MD_FILES=$(shell find * -name "*.md")
HTML_FILES=$(MD_FILES:.md=.html)
TEMPLATE_FILE=html5-template.html
CSS_FILE=styles.css
.SUFFIXES: .md .html
%.html : %.md $(TEMPLATE_FILE)
	echo $<
	sh run_pandoc.sh $(CSS_FILE) $(TEMPLATE_FILE) $< $@
	mv $@ .
.PHONY: all clean
all: $(HTML_FILES)

clean:
	rm -f $(HTML_FILES)
