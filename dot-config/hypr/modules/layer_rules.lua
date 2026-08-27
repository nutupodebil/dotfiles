
--
--  правила для слоев
--

hl.layer_rule({
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0.5,
    animation = "slide right",
})

hl.layer_rule({
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0.5,
    animation = "slide right",
})

hl.layer_rule({
    match = { namespace = "logout_dialog" },
    blur = true,
    animation = "slide top",
})

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true, 
})

hl.layer_rule({
    match = { namespace = "waybar" },
    animation = "slide top",
})

hl.layer_rule({
    match = { namespace = "selection" },
    no_anim = true,
})

