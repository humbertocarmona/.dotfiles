#!/bin/zsh

fd -H -I -i -L -t d .+ $HOME | fzf --height 50% --layout reverse --preview='exa --tree -L 2 {}'
