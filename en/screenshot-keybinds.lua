function get_media_info()
    local media, title, release, year, media_type, season_number, episode_number
    media = mp.get_property("user-data/plex/playing-media")
    title=".+\"summary\":\".-\"title\":\"(.-[%w%s%p])\".+$"
    title=string.gsub(media,title,"%1")
    title = string.gsub(title,"[\"]","")
    title = string.gsub(title,"[,]","")
    release=".+\"originallyAvailableAt\":\"(.-[%w%s%p])\".+$"
    release=string.gsub(media,release,"%1")
    year=string.sub(release, 1, 4)
    
    if string.match(media, "\"type\":\"episode\"") then
        show_title=".+\"grandparentTitle\":\"(.-[%w%s%p])\".+$"
        	show_title=string.gsub(media,show_title,"%1")
        s00e00=".+\"file\":\".-([Ss][0-9][0-9][Ee][0-9][0-9]).+$"
            s00e00=string.gsub(media,s00e00,"%1")
        
        show_title = string.gsub(show_title,"[\"]","")
        show_title = string.gsub(show_title,"[,]","")
        
        return show_title, year, s00e00
    else
        return title, year
    end
    
end

mp.add_key_binding("s", "screenshot", function()
    local path = "/Users/User/Downloads/" -- Set save path
    local time_pos = mp.get_property_number("time-pos")
    local seconds = math.floor(time_pos % 60)
    local minutes = math.floor((time_pos / 60) % 60)
    local hours = math.floor(time_pos / 3600)
    local time_string = string.format("%02d-%02d-%02d", hours, minutes, seconds)
    
    local title, year, s00e00 = get_media_info()
    
    if s00e00 then
        local screenshot_template = title .. " (" .. year .. ") " .. s00e00 .. " " .. time_string .. ".png"
        local screenshot_filename = string.format(screenshot_template)
        mp.commandv("screenshot-to-file", path .. screenshot_filename)
    else
        local screenshot_template = title .. " (" .. year .. ") " .. time_string .. ".png"
        local screenshot_filename = string.format(screenshot_template)
        mp.commandv("screenshot-to-file", path .. screenshot_filename)
    end
    
end)
