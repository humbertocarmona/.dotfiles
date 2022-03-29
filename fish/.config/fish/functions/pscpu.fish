function pscpu --wraps='ps auxf | sort -nr -k 3 | head -5' --description 'alias pscpu=ps auxf | sort -nr -k 3 | head -5'
  ps auxf | sort -nr -k 3 | head -5 $argv; 
end
