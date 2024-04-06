-- Whether to show the embedded audio track title by default
local show_title = false

function toggle_show_title()
    show_title = not show_title
end

mp.add_key_binding("6", "toggle_show_title", toggle_show_title)

function cycle_audio_tracks()
    mp.command("cycle audio")
    local audio_info = mp.get_property_native("track-list")
    local media = mp.get_property("user-data/plex/playing-media")
    local displayTitle = "None"

    for _, track in pairs(audio_info) do
        if track["type"] == "audio" and track["selected"] then
            local ff_index = track["ff-index"]

            for audio in string.gmatch(media, "{(.-)}") do
                local index = string.match(audio, "\"index\":(%d+)")
                local id = string.match(audio, "\"id\":\"(.-)\"")
                local title, display
                if show_title then
                    if not track["title"] then
                        display = string.match(audio, "\"displayTitle\":\"(.-)\"")
                    else
                        title = track["title"]
                    end
                else
                    display = string.match(audio, "\"displayTitle\":\"(.-)\"")
                end

                if ff_index ~= 0 and index and (title or display) and tonumber(index) == ff_index then
                    displayTitle = title or display
                    break
                end
            end
        end
    end

    mp.osd_message("Current Audio Track: " .. displayTitle)
end

mp.add_key_binding("y", "cycle_audio_tracks", cycle_audio_tracks)
