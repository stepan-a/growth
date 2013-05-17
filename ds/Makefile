LATEX = pdflatex
TARGET = kirikou.cepremap.org:~/public_html/university/growth/ds

INITIAL_PATH = $(PATH)
PYTHON_PATH = /home/stepan/Python/Anaconda/bin

ds1-2013.pdf: ds1-2013.tex
	while ($(LATEX) ds1-2013.tex ; \
	grep -q "Rerun to get cross" ds1-2013.log ) do true ; \
	done

ds1-2013-question-5.tikz:
	export PATH=$(PYTHON_PATH):$(INITIAL_PATH)
	python ds1-2013.py
	export PATH=$(INITIAL_PATH)

correction-ds1-2013.pdf: correction-ds1-2013.tex ds1-2013-question-5.tikz
	while ($(LATEX) correction-ds1-2013.tex ; \
	grep -q "Rerun to get cross" correction-ds1-2013.log ) do true ; \
	done

clean:
	rm -rf *.aux
	rm -rf *.out

clean-all: clean
	rm *.pdf
	rm *.tikz
	rm *.log

push:
	rsync -avz --delete-after ./*.pdf $(TARGET)
	rsync -avz --delete-after ./*.tex $(TARGET)
	rsync -avz --delete-after ./*.py $(TARGET)

all: ds1-2013.pdf correction-ds1-2013.pdf clean push
