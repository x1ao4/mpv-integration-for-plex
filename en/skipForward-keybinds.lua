function skipForward()
    mp.command("seek 10")
end

mp.add_forced_key_binding("RIGHT", "skipForward", skipForward, {repeatable=true})
