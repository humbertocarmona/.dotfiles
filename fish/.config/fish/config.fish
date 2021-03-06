set fish_greeting "fishing with $TERM .."


# test -z returns 0 if the string length is 0
# test (cond1) -a (cond2) combine expresions
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1 -a $USER = "humberto"
        exec startx -- -keeptty
    end
end


fish_add_path -p $HOME/packages/basilisk/src
fish_add_path -p /var/snap/snapd/bin
fish_add_path -p /opt/VSCode-linux-x64/bin
fish_add_path -p $HOME/.cargo/bin

export BASILISK=$HOME/packages/basilisk/src
export DISPLAY=":0"
export PIPENV_VERBOSITY=-1
export JUPYTER_TOKEN="hi"
export GPG_TTY=$(tty)

fish_add_path -p $HOME/.local/bin

source $HOME/.config/fish/scripts/zoxide.fish
source $HOME/.config/fish/scripts/spot.fish
source $HOME/.config/ranger/scripts/ranger_cd.fish
source $HOME/.config/lf/icons
source $HOME/.config/fish/scripts/gitaddrem.fish
source $HOME/.config/fish/scripts/br.fish

set -g fish_key_bindings fish_vi_key_bindings

bind \co --mode insert 'nvim (fzf)'
bind \ck --mode insert 'tmux-configs'
bind \cl --mode insert 'tmux-projects'
bind \cz --mode insert 'zi'
bind \co --mode normal 'nvim (fzf)'
bind \ck --mode normal 'tmux-configs'
bind \cl --mode normal 'tmux-projects'
bind \cz --mode normal 'zi'
abbr -a -U br   br -g
abbr -a -U cl   clear
abbr -a -U cat  bat
abbr -a -U co   'code . && exit'
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
abbr -a -U l    exa 
abbr -a -U ll   exa -l --icons
abbr -a -U la   exa -la --icons
abbr -a -U lf   lfrun

# Import colorscheme from 'wal' asynchronously
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

