function get_media_info()
    local show_title, title, year, s00e00
    local media, release
    media = mp.get_property("user-data/plex/playing-media")

    if not string.match(media, "\"summary\":\".-\"title\":\"(.-[%w%s%p])\"") then
        return
    end

    title=".+\"summary\":\".-\"title\":\"(.-[%w%s%p])\".+$"
    title=string.gsub(media,title,"%1")

    title = string.gsub(title,"[\"]","")
    title = string.gsub(title,"[,]","")
    title = string.gsub(title,"[<>:\"/\\|?*]","")

    release=".+\"originallyAvailableAt\":\"(.-[%w%s%p])\".+$"
    release=string.gsub(media,release,"%1")
    year=string.sub(release, 1, 4)

    if year == '{"au' then
        year = nil
    end

    if string.match(media, "\"type\":\"episode\"") then
        show_title=".+\"grandparentTitle\":\"(.-[%w%s%p])\".+$"
        show_title=string.gsub(media,show_title,"%1")

        local episode_index = string.match(media, "\"index\":(%d+),\"isDownloaded\"")
        local season_index = string.match(media, "\"parentIndex\":(%d+)")
        if episode_index and season_index then
            s00e00 = "S" .. string.format("%02d", tonumber(season_index)) .. "E" .. string.format("%02d", tonumber(episode_index))
        else
            s00e00 = nil
        end

        show_title = string.gsub(show_title,"[\"]","")
        show_title = string.gsub(show_title,"[,]","")
        show_title = string.gsub(show_title,"[<>:\"/\\|?*]","")
    else
        s00e00 = nil
    end
    return show_title, title, year, s00e00
end

local screenshot_queue = {}

local function process_screenshot_queue()
    if #screenshot_queue > 0 then
        local screenshot_request = table.remove(screenshot_queue, 1)
        mp.commandv("screenshot-to-file", screenshot_request)
    end
end

mp.register_event("screenshot-filename", process_screenshot_queue)

mp.add_key_binding("s", "screenshot", function()
    local media = mp.get_property("user-data/plex/playing-media")
    if string.match(media, "\"type\":\"track\"") then
        return
    end

    local path = "/Users/User/Downloads/" -- Set the screenshot save path, for example, /Users/Username/Downloads/ or D:\Users\Username\Downloads\
    local time_pos = mp.get_property_number("time-pos")
    local seconds = math.floor(time_pos % 60)
    local minutes = math.floor((time_pos / 60) % 60)
    local hours = math.floor(time_pos / 3600)
    local time_string = string.format("%02d-%02d-%02d", hours, minutes, seconds)

    local frame_number = mp.get_property_number("estimated-frame-number")
    local frame_string = string.format("%04d", frame_number)

    local show_title, title, year, s00e00 = get_media_info()

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

    process_screenshot_queue()
end)
