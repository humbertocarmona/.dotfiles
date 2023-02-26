function t

    if test (count $argv) -lt 1
        echo "use 't some pattern'"
        return
    end

    set -l pattern $argv
    set -l zoxide_result (zoxide query $pattern)

    if test -z "$zoxide_result"
        return 1
    end
    # echo "zoxide query result = $zoxide_result"

    set -l zsession (basename $zoxide_result)
    # echo "pretended session is $zsession"

    set -l found_session (tmux list-sessions | rg $zsession | awk '{print $1}')

    if test -z $TMUX
        # echo "not running tmux"
        if test -z $found_session
            # echo "$zsession do not exist"
            cd $zoxide_result
            tmux new-session -s $zsession
        else
            # echo "$zsession exist"
            tmux attach -t $zsession
        end
    else
        # echo "is tmux"
        if test -z $found_session
            # echo "$zsession do not exist"
            cd $zoxide_result
            tmux new-session -d -s $zsession
            tmux switch-client -t $zsession
        else
            tmux switch-client -t $zsession
        end
    end
end
