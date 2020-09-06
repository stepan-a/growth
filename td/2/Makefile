LATEX = pdflatex

td2.pdf: td2.tex
	while ($(LATEX) td2.tex ; \
	grep -q "Rerun to get cross" td2.log ) do true ; \
	done

correction-td2.pdf: correction-td2.tex fig1.tikz fig2.tikz fig3.tikz fig4.tikz
	while ($(LATEX) correction-td2.tex ; \
	grep -q "Rerun to get cross" correction-td2.log ) do true ; \
	done

clean:
	rm -rf *.aux
	rm -rf *.log

clean-all: clean
	rm -f *.pdf

all: td2.pdf correction-td2.pdf clean
