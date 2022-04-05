# Start X at login
set fish_greeting "fishing with $TERM .."
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        #exec startx -- -keeptty
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


set -g fish_key_bindings fish_vi_key_bindings
bind \cc -M insert kill-while-line repaint
bind \ce -M insert 'source ~/.myenv/bin/activate.fish' 
bind \ee -M insert 'deactivate'
bind \co -M insert 'lf'
bind \cf -M insert 'tmux-sessionizer'
bind \ch -M insert 'tmux-sessionizer ~/'
bind \cl -M insert 'tmux-configs'
bind \cu -M insert 'ncdu'
bind \cz -M insert 'zi'

abbr -a -U l exa
abbr -a -U ll exa -lh
abbr -a -U lll exa -lha
abbr -a -U lt tmux ls

abbr -a -U x startx
abbr -a -U q exit
abbr -a -U g lazygit

