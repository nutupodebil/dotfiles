#!/bin/sh


# installing zsh
sudo pacman -S --needed zsh
chsh -s /usr/bin/zsh


# installing oh-my-zsh and powerlevel10k
sudo pacman -S --needed curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
