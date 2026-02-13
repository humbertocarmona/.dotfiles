set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_TYPE wayland

# Import into systemd user environment
systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_TYPE WAYLAND_DISPLAY

# Import into DBus activation environment
dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP XDG_SESSION_TYPE WAYLAND_DISPLAY
