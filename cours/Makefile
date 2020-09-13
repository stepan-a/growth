LATEX = pdflatex

all: introduction.pdf solow.pdf clean

introduction.pdf: introduction.tex
	rubber --src-specials --pdf introduction

solow.pdf: solow.tex
	rubber --src-specials --pdf solow

clean:
	@rm -f *.aux *.log *.out *.nav *.rel *.toc *.snm *.synctex.gz *.vrb
	@rm -rf auto

clean-all:
	@rm -f *.pdf

.PHONY: all
