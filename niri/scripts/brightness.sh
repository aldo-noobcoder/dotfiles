#!/usr/bin/env bash

function notify_brightness() {
  BRIGHTNESS_PERCENT=$(light -G | cut -c1-2)
  notify-send -t 2000  -h string:x-canonical-private-synchronous:brightness_notif  -h int:value:$BRIGHTNESS_PERCENT -u low -i "$HOME/.config/niri/assets/brightness.png" "Brightness" " $BRIGHTNESS_PERCENT %"
}

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "inc" || "$1" == "dec") ]]; then
    printf "Usage: %s [inc|dec]\n" "$0" >&2
    exit 1
fi

# Check if brightnessctl is available
# if ! command -v brightnessctl &> /dev/null; then
#   echo "Error: brightnessctl is not installed. Please install it." >&2
#   exit 1
# fi

# Perform brightness adjustment
if [[ "$1" == "inc" ]]; then
  brightnessctl set +5% > /dev/null
  notify_brightness
elif [[ "$1" == "dec" ]]; then
  brightnessctl set 5%- > /dev/null
  notify_brightness
fi
