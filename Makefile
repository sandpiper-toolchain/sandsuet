DOC_SOURCE = sandsuet.md
PDF_OUTPUT = sandsuet.pdf

# Default target
all: clean pdf

# pdf rule
pdf: $(PDF_OUTPUT)

# pdf for sandsuet main document
$(PDF_OUTPUT): $(DOC_SOURCE)
	pandoc $(DOC_SOURCE) --template=sandsuet-pdf-theme.tex -o $(PDF_OUTPUT)

# clean rule
clean:
	rm -f $(PDF_OUTPUT)

.PHONY: all clean pdf