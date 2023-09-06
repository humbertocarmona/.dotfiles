function convert_pdfs_to_pngs
    set regex_pattern $argv[1]

    for file in (fd -t f -e pdf | rg -e $regex_pattern)
        set base_name (basename $file .pdf)
        set output_file $base_name.png

        if not test -e $output_file
            convert -density 300 $file -quality 100 $output_file
            echo "Converted $file to $output_file"
        else
            echo "File $output_file already exists, skipping..."
        end
    end
end
