#!/bin/bash

# Get the full path to the wallpaper
wall="$1"

# If no input is provided, read from the default file
if [ -z "$wall" ]; then
    wall=$(cat "$HOME/wallpaper/current-wal.txt")
fi

# Set wallpaper
if ! pgrep -x "swww" > /dev/null; then
    swww init
fi

# Track current wallpaper
echo "$wall" > "$HOME/wallpapers/current-wal.txt"


swww img "$wall"

# Generate and apply theme
matugen image "$wall" --mode dark
