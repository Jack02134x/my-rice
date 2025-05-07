#!/bin/bash

# Show Wofi menu for selection
show_menu() {
    local prompt="$1"
    shift
    local options=("$@")
    printf "%s\n" "${options[@]}" | wofi --show dmenu --prompt="$prompt"
}

# Main function
main() {

    # Step 1: Ask for mode
    local mode
    mode=$(show_menu "Select waybar" "animated-waybar" "blush" "darkminimal" "darkminimaljp" "minimal" "slanted-bubbles")
    [[ -z "$mode" ]] && exit 0 # Exit if no selection

    # Step 2: change waybar
    pkill waybar; waybar --config ~/.config/waybar/themes/$mode/config.jsonc --style ~/.config/waybar/themes/$mode/style.css &

    # Step 3: Keep track of current waybar
    echo "waybar --config ~/.config/waybar/themes/$mode/config.jsonc --style ~/.config/waybar/themes/$mode/style.css" > ~/.config/waybar/waybar-switcher/current.sh
}

main
