LATEX = pdflatex

all: introduction.pdf solow.pdf clean

%.pdf: %.tex
	@rubber --src-specials --pdf $*

clean:
	@rm -f *.aux *.log *.out *.nav *.rel *.toc *.snm *.synctex.gz *.vrb
	@rm -rf auto

clean-all:
	@rm -f *.pdf

.PHONY: all
