function dpat

    set -l target $argv
    if test (count $argv) -lt 1
        set target $HOME
    end
    set -l res (fd -E .pyenv -E .cache -E Trash -E .virtualenvs -H -I -i -L -t d . $target | fzf --height 50% --layout reverse --preview='exa --tree -L 2 {}')
    cd $res
end
