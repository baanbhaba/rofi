#!/bin/bash
lock="󰌾  Lock"
shutdown="  Shutdown"
reboot="󰜉  Reboot"
logout="󰈆  Logout"
options="$shutdown\n$reboot\n$logout\n$lock"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/config.rasi)"

case "$chosen" in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $logout)
        hyprctl dispatch exit
        ;;
    $lock)
        pidof hyprlock >/dev/null || hyprlock
        ;;
esac
