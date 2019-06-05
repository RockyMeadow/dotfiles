#!/bin/sh

old="$(upower -i /org/freedesktop/UPower/devices/line_power_AC | fgrep online | awk '{print $2}')"
while sleep 1; do
    new="$(upower -i /org/freedesktop/UPower/devices/line_power_AC | fgrep online | awk '{print $2}')"
    if [ "$new" != "$old" ]; then
        if [ "$new" == "yes" ]; then
            notify-send --icon=gnome-power-manager "AC power on"
        elif [ "$new" == "no" ]; then
            notify-send --icon=gnome-power-manager "Battery power on"
        fi
    fi
    old="$new"
done
