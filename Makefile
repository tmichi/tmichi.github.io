MD_FILES=$(shell find * -name "*.md")
HTML_FILES=$(MD_FILES:.md=.html)
TEMPLATE_FILE=html5-template.html
CSS_FILE=styles.css
.SUFFIXES: .md .html
%.html : %.md $(TEMPLATE_FILE)
	echo $<
	pandoc  -F pandoc-crossref --css $(CSS_FILE) --template $(TEMPLATE_FILE) --to html5 -o $@ $<

.PHONY: all clean publish

all: $(HTML_FILES)
clean:
	rm -f $(HTML_FILES) *~

publish: 
	git commit -a -m "snapshot"
	git push
