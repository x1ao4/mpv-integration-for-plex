-- 设置开关，如果为 true 则显示 title，否则显示 displayTitle
local show_title = true

function toggle_show_title()
    show_title = not show_title
end

mp.add_key_binding("y", "toggle_show_title", toggle_show_title)

function cycle_subtitles()
    -- 切换字幕
    mp.command("cycle sub")

    -- 获取当前字幕的信息
    local sub_info = mp.get_property_native("track-list")

    -- 获取视频的元数据
    local media = mp.get_property("user-data/plex/playing-media")

    -- 初始化 displayTitle 为 "无"
    local displayTitle = "无"

    -- 遍历字幕信息，找到当前选中的字幕
    for _, track in pairs(sub_info) do
        if track["type"] == "sub" and track["selected"] then
            -- 如果字幕信息中不存在"title"或者codec为eia_608，则跳过
            if not track["title"] or track["codec"] == "eia_608" then
                return cycle_subtitles()
            else
                -- 获取 ff-index 的值
                local ff_index = track["ff-index"]

                -- 将元数据字符串分割成多个部分，每个部分代表一个字幕
                for subtitle in string.gmatch(media, "{(.-)}") do
                    -- 在每个部分中查找 "index": 和 "displayTitle" 或 "title":
                    local index = string.match(subtitle, "\"index\":(%d+)")
                    local id = string.match(subtitle, "\"id\":\"(.-)\"")
                    local title, display
                    if show_title then
                        title = string.match(subtitle, "\"title\":\"(.-)\"")
                    else
                        display = string.match(subtitle, "\"displayTitle\":\"(.-)\"")
                    end

                    -- 如果找到了 "index": 和 "displayTitle" 或 "title"，并且 "index": 的值与 ff_index 相同，那么就更新 displayTitle
                    if ff_index ~= 0 and index and (title or display) and tonumber(index) == ff_index then
                        displayTitle = title or display
                        break
                    end

                    -- 如果 ff-index 为 0，那么就使用字幕的 title 中的数字去匹配元数据中的 "id"，然后再反推 "displayTitle"
                    if ff_index == 0 and id and (title or display) and id == string.match(track["title"], "(%d+)") then
                        -- 先满足 id 匹配再获取 displayTitle
                        if id == string.match(track["title"], "(%d+)") then
                            displayTitle = title or display
                            break
                        end
                    end
                end
            end

            -- 如果没有找到匹配的字幕，再次调用 cycle_subtitles
            if displayTitle == "无" then
                return cycle_subtitles()
            else
                -- 显示当前字幕
                mp.osd_message("当前字幕: " .. displayTitle)
                return
            end
        end
    end

    -- 如果没有找到选中的字幕，显示 "当前字幕: 无"
    if displayTitle == "无" then
        mp.osd_message("当前字幕: " .. displayTitle)
    end
end

mp.add_key_binding("t", "cycle_subtitles", cycle_subtitles)
