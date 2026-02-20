# set -gx TERM xterm-256color
set -gx TERM xterm-kitty
set -Ux COLORTERM truecolor
set -gx EDITOR nvim
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 50% --preview='bat --style=numbers --color=always {}' --preview-window '~3'"
set -xU JULIA_NUM_THREADS 8
set -xU JULIA_PROJECT "./"
set -U fish_user_paths $HOME/.config/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/go/bin $fish_user_paths
set -U fish_user_paths $HOME/.juliaup/bin $fish_user_paths
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

fish_vi_key_bindings
fish_vi_cursor

source $HOME/.config/fish/fish_aliases
zoxide init fish | source

#pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

status --is-interactive; and pyenv init --path | source
status --is-interactive; and pyenv init - | source

# set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_TYPE wayland

# Import into systemd user environment
# Import into DBus activation environment
dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP XDG_SESSION_TYPE WAYLAND_DISPLAY

systemctl --user import-environment XDG_CURRENT_DESKTOP WAYLAND_DISPLAY XDG_SESSION_TYPE
systemctl --user restart xdg-desktop-portal
