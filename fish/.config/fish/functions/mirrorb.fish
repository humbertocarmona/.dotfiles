function mirrorb --wraps='sudo reflector -c Brazil -f 10 -l 10 --number 10 --verbose --save /etc/pacman.d/mirrorlist' --description 'alias mirrorb=sudo reflector -c Brazil -f 10 -l 10 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
  sudo reflector -c Brazil -f 10 -l 10 --number 10 --verbose --save /etc/pacman.d/mirrorlist $argv; 
end
