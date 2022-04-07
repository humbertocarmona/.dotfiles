#!/bin/sh
userresources=$HOME/.Xresources
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
mkdir -p "$HOME"/.local/share/keyrings


# merge in defaults and keymaps
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export VISUAL="neovide"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="bat"
export WM="bspwm"
# For QT Themes
# export QT_QPA_PLATFORMTHEME=qt5ct

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
        
# load Xresources
# xrdb ~/.Xresources
export ZDOTDIR=$HOME/.config/zsh/

# zsh config dir
# export ZDOTDIR=$HOME/.config/zsh

#  for gnome
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS="1;1;1"

export FZF_DEFAULT_COMMAND='find .'



# xrandr --output DP-1 --mode 2560x1440 --rate 59.95 --left-of DP-1  
xrandr --output HDMI1 --dpi 96
nitrogen --restore &
# auto backup
remaps &
start_backintime &
# Network Manager Applet
nm-applet --indicator &

autostart="mpd picom dunst unclutter pipewire flameshot udiskie dwmblocks"
for program in $autostart; do
	pidof -s "$program" || setsid -f "$program"
done >/dev/null 2>&1

[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm 
