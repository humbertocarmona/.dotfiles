function latexclean
    function USAGE
        echo "USAGE: latexclean --project projetc_name"
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
