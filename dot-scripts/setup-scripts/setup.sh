#!/bin/bash

# creating config dirs in ~/.config
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/btop
mkdir -p ~/.config/cava
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/fish
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0
mkdir -p ~/.config/hypr/monitor-profiles
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
mkdir -p ~/.config/zellij

mkdir -p ~/.local/share/icons
mkdir -p ~/.local/share/fonts

# installing all necessary packages
# from pacman
sudo pacman -Syu --needed stow \
  clang \
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
  gtk4 \
  zip

# install yay
sudo pacman -Syu --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si

# from AUR
yay -Syu --needed hyprmoncfg-bin \
  wlogout \
  iris-colors

# rebuilding the get_backlight_device script
clang++ --std=c++20 -O3 -fsanitize=address,undefined -Wall -Wextra -Werror ~/.dotfiles/dot-scripts/src/get_backlight_device.cpp -o ~/.dotfiles/dot-scripts/get_backlight_device

# adding HyprCapture and hyprexpo plugins
hyprpm update
hyprpm add https://github.com/gfhdhytghd/HyprCapture
hyprpm enable hyprcapture
hyprpm add https://github.com/sandwichfarm/hyprexpo
hyprpm enable hyprexpo
hyprpm reload
