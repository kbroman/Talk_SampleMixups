berkeley2017.pdf: berkeley2017.tex
	pdflatex berkeley2017

Web: berkeley2017.pdf
	scp $(<F) broman-10.biostat.wisc.edu:Website/presentations/
