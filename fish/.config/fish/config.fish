set -gx TERM xterm-256color
set -Ux COLORTERM truecolor
# set -x TERM screen-256color
# set -gx TERMINAL kitty
# set -gx TERM kitty
# set -Ux fish_term24bit 1

# set -gx ZDOTDIR $HOME/.config/zsh

# set -gx EDITOR nvim
# set -gx GOPATH $HOME/.go
# set -gx BAT_THEME Catppuccin-mocha

set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 50% --preview='bat --style=numbers --color=always {}' --preview-window '~3'"
set -xU JULIA_NUM_THREADS 8

# set -U fish_user_paths $GOPATH/bin $fish_user_paths
set -U fish_user_paths $HOME/.config/bin $fish_user_paths
set -U fish_user_paths $HOME/go/bin $fish_user_paths
set -U fish_user_paths $HOME/.juliaup/bin $fish_user_paths
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
# set -x XDG_CONFIG_HOME $HOME/.config

#set -x LANG pt_BR.UTF-8
#set -x LC_ALL pt_BR.UTF-8

zoxide init fish | source
source $HOME/.config/fish/fish_aliases

fish_vi_key_bindings
fish_vi_cursor

# >>> conda initialize >>>
set -U __conda_prefix ''
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f /opt/miniconda/etc/fish/conf.d/conda.fish
        . /opt/miniconda3/etc/fish/conf.d/conda.fish
    else
        set -x PATH /opt/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<
