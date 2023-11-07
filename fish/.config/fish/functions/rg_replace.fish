function rg_replace --description 'Search and replace recursively using ripgrep and sed with confirmation'
    set -l old_string $argv[1]
    set -l new_string $argv[2]
    set -l path $argv[3]

    if not set -q old_string
        echo "Usage: rg_replace 'old_string' 'new_string' [path]"
        return 1
    end

    if not set -q new_string
        set new_string ""
    end

    if not set -q path
        set path .
    end

    # Perform the search and ask for confirmation before replacing
    rg -l $old_string $path | while read -l file
        echo "Replace all occurrences of '$old_string' with '$new_string' in file '$file'? (y/N)"
        read -l confirm
        switch $confirm
            case Y y
                sed -i "s/$old_string/$new_string/g" $file
                echo "Replaced in $file"
            case '*'
                echo "Skipped $file"
        end
    end
end
