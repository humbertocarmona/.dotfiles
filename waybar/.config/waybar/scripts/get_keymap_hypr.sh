#!/bin/bash

kmap=$(hyprctl -j devices | jq '.keyboards | .[] |select(.name == "keychron-keychron-k2") | .active_keymap')
if [ -z "$kmap" -a "$kmap" != " " ]; then
    kmap=$(hyprctl -j devices | jq '.keyboards | .[] |select(.name|contains("logitech-wireless-keyboard")) | .active_keymap')
fi

case "$kmap" in
    "\"English (US)\"")
        echo " US"
    ;;
    "\"English (US, intl., with dead keys)\"") 
        echo " US (intl)"
    ;;
    "\"Portuguese (Brazil)\"")
        echo " BR"
        ;;
    *) echo $kmap
    ;;
esac