--
--  переменные среды
--

hl.env("XCURSOR_THEME", "KanadeHyprcursor_static")
hl.env("XCURSOR_SIZE", "28")

hl.env("HYPRCURSOR_THEME", "KanadeHyprcursor_static")
hl.env("HYPRCURSOR_SIZE", "28")

--hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1.6")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

--hl.env("LIBVA_DRIVER_NAME", "nvidia")
--hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")
--hl.env("AQ_NO_ATOMIC", "1")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
