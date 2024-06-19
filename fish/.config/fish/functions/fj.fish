function fj
    cd (fd -L -t d . $HOME | fzf --height=50% --layout=reverse --preview="eza --tree -L 2 {} | bat") > /dev/null &
end
