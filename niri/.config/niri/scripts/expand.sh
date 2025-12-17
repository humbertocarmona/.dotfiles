#!/usr/bin/bash
TEMP=~/.config/niri/scripts/current_wall

wallpapers=(~/.config/niri/wallpapers/*)

config=~/.config/niri
scripts=$config/scripts

cooldown=0.1

while true; do
    case "$1" in
    "wall")
        index=$(cat $TEMP)
        index2=$((index + 1))

        $scripts/wall.sh "${wallpapers[$index]}" "${wallpapers[$index2]}"
        exit 0
        ;;
    "cycle")
        index=$(cat $TEMP)
        index=$((index + 2))
        if [ $index -ge ${#wallpapers[@]} ]; then
            index=0
        fi
        index2=$((index + 1))
        echo $index >$TEMP
        $scripts/wall.sh "${wallpapers[$index]}" "${wallpapers[$index2]}"
        exit 0
        ;;
    *)
        if $scripts/toolbar_state; then
            echo "     "
        else
            echo ""
        fi
        ;;
    esac
    sleep $cooldown
done
