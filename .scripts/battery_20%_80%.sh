#!/bin/bash

cap_file="/sys/class/power_supply/BAT1/capacity"
st_file="/sys/class/power_supply/BAT1/status"

while true; do
    battery_percentage=$(cat "$cap_file")
    status=$(cat "$st_file")

    if [[ $battery_percentage -ge 80 && $battery_percentage -le 85 && "$status" != "Discharging" ]]; then
        notify-send " LET IT DRAIN    Battery Level: ${battery_percentage}%"
    elif [[ $battery_percentage -le 25 && "$status" == "Discharging" ]]; then
        notify-send " CHARGE IT UP    Battery Level: ${battery_percentage}%"
        brightnessctl set 20%
    fi

    sleep 45
done
