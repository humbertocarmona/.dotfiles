function psmem --wraps='ps auxf | sort -nr -k 4 | head -5' --description 'alias psmem=ps auxf | sort -nr -k 4 | head -5'
  ps auxf | sort -nr -k 4 | head -5 $argv; 
end
