LATEX = pdflatex

all: introduction.pdf solow.pdf convergence.pdf education.pdf clean

introduction.pdf: introduction.tex ../data/fra_logged_rgdp_per_capita2.dat ../data/fra_logged_rgdp_per_capita1.dat ../data/gbr_logged_rgdp_per_capita.dat ../data/usa_logged_rgdp_per_capita2.dat ../tikz/us-real-gdp-per-capita.tex ../tikz/us-real-gdp-per-capita-with-regression.tex ../tikz/us-real-gdp-per-capita-level.tex ../tikz/uk-real-gdp-per-capita.tex ../tikz/fra-1-real-gdp-per-capita.tex ../tikz/fra-2-real-gdp-per-capita.tex ../tikz/world-1950-2019.tex ../tikz/world-1960-2019.tex ../tikz/density-1960-2000-2019.tex ../data/rgdpc-density-1960.dat ../data/rgdpc-density-2000.dat ../data/rgdpc-density-2019.dat
	@rubber --src-specials --unsafe --pdf introduction

solow.pdf: solow.tex ../data/fra_logged_population.dat ../data/fra_k_over_y_ratio.dat ../tikz/fra-logged-population.tex ../tikz/fra-population-growth.tex ../tikz/fra-k-over-y-ratio.tex ../tikz/world-k-y-ratios-1960-2000.tex
	@rubber --src-specials --unsafe --pdf solow

convergence.pdf: convergence.tex ../tikz/us-real-gdp-per-capita-with-regression.tex ../tikz/oecd-1950-2019.tex ../tikz/world-1960-2019-with-regression.tex
	@rubber --src-specials --unsafe --pdf convergence

education.pdf: education.tex ../pgf/mrw-transition.pgf
	@rubber --src-specials --unsafe --pdf education

clean:
	@rm -f *.aux *.log *.out *.nav *.rel *.toc *.snm *.synctex.gz *.vrb *.rubbercache
	@rm -rf auto
	@rm -rf _minted-education/

clean-all:
	@rm -f *.pdf

.PHONY: all clean clean-all
