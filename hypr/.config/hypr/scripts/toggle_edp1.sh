#!/bin/bash
if rg eDP-1,preferred /home/humberto/.config/hypr/hyprland.conf; then
    sed -i -e s/eDP-1,preferred/eDP-1,disable/g /home/humberto/.config/hypr/hyprland.conf
else
    sed -i -e s/eDP-1,disable/eDP-1,preferred/g /home/humberto/.config/hypr/hyprland.conf
fi
