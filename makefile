#TSF = $(shell ls tsf)
TSF = $(notdir $(wildcard tsf/*.tsf))

PDF = $(TSF:%.tsf=%.pdf)

.PRECIOUS: %.tex

all: $(PDF)

clean:
	rm *.log *.aux *.fdb_latexmk *.fls *.tex

%.tex: tsf/%.tsf
	echo "tsf -> tex"
	java -jar ../TonicTo/target/TonicTo-1.0-SNAPSHOT.jar $< $@


%.pdf: %.tex
	echo $(PDF)
	latexmk $<
