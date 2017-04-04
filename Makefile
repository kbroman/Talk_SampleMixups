berkeley2017.pdf: berkeley2017.tex
	xelatex berkeley2017

clean:
	rm berkeley2017.pdf berkeley2017.out berkeley2017.log berkeley2017.aux

Web: berkeley2017.pdf
	scp $(<F) broman-10.biostat.wisc.edu:Website/presentations/
