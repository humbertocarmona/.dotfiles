function tw -d "Rename tmux window and re-theme it"
    if not set -q TMUX
        echo "Not inside tmux"
        return 1
    end
    if test (count $argv) -lt 1
        echo "Usage: tw <name>"
        return 1
    end
    set name $argv[1]
    tmux rename-window $name
    set wid (tmux display-message -p "#{window_id}")
    ~/.config/tmux/window_theme.sh $wid $name
end
