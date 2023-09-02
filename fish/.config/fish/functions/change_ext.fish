function change_ext
    function USAGE
        echo "USAGE: change_ext -o old -n new -p pattern"
        echo ""
    end

    set -l options (fish_opt --short=h --long=help)
    set options $options (fish_opt --short=o --long=old --required-val)
    set options $options (fish_opt --short=n --long=new --required-val)
    set options $options (fish_opt --short=p --long=pattern --required-val)
    argparse $options -- $argv
    or return

    if set -q _flag_help
        USAGE
        return
    end

    if set -q _flag_old
        set old_ext $_flag_old
    else
        echo "Missing old extension"
        USAGE
        return 1
    end

    if set -q _flag_new
        set new_ext $_flag_new
    else
        echo "Missing new extension"
        USAGE
        return 1
    end

    set -l patt *
    if set -q _flag_pattern
        set patt $_flag_pattern
    end

    for file in (fd -e $old_ext $patt)
        set name (basename -s .$old_ext $file)
        echo "mv $file $name.$new_ext"
    end
    read -l -P 'agora pra valer, tem certeza? [y/n]' reply
    switch $reply
        case Y y
            for file in (fd -e $old_ext $patt)
                set name (basename -s .$old_ext $file)
                mv $file $name.$new_ext
            end
        case '' N n
            return 0
    end

end
