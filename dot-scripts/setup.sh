#!/bin/sh


# creating config dirs in ~/.config
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/btop
mkdir -p ~/.config/cava
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0
mkdir -p ~/.config/hypr
mkdir -p ~/.config/hyprmoncfg/profiles
mkdir -p ~/.config/iris
mkdir -p ~/.config/kitty
mkdir -p ~/.config/Kvantum
mkdir -p ~/.config/matugen
mkdir -p ~/.config/nvim
mkdir -p ~/.config/qt5ct
mkdir -p ~/.config/qt6ct
mkdir -p ~/.config/rofi/colors
mkdir -p ~/.config/spicetify
mkdir -p ~/.config/swaync/colors
mkdir -p ~/.config/systemd
mkdir -p ~/.config/vesktop
mkdir -p ~/.config/waybar
mkdir -p ~/.config/waypaper
mkdir -p ~/.config/wlogout/colors


# installing all necessary packages
sudo pacman -S --needed stow \
  kitty \
  vim \
  neovim \
  fastfetch \
  hyprland \
  hypridle \
  hyprlock \
  hyprpm \
  hyprshutdown \
  xdg-desktop-portal-hyprland \
  waybar \
  rofi \
  nautilus \
  swaync \
  awww \
  matugen \
  btop \
  cava \
  kvantum \
  qt5ct \
  qt6ct \
  gtk3 \
  gtk4

yay -S --needed hyprmoncfg-bin \
  wlogout \
  waypaper \
  iris-colors


# rebuilding the get_backlight_device script
clang++ --std=c++20 -O3 -fsanitize=address,undefined -Wall -Wextra -Werror ~/.dotfiles/dot-scripts/src/get_backlight_device.cpp -o ~/.dotfiles/dot-scripts/get_backlight_device
