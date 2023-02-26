function ranger_cd
    set -l temp_file (mktemp -t "ranger_cd.XXXXXXXXXX")
    ranger --choosedir=$temp_file 
    set -l chosen_dir (cat -- $temp_file)
    echo "chosen_dir = " $chosen_dir
    cd -- $chosen_dir
    rm -f $temp_file
end

