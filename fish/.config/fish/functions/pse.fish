function pse --wraps='ps -ef' --description 'alias pse=ps -ef'
  ps -ef $argv; 
end
