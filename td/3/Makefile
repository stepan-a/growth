LATEX = pdflatex

td3.pdf: td3.tex
	while ($(LATEX) td3.tex ; \
	grep -q "Rerun to get cross" td3.log ) do true ; \
	done

correction-td3.pdf: correction-td3.tex
	while ($(LATEX) correction-td3.tex ; \
	grep -q "Rerun to get cross" correction-td3.log ) do true ; \
	done

clean:
	rm -rf *.aux
	rm -rf *.log

clean-all: clean
	rm *.pdf

all: td3.pdf correction-td3.pdf clean push
