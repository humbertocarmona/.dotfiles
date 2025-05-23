function plotcsv
    set file $argv[1]
    set output (basename $file .csv)".png"
    gnuplot -e "set datafile separator ','; \
    set terminal pngcairo size 800,600; \
    set output '$output'; \
    set xlabel 'E'; \
    set ylabel 'log g(E)'; \
    plot '$file' every ::1 using 1:2 with linespoints title 'log g(E)'"
    echo "Saved to $output"
end