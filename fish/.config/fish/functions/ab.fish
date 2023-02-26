function ab --wraps='bat ~/.config/fish/config.fish | rg abbr' --description 'alias ab bat ~/.config/fish/config.fish | rg abbr'
  bat ~/.config/fish/config.fish | rg abbr $argv | fzf --preview ""
        
end
