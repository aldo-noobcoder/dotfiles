#!/bin/bash

# Function to get the current volume
get_current_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//'
}

notify(){
    notify-send  -t 2000   -h string:x-canonical-private-synchronous:volume_notif -h int:value:$1 -i "$HOME/.config/niri/assets/volume.png" "Volume" "  $1"
}

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "inc" || "$1" == "dec" || "$1" == "mute" ) ]]; then
    printf "Usage: $0 [inc|dec|mute]\n"
    exit 1
fi

# Check if pactl is installed
# if ! command -v pactl &> /dev/null; then
#     echo "Error: pactl is not installed. Please install it and try again."
#     exit 1
# fi

# Perform volume adjustment

if [[ "$1" == "inc" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ false
    [ "$(get_current_volume)" -lt 150 ] && pactl set-sink-volume @DEFAULT_SINK@ +5%
    vol=$(pamixer --get-volume-human)
    notify $vol
elif [[ "$1" == "dec" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ false
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    vol=$(pamixer --get-volume-human)
    notify $vol
elif [[ "$1" == "mute" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    vol=$(pamixer --get-volume-human)
    if [[ $vol == "muted" ]]; then
        notify-send  -t 2000 -i "$HOME/.config/hypr/assets/volume.png"   -h string:x-canonical-private-synchronous:volume_notif "Volume" "  $vol"
    else
        notify $vol
    fi
fi
