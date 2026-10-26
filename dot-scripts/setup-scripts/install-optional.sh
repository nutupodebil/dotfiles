#!/bin/sh

# installing optional packages
# from pacman
sudo pacman -S --needed ly \
  power-profiles-daemon \
  asusctl \
  rog-control-center \
  spotify-launcher \
  telegram-desktop \
  steam

# from AUR
yay -S --needed spicetify-cli \
  vesktop-bin \
  zen-browser-bin \
  adwsteamgtk
