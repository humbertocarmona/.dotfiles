function rgsed -d "find and replace pathern in files"
    function USAGE
        echo "find and replace pathern in files"
        echo "USAGE: rgsed -f old pattern -t new pattern"
        echo ""
    end



    set -l options (fish_opt --short=h --long=help)
    set options $options (fish_opt --short=f --long=from --required-val)
    set options $options (fish_opt --short=t --long=to --required-val)

    argparse $options -- $argv
    or return

    if set -q _flag_help
        USAGE
        return
    end

    set cmd "'s/"$_flag_from"/"$_flag_to"/g'"

    echo "$cmd in files:"
    rg --no-heading $_flag_from

    while true
        read -l -P "posso continuar ? [y/n]" reply
        switch $reply
            case Y y
                rg -l --no-heading $_flag_from | xargs sed -i -e "s/$_flag_from/$_flag_to/g"
                echo ""
                echo "changed $_flag_from to $_flag_to"
                echo "ja era..."
                return 0
            case '' N n
                return 1
        end
    end
end
