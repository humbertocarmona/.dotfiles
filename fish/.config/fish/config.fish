# Start X at login
set fish_greeting "fishing with $TERM .."
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        # exec startx -- -keeptty
    end
end

if status is-interactive
    fish_add_path -g $HOME/.local/bin
    source $HOME/.config/fish/scripts/zoxide.fish
    source $HOME/.config/fish/scripts/spot.fish
    source $HOME/.config/ranger/scripts/ranger_cd.fish
    source $HOME/.config/lf/icons
    source $HOME/.config/fish/scripts/gitaddrem.fish
    source $HOME/.config/fish/scripts/br.fish
    export CCHEFE="$HOME/Projetos/Cientista-Chefe/"
    export ANALISE="$HOME/Projetos/Cientista-Chefe/COVID/analysis/"
    export PREPRO="$HOME/Projetos/Cientista-Chefe/COVID/preprocessaISUS/"
end


# set -g fish_key_bindings fish_vi_key_bindings
# bind \cc -M insert kill-while-line repaint

bind \ce 'source ~/.myenv/bin/activate.fish' 
bind \ee 'deactivate'
bind \co 'lf'
bind \cf 'tmux-sessionizer'
bind \ch 'tmux-sessionizer ~/'
bind \cl 'tmux-configs'
bind \cu 'ncdu'
bind \cz 'zi'
bind \cr 'tmux new -s RSYNC -c ~/'
