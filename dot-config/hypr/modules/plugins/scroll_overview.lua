--
--  scroll-overview plugin config
--

--  configuration
hl.config({
  plugin = {
    scrolloverview = {
      gesture_distance = 150, -- how far is the "max" for the gesture
      scale = 0.6,            -- preferred overview scale
      workspace_gap = 50,
      layout = "auto",        -- vertical, horizontal, or auto (per-monitor orientation)
      wallpaper = 2,          -- 0: global only, 1: per-workspace only, 2: both
      blur = true,            -- blur only the main overview wallpaper

      shadow = {
        enabled = true,
        range = 50,
      },
    },
  },
})

--  binds
hl.bind("SUPER + g", function()
  hl.plugin.scrolloverview.overview("toggle all")
end)

--  gestures
hl.plugin.scrolloverview.gesture({ fingers = 3, direction = "vertical" })
