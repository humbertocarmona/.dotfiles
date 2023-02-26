function check-git -d "check all git projects under pwd"
    function USAGE
        echo get-git
    end

    function gitstatus
        set -g __fish_git_prompt_char_dirtystate " "
        set -g __fish_git_prompt_char_untrackedfiles "?"
        set -l vcs (fish_vcs_prompt 2>/dev/null)
        echo $vcs
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=f --long=fix)

    argparse $options -- $argv
    or return


    if set -q _flag_h
        USAGE
        return
    end

    set -l rootfolder $PWD
    echo $rootfolder
    set -l gits (fd -H -t d .git)
    for folder in $gits
        cd $folder
        cd ..
        echo -n $PWD
        gitstatus
        cd $rootfolder
    end
end
