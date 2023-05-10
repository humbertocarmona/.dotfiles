#!/bin/bash
kmap=$(swaymsg -t get_inputs | jq '.[] | select(.type=="keyboard") | select((.name|contains("keyboard")) or (.name|contains("Keychron"))) | select(.libinput.accel_speed==null) | .xkb_active_layout_name')

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
*)
	echo ${kmap}
	;;
esac
