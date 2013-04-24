LATEX = pdflatex
TARGET = kirikou.cepremap.org:~/public_html/university/growth/td/2

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

push:
	rsync -avz --delete-after ./*.pdf $(TARGET)
	rsync -avz --delete-after ./*.tex $(TARGET)

all: td3.pdf correction-td3.pdf clean push
