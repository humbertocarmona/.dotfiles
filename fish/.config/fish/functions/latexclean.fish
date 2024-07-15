function latexclean -d "clean up auxiliary LaTeX files"
    function USAGE
        echo "USAGE: cleanLatexProject --project main_file (without extension)"
        echo ""
    end

    function clean_latex
        for ext in aux bbl bcf fdb_latexmk fls log run.xml synctex.gz toc blg pdf
            rm -f "$argv[1].$ext"
        end
    end

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short=p --long=project)

    argparse $options -- $argv
    or return

    if set -q _flag_h
        USAGE
        return
    end

    set -l main all

    if set -q _flag_p
        set main $argv
    end

    if test "$main" = all
        for file in (fd -t f -e tex)
            set f (path change-extension '' $file)
            echo "cleaning $f"
            clean_latex $f
        end
        return
    else if test "$main" = nenhum
        if test -e "main.tex"
            echo "found main.tex"
            set main main
        else if test -e "root.tex"
            echo "found root.tex"
            set main root
        else
            for file in (fd -t f -e tex)
                set -l first_line (head -n 1 $file)
                set -l root_filename (string match -r '% ?!TEX root ?= ?(.+)$' -- $first_line)

                if test -n "$root_filename"
                    echo "root filename is $root_filename[2]"
                    set main (string split "." $root_filename[2])
                    break
                end
            end
        end

        if test "$main" = nenhum
            echo "No root filename found."
            return
        end
    end

    echo "project = $main"
    clean_latex $main
    return
end
