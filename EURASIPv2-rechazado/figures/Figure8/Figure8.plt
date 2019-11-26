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

Urbano1(d)=(d > 1 && d < 801) ? 59.53+11.26*log(d):1/0;
Urbano2(d)=(d > 1 && d < 951) ? 44.96+13.39*log(d):1/0;
Semiurbano(d)=(d > 1 && d < 1171) ? 61.55+10.7*log(d):1/0;
Rural(d)=(d > 1 && d < 1601) ? 55.36+11.27*log(d):1/0;

#set format y "%1.2f";
#set xtics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
#set ytics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
set xrange [ 0:1600 ] # reverse
plot Urbano1(x) title "Urban $1$" ls 1 lw 3, \
Urbano2(x) title "Urban $2$" ls 2 lw 3, \
Semiurbano(x) title "Semiurban" ls 3 lw 3, \
Rural(x) title "Rural" ls 4 lw 3
