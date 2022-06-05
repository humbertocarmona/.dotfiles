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
# source $HOME/.config/ranger/scripts/ranger_cd.fish
source $HOME/.config/lf/icons
source $HOME/.config/fish/scripts/gitaddrem.fish
source $HOME/.config/fish/scripts/br.fish

set -g EDITOR (type -p vim)

set -g fish_key_bindings fish_vi_key_bindings

bind \co -M insert 'lfrun'
bind \cl -M insert 'tmux-configs'
bind \ck -M insert 'tmux-projects'
# bind \cz -M insert 'zi'
# bind \cu -M insert 'docker-compose up'
# bind \cd -M insert 'docker-compose down'
# bind \co 'lfcd'
# bind \cl 'tmux-configs'
# bind \ck 'tmux-projects'
# bind \cz 'zi'
# bind \cu 'docker-compose up'
# bind \cd 'docker-compose down'


# abbr -a -U ls exa
# abbr -a -U l exa -lh
# abbr -a -U ll exa -lha
# abbr -a -U cat bat
# abbr -a -U tl tmux ls

abbr -a -U tw tmux switch -t
abbr -a -U tk tmux kill-session -t
abbr -a -U tks tmux kill-server
abbr -a -U ta tmux attach-session -t
abbr -a -U td tmux detach
abbr -a -U c clear
abbr -a -U q exit
abbr -a -U :q exit

abbr -a -U g lazygit
abbr -a -U lf lfrun
abbr -a -U x z
abbr -a -U co 'code .'

# abbr -a -U rm rm -i
# abbr -a -U @ease ssh 192.168.15.11
# abbr -a -U @ease ssh 10.2.21.222

# Import colorscheme from 'wal' asynchronously
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

rev
