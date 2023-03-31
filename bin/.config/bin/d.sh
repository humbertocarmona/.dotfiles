#!/bin/zsh

res=$(fd -E .cache  -E .pyenv -E Trash -E .virtualenvs -H -I -i -L -t d .+ $HOME | fzf --height 50% --layout reverse --preview='exa --tree -L 2 {}')
cd $res
