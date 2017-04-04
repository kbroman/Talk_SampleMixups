# R_OPTS: --vanilla without --no-environ
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

berkeley2017.pdf: berkeley2017.tex Figs/intercross.pdf Figs/data_fig.png Figs/lodcurve_insulin.pdf
	xelatex berkeley2017

Figs/intercross.pdf: R/intercross_fig.R R/meiosis_func.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/data_fig.png: R/data_fig.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/lodcurve_insulin.pdf: R/lodcurve_insulin.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

clean:
	rm berkeley2017.pdf berkeley2017.out berkeley2017.log berkeley2017.aux

Web: berkeley2017.pdf
	scp $(<F) broman-10.biostat.wisc.edu:Website/presentations/
