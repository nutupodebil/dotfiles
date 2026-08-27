
--
--  бинды
--

local mod = "SUPER"
require("modules/backlight_device")
--local mon_bright = "amdgpu_bl2"
local menu = "rofi -show drun -theme ~/.config/rofi/style.rasi"  --"wofi --show drun"


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind(mod .. " + F10", hl.dsp.exec_cmd("~/.scripts/touchpad_bind.sh"))
hl.bind(mod .. " + F8", hl.dsp.exec_cmd("brightnessctl --device=" .. mon_bright .. " set 5%+"), { locked = true, repeating = true })
hl.bind(mod .. " + F7", hl.dsp.exec_cmd("brightnessctl --device=" .. mon_bright .. " set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind(mod .. " + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar"))

hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("waypaper")) --waypaper --backend awww --folder /home/vldzn/Pictures/wallpapers --random >> /dev/null"))
hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu .. " || pkill rofi"))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("wlogout -s || pkill wlogout"))

hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))


