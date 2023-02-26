function rclone-one -d "mount rclone documents"
    rclone mount --vfs-cache-mode full OneDrive:Documentos  /home/humberto/OneDrive &> /dev/null &
    disown (pidof rclone)
end
