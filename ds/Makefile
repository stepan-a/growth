LATEX = pdflatex

all: ds1-2013.pdf correction-ds1-2013.pdf partiel-2013.pdf correction-partiel-2013.pdf partiel-2014.pdf correction-partiel-2014.pdf partiel-2015.pdf partiel-2016.pdf partiel-2017.pdf partiel-2018.pdf rattrapage-2013.pdf rattrapage-2017.pdf correction-rattrapage-2017.pdf correction-partiel-2018.pdf rattrapage-2018.pdf rattrapage-2019.pdf rattrapage-2023.pdf rattrapage-2024.pdf partiel-2023.pdf clean

ds1-2013.pdf: ds1-2013.tex
	rubber --pdf $^
	rubber --clean $^

ds1-2013-question-5.tikz:
	python3 ds1-2013.py

correction-ds1-2013.pdf: ds1-2013-question-5.tikz correction-ds1-2013.tex 
	rubber --pdf correction-ds1-2013.tex
	rubber --clean correction-ds1-2013.tex

partiel-2013.pdf: partiel-2013.tex
	rubber --pdf $^
	rubber --clean $^

partiel-2014.pdf: partiel-2014.tex
	rubber --pdf $^
	rubber --clean $^

partiel-2015.pdf: partiel-2015.tex
	rubber --pdf $^
	rubber --clean $^

partiel-2016.pdf: partiel-2016.tex
	rubber --pdf $^
	rubber --clean $^

partiel-2017.pdf: partiel-2017.tex
	rubber --pdf $^
	rubber --clean $^

partiel-2018.pdf: partiel-2018.tex
	rubber --pdf $^
	rubber --clean $^

partiel-2023.pdf: partiel-2023.tex
	rubber --pdf $^
	rubber --clean $^

correction-partiel-2013.pdf: correction-partiel-2013.tex
	rubber --pdf $^
	rubber --clean $^

correction-partiel-2014.pdf: correction-partiel-2014.tex
	rubber --pdf $^
	rubber --clean $^

correction-partiel-2018.pdf: correction-partiel-2018.tex
	rubber --pdf $^
	rubber --clean $^

correction-partiel-2023.pdf: correction-partiel-2023.tex
	rubber --pdf $^
	rubber --clean $^

rattrapage-2013.pdf: rattrapage-2013.tex
	rubber --pdf $^
	rubber --clean $^

rattrapage-2017.pdf: rattrapage-2017.tex
	rubber --pdf $^
	rubber --clean $^

rattrapage-2018.pdf: rattrapage-2018.tex
	rubber --pdf $^
	rubber --clean $^

rattrapage-2019.pdf: rattrapage-2019.tex
	rubber --pdf $^
	rubber --clean $^

correction-rattrapage-2017.pdf: correction-rattrapage-2017.tex
	rubber --pdf $^
	rubber --clean $^

rattrapage-2023.pdf: rattrapage-2023.tex
	rubber --pdf $^
	rubber --clean $^

rattrapage-2024.pdf: rattrapage-2024.tex
	rubber --pdf $^
	rubber --clean $^

clean:
	rm -rf auto

clean-all: clean
	rm -f correction-ds1-2013.pdf correction-rattrapage-2017.pdf partiel-2013.pdf partiel-2016.pdf partiel-2023.pdf rattrapage-2023.pdf correction-partiel-2013.pdf ds1-2013.pdf partiel-2014.pdf partiel-2017.pdf rattrapage-2013.pdf correction-partiel-2014.pdf partiel-2015.pdf partiel-2018.pdf rattrapage-2017.pdf
	rm -f *.tikz
