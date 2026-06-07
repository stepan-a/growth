# Tous les PDF dérivés des sources .tex présentes dans le répertoire.
PDFS = $(patsubst %.tex,%.pdf,$(wildcard *.tex))

all: $(PDFS) clean

# Règle générique : un PDF se construit à partir du .tex de même nom.
%.pdf: %.tex
	rubber --pdf $<
	rubber --clean $<

# Cas particulier : la correction du DS1 2013 utilise une figure TikZ générée
# par un script Python.
ds1-2013-question-5.tikz:
	python3 ds1-2013.py

correction-ds1-2013.pdf: ds1-2013-question-5.tikz

clean:
	rm -rf auto

clean-all: clean
	rm -f $(PDFS)
	rm -f *.tikz

.PHONY: all clean clean-all
