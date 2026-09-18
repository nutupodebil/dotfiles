--
--  переменные среды
--

--hl.env("XCURSOR_THEME", "KanadeHyprcursor_static")
hl.env("XCURSOR_SIZE", "28")

hl.env("HYPRCURSOR_THEME", "KanadeHyprcursor_static")
hl.env("HYPRCURSOR_SIZE", "28")

hl.env("GDK_SCALE", "1.6")
hl.env("GDK_BACKEND", "wayland,x11,*")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("CLUTTER_BACKEND", "wayland")

hl.env("SDL_VIDEODRIVER", "wayland")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "1")

hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")
--hl.env("AQ_NO_ATOMIC", "1")
