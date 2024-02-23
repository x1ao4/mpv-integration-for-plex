local speed_level = 1

-- 是否默认启用全局播放速度
local global_speed = false

function stepFwd()
    mp.command("add speed 0.25")
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("播放速度: %.2f", speed_level), 0.5)
end

function stepBack()
    mp.command("add speed -0.25")
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("播放速度: %.2f", speed_level), 0.5)
end

function speedReset()
    mp.command("set speed 1")
    speed_level = 1
    mp.osd_message("重置播放速度")
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
        mp.osd_message("全局播放速度: 开")
    else
        mp.osd_message("全局播放速度: 关")
    end
end

mp.add_forced_key_binding(".", "stepFwd", stepFwd)
mp.add_forced_key_binding(",", "stepBack", stepBack)
mp.add_forced_key_binding("/", "speedReset", speedReset)
mp.add_forced_key_binding("g", "toggle_global_speed", toggle_global_speed)

mp.register_event("file-loaded", on_file_loaded)
