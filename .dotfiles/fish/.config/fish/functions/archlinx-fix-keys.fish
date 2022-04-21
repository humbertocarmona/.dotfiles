function archlinx-fix-keys --wraps='sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys' --description 'alias archlinx-fix-keys=sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'
  sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys $argv; 
end
