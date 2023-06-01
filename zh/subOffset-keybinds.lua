mp.set_property_native("sub-delay", 0)

function adjust_sub(delay)
    local sub_delay = mp.get_property_native("sub-delay")
    mp.set_property_native("sub-delay", sub_delay + delay)
    mp.osd_message(string.format("字幕偏移: %.2f 秒", sub_delay + delay))
end

mp.add_key_binding("v", "sub-decrease", function() adjust_sub(-0.05) end, {repeatable=true})

mp.add_key_binding("b", "sub-increase", function() adjust_sub(0.05) end, {repeatable=true})

mp.add_key_binding("n", "sub-reset", function() mp.set_property_native("sub-delay", 0); mp.osd_message("字幕偏移: 0 秒") end)

mp.register_event("file-loaded", function() mp.set_property_native("sub-delay", 0) end)
