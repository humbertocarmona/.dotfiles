#!/bin/sh

active_window=$(xprop -root _NET_ACTIVE_WINDOW|cut -d ' ' -f 5 |sed -e 's/../00&/2')
active_window2=$(xprop -root _NET_ACTIVE_WINDOW|cut -d ' ' -f 5 |sed -e 's/../0&/2')

current_display=$(wmctrl -d|grep "*"|awk '{print $1}')

#########################
# Simple version BEGIN
#
#current_windows=$(wmctrl -lx|awk -v current_display="$current_display" -v active_window="$active_window" '
#
#	{if ($2==current_display) {
#
#		if ($1==active_window) {
#
#			$3="#"$3;
#
#			}
#
#		split($3,window_title,".")
#
#		print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"
#
#		}
#
#	}')
#
# Simple version END
#########################

#########################
# Decorated version BEGIN
#
color0="20577a"
color2="ffffff"
color1="ffaa00"
active_window_decoration_style_left_side="%{F#$color1}%{+u}%{u#$color1}"
active_window_decoration_style_right_side="%{-u}%{F-}"

icons=";;;;;;;;;"
 

current_windows=$(wmctrl -lx -F | awk -v \
    var=$icons \
    -v current_display="$current_display" \
    -v active_window="$active_window" \
    -v active_window2="$active_window2" \
    -v active_window_decoration_style_left_side="$active_window_decoration_style_left_side" \
    -v active_window_decoration_style_right_side="$active_window_decoration_style_right_side" '
	{if ($2>-1) {
		  split($3,window_title,".")
      split(var,icons_arr,";")
		  if ($1==active_window || $1==active_window2) {
			  window_title[1]=active_window_decoration_style_left_side icons_arr[$2+1]" "$5 active_window_decoration_style_right_side
		  }else{
        window_title[1]=icons_arr[$2+1]" "$5
      }
      print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"
		}
	}')
#
# Decorated version END
#######################
echo $current_windows

