mp.add_key_binding("s", "screenshot", function()
    local path = "/Users/User/Downloads/" -- Set save path
    local time_pos = mp.get_property_number("time-pos")
    local seconds = math.floor(time_pos % 60)
    local minutes = math.floor((time_pos / 60) % 60)
    local hours = math.floor(time_pos / 3600)
    local time_string = string.format("%02d-%02d-%02d", hours, minutes, seconds) -- Modify time format
    local screenshot_template = time_string .. ".png" -- Set file name format
    local screenshot_filename = string.format(screenshot_template)
    mp.commandv("screenshot-to-file", path .. screenshot_filename)
end)
