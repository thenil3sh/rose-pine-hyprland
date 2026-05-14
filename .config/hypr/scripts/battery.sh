#!/bin/bash

AC_DEVICE=$(upower -e | grep line_power)
LAST_BAT_STATE=2
LAST_NOTIF_ID=""

upower --monitor | while read -r line; do
    state=$(upower -i "$AC_DEVICE" | grep 'online' | awk '{print $2}')

    if [ "$state" = "yes" ] && [ "$LAST_BAT_STATE" -ne 0 ]; then
        LAST_BAT_STATE=0
        notify-send -p --icon battery-medium-charging --app-name "POWER" -t 3000 "Device plugged In"

    elif [ "$state" = "no" ] && [ "$LAST_BAT_STATE" -ne 1 ]; then
        LAST_BAT_STATE=1
        notify-send -p --icon battery-medium --app-name "POWER" -t 3000 "Device on battery"

    fi
done
