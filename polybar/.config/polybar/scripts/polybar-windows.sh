#!/bin/sh

active_window1=$(xprop -root _NET_ACTIVE_WINDOW|cut -d ' ' -f 5 |sed -e 's/../00&/2')
active_window0=$(xprop -root _NET_ACTIVE_WINDOW|cut -d ' ' -f 5 |sed -e 's/../0&/2')

current_display=$(wmctrl -d|grep "*"|awk '{print $1}')

primary="#F0C674"

left_side="%{F$primary}"
right_side="%{F-}"

icons="%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-};%{T2}%{T-}"






# awk separate wmctrl -l by the host name
#   $1 = contais window and workspace id
#   $2 = contains the running command
current_windows=$(wmctrl -l | awk -F'ease' -v \
    var=$icons \
    -v current_display="$current_display" \
    -v active_window0="$active_window0" \
    -v active_window1="$active_window1" \
    -v left_side="$left_side" \
    -v right_side="$right_side" '
    {
        split($1,ids," ");
        win=ids[1]
        wks=ids[2]
        if (wks>-1) {
            split(var,icons_arr,";");
            cmd=substr($2,1,30)"...";
            title=icons_arr[wks+1]" "cmd;
		    if (win==active_window0 || win==active_window1) {
			    title=left_side title right_side;
		    }
            print "%{A1: wmctrl -ia "win" & disown:}" title "%{A}";
		}
	}')
#
# Decorated version END
#######################
echo $current_windows

