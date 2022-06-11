function rrsync -d "special rsync using .rsync-filter"
    function USAGE
        echo "USAGE: rrsync -p project --from ~/ --to 10.2.21.222:~/"
        echo ""
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=r --long=run)
    set options $options (fish_opt --short=p --long=project --required-val)
    set options $options (fish_opt --short=f --long=from --required-val)
    set options $options (fish_opt --short=t --long=to --required-val)
    set options $options (fish_opt --short=l --long=flags --required-val)
    
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
        set _flag_flags "roltDv"
        echo "flags = "$_flag_flags
    end

    
    if set -q _flag_h
        USAGE
        return
    end
    
    if set -q _flag_r
        while true
            echo "    rsync -$_flag_flags \ "
            echo "      $_flag_from$_flag_project \ "
            echo "      $_flag_to$_flag_project \ "
            echo "      --include='**.gitignore' \ " 
            echo "      --exclude='/.git' --filter=':- .rsync-filter'"
            rsync -n$_flag_flags \
                $_flag_from$_flag_project \
                $_flag_to$_flag_project \
                --filter=':- .rsync-filter'
            echo ""
            read -l -P 'agora pra valer, tem certeza? [y/n]' reply
            switch $reply
                case Y y
                    rsync -$_flag_flags $_flag_from$_flag_project \
                        $_flag_to$_flag_project \
                        --filter=':- .rsync-filter'
                    
                return 0
                case '' N n
                    return 1
            end
        end
    else
        echo 'dry run ----------------------------------------------'
        echo "rsync -n"$_flag_flags  \
            $_flag_from$_flag_project \
            $_flag_to$_flag_project \
            "--filter=':- .rsync-filter'"
        
        rsync -n$_flag_flags  \
            $_flag_from$_flag_project \
            $_flag_to$_flag_project \
            --filter=':- .rsync-filter'
    end
end


# --include='**.gitignore' \
# --exclude='.git' \
