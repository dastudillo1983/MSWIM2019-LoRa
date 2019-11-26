#set terminal pngcairo  transparent enhanced font "arial,10" size 500, 350 
#set terminal postscript eps enhanced color "NimbusSanL-Regu" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb" 22
#set output 'BandWidth2013.eps'

set key box inside right top
set key height 1
set ylabel "RSSI (dBm)"
set xlabel "Distance (m)"
set datafile separator ';'
#set datafile missing '-'
set grid xtics ytics
#set format y "%1.2f";
#set xtics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
#set ytics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
#set yrange [ 0.9:1.2 ] # reverse
plot 'datos.csv' using 1:2 with linespoints title "\\ DR0" ls 1 lw 3, \
'' using 1:2:4 with yerrorbars notitle ls 1 lw 3, \
'' using 1:5 with linespoints title " DR3" ls 2 lw 3, \
'' using 1:5:7 with yerrorbars notitle ls 2 lw 3

#, \
#'' using 5:xtic(1) with lines title "\\textsc{w/o rts/cts}" ls 1 lw 3, \
#'' index 1 using 5:xtic(1) with lines title "\\textsc{rts/cts}" ls 2 lw 3
