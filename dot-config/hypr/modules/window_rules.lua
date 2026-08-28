--
--  правила для окон
--

hl.window_rule({
	match = { class = "zen" },
	opacity = "0.95 override 0.9 override 1.0 override",
})

hl.window_rule({
	match = { class = "firefox" },
	opacity = "0.95 override 0.9 override 1.0 override",
})

hl.window_rule({
	match = { class = "discord" },
	opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
	match = { class = "vesktop" },
	opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
	match = { class = "Spotify" },
	opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
	match = { class = "waypaper" },
	pseudo = true,
	float = true,
	size = { 800, 600 },
	opacity = "0.9 override 0.5 1.0",
	animation = "popin",
})

hl.window_rule({
	match = { class = "blueman-manager" },
	pseudo = true,
	size = { 800, 600 },
	float = true,
})

hl.window_rule({
	match = { class = "sublime_text" },
	opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
	match = { class = "xdg-desktop-portal-gtk" },
	size = { 800, 600 },
	center = true,
})

hl.window_rule({
	match = { class = "org.telegram.desktop" },
	opacity = "0.95 override 0.8 override 1.0 override",
	pseudo = true,
	float = true,
	size = { 1200, 900 },
})

hl.window_rule({
	match = { class = "org.telegram.desktop", title = "Choose an image" },
	size = { 800, 600 },
	center = true,
})

hl.window_rule({
	match = { class = "org.telegram.desktop", title = "Save File" },
	size = { 800, 600 },
	center = true,
})

hl.window_rule({
	match = { class = "org.telegram.desktop", title = "Choose Files" },
	size = { 800, 600 },
	center = true,
})

hl.window_rule({
	match = { class = "AmneziaVPN" },
	center = true,
	size = { 360, 640 },
})

hl.window_rule({
	match = { class = "nm-connection-editor" },
	float = true,
})

hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol" },
	size = { 800, 600 },
	float = true,
})

hl.window_rule({
	match = { class = "hyprland-share-picker" },
	size = { 800, 600 },
})
