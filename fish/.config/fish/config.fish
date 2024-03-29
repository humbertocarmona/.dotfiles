set -gx TERMINAL kitty
set -gx ZDOTDIR $HOME/.config/zsh
set -gx EDITOR nvim
set -gx GOPATH $HOME/.go
set -gx BAT_THEME Catppuccin-mocha
# set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore .cache -g ""'
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 50% --preview='bat --color=always {}'"
set -gx TEXMFHOME $HOME/.texmf
set -x PYTHONPATH $PYTHONPATH $HOME/Dev/ESP/Mabell/src/
set -xU JULIA_NUM_THREADS 8

set -U fish_user_paths $GOPATH/bin $fish_user_paths
set -U fish_user_paths $HOME/.config/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths /usr/local/texlive/2023/bin/x86_64-linux $fish_user_paths
set -U fish_user_paths /opt/juliaup/bin $fish_user_paths

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
set -U JULIA_LOAD_PATH $HOME/.julia/packages $JULIA_LOAD_PATH
set -U JULIA_LOAD_PATH $HOME/projects/RL/random_laser_jl $JULIA_LOAD_PATH

zoxide init fish | source
source $HOME/.config/fish/fish_aliases

fish_vi_key_bindings
fish_vi_cursor
source /opt/conda/etc/fish/conf.d/conda.fish
# conda activate py311
