set fish_greeting "fishing with $TERM .."

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end


fish_add_path -p $HOME/packages/basilisk/src
fish_add_path -p /var/snap/snapd/bin
fish_add_path -p /opt/VSCode-linux-x64/bin


export BASILISK=$HOME/packages/basilisk/src
export DISPLAY=":0"
export PIPENV_VERBOSITY=-1
export JUPYTER_TOKEN="hi"

fish_add_path -p $HOME/.local/bin

source $HOME/.config/fish/scripts/zoxide.fish
source $HOME/.config/fish/scripts/spot.fish
source $HOME/.config/ranger/scripts/ranger_cd.fish
source $HOME/.config/lf/icons
source $HOME/.config/fish/scripts/gitaddrem.fish
source $HOME/.config/fish/scripts/br.fish

set -g fish_key_bindings fish_vi_key_bindings

bind \co --mode insert 'lfrun'
bind \cp --mode insert 'lfcd'
bind \ck --mode insert 'tmux-configs'
bind \cl --mode insert 'tmux-projects'
bind \cz --mode insert 'zi'
bind \co --mode normal 'lfrun'
bind \cp --mode normal 'lfcd'
bind \ck --mode normal 'tmux-configs'
bind \cl --mode normal 'tmux-projects'
bind \cz --mode normal 'zi'
bind \cu --mode normal "rofi -modi drun -font 'Hack Nerd Font 9' -show drun -show-icon"
abbr -a -U br   br -g
abbr -a -U cl   clear
abbr -a -U cat  bat
abbr -a -U co   'code .'
abbr -a -U g    lazygit
abbr -a -U q    exit
abbr -a -U ta   tmux attach-session -t
abbr -a -U td   tmux detach
abbr -a -U tk   tmux kill-session -t
abbr -a -U tks  tmux kill-server
abbr -a -U tl   tmux list-sessions
abbr -a -U tw   tmux switch -t
abbr -a -U v    nvim 
abbr -a -U x    z

# Import colorscheme from 'wal' asynchronously
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

