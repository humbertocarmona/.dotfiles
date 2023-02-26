function help_exit
    echo "usage: [options] arguments..."
    echo "arguments:"
    echo "-r some: repositorio"
end

function gitaddrem
    set args (getopt -s sh ar: $argv); or help_exit
    echo $args

    set args (fish -c "for el in $args; echo \$el; end")

    set i 1
    while true # test $i -le 5
        switch $args[$i]
            case "-r"
                set i (math "$i+1")
                set repo $args[$i]
                echo "repo = $repo"
            case "*"
                break
        end
        set i (math "$i + 1")
    end
    set pargs
    if test "$i" -le (count $args)
        set pargs $args[(math "$i + 1")..-1]
    end

    echo "positional arguments:" $pargs
end
