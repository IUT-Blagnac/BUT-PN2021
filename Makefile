#-----------------------------------------------------
%.png: %.plantuml
	@echo '==> Compiling plantUML files to generate PNG'
	java -jar plantuml.jar $<

%.svg: %.plantuml
	@echo '==> Compiling plantUML files to generate SVG'
	java -jar plantuml.jar -t SVG $<
