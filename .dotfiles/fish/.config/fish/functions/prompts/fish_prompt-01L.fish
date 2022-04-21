function fish_prompt
    set -l stcolor red
    test $status = 0; and set stcolor $fish_color_cwd
    set -l color1 blue
    set -l color2 blue 

    #set -q __fish_git_prompt_showupstream
    #or set -g __fish_git_prompt_showupstream auto



         
    echo -n -s (set_color $color1)"["(set_color normal)
    echo -n -s (set_color white) $USER(set_color red)"@"(set_color white)(prompt_hostname)
    echo -n -s (set_color $color1)"]"(set_color normal)
    # virtual environment
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b $color2 $white) (basename "$VIRTUAL_ENV") (set_color normal)
    end

    # pwd
    set_color -o $color1 
    echo -n " "(prompt_pwd)
    

    set_color $stcolor
    echo ' % '
end
