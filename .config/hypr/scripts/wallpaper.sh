#!/bin/bash

WALLPAPER="$(find $HOME/.config/hypr/wallpaper/ -maxdepth 1 -type f | shuf -n 1)"
awww img --transition-type grow --transition-fps 60 --transition-duration 3 $WALLPAPER
hyprctl keyword env "WALLPAPER,$WALLPAPER"
