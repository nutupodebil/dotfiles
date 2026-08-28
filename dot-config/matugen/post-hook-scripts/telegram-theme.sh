#!/bin/sh

walname="background.jpg"

magick ~/.cache/matugen/current-wallpaper.jpg -resize 1920x1080 ~/.cache/matugen/$walname
magick ~/.cache/matugen/$walname -blur "0x16" ~/.cache/matugen/$walname

zip -j ~/.cache/matugen/mat.zip ~/.cache/matugen/$walname ~/.cache/matugen/colors.tdesktop-theme

mv ~/.cache/matugen/mat.zip ~/.cache/matugen/mat.tdesktop-theme
