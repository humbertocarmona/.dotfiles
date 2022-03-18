#!/bin/sh
userresources=$HOME/.Xresources
# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
mkdir -p "$HOME"/.local/share/keyrings


# merge in defaults and keymaps
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"

# For QT Themes
# export QT_QPA_PLATFORMTHEME=qt5ct

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
        
# load Xresources
# xrdb ~/.Xresources

# zsh config dir
# export ZDOTDIR=$HOME/.config/zsh

#  for gnome
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11

export FZF_DEFAULT_COMMAND='find .'

# exec gnome-session
exec bspwm
