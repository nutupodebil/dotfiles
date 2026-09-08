
--
-- плагины
--

--  цвета
require("~/.cache/iris/colors-hyprland")

hl.config({
    plugin = {
        hyprexpo = {
            --columns = 3,
            dynamic_grid = 1,
            gaps_in = 8,
            gaps_out = 8,
            bg_col = bg,
            workspace_method = "center current",
            gesture_distance = 200,
            cancel_key = "escape",
            show_cursor = 1,
            wallpaper_bg = 0,
        },
    },
})

hl.define_submap("hyprexpo", function()
    hl.bind("left",   function() hl.plugin.hyprexpo.kb_focus("left") end)
    hl.bind("right",  function() hl.plugin.hyprexpo.kb_focus("right") end)
    hl.bind("up",     function() hl.plugin.hyprexpo.kb_focus("up") end)
    hl.bind("down",   function() hl.plugin.hyprexpo.kb_focus("down") end)
    hl.bind("return", function() hl.plugin.hyprexpo.kb_confirm() end)
    hl.bind("escape", function() hl.plugin.hyprexpo.expo("cancel") end)
end)