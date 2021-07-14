#-----------------------------------------------------
# Some usefull instructions...
#
DOC = asciidoctor -a allow-uri-read
.DEFAULT_GOAL := png

## Diagram compilation : using PlantUML

PLANTUML_EXEC = java -jar plantuml.jar 
PUML = $(PLANTUML_EXEC) -charset UTF-8

SOURCES := $(shell find * -type f -name "*.plantuml")

PNGS = $(SOURCES:.plantuml=.png)
SVGS = $(SOURCES:.plantuml=.svg)
PDFS = $(SOURCES:.plantuml=.pdf)
#-----------------------------------------------------

all: *.pdf *.html 

# main.adoc: main-template.adoc $(BOOKS)
# 	mvn asciidoc-template::build

%.html: %.adoc 
	$(DOC) $<

%.pdf: %.adoc 
	asciidoctor-pdf -a allow-uri-read -a pdf-backend $<

check:
	cucumber


%.png: %.plantuml
	$(PUML) ./$<

%.svg: %.plantuml
	$(PUML) -tsvg ./$<

%.pdf: %.svg
	rsvg-convert -f pdf -o $@ $<

testenv:
	$(PUML) -testdot

png: $(PNGS)
pdf: $(PDFS)

## Clean
clean:
	rm -rf $(PNGS) $(PDFS) $(SVGS) *.html
