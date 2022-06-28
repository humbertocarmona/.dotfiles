function uonedrive --wraps='fusermount -u /home/humberto/OneDrive' --description 'alias uonedrive=fusermount -u /home/humberto/OneDrive'
  fusermount -u /home/humberto/OneDrive $argv; 
end
