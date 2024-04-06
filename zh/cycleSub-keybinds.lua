-- 是否默认显示内置字幕标题
local show_title = false

function toggle_show_title()
    show_title = not show_title
end

mp.add_key_binding("5", "toggle_show_title", toggle_show_title)

function cycle_subtitles()
    mp.command("cycle sub")
    local sub_info = mp.get_property_native("track-list")
    local media = mp.get_property("user-data/plex/playing-media")
    local displayTitle = "无"

    for _, track in pairs(sub_info) do
        if track["type"] == "sub" and track["selected"] then
            if track["codec"] == "eia_608" then
                return cycle_subtitles()
            else
                local ff_index = track["ff-index"]

                for subtitle in string.gmatch(media, "{(.-)}") do
                    local index = string.match(subtitle, "\"index\":(%d+)")
                    local id = string.match(subtitle, "\"id\":\"(.-)\"")
                    local title, display
                    if show_title then
                        if not track["title"] then
                            display = string.match(subtitle, "\"displayTitle\":\"(.-)\"")
                        else
                            title = track["title"]
                        end
                    else
                        display = string.match(subtitle, "\"displayTitle\":\"(.-)\"")
                    end

                    if ff_index ~= 0 and index and (title or display) and tonumber(index) == ff_index then
                        displayTitle = title or display
                        break
                    end
                end

                if displayTitle == "无" then
                    for subtitle in string.gmatch(media, "{(.-)}") do
                        local id = string.match(subtitle, "\"id\":\"(.-)\"")
                        local title, display
                        if show_title then
                            if string.find(track["title"], "?") then
                                display = string.match(subtitle, "\"displayTitle\":\"(.-)\"")
                            else
                                title = track["title"]
                            end
                        else
                            display = string.match(subtitle, "\"displayTitle\":\"(.-)\"")
                        end

                        if id and (title or display) and id == string.match(track["title"], "(%d+)") then
                            displayTitle = title or display
                            break
                        end
                    end
                end
            end

            if displayTitle == "无" then
                return cycle_subtitles()
            else
                mp.osd_message("当前字幕: " .. displayTitle)
                return
            end
        end
    end

    if displayTitle == "无" then
        mp.osd_message("当前字幕: " .. displayTitle)
    end
end

mp.add_key_binding("t", "cycle_subtitles", cycle_subtitles)
