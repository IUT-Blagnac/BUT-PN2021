#-----------------------------------------------------
# Some usefull instructions...
#
DOC = asciidoctor -a allow-uri-read
#-----------------------------------------------------

all: *.pdf *.html 

# main.adoc: main-template.adoc $(BOOKS)
# 	mvn asciidoc-template::build

%.html: %.adoc 
	$(DOC) $<

%.pdf: %.adoc 
	asciidoctor-pdf -a allow-uri-read -a pdf-backend $<

clean:
	rm *.html

check:
	cucumber
