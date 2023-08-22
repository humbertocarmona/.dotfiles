function rrsync -d "special rsync using .rsync-filter"
    function USAGE
        echo "USAGE: rrsync --flags flags -p project/ --from ~/path/ --to 10.2.21.222:/dest_path/"
        echo ""
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=p --long=project --required-val)
    set options $options (fish_opt --short=f --long=from --required-val)
    set options $options (fish_opt --short=t --long=to --required-val)
    set options $options (fish_opt --short=l --long=flags --required-val)
    set options $options (fish_opt --short=d --long=delete)

    argparse $options -- $argv
    or return

    if set -q _flag_project
        echo "project = " $_flag_project
    else
        echo ""
        echo "project must be specified"
        USAGE
        return
    end

    if set -q _flag_from
        echo "from = " $_flag_from
    else
        echo ""
        echo "must specify origin"
        USAGE
        return
    end

    if set -q _flag_to
        echo "to = " $_flag_to
    else
        echo ""
        echo "must specify destination"
        USAGE
        return
    end

    if set -q _flag_flags
        echo "flags = "$_flag_flags
    else
        set _flag_flags -roltDv
        echo "flags = "$_flag_flags
    end

    if set -q _flag_h
        USAGE
        return
    end

    set cmd1 rsync $(echo --filter=\': .rsync-filter\')
    set cmd2 --no-perms
    set cmd3 $_flag_flags $_flag_from$_flag_project
    set cmd4 $_flag_to$_flag_project
    set cmd $cmd1 $cmd2 $cmd3 $cmd4
    if set -q _flag_delete
        set -a cmd $(echo --delete)
    end
    set cmdn $cmd -n
    echo ""
    while true # keep asking
        eval $cmdn
        echo "from = " $_flag_from
        echo "to = " $_flag_to
        echo $cmd
        read -l -P 'agora pra valer, tem certeza? [y/n]' reply
        switch $reply
            case Y y
                eval $cmd
                return 0
            case '' N n
                return 1
        end
    end
end

# --include='**.gitignore' \
# --exclude='.git' \
