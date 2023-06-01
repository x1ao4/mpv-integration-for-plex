local muted = false
local last_volume = mp.get_property_number("volume")

function toggle_mute()
    if muted then
        mp.set_property_number("volume", last_volume)
        muted = false
    else
        last_volume = mp.get_property_number("volume")
        mp.set_property_number("volume", 0)
        muted = true
    end
end

mp.add_key_binding("j", "toggle_mute", toggle_mute)
