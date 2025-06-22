# Makefile for VoiceNotion LaTeX Documentation (Windows Compatible)

# Default target
all: pdf

# Variables
MAIN = main
DIAGRAMS = voicenotion_diagrams
COMMANDS = voicenotion_commands
TOC_STRUCTURE = voicenotion_toc_structure
INTRODUCTION = voicenotion_introduction
OUTPUT_DIR = output
ASSETS_DIR = assets/docs
LATEX = pdflatex
LATEX_OPTS = -output-directory=$(OUTPUT_DIR)

# Create output directory if it doesn't exist
$(OUTPUT_DIR):
	@mkdir -p $(OUTPUT_DIR)

# Copy placeholder logo if needed
placeholder: $(ASSETS_DIR)
	@if [ ! -f "$(ASSETS_DIR)/university_logo.png" ]; then \
		echo "University logo not found, creating placeholder..."; \
		convert -size 300x300 xc:white -fill lightgray -draw "circle 150,150 150,150" -pointsize 24 -gravity center -annotate 0 "University Logo" "$(ASSETS_DIR)/university_logo.png" 2>/dev/null || echo "Warning: ImageMagick not installed, no placeholder created."; \
	fi

# Check for required files
check-files:
	@if [ ! -f "$(MAIN).tex" ]; then echo "Missing required file: $(MAIN).tex" && exit 1; fi
	@if [ ! -f "$(INTRODUCTION).tex" ]; then echo "Missing required file: $(INTRODUCTION).tex" && exit 1; fi

# Compile PDF
pdf: $(OUTPUT_DIR) placeholder check-files
	$(LATEX) $(LATEX_OPTS) $(MAIN).tex
	$(LATEX) $(LATEX_OPTS) $(MAIN).tex  # Run twice for cross-references
	$(LATEX) $(LATEX_OPTS) $(MAIN).tex  # Run third time for stable references

# View the PDF (if available)
view: pdf
	@if exist "$(OUTPUT_DIR)\$(MAIN).pdf" ( \
		echo "Opening PDF..." & \
		start "" "$(OUTPUT_DIR)\$(MAIN).pdf" \
	) else ( \
		echo "PDF not found. Run 'make pdf' first." \
	)

# Clean up auxiliary files but keep PDF
clean:
	@-del /Q "$(OUTPUT_DIR)\*.aux" "$(OUTPUT_DIR)\*.log" "$(OUTPUT_DIR)\*.toc" "$(OUTPUT_DIR)\*.lof" "$(OUTPUT_DIR)\*.lot" "$(OUTPUT_DIR)\*.out" 2>nul

# Clean everything including PDF
distclean: clean
	@-del /Q "$(OUTPUT_DIR)\*.pdf" 2>nul

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