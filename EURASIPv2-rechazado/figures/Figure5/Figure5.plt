#set terminal pngcairo  transparent enhanced font "arial,10" size 500, 350 
#set terminal postscript eps enhanced color "NimbusSanL-Regu" fontfile "/usr/share/texmf-texlive/fonts/type1/urw/helvetic/uhvr8a.pfb" 22
#set output 'BandWidth2013.eps'

set key box inside right bottom
set key height 1
set ylabel "Path loss (dB)"
set xlabel "Distance (m)"
set datafile separator ';'
#set datafile missing '-'
set grid xtics ytics

g(d)=59.53+11.26*log(d);

#set format y "%1.2f";
#set xtics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
#set ytics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
set xrange [ 0:800 ] # reverse
plot g(x) title "Fitted curve" ls 1 lw 3, \
'datos.csv' using 1:2 with points title " Data" ls 2 lw 3
