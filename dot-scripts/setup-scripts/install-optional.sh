#!/bin/bash

# installing optional packages
# from pacman
sudo pacman -Syu --needed ly \
  power-profiles-daemon \
  asusctl \
  rog-control-center \
  spotify-launcher \
  telegram-desktop \
  steam

# from AUR
yay -Syu --needed spicetify-cli \
  vesktop-bin \
  zen-browser-bin \
  adwsteamgtk
