function fvim --wraps='nvim (fzf --height=40% --reverse)' --description 'alias fvim=nvim (fzf --height=40% --reverse)'
  nvim (fzf --height=40% --reverse) $argv; 
end
