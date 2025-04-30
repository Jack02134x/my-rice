#!/bin/bash

# Dependencies: wofi, bluetoothctl, nmcli, pavucontrol
check_dependencies() {
    for cmd in wofi bluetoothctl nmcli pavucontrol; do
        if ! command -v $cmd &> /dev/null; then
            echo "Error: $cmd is not installed. Please install it."
            exit 1
        fi
    done
}

# Show Wofi menu for selection
show_menu() {
    local prompt="$1"
    shift
    local options=("$@")
    printf "%s\n" "${options[@]}" | wofi --show dmenu --prompt="$prompt"
}

# Main function
main() {
    check_dependencies
    local choice=$(show_menu "Quick Settings" "Bluetooth" "Network Manager" "Volume Control" "Hypr" "Waybar" "Scripts")
    case "$choice" in
        "Bluetooth") kitty -e bluetuith ;;
        "Network Manager") kitty -e nmtui ;;
        "Volume Control") pavucontrol & ;;
        "Hypr") kate ~/.config/hypr/ ;;
        "Waybar") kate ~/.config/waybar/ ;;
        "Scripts") kate ~/.scripts ;;
    esac
}

main