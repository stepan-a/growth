LATEX = pdflatex

all: introduction.pdf solow.pdf clean

introduction.pdf: introduction.tex
	while ($(LATEX) --shell-escape introduction.tex ; \
	grep -q "Rerun to get cross" introduction.log ) do true ; \
	done

solow.pdf: solow.tex
	while ($(LATEX) --shell-escape solow.tex ; \
	grep -q "Rerun to get cross" solow.log ) do true ; \
	done

clean:
	@rm -f *.aux *.log *.out *.nav *.rel *.toc *.snm *.synctex.gz *.vrb
	@rm -rf auto

clean-all:
	@rm -f *.pdf

.PHONY: all
