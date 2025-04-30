selected=$(rofi -dmenu -p "Select waybar" < ~/.config/waybar/waybar-switcher/waybar-configs.txt)
echo "$selected" > /home/jack/.config/waybar/waybar-switcher/current.sh
pkill waybar
eval "$selected"
