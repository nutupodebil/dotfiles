--
--  window rules
--

hl.window_rule({
  name = "Zen Browser rules",
  match = { class = "zen" },
  opacity = "0.95 override 0.9 override 1.0 override",
})

hl.window_rule({
  name = "Zen Browser (pic-in-pic) rules",
  match = { class = "zen", title = "Картинка в картинке" },
  float = true,
  size = { 640, 400 },
})

hl.window_rule({
  name = "Firefox rules",
  match = { class = "firefox" },
  opacity = "0.95 override 0.9 override 1.0 override",
})

hl.window_rule({
  name = "Discord rules",
  match = { class = "discord" },
  opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
  name = "Vesktop rules",
  match = { class = "vesktop" },
  opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
  name = "Spotify rules",
  match = { class = "spotify" },
  opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
  name = "Waypaper rules",
  match = { class = "waypaper" },
  pseudo = true,
  float = true,
  size = { 800, 600 },
  opacity = "0.9 override 0.5 1.0",
  animation = "popin",
})

hl.window_rule({
  name = "Blueman rules",
  match = { class = "blueman-manager" },
  pseudo = true,
  size = { 800, 600 },
  float = true,
})

hl.window_rule({
  name = "Sublime Text rules",
  match = { class = "sublime_text" },
  opacity = "0.9 override 0.8 override 1.0 override",
})

hl.window_rule({
  name = "Xdg-desktop-portal-gtk windows rules",
  match = { class = "xdg-desktop-portal-gtk" },
  size = { 800, 600 },
  center = true,
})

hl.window_rule({
  name = "Telegram Desktop rules",
  match = { class = "org.telegram.desktop" },
  opacity = "0.95 override 0.8 override 1.0 override",
  pseudo = true,
  --float = true,
  size = { 1200, 900 },
})

hl.window_rule({
  name = "Telegram Desktop (choose an image) rules",
  match = { class = "org.telegram.desktop", title = "Choose an image" },
  size = { 800, 800 },
  center = true,
})

hl.window_rule({
  name = "Telegram Desktop (save file) rules",
  match = { class = "org.telegram.desktop", title = "Save File" },
  size = { 800, 600 },
  center = true,
})

hl.window_rule({
  name = "Telegram Desktop (choose files) rules",
  match = { class = "org.telegram.desktop", title = "Choose Files" },
  size = { 800, 600 },
  center = true,
})

hl.window_rule({
  name = "AmneziaVPN rules",
  match = { class = "AmneziaVPN" },
  center = true,
  size = { 360, 640 },
  float = true,
  border_size = 0,
})

hl.window_rule({
  name = "Happ rules",
  match = { class = "Happ" },
  float = true,
  center = true,
  size = { 1000, 640 },
})

hl.window_rule({
  name = "NM connection editor rules",
  match = { class = "nm-connection-editor" },
  float = true,
})

hl.window_rule({
  name = "Pavucontrol rules",
  match = { class = "org.pulseaudio.pavucontrol" },
  size = { 800, 600 },
  float = true,
})

hl.window_rule({
  name = "Hyprland share picker rules",
  match = { class = "hyprland-share-picker" },
  size = { 800, 600 },
})

hl.window_rule({
  name = "VS Code rules",
  match = { class = "code-oss" },
  opacity = "0.95 override 0.8 override 1.0 override",
})

hl.window_rule({
  name = "Kitty rules",
  match = { class = "kitty" },
  fullscreen_state = 0,
})

hl.window_rule({
  name = "Neovim rules",
  match = { class = "kitty", title = "^nvim.*" },
  opacity = "0.9 override 0.75 override 1.0 override",
})

hl.window_rule({
  name = "Vim rules",
  match = { class = "kitty", title = "^vim.*" },
  opacity = "0.9 override 0.75 override 1.0 override",
})

hl.window_rule({
  name = "Libreoffice Writer rules",
  match = { class = "libreoffice-writer" },
  opacity = "0.95 override 0.9 override 1.0 override",
})

hl.window_rule({
  name = "Nautilus rules",
  match = { class = "org.gnome.Nautilus" },
  opacity = "0.95 override 0.8 override 1.0 override",
  float = true,
  size = { 1100, 750 },
})

hl.window_rule({
  name = "Swayimg rules",
  match = { class = "swayimg" },
  float = true,
})

hl.window_rule({
  name = "Steam rules",
  match = { class = "steam" },
  opacity = "0.9 override 0.8 override 1.0 override",
})
