function lc -d "clean latex"
    function USAGE
        echo "USAGE: latexclean --project main_file (without extension)"
        echo ""
    end


    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=p --long=project)

    argparse $options -- $argv
    or return

    echo $argv

    if set -q _flag_h
        USAGE
        return
    end

    set -l main main
    if test -e "Root.tex"
        echo "found Root.tex"
        set main Root
    end

    for file in (fd -t f -e tex)
        set -l first_line (head -n 1 $file)
        set -l root_filename (string match -r '% ?!TEX root ?= ?(.+)$' -- $first_line)

        # Check if root_filename is empty
        if test -n "$root_filename"
            echo "root filename is $root_filename[2]"
            set main (string split "." $root_filename[2])
        else
            echo "No root filename found."
        end
    end

    if set -q _flag_p
        set main $argv
    end

    echo "project = " $main

    rm -f $main.aux
    rm -f $main.bbl
    rm -f $main.bcf
    rm -f $main.fdb_latexmk
    rm -f $main.fls
    rm -f $main.log
    rm -f $main.run.xml
    rm -f $main.synctex.gz
    rm -f $main.toc
    rm -f $main.blg
    rm -f $main.pdf
end
