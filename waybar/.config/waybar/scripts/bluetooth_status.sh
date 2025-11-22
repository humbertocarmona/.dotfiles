#!/usr/bin/env bash

# Simple Bluetooth status script for Waybar

# Check if bluetoothctl exists
command -v bluetoothctl >/dev/null 2>&1 || {
    echo '{"text": "", "tooltip": "bluetoothctl not found", "class": "off"}'
    exit 0
}

# Get controller info
info=$(bluetoothctl show 2>/dev/null)

powered=$(echo "$info" | awk '/Powered:/ {print $2}')
if [[ "$powered" != "yes" ]]; then
    # Bluetooth is off
    echo '{"text": "", "tooltip": "Bluetooth off", "class": "off"}'
    exit 0
fi

# Count connected devices
connected_count=$(bluetoothctl info | awk '/Connected: yes/{c++} END{print c+0}')

if ((connected_count > 0)); then
    # At least one connected device
    echo '{"text": "", "tooltip": "Bluetooth on", "class": "on"}'
    # echo "{\"text\": \" $connected_count\", \"tooltip\": \"Bluetooth on • $connected_count device(s) connected\", \"class\": \"on connected\"}"
else
    # On but no devices
    echo '{"text": "", "tooltip": "Bluetooth on • no devices connected", "class": "on"}'
fi
