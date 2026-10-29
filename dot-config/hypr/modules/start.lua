--
--  autostart commands
--

hl.on("hyprland.start", function()
  hl.exec_cmd("ls /sys/class/backlight/ | grep amd | ~/.scripts/get_backlight_device")
  hl.exec_cmd("bash ~/.scripts/touchpad_bind.sh")
  --hl.exec_cmd("[ ! -f /run/user/1000/touchpad.status ] && bash ~/.scripts/touchpad_bind.sh")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("bash ~/.scripts/hypr-refresh.sh")

  hl.exec_cmd("hyprpm reload")
  --hl.exec_cmd("hyprpaper")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")

  --hl.exec_cmd("spicetify -q -s -n watch")  -- if you want "hot reload" spotify theme
end)
