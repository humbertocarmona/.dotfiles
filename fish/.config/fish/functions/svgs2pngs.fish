function svgs2pngs -d "convert svg files matching pattern to png"
    function USAGE
        echo "USAGE: svgs2pngs -p (--pattern) pattern -p (--density) (150) -d (--dell)"
        echo ""
    end
    set --long options (fish_opt --short=h --long=help)
    set options $options (fish_opt --short=p --long=pattern --required-val)
    set options $options (fish_opt --short=n --long=density --required-val)

    argparse $options -- $argv
    or return

    if set -q _flag_h
        USAGE
        return
    end

    echo " -p = "$_flag_pattern
    if set -q _flag_pattern
        echo " pattern = "$_flag_patthern
    else
        set _flag_pattern svg
    end

    if set -q _flag_density
        echo " density = "$_flag_density
    else
        set _flag_density 288
    end

    for f in (fd -t f $_flag_pattern)
        echo $f
        set -l f2 (echo $f | sed s/svg/png/)
        if not test -f $f2
            echo "convert $f $f2"
            rsvg-convert -d $_flag_density -p $_flag_density $f -o $f2
        else
            echo "$f2 exists"
        end
    end

end
