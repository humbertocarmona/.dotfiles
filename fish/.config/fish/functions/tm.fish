function tm

    # if test (count $argv) -lt 
    #     echo "this script creates a tmux session if argv in zoxide path"
    #     echo "or just in current folder if no argv"
    #     echo "usage: 'tc some-pattern'"
    #     return
    # end

    set -l pattern $argv
    set -l zoxide_result (zoxide query $pattern)

    if test -z "$zoxide_result"
        if type tmux >/dev/null
            #if not inside a tmux session, and if no session is started, start a new session
            if test -z "$TMUX"; and test -z $TERMINAL_CONTEXT
                tmux -2 attach; or tmux -2 new-session
            end
        end
    else
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
            echo "is tmux"
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
end
