ASCIIDOC_SOURCE = sandsuet.adoc
PDF_OUTPUT = sandsuet.pdf
ASCIIDOCTOR_PDF = asciidoctor-pdf

# Default target
all: clean pdf

# pdf rule
pdf: $(PDF_OUTPUT)

# pdf for sandsuet main document
$(PDF_OUTPUT): $(ASCIIDOC_SOURCE)
	asciidoctor-pdf --verbose -a pdf-theme=sandsuet-pdf-theme.yml $(ASCIIDOC_SOURCE)

# clean rule
clean:
	rm -f $(PDF_OUTPUT)

.PHONY: all clean pdf