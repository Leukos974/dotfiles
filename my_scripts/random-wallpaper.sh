#!/bin/bash
# random-wallpaper.sh

wallpaper_dir="$HOME/Pictures/Wallpapers"
files=("$wallpaper_dir"/*)
random_wallpaper="${files[RANDOM % ${#files[@]}]}"

feh --bg-fill "$random_wallpaper"

