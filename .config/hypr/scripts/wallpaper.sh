#!/bin/bash

WALLPAPER="$(find $HOME/.config/hypr/wallpaper/ -maxdepth 1 -type f | shuf -n 1)"
awww img --transition-type grow --transition-pos 0.5,1.0 --transition-fps 60 --transition-duration 5 $WALLPAPER
hyprctl keyword env "WALLPAPER,$WALLPAPER"