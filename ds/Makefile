LATEX = pdflatex

all: ds1-2013.pdf correction-ds1-2013.pdf partiel-2013.pdf correction-partiel-2013.pdf partiel-2014.pdf correction-partiel-2014.pdf partiel-2015.pdf partiel-2016.pdf partiel-2017.pdf partiel-2018.pdf rattrapage-2013.pdf rattrapage-2017.pdf correction-rattrapage-2017.pdf correction-partiel-2018.pdf clean

ds1-2013.pdf: ds1-2013.tex
	while ($(LATEX) ds1-2013.tex ; \
	grep -q "Rerun to get cross" ds1-2013.log ) do true ; \
	done

ds1-2013-question-5.tikz:
	python ds1-2013.py

correction-ds1-2013.pdf: correction-ds1-2013.tex ds1-2013-question-5.tikz
	while ($(LATEX) correction-ds1-2013.tex ; \
	grep -q "Rerun to get cross" correction-ds1-2013.log ) do true ; \
	done

partiel-2013.pdf: partiel-2013.tex
	while ($(LATEX) partiel-2013.tex ; \
	grep -q "Rerun to get cross" partiel-2013.log ) do true ; \
	done

partiel-2014.pdf: partiel-2014.tex
	while ($(LATEX) partiel-2014.tex ; \
	grep -q "Rerun to get cross" partiel-2014.log ) do true ; \
	done

partiel-2015.pdf: partiel-2015.tex
	while ($(LATEX) partiel-2015.tex ; \
	grep -q "Rerun to get cross" partiel-2015.log ) do true ; \
	done

partiel-2016.pdf: partiel-2016.tex
	while ($(LATEX) partiel-2016.tex ; \
	grep -q "Rerun to get cross" partiel-2016.log ) do true ; \
	done

partiel-2017.pdf: partiel-2017.tex
	while ($(LATEX) partiel-2017.tex ; \
	grep -q "Rerun to get cross" partiel-2017.log ) do true ; \
	done

partiel-2018.pdf: partiel-2018.tex
	while ($(LATEX) partiel-2018.tex ; \
	grep -q "Rerun to get cross" partiel-2018.log ) do true ; \
	done

correction-partiel-2013.pdf: correction-partiel-2013.tex
	while ($(LATEX) correction-partiel-2013.tex ; \
	grep -q "Rerun to get cross" correction-partiel-2013.log ) do true ; \
	done

correction-partiel-2014.pdf: correction-partiel-2014.tex
	while ($(LATEX) correction-partiel-2014.tex ; \
	grep -q "Rerun to get cross" correction-partiel-2014.log ) do true ; \
	done

correction-partiel-2018.pdf: correction-partiel-2018.tex
	while ($(LATEX) correction-partiel-2018.tex ; \
	grep -q "Rerun to get cross" correction-partiel-2018.log ) do true ; \
	done

rattrapage-2013.pdf: rattrapage-2013.tex
	while ($(LATEX) rattrapage-2013.tex ; \
	grep -q "Rerun to get cross" rattrapage-2013.log ) do true ; \
	done

rattrapage-2017.pdf: rattrapage-2017.tex
	while ($(LATEX) rattrapage-2017.tex ; \
	grep -q "Rerun to get cross" rattrapage-2017.log ) do true ; \
	done

correction-rattrapage-2017.pdf: correction-rattrapage-2017.tex
	while ($(LATEX) correction-rattrapage-2017.tex ; \
	grep -q "Rerun to get cross" correction-rattrapage-2017.log ) do true ; \
	done

clean:
	rm -rf *.aux
	rm -rf *.out
	rm -rf auto
	rm -rf *.log
	rm -rf *.synctex.gz

clean-all: clean
	rm *.pdf
	rm *.tikz
	rm *.log
