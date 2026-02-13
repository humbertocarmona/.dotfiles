#!/usr/bin/env bash

case $- in
*i*) ;;
*) return ;;
esac

# Don't start tmux inside tmux
if [ -z "$TMUX" ]; then
    # Optional: only on local terminals
    if [ -z "$SSH_CONNECTION" ]; then
        tmux attach-session -t default 2>/dev/null || tmux new-session -s default
    fi
fi
