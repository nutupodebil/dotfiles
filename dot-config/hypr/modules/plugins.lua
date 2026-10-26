--
-- плагины
--

--  цвета
require("~/.cache/iris/colors-hyprland")

hl.config({
  plugin = {
    hyprcapture = {
      default_mode = "region",
      fullscreen_scope = "all",
      overlay_scope = "fix",
      window_background = "follow-system",
      window_border = "keep",
      window_shadow = "keep",
      notification_backend = "system",
      screenshot_notification = true,
      notification_title_template = "Screenshot captured",
      notification_body_template = "Saved {filename} ({window_title})",
      save = false,
      clipboard = true,
      show_thumbnail = true,
      language = "auto",
      remember_settings = false,
      allow_quick = false,
      confirm_before_capture = false,
      fusion_mode = true,
      capture_fullscreen_clients_as_monitor = false,
      dynamic_window_metadata = true,
      window_wheel_scroll = true,
      window_wheel_scope = "workspace",
      fullscreen_preview_rounding = "auto",
      save_dir = "$XDG_PICTURES_DIR/screenshots",
      filename_template = "Screenshot-%Y-%m-%d-%H%M%S.png",
      record_save_dir = "$XDG_VIDEOS_DIR/screenrecords",
      record_filename_template = "Recording-%Y-%m-%d-%H%M%S.mp4",
      record_format = "mp4",
      record_transparent_format = "webm",
      record_fps = 30,
      record_fps_options = "30 60 120",
      record_window_fps_limit = 12,
      record_window_real_bg_fps_limit = 8,
      record_audio = "off",
      record_audio_output = "auto",
      record_audio_input = "default",
      record_codec = "auto",
      record_transparent_codec = "auto",
      record_solid_alpha = false,
      record_preset = "veryfast",
      record_gsr_flags = "",
      record_window_backend = "auto",
      record_max_seconds = 0,
      record_countdown_seconds = 0,
      include_cursor = false,
      thumbnail_timeout_ms = 2500,
      thumbnail_monitor = "active",
      watermark = "",
      watermark_position = "central",
      watermark_width = "20%",
      watermark_offset = "0 0",
    },

    hyprexpo = {
      --columns = 3,
      dynamic_grid = 1,
      gaps_in = 8,
      gaps_out = 8,
      bg_col = bg,
      workspace_method = "center current",
      label_enable = 1,
      label_text_mode = "id",
      gesture_distance = 200,
      cancel_key = "escape",
      show_cursor = 1,
      wallpaper_bg = 0,
    },
  },
})

hl.define_submap("hyprexpo", function()
  hl.bind("left", function() hl.plugin.hyprexpo.kb_focus("left") end)
  hl.bind("right", function() hl.plugin.hyprexpo.kb_focus("right") end)
  hl.bind("up", function() hl.plugin.hyprexpo.kb_focus("up") end)
  hl.bind("down", function() hl.plugin.hyprexpo.kb_focus("down") end)
  hl.bind("return", function() hl.plugin.hyprexpo.kb_confirm() end)
  hl.bind("escape", function() hl.plugin.hyprexpo.expo("cancel") end)
end)
