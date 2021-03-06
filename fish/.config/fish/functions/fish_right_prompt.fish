function fish_right_prompt
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_use_informative_chars 1
    # Unfortunately this only works if we have a sensible locale
    string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
    and set -g __fish_git_prompt_char_dirtystate 𥉉
    #\U1F4a9
    set -g __fish_git_prompt_char_untrackedfiles "?"

    set -l vcs (fish_vcs_prompt 2>/dev/null)

    set -l d (set_color brgrey)(date "+%R")(set_color normal)

    set -l duration "$cmd_duration $CMD_DURATION"
    if test $duration -gt 100
        set duration (math $duration / 1000)s
    else
        set duration
    end

    set_color reset
    string join " " -- $duration $vcs
end
