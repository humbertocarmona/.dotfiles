#!/bin/bash
kmap=$(swaymsg -t get_inputs | jq '.[] | select(.type=="keyboard") | select(.libinput.accel_speed==0) | .xkb_active_layout_name')
if [ -z "$kmap" -a "$kmap" != " " ]; then
	kmap=$(swaymsg -t get_inputs | jq '.[] | select(.type=="keyboard") | select(.name|contains("Logit")) | .xkb_active_layout_name')
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
*)
	echo $kmap
	;;
esac
