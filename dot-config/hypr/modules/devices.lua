--
--  девайсы
--

hl.device({
	name = "razer-razer-deathadder-v3-pro",
	sensitivity = -1.0,
})

hl.device({
	name = "razer-razer-deathadder-v3-pro-1",
	sensitivity = -1.0,
})

hl.device({
	name = "asuf1209:00-2808:0219-touchpad",
	enabled = false,

	natural_scroll = true,
	scroll_factor = 0.26,
	sensitivity = 0,
	disable_while_typing = true,

	clickfinger_behavior = true,
})

local file = io.open("/run/user/1000/touchpad.status", "r")
if not file then
	return
end
local touchpad_state = file:read("*l")
file:close()

hl.device({ name = "asuf1209:00-2808:0219-touchpad", enabled = (touchpad_state == "true") })
