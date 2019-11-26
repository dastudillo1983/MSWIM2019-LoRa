#set terminal pngcairo  transparent enhanced font "arial,10" size 500, 350 
#set terminal postscript eps enhanced color "NimbusSanL-Regu" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb" 22
#set output 'BandWidth2013.eps'

set nokey
set ylabel "Mesurement $1$"
set xlabel "Mesurement $2$"
set datafile separator ';'
set datafile missing '-'
set grid xtics ytics

#set format y "%1.2f";
set xtics scale 0 nomirror rotate
set xrange [ -130:-40 ] reverse
set yrange [ -130:-40 ] reverse
stats "datos.csv" using 2:1 name "B"
set label 1 sprintf("$r = %4.3f$",B_correlation)  at graph 0.1, graph 0.85
line_fit2(x)=B_slope*(x)+B_intercept

plot 'datos.csv' using 1:2 with points notitle ls 2 lw 3, \
line_fit2(x) title 'Linear Fit' ls 2 lw 3
