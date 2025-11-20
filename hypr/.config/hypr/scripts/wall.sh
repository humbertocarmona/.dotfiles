#!/bin/bash

# Normalize session name to lowercase
session="${XDG_CURRENT_DESKTOP,,}"

# Initialize swww-daemon if not running
if ! pidof swww-daemon >/dev/null; then
    swww-daemon &
    sleep 0.2
fi

monitor_names=()
monitor_main=""

if [[ "$session" == *hyprland* ]]; then
    # --- Hyprland branch ---
    monitor_info=$(hyprctl monitors -j)

    # All monitor names
    mapfile -t monitor_names < <(echo "$monitor_info" | jq -r '.[].name')

    # Main monitor: id == 0
    monitor_main=$(echo "$monitor_info" | jq -r '.[] | select(.id == 0) | .name')

elif [[ "$session" == *niri* ]]; then
    # --- Niri branch ---
    outputs_json=$(niri msg --json outputs)

    # All monitor names (keys of the object)
    mapfile -t monitor_names < <(echo "$outputs_json" | jq -r 'keys[]')

    # Main monitor: the one at logical (0,0)
    monitor_main=$(echo "$outputs_json" | jq -r '
        to_entries[]
        | select(.value.logical.x == 0 and .value.logical.y == 0)
        | .key
    ')

    # Fallback: first monitor if none matched (just in case)
    [[ -z "$monitor_main" ]] && monitor_main="${monitor_names[0]}"

else
    echo "Unknown compositor (XDG_CURRENT_DESKTOP='$XDG_CURRENT_DESKTOP')" >&2
    exit 1
fi

echo "Main monitor is $monitor_main"

# Display images based on monitor names
for name in "${monitor_names[@]}"; do
    if [[ "$name" == "$monitor_main" ]]; then
        swww img "$1" --transition-type simple --transition-step 255 -o "$monitor_main"
    else
        swww img "$2" --transition-type simple --transition-step 255 -o "$name"
    fi
done

