-- 创建一个函数来写入日志
local function write_log(message)
    local path = "/Users/User/Downloads/" -- 设置日志保存路径
    local log_file = io.open(path .. "log.txt", "a")
    log_file:write(os.date("%Y-%m-%d %H:%M:%S") .. " - " .. message .. "\n")
    log_file:close()
end

-- 修改原有函数，添加日志记录和错误处理
function get_media_info()
    local show_title, title, year, s00e00
    local status, err = pcall(function()
        write_log("调用 get_media_info 函数")

        local media, release
        media = mp.get_property("user-data/plex/playing-media")
        write_log("媒体: " .. tostring(media))

        -- 检查 media 是否包含 "summary" 和 "title"
        if not string.match(media, "\"summary\":\".-\"title\":\"(.-[%w%s%p])\"") then
            write_log("警告: 媒体信息不包含 'summary' 或 'title'")
        end

        title=".+\"summary\":\".-\"title\":\"(.-[%w%s%p])\".+$"
        title=string.gsub(media,title,"%1")
        write_log("原始标题: " .. tostring(title))  -- 添加日志记录

        title = string.gsub(title,"[\"]","")
        title = string.gsub(title,"[,]","")
        -- 去除特殊字符
        title = string.gsub(title,"[<>:\"/\\|?*]","")
        write_log("处理后的标题: " .. tostring(title))  -- 添加日志记录

        release=".+\"originallyAvailableAt\":\"(.-[%w%s%p])\".+$"
        release=string.gsub(media,release,"%1")
        year=string.sub(release, 1, 4)
        write_log("年份: " .. tostring(year))

        if year == '{"au' then
            year = nil
        end

        if string.match(media, "\"type\":\"episode\"") then
            show_title=".+\"grandparentTitle\":\"(.-[%w%s%p])\".+$"
            show_title=string.gsub(media,show_title,"%1")

            -- 从 "index" 和 "parentIndex" 中获取集数信息
            local episode_index = string.match(media, "\"index\":(%d+),\"isDownloaded\"")
            local season_index = string.match(media, "\"parentIndex\":(%d+)")
            if episode_index and season_index then
                s00e00 = "S" .. string.format("%02d", tonumber(season_index)) .. "E" .. string.format("%02d", tonumber(episode_index))
            else
                s00e00 = nil
            end

            show_title = string.gsub(show_title,"[\"]","")
            show_title = string.gsub(show_title,"[,]","")
            -- 去除特殊字符
            show_title = string.gsub(show_title,"[<>:\"/\\|?*]","")

            write_log("节目标题: " .. tostring(show_title))
            write_log("集数: " .. tostring(s00e00))

        else
            s00e00 = nil
        end
    end)
    if not status then
        write_log("在 get_media_info 函数中出错: " .. err)
        write_log(debug.traceback())
    end
    return show_title, title, year, s00e00
end

-- 创建一个队列来存储截图请求
local screenshot_queue = {}

-- 创建一个函数来处理队列中的截图请求
local function process_screenshot_queue()
    local status, err = pcall(function()
        write_log("调用 process_screenshot_queue 函数")
        if #screenshot_queue > 0 then
            local screenshot_request = table.remove(screenshot_queue, 1)
            mp.commandv("screenshot-to-file", screenshot_request)
            write_log("处理截图请求: " .. screenshot_request)
        end
        write_log("结束 process_screenshot_queue 函数")
    end)
    if not status then
        write_log("在 process_screenshot_queue 函数中出错: " .. err)
        write_log(debug.traceback())
    end
end

-- 添加一个事件处理器，当截图保存完成后，处理队列中的下一个截图请求
mp.register_event("screenshot-filename", process_screenshot_queue)

-- 修改截图函数，将截图请求添加到队列中，而不是立即处理
mp.add_key_binding("s", "screenshot", function()
    local status, err = pcall(function()
        write_log("调用截图函数")

        local media = mp.get_property("user-data/plex/playing-media")
        if string.match(media, "\"type\":\"track\"") then
            write_log("当前播放的是音乐文件，不执行截图操作")
            return
        end

        local path = "/Users/User/Downloads/" -- 设置截图保存路径
        local time_pos = mp.get_property_number("time-pos")
        write_log("时间位置: " .. tostring(time_pos))
        local seconds = math.floor(time_pos % 60)
        local minutes = math.floor((time_pos / 60) % 60)
        local hours = math.floor(time_pos / 3600)
        local time_string = string.format("%02d-%02d-%02d", hours, minutes, seconds)
        write_log("时间字符串: " .. tostring(time_string))

        local frame_number = mp.get_property_number("estimated-frame-number")
        local frame_string = string.format("%04d", frame_number)
        write_log("帧数字符串: " .. tostring(frame_string))

        local show_title, title, year, s00e00 = get_media_info() -- 获取 get_media_info 函数的返回值

        write_log("节目标题: " .. tostring(show_title))
        write_log("标题: " .. tostring(title))
        write_log("年份: " .. tostring(year))
        write_log("集数: " .. tostring(s00e00))

        local screenshot_template, screenshot_filename
        if s00e00 then
            if year then
                screenshot_template = show_title .. " (" .. year .. ") " .. s00e00 .. " " .. time_string .. " " .. frame_string .. ".png"
            else
                screenshot_template = show_title .. " " .. s00e00 .. " " .. time_string .. " " .. frame_string .. ".png"
            end
            screenshot_filename = string.format(screenshot_template)
            table.insert(screenshot_queue, path .. screenshot_filename)
        else
            if year then
                screenshot_template = title .. " (" .. year .. ") " .. time_string .. " " .. frame_string .. ".png"
            else
                screenshot_template = title .. " " .. time_string .. " " .. frame_string .. ".png"
            end
            screenshot_filename = string.format(screenshot_template)
            table.insert(screenshot_queue, path .. screenshot_filename)
        end

        write_log("添加截图请求到队列: " .. path .. screenshot_filename)

        -- 处理队列中的截图请求
        process_screenshot_queue()
        write_log("结束截图函数")
    end)
    if not status then
        write_log("在截图函数中出错: " .. err)
        write_log(debug.traceback())
    end
end)
