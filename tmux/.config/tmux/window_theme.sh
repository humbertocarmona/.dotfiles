#!/usr/bin/env sh
# Usage: window_theme.sh <window_id> <window_name>

wid="$1"
wname="$2"

case "$wname" in
dev) # just like the default
    tmux set-window-option -t "$wid" window-active-style 'bg=#1a1b26' \; \
        set-window-option -t "$wid" window-style 'bg=#1a1b26'
    ;;
isa) # a bit darker
    tmux set-window-option -t "$wid" window-active-style 'bg=colour232' \; \
        set-window-option -t "$wid" window-style 'bg=colour230'
    ;;
fix)
    tmux set-window-option -t "$wid" window-active-style 'bg=colour52' \; \
        set-window-option -t "$wid" window-style 'bg=colour233'
    ;;
analysis)
    tmux set-window-option -t "$wid" window-active-style 'bg=colour23' \; \
        set-window-option -t "$wid" window-style 'bg=colour17'
    ;;
*)
    # defaults
    tmux set-window-option -t "$wid" window-active-style 'bg=colour235' \; \
        set-window-option -t "$wid" window-style 'bg=colour232'
    ;;
esac
