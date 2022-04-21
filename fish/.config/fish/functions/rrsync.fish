function rrsync -d "special rsync using .gitignore"
    function USAGE
        echo "USAGE: rrsync -p project --from ~/ --to 10.2.21.222:~/"
        echo ""
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=r --long=run)
    set options $options (fish_opt --short=p --long=project --required-val)
    set options $options (fish_opt --short=f --long=from --required-val --long-only)
    set options $options (fish_opt --short=t --long=to --required-val --long-only)
    
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


    if set -q _flag_h
        USAGE
        return
    end

    if set -q _flag_r
        while true
            echo "    rsync -vhra \ "
            echo "      $_flag_from$_flag_project \ "
            echo "      $_flag_to$_flag_project \ "
            echo "      --include='**.gitignore' \ " 
            echo "      --exclude='/.git' --filter=':- .gitignore'"
            rsync -nvhra \
                $_flag_from$_flag_project \
                $_flag_to$_flag_project \
                --include='**.gitignore' \
                --exclude='.git' \
                --filter=':- .gitignore'
            echo ""
            read -l -P 'agora pra valer, tem certeza? [y/n]' reply
            switch $reply
                case Y y
                    rsync -vhra $_flag_from$_flag_project \
                        $_flag_to$_flag_project \
                        --include='**.gitignore' \
                        --exclude='.git' \
                        --filter=':- .gitignore'
                    
                return 0
                case '' N n
                    return 1
            end
        end
    else
        echo 'dry run ----------------------------------------------'
        rsync -nvhra  \
            $_flag_from$_flag_project \
            $_flag_to$_flag_project \
            --include='**.gitignore' \
            --exclude='.git' \
            --filter=':- .gitignore'
    end
end


