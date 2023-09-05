function convert_pdfs_to_pngs -a pattern
    fd -e pdf -x echo {} | grep -E "$pattern" | while read file
        set name (basename "$file" .pdf)
        set output_file "$name.png"
        if not test -f $output_file
            echo "Converting $file to $output_file"
            convert -density 300 -quality 100 "$file" "$output_file"
        else
            echo "$output_file already exists"
        end
    end
end
