function convert_svgs_to_pngs -a pattern
    fd -e svg -x echo {} | grep -E "$pattern" | while read file
        set name (basename "$file" .svg)
        set output_file "$name.png"
        if not test -f $output_file
            echo "Converting $file to $output_file"
            rsvg-convert "$file" -o "$output_file"
        else
            echo "$output_file already exists"
        end
    end
end
