function f --wraps='cd $(fd -t d | fzf)' --description 'alias f=cd $(fd -t d | fzf)'
  cd $(fd -t d | fzf) $argv; 
end
