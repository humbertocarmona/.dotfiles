#!/bin/bash

DEVICE="DLL0945:00:06CB:CDE6:Touchpad"
STATE=$(swaymsg -t get_inputs | grep "$DEVICE" -A10 | grep "send_events" | awk '{print $2}' | tr -d ',')

echo "\"$DEVICE"\"
if [ "$STATE" == "enabled" ]; then
	swaymsg input "$DEVICE" events disabled
else
	swaymsg input "$DEVICE" events enabled
fi
