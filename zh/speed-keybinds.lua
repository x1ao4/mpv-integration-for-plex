function stepFwd()
    mp.command("multiply speed 1.25")
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("播放速度: %.2f", speed_level), 0.5)
end

function stepBack()
    mp.command("multiply speed 0.75")
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("播放速度: %.2f", speed_level), 0.5)
end

function speedReset()
    mp.command("set speed 1")
    mp.osd_message("重置播放速度")
end

mp.add_forced_key_binding(".", "stepFwd", stepFwd)
mp.add_forced_key_binding(",", "stepBack", stepBack)
mp.add_forced_key_binding("/", "speedReset", speedReset)
