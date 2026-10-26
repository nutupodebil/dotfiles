--
--  бинды
--

local mod = "SUPER"
local menu = "rofi -show drun -theme ~/.config/rofi/style.rasi"

require("modules/backlight_device")

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

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("sh ~/.scripts/touchpad_bind.sh"))

hl.bind("XF86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
--hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"))

hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar"))

hl.bind(mod .. " + W", hl.dsp.exec_cmd("pkill rofi || sh ~/.config/rofi/scripts/wallpaper-menu.sh"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu .. " || pkill rofi"))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("pkill wlogout || wlogout -s"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("zen-browser"))

--hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + SHIFT + S", hl.plugin.hyprcapture.open)

hl.bind(mod .. " + G", function()
  hl.plugin.hyprexpo.expo("toggle")
end)
