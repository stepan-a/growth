LATEX = pdflatex

td1.pdf: td1.tex
	while ($(LATEX) td1.tex ; \
	grep -q "Rerun to get cross" td1.log ) do true ; \
	done

correction-td1.pdf: correction-td1.tex
	while ($(LATEX) correction-td1.tex ; \
	grep -q "Rerun to get cross" correction-td1.log ) do true ; \
	done

clean:
	rm -rf *.aux
	rm -rf *.log

clean-all: clean
	rm -f *.pdf

all: td1.pdf correction-td1.pdf clean
