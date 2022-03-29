function rmusb --wraps='udiskie-umount -d /dev/sda1' --description 'alias rmusb=udiskie-umount -d /dev/sda1'
  udiskie-umount -d /dev/sda1 $argv; 
end
