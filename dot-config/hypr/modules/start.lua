
--
--  автостарт
--

hl.on("hyprland.start", function()
    hl.exec_cmd("ls /sys/class/backlight/ | grep amd | ~/.scripts/get_backlight_device")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("blueman-applet")
    --hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waypaper --restore")  --backend awww --folder /home/vldzn/Pictures/wallpapers --random")
    hl.exec_cmd("sleep 5; AmneziaVPN & rog-control-center")
    --hl.exec_cmd("spicetify -q -s -n watch")  --  если нужна смена темы спотифай "на лету"
end)
