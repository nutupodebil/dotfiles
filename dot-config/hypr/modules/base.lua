
--
--  основа
--

--  цвета
require("~/.cache/iris/colors-hyprland")

hl.config({
    general = {
        gaps_in  = 6,
        gaps_out = 12,
        border_size = 2,
        col = {
            active_border   = fg, --accent
            inactive_border = dim,
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },
    
    cursor = {
        inactive_timeout = 5,
        --hide_on_key_press = true,
    },

    decoration = {
        rounding       = 6,
        rounding_power = 2,
        active_opacity   = 0.8,
        inactive_opacity = 0.5,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled   = true,
            size      = 7,
            noise     = 0.015, --0.0117,
            passes    = 3,
            vibrancy  = 0.1696,
            popups    = true,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    input = {
        kb_layout  = "us, ru",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
        sensitivity  = 0,
    },
})
