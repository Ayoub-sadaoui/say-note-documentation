# Makefile for VoiceNotion LaTeX Documentation

# Default target
all: pdf

# Variables
MAIN = voicenotion_template
DIAGRAMS = voicenotion_diagrams
COMMANDS = voicenotion_commands
TOC_STRUCTURE = voicenotion_toc_structure
INTRODUCTION = voicenotion_introduction
OUTPUT_DIR = output
ASSETS_DIR = ../assets/docs
LATEX = pdflatex
LATEX_OPTS = -output-directory=$(OUTPUT_DIR)

# Create output and assets directories if they don't exist
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

$(ASSETS_DIR):
	mkdir -p $(ASSETS_DIR)

# Copy placeholder logo if needed
placeholder: $(ASSETS_DIR)
	@if [ ! -f $(ASSETS_DIR)/university_logo.png ]; then \
		echo "University logo not found, creating placeholder..."; \
		convert -size 300x300 xc:white -fill lightgray -draw "circle 150,150 150,150" -pointsize 24 -gravity center -annotate 0 "University Logo" $(ASSETS_DIR)/university_logo.png 2>/dev/null || echo "Warning: ImageMagick not installed, no placeholder created"; \
	fi

# Check for required files
check-files:
		@for file in $(MAIN).tex $(INTRODUCTION).tex; do \
		if [ ! -f $$file ]; then \
			echo "Missing required file: $$file"; \
			exit 1; \
		fi; \
	done

# Compile PDF
pdf: $(OUTPUT_DIR) placeholder check-files
	$(LATEX) $(LATEX_OPTS) $(MAIN).tex
	$(LATEX) $(LATEX_OPTS) $(MAIN).tex  # Run twice for cross-references
	$(LATEX) $(LATEX_OPTS) $(MAIN).tex  # Run third time for stable references

# View the PDF (if available)
view: pdf
	@if [ -f $(OUTPUT_DIR)/$(MAIN).pdf ]; then \
		echo "Opening PDF..."; \
		open $(OUTPUT_DIR)/$(MAIN).pdf 2>/dev/null || xdg-open $(OUTPUT_DIR)/$(MAIN).pdf 2>/dev/null || start $(OUTPUT_DIR)/$(MAIN).pdf 2>/dev/null || echo "Could not open PDF automatically"; \
	else \
		echo "PDF not found. Run 'make pdf' first."; \
	fi

# Clean up auxiliary files but keep PDF
clean:
	rm -f $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.log $(OUTPUT_DIR)/*.toc $(OUTPUT_DIR)/*.lof $(OUTPUT_DIR)/*.lot $(OUTPUT_DIR)/*.out

# Clean everything including PDF
distclean: clean
	rm -f $(OUTPUT_DIR)/*.pdf

# Help target
help:
	@echo "Available targets:"
	@echo "  all        - Build PDF (default)"
	@echo "  pdf        - Build PDF"
	@echo "  placeholder - Create university logo placeholder if missing"
	@echo "  view       - Open the compiled PDF"
	@echo "  clean      - Remove auxiliary files"
	@echo "  distclean  - Remove all generated files"
	@echo "  help       - Show this help message"

.PHONY: all pdf placeholder check-files view clean distclean help 