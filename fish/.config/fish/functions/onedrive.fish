function onedrive --wraps='rclone mount --vfs-cache-mode full onedrive:Documentos  /home/humberto/OneDrive &> /dev/null &; disown (pidof rclone)' --description 'alias onedrive=rclone mount --vfs-cache-mode full onedrive:Documentos  /home/humberto/OneDrive &> /dev/null &; disown (pidof rclone)'
  rclone mount --vfs-cache-mode full onedrive:Documentos  /home/humberto/OneDrive &> /dev/null &; disown (pidof rclone) $argv; 
end
