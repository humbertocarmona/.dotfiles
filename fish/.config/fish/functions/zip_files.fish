function zip_files
    # Check if both directory and extension arguments are provided
    if test (count $argv) -lt 2
        echo "Usage: zip_individual_files <directory> <extension>"
        return 1
    end

    # Set the directory and file extension
    set dir $argv[1]
    set ext $argv[2]

    # Ensure the extension starts with a dot (.)
    if not string match -q ".*\." $ext
        set ext ".$ext"
    end

    # Check if the specified directory exists
    if not test -d $dir
        echo "Error: Directory '$dir' does not exist."
        return 1
    end

    # Change to the specified directory
    cd $dir

    # Zip each file with the specified extension individually
    for file in *$ext
        if test -f "$file"
            set zip_name (string replace -r "\.$ext" "" $file).zip
            echo "Zipping $file into $zip_name..."
            zip $zip_name "$file"

            # Check if the zip command was successful
            #if test $status -eq 0
            #    echo "Successfully created $zip_name."
            #else
            #    echo "Error: Failed to create zip for $file."
            #end
        end
    end
end
