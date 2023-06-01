function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function subDown()
    mp.command("add sub-pos +1")
    sub_pos = mp.get_property("sub-pos")
    sub_pos = round(sub_pos, 2)
    mp.osd_message("字幕位置: "..sub_pos, 0.5)
end

function subUp()
    mp.command("add sub-pos -1")
    sub_pos = mp.get_property("sub-pos")
    sub_pos = round(sub_pos, 2)
    mp.osd_message("字幕位置: "..sub_pos, 0.5)
end

function subReset()
    mp.set_property("sub-pos", 100)
    mp.osd_message("字幕位置: 100", 0.5)
end

mp.add_forced_key_binding("d", "subDown", subDown, {repeatable=true})
mp.add_forced_key_binding("e", "subUp", subUp, {repeatable=true})
mp.add_forced_key_binding("r", "subReset", subReset)
