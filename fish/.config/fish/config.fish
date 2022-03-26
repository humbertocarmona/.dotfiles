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

source $HOME/.config/zsh/zsh-aliases
