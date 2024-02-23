local speed_level = 1

-- Whether to enable global playback speed by default
local global_speed = false

function stepFwd()
    mp.command("add speed 0.25")
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("Speed: %.2f", speed_level), 0.5)
end

function stepBack()
    mp.command("add speed -0.25")
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("Speed: %.2f", speed_level), 0.5)
end

function speedReset()
    mp.command("set speed 1")
    speed_level = 1
    mp.osd_message("Speed Reset")
end

function on_file_loaded()
    if global_speed then
        mp.set_property("speed", speed_level)
    else
        mp.set_property("speed", 1)
    end
end

function toggle_global_speed()
    global_speed = not global_speed
    if global_speed then
        mp.osd_message("Global Speed: ON")
    else
        mp.osd_message("Global Speed: OFF")
    end
end

mp.add_forced_key_binding(".", "stepFwd", stepFwd)
mp.add_forced_key_binding(",", "stepBack", stepBack)
mp.add_forced_key_binding("/", "speedReset", speedReset)
mp.add_forced_key_binding("g", "toggle_global_speed", toggle_global_speed)

mp.register_event("file-loaded", on_file_loaded)
