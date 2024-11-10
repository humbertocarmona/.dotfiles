function fish_prompt
    set -l stcolor red
    test $status = 0; and set stcolor purple

    # ----- [user@hostmbane] --------------------------
    echo -n (set_color blue)"["
    echo -n ""(set_color normal)$USER(set_color red)"@"(set_color normal)$hostname
    echo -n (set_color blue)"]"
    # ----------------------------------------------

    # ------- [venv] -----------------------------------
    if set -q VIRTUAL_ENV
        echo -n (set_color blue)"["
        echo -n -s (set_color "#1d5da1")(basename "$VIRTUAL_ENV")
        echo -n (set_color blue)"] "
    end

    if set -q CONDA_DEFAULT_ENV
        echo -n (set_color blue)"["
        echo -n -s (set_color "#1d5da1")(basename "$CONDA_DEFAULT_ENV")
        echo -n (set_color blue)"] "
    end

    # ----------------------------------------------

    # ------------------ pwd -----------------------
    echo -n (set_color cyan)" "(prompt_pwd -d 3 -D 1)" "
    # ---------------------------------------------


    set_color $stcolor
    if [ $USER = root ]
        echo '# '
    else
        echo '& '
    end
end
