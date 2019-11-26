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

Urbano1(d)=(d > 1 && d < 641) ? 53.38+12.98*log(d):1/0;
Urbano2(d)=(d > 1 && d < 601) ? 26.24+17.49*log(d):1/0;
Semiurbano(d)=(d > 1 && d < 1101) ? 62.74+10.67*log(d):1/0;
Rural(d)=(d > 1 && d < 1501) ? 61.13+10.55*log(d):1/0;

#set format y "%1.2f";
#set xtics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
#set ytics border in scale 0,0 nomirror rotate by -0 offset 0.0,0.0
set xrange [ 0:1600 ] # reverse
plot Urbano1(x) title "Urban $1$" ls 1 lw 3, \
Urbano2(x) title "Urban $2$" ls 2 lw 3, \
Semiurbano(x) title "Semiurban" ls 3 lw 3, \
Rural(x) title "Rural" ls 4 lw 3
