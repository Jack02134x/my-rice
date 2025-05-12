#!/usr/bin/bash

# bar/panel
./.config/waybar/waybar-switcher/current.sh &
#hyprpanel &

# wallpaper
#hyprpaper &
swww-daemon &
#mpvpaper -o "no-audio --loop-playlist shuffle" eDP-1 /home/jack/.config/hypr/wallpapers/'21 - Lone Samurai Sekiro Live Wallpaper.mp4' &

# Applets
nm-applet &

#notifications
swaync &

#applications
telegram-desktop -startintray &
zapzap &
steam -silent &

# hypridle the automatic lock
hypridle &

# other
wl-paste --watch cliphist store &
