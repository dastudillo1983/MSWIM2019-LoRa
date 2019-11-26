.SUFFIXES: .plt .tex .pdf

%.tex: %.plt
	gnuplot -e " \
		set format '$$%g$$' ; \
		set terminal epslatex standalone color font ',12'; \
		set output '$@' \
		" $<

%.pdf: %.tex
	pdflatex $<

all: Figure6.pdf
#gnuplot -e "set format '$$%g$$' ; set terminal epslatex standalone color ; set output '$@' "
