function spot
    set -l a (pgrep spotifyd); 
    if test -z $a 
        echo "launching spotifyd"
        spotifyd
    else
        echo "spotifyd running process:" $a
    end
    spt
end
