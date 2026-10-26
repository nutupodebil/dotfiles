#!/bin/bash

wallpaper_dir="$HOME/.dotfiles/wallpapers"
monitor="eDP-1"

find "$wallpaper_dir" -type f \
  \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) -print0 |
  while IFS= read -r -d $'\0' file; do
    rel="${file#"$wallpaper_dir"/}"
    printf "%s\0icon\x1f%s\n" "$rel" "$file"
  done |
  rofi -dmenu -i -p "wallpaper" -show-icons -markup-rows \
    -width 40 -lines 15 -theme ~/.config/rofi/wallpaper-switcher.rasi |
  while IFS= read -r selected_wallpaper; do
    if [[ -n "$selected_wallpaper" ]]; then
      image="$wallpaper_dir/$selected_wallpaper"
      awww img "$wallpaper_dir/$selected_wallpaper" --transition-type=any --transition-duration=2 --transition-fps=90
      #hyprctl hyprpaper wallpaper "$monitor, $image, fill"
      ln -sf $image ~/.cache/matugen/current-wallpaper.jpg
      ln -sf ~/.cache/iris/colors-rofi.rasi ~/.config/rofi/colors/iris-colors.rasi
      ln -sf ~/.cache/iris/colors-waybar.css ~/.config/swaync/colors/iris-colors.css
      ln -df ~/.cache/iris/colors-waybar.css ~/.config/wlogout/colors/iris-colors.css
      iris --dark -1 $image
      swaync-client -rs
      matugen image $image --source-color-index 0 -t scheme-smart -m smart --lightness-light -0.1 --show-colors
      pkill -SIGUSR2 waybar
    fi
  done
