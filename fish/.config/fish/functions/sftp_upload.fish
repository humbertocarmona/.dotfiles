function sftp_upload
    set file $argv[1]
    set remote_path $argv[2]
    set server $argv[3]

    if not test -f $file
        echo "File not found: $file"
        return 1
    end

    set size_bytes (stat -c %s $file)
    set size_gb (math --scale 2 "$size_bytes / 1024 / 1024 / 1024")

    echo "Uploading $file ($size_gb GB) to $server:$remote_path"
    set start (date +%s)

    echo "put $file $remote_path" | sftp $server

    set end (date +%s)
    set duration (math "$end - $start")
    set speed (math --scale 2 "$size_gb / $duration")

    echo ""
    echo "Transfer completed in $duration seconds"
    echo "Average speed: $speed GB/s"
end
