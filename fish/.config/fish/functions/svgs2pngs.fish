function svgs2pngs -d "convert svg files matching pattern to png"
    function USAGE
        echo "USAGE: svgs2pngs -p (--path) path -p (--density) (150) -d (--dell)"
        echo ""
    end
    set -l options (fish_opt --short h --long help)
    set options $options (fish_opt --short=p --long=pathern --required-val)
    set options $options (fish_opt --short=n --long=density --required-val)
    set options $options (fish_opt --short=d --long=del --required-val)

    argpase $options -- $argv
    or return 
    
    if set -q _flag_h
        USAGE
        return 
    end

    if set -q _flag_patthern
        echo " pattern = "$_flag_patthern
    else
        set _flag_pattern svg
    end

    if set -q _flag_density
        echo " density = "$_flag_density
    else 
        set _flag_density 150 
    end
    
    for f in (fd -tf $_flag_patthern)
        set -l f2 (echo $f | seds/svg/png/)
        echo "convert $f $f2"
        convert -density $_flag_density $f $f2 
    end

end
