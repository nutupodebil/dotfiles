--
--  автостарт
--

hl.on("hyprland.start", function()
	hl.exec_cmd("ls /sys/class/backlight/ | grep amd | ~/.scripts/get_backlight_device")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("awww-daemon")
	--hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar")
	hl.exec_cmd("waypaper --restore")
	hl.exec_cmd("sh ~/.scripts/hypr-refresh.sh")
	hl.exec_cmd("swaync")
	hl.exec_cmd("sleep 4; rog-control-center & AmneziaVPN")
	--hl.exec_cmd("spicetify -q -s -n watch")  --  если нужна смена темы спотифай "на лету"
end)
