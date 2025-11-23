set -gx TERM xterm-256color
set -Ux COLORTERM truecolor
set -gx EDITOR nvim
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 50% --preview='bat --style=numbers --color=always {}' --preview-window '~3'"
set -xU JULIA_NUM_THREADS 8
set -U fish_user_paths $HOME/.config/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths
set -U fish_user_paths $HOME/go/bin $fish_user_paths
set -U fish_user_paths $HOME/.juliaup/bin $fish_user_paths
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

fish_vi_key_bindings
fish_vi_cursor

source $HOME/.config/fish/fish_aliases
zoxide init fish | source

# set -x TERM screen-256color
# set -gx TERMINAL kitty
# set -gx TERM kitty
# set -Ux fish_term24bit 1
# set -gx ZDOTDIR $HOME/.config/zsh
# set -gx GOPATH $HOME/.go
# set -gx BAT_THEME Catppuccin-mocha
# set -U fish_user_paths $GOPATH/bin $fish_user_paths
# set -x XDG_CONFIG_HOME $HOME/.config
# set -x LANG pt_BR.UTF-8
# set -x LC_ALL pt_BR.UTF-8
