# R_OPTS: --vanilla without --no-environ
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

berkeley2017.pdf: berkeley2017.tex Figs/intercross.pdf        \
								   Figs/data_fig.png          \
								   Figs/lodcurve_insulin.pdf  \
								   Figs/xchr_fig.pdf          \
								   Figs/plate_errors.pdf      \
								   Figs/eqtl_lod_1.pdf        \
								   Figs/gve1a.pdf             \
								   Figs/gve_scheme_1.pdf
	xelatex berkeley2017

Figs/intercross.pdf: R/intercross_fig.R R/meiosis_func.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/data_fig.png: R/data_fig.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/lodcurve_insulin.pdf: R/lodcurve_insulin.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/xchr_fig.pdf: R/xchr_fig.R R/meiosis_func.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/plate_errors.pdf: R/xchr_fig.R R/plot_plates.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/eqtl_lod_1.pdf: R/eQTL_LOD.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/gve1a.pdf: R/gve.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/gve_scheme_1.pdf: R/gve_scheme.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

clean:
	rm berkeley2017.pdf berkeley2017.out berkeley2017.log berkeley2017.aux

web: berkeley2017.pdf
	scp $(<F) broman-10.biostat.wisc.edu:Website/presentations/
