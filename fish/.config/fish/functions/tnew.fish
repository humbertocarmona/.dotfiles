# New session with themed first window
function tnew -d "Create session with status color + first window theme"
    if test (count $argv) -lt 1
        echo "Usage: tnew <session-name> [window-name]"
        return 1
    end
    set s $argv[1]
    set w (pwd | sed 's/.*\///g')
    if test (count $argv) -ge 2
        set w $argv[2]
    end
    tmux new-session -d -s $s
    tmux rename-window -t $s:1 $w
    ~/.config/tmux/window_theme.sh (tmux display-message -p -t $s:1 "#{window_id}") $w
    tmux attach -t $s
end
