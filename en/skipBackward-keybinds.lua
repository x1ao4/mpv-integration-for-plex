function skipBackward()
    mp.command("seek -10")
end

mp.add_forced_key_binding("LEFT", "skipBackward", skipBackward, {repeatable=true})
