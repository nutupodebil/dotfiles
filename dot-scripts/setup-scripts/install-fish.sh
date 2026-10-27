#!/bin/bash

# installing fish and fisher plugin manager
sudo pacman -Syu --needed fish fisher

# installing tide plugin
fish -c "fisher install IlanCosman/tide@v6"
