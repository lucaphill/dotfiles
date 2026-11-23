#!/bin/sh
pkill swaybg
swaybg -i "$(find ~/Imagens/wallpaper_mango -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | shuf -n 1)" -m fill &
