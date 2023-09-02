function prepend_line -d "add a string as the first line of matched files"
    function USAGE
        echo "USAGE: prepend_line -p pattern -l string"
        echo ""
    end

    set -l options (fish_opt --short=h --long=help)
    set options $options (fish_opt --short=p --long=pattern --required-val)
    set options $options (fish_opt --short=l --long=line --required-val)
    argparse $options -- $argv
    or return

    if set -q _flag_help
        USAGE
        return
    end

    if set -q _flag_pattern
        set patt $_flag_pattern
    else
        USAGE
        return
    end

    if set -q _flag_line
        set line $_flag_line
    else
        USAGE
        return
    end

    echo $patt
    echo $line

    set -l files (fd -t f $patt)


    for file in $files
        echo "sed -i '1i $line' $file"
    end
    read -l -P 'agora pra valer, tem certeza? [y/n]' reply
    switch $reply
        case Y y
            for file in $files
                sed -i "1i $line" $file
            end
            return 0
        case '' N n
            return 0
    end

    # set -q argv[1]; or echo "Missing string to prepend"; and return 1
    #
    # set prepend_str $argv[1]
    #
    # for file in *
    #     sed -i "1i $prepend_str" $file
    # end
end
