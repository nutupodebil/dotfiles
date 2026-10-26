#!/bin/sh

# installing dependences
sudo pacman -Syu --needed nodejs npm
sudo npm install -g pnpm

# installing font with cool icons
git clone https://github.com/kvndrsslr/sketchybar-app-font.git && cd sketchybar-app-font && pnpm install && pnpm run build && cp dist/sketchybar-app-font.ttf ~/.local/share/fonts/
fc-cache -fv
