function stepFwd()
    mp.command("frame-step")
    mp.osd_message("帧 +1", 0.5)
end

function stepBack()
    mp.command("frame-back-step")
    mp.osd_message("帧 -1", 0.5)
end

mp.add_forced_key_binding("'", "stepFwd", stepFwd)
mp.add_forced_key_binding(";", "stepBack", stepBack)
