local is_moving = false

function move_toggle()
    is_moving = not is_moving
    if is_moving then
        mp.add_forced_key_binding("DOWN", "move_up", move_up, {repeatable=true})
        mp.add_forced_key_binding("UP", "move_down", move_down, {repeatable=true})
        mp.add_forced_key_binding("LEFT", "move_left", move_left, {repeatable=true})
        mp.add_forced_key_binding("RIGHT", "move_right", move_right, {repeatable=true})
        mp.osd_message("Move Mode: ON")
    else
        mp.remove_key_binding("move_up")
        mp.remove_key_binding("move_down")
        mp.remove_key_binding("move_left")
        mp.remove_key_binding("move_right")
        mp.osd_message("Move Mode: OFF")
    end
end

mp.add_key_binding("m", "move_toggle", move_toggle, {repeatable=false})

mp.add_key_binding("o", "reset_toggle",
    function()
        mp.commandv("set", "video-pan-x", 0)
        mp.commandv("set", "video-pan-y", 0)
    end,
    {repeatable=false}
)

function move_up()
    local y = mp.get_property_number("video-pan-y")
    if y >= 1 then
        mp.commandv("set", "video-pan-y", -1)
    else
        mp.commandv("add", "video-pan-y", 0.05)
    end
end

function move_down()
    local y = mp.get_property_number("video-pan-y")
    if y <= -1 then
        mp.commandv("set", "video-pan-y", 1)
    else
        mp.commandv("add", "video-pan-y", -0.05)
    end
end

function move_left()
    local x = mp.get_property_number("video-pan-x")
    if x <= -1 then
        mp.commandv("set", "video-pan-x", 1)
    else
        mp.commandv("add", "video-pan-x", -0.05)
    end
end

function move_right()
    local x = mp.get_property_number("video-pan-x")
    if x >= 1 then
        mp.commandv("set", "video-pan-x", -1)
    else
        mp.commandv("add", "video-pan-x", 0.05)
    end
end
