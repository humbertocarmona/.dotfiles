function git-check -d "check all git projects under pwd"

    function gitstatus
        set -g __fish_git_prompt_showdirtystate 1
        set -g __fish_git_prompt_showuntrackedfiles 1
        set -g __fish_git_prompt_showupstream informative
        set -g __fish_git_prompt_showcolorhints 1
        set -g __fish_git_prompt_use_informative_chars 1
        set -g __fish_git_prompt_showdirtystate 1
        set -g __fish_git_prompt_char_untrackedfiles "?"
        set -l vcs (fish_vcs_prompt 2>/dev/null)
        string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
        and set -g __fish_git_prompt_char_dirtystate ""
        set -g __fish_git_prompt_char_untrackedfiles "?"

        set -l vcs (fish_vcs_prompt 2>/dev/null)

        echo $vcs
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=f --long=fix)

    argparse $options -- $argv
    or return

    if set -q _flag_h
        echo "check all git projects under pwd"
        return
    end

    set -l rootfolder $PWD
    set -l gits (fd -H -t d .git)
    for folder in $gits
        cd $folder
        cd ..
        echo -n "$PWD :"
        gitstatus
        cd $rootfolder
    end

    while true
        read -l -P "auto commit and push? (Y/n)" reply
        switch $reply
            case Y y
                for folder in $gits
                    cd $folder
                    cd ..
                    echo -n "$PWD :"
                    git commit -a -m "auto commit"
                    git push origin main
                    gitstatus
                    cd $rootfolder
                end
                return 0
            case '' N n
                return 0
        end
    end
end
