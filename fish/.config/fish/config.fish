set -gx TERMINAL kitty
set -gx ZDOTDIR $HOME/.config/zsh
set -gx EDITOR nvim
set -gx GOPATH $HOME/.go
set -gx BAT_THEME Catppuccin-mocha
# set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore .cache -g ""'
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 50% --preview='bat --color=always {}'"

set -U fish_user_paths $GOPATH/bin $fish_user_paths
set -U fish_user_paths $HOME/.config/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

zoxide init fish | source
source $HOME/.config/fish/fish_aliases

abbr cat bat
abbr icat 'kitty +kitten icat --transfer-mode file'

abbr bt 'sudo btrfs'
abbr cl clear
abbr df 'df -h' # human-readable sizes
abbr kb 'rg bindsym ~/.config/sway/config | fzf --preview ""'

abbr g lazygit
abbr zd 'z ~/.dotfiles'
abbr zv 'z ~/.config/nvim'
abbr zl 'z ~/.config/lf'
abbr zs 'z ~/.config/sway'
abbr zb 'z ~/.config/waybar'
abbr zf 'z ~/.config/fish'

abbr ve 'pipenv shell --fancy'

abbr f lfcd
# tmux stuff
abbr mux tmuxinator
abbr ta 'tmux attach-session'
abbr td 'tmux detach'
abbr tk 'tmux kill-session'
abbr tl 'tmux list-sessions'
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
