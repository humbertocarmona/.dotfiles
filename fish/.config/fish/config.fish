# set -gx TERMINAL kitty
# set -gx TERM kitty
# set -gx ZDOTDIR $HOME/.config/zsh
# set -gx EDITOR nvim
# set -gx GOPATH $HOME/.go
# set -gx BAT_THEME Catppuccin-mocha
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 50% --preview='bat --style=numbers --color=always {}' --preview-window '~3'"
set -gx TEXMFHOME $HOME/.texmf
# set -x PYTHONPATH $PYTHONPATH $HOME/Dev/ESP/Mabell/src/
set -xU JULIA_NUM_THREADS 8

# set -U fish_user_paths $GOPATH/bin $fish_user_paths
set -U fish_user_paths $HOME/.config/bin $fish_user_paths
set -U fish_user_paths $HOME/go/bin $fish_user_paths
# set -U fish_user_paths /usr/local/texlive/2023/bin/x86_64-linux $fish_user_paths
set -U fish_user_paths $HOME/.juliaup/bin $fish_user_paths
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
#set -x LANG pt_BR.UTF-8
#set -x LC_ALL pt_BR.UTF-8
# Set TERM depending on whether we're inside tmux
set -x TERM screen-256color

# set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# set -U JULIA_LOAD_PATH $HOME/.julia/packages $JULIA_LOAD_PATH
# set -U JULIA_LOAD_PATH $HOME/projects/RL/random_laser_jl $JULIA_LOAD_PATH
set -U __conda_prefix ''

zoxide init fish | source
source $HOME/.config/fish/fish_aliases
fish_vi_key_bindings
fish_vi_cursor

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f /opt/miniconda/etc/fish/conf.d/conda.fish
        . /opt/miniconda3/etc/fish/conf.d/conda.fish
    else
        set -x PATH /opt/miniconda3/bin $PATH
    end
end
# conda activate py312
# conda deactivate
conda activate py313
# <<< conda initialize <<<
if not test -d /run/tmux
    echo "criando tmux"
    sudo mkdir /run/tmux
    sudo chown -R humberto:humberto /run/
    tmux new -s (pwd | sed 's/.*\///g')
end

# Get current directory name (used as session name)
#set session_name (pwd | sed 's:.*/::')

# Check if tmux is running any session with that name
#if tmux list-sessions 2>/dev/null
#    echo "available tmux sessions: ta -t session_name"
#    tmux list-sessions
#else
#    tmux new-session -s "$session_name" -c "$PWD" 2>/dev/null
#end
