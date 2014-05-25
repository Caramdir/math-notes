SOURCES=$(shell echo *.tex)
PDFS=$(SOURCES:.tex=.pdf)

list:
	ls *.tex | sed 's/.tex//'

dist: all
	rsync -av --del --include="*.pdf" -f 'hide, *' . ~/Dropbox/ezpdf\ library/00_Notes

all: $(PDFS)

%.pdf: %.tex
	latexmk -pdf -pdflatex=lualatex $<
