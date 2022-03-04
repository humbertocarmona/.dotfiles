#!/bin/sh
userresources=$HOME/.Xresources

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

#exec gnome-session
exec bspwm
