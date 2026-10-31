--
--  keybindings
--

local mod = "SUPER"
local file_manager = "nautilus"
local menu = "rofi -show drun -theme ~/.config/rofi/style.rasi"


--  getting mon_bright var
require("modules/backlight_device")


--  window resizing binds
hl.bind(
  mod .. " + CTRL + left",
  hl.dsp.window.resize({ activewindow, x = -20, y = 0, relative = true }),
  { repeating = true }
)

hl.bind(
  mod .. " + CTRL + right",
  hl.dsp.window.resize({ activewindow, x = 20, y = 0, relative = true }),
  { repeating = true }
)

hl.bind(
  mod .. " + CTRL + up",
  hl.dsp.window.resize({ activewindow, x = 0, y = -20, relative = true }),
  { repeating = true }
)

hl.bind(
  mod .. " + CTRL + down",
  hl.dsp.window.resize({ activewindow, x = 0, y = 20, relative = true }),
  { repeating = true }
)


--  volume binds
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
  { locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })


--  brightness binds
hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd("brightnessctl --device=" .. mon_bright .. " set 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessUp",
  hl.dsp.exec_cmd("brightnessctl --device=" .. mon_bright .. " set 5%+"),
  { locked = true, repeating = true }
)


--  touchpad toggle bind
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("bash ~/.scripts/touchpad_bind.sh"))


--  power buttons binds
hl.bind("XF86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
--hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"))


--  Waybar binds
hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar"))


--  some useful binds
hl.bind(mod .. " + E", hl.dsp.exec_cmd("pkill " .. file_manager .. " || " .. file_manager))

hl.bind(mod .. " + W", hl.dsp.exec_cmd("pkill rofi || bash ~/.config/rofi/scripts/wallpaper-menu.sh"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu .. " || pkill rofi"))
hl.bind(mod .. " + SHIFT + N",
  hl.dsp.exec_cmd("BUTTERTODO_THEME=~/.config/rofi/buttertodo-theme.rasi ~/.local/bin/buttertodo"))

hl.bind(mod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

hl.bind(mod .. " + L", hl.dsp.exec_cmd("pkill wlogout || wlogout -s"))

hl.bind(mod .. " + B", hl.dsp.exec_cmd("zen-browser"))

--hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))


--  plugins binds
hl.bind("SUPER + SHIFT + S", hl.plugin.hyprcapture.open)

hl.bind(mod .. " + G", function()
  hl.plugin.hyprexpo.expo("toggle")
end)
