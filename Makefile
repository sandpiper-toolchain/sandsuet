VERSION_FILE := metadata.yml
SANDSUET_VERSION := $(shell grep "sandsuetversion:" $(VERSION_FILE) | sed 's/.*sandsuetversion: //')

DOC_SOURCE = sandsuet.md
PDF_OUTPUT = sandsuet_v$(SANDSUET_VERSION).pdf

# Default target
all: clean pdf

# pdf rule
pdf: $(PDF_OUTPUT)

# pdf for sandsuet main document
$(PDF_OUTPUT): $(DOC_SOURCE)
	pandoc $(DOC_SOURCE) metadata.yml --template=sandsuet-pdf-theme.tex -o $(PDF_OUTPUT)

# clean rule
clean:
	rm -f $(PDF_OUTPUT)

.PHONY: all clean pdf
