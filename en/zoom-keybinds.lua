function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function zoomAdd()
    mp.command("add video-zoom +0.05")
    zoom_level = mp.get_property("video-zoom")
    zoom_level = round(zoom_level, 2)
    mp.osd_message("Zoom: "..zoom_level, 0.5)
end

function zoomSub()
    mp.command("add video-zoom -0.05")
    zoom_level = mp.get_property("video-zoom")
    zoom_level = round(zoom_level, 2)
    mp.osd_message("Zoom: "..zoom_level, 0.5)
end

function zoomReset()
    mp.command("set video-zoom 0")
    mp.osd_message("Zoom Reset")
end

mp.add_forced_key_binding("=", "zoomAdd", zoomAdd, {repeatable=true})
mp.add_forced_key_binding("-", "zoomSub", zoomSub, {repeatable=true})
mp.add_forced_key_binding("0", "zoomReset", zoomReset)
