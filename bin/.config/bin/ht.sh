#! /bin/zsh

function t {

    if [[ $# -lt 1 ]]; then
        echo "use 't some pattern'"
        return
    fi

    local pattern="$*"
    local zoxide_result=$(zoxide query "$pattern")

    if [[ -z "$zoxide_result" ]]; then
        return 1
    fi

    local zsession=$(basename "$zoxide_result")
    local found_session=$(tmux list-sessions | rg "$zsession" | awk '{print $1}')

    if [[ -z $TMUX ]]; then
        if [[ -z $found_session ]]; then
            cd "$zoxide_result"
            tmux new-session -s "$zsession"
        else
            tmux attach -t "$zsession"
        fi
    else
        if [[ -z $found_session ]]; then
            cd "$zoxide_result"
            tmux new-session -d -s "$zsession"
            tmux switch-client -t "$zsession"
        else
            tmux switch-client -t "$zsession"
        fi
    fi
}

t $@
