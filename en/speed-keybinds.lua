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
    mp.osd_message("Speed Reset")
end

mp.add_forced_key_binding(".", "stepFwd", stepFwd)
mp.add_forced_key_binding(",", "stepBack", stepBack)
mp.add_forced_key_binding("/", "speedReset", speedReset)
