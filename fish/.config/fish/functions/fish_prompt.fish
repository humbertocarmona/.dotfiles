function fish_prompt
    set -l stcolor red
    test $status = 0; and set stcolor yellow
    set -l user_color $fish_color_normal
    set -l host_color $fish_color_normal
    set -l at_color red
    set -l pwd_color $fish_color_cwd
    set -l bracket_color blue
    set -l venv_bg_color cyan
    set -l venv_fg_color black 

    #set -q __fish_git_prompt_showupstream
    #or set -g __fish_git_prompt_showupstream auto

    # echo -n -s (prompt_login)
    # virtual environment
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b $venv_bg_color  $venv_fg_color)"("(basename "$VIRTUAL_ENV")")"(set_color normal)" "
    end
    echo -n -s (set_color $bracket_color)"["(set_color normal)
    echo -n -s (set_color $user_color) $USER(set_color $at_color)"@"(set_color $host_color)(prompt_hostname)
    echo -n " "(set_color $pwd_color)(prompt_pwd)(set_color normal)
    echo -n -s (set_color $bracket_color)"]"(set_color normal)
    

    set_color $stcolor
    echo '$ '
end
