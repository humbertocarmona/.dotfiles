function start_tmux -d "start tmux with new or existing session"
    #tmux
    # Auto-start tmux on interactive shells
    if status is-interactive
        # Don't start tmux inside tmux
        if not set -q TMUX
            # Optional: only on local terminals
            if test -z "$SSH_CONNECTION"
                tmux attach-session -t default || tmux new-session -s default
            end
        end
    end
end
