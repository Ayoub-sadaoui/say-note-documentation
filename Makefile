# Makefile for SayNote LaTeX Documentation (Windows Compatible)

# Default target
all: pdf

# Variables
MAIN = main
DIAGRAMS = SayNote_diagrams
COMMANDS = SayNote_commands
TOC_STRUCTURE = SayNote_toc_structure
INTRODUCTION = SayNote_introduction
OUTPUT_DIR = output
ASSETS_DIR = assets/docs
LATEX = pdflatex
LATEX_OPTS = -output-directory=$(OUTPUT_DIR)

# Create output directory if it doesn't exist
$(OUTPUT_DIR):
	@if not exist "$(OUTPUT_DIR)" mkdir "$(OUTPUT_DIR)"

# Copy placeholder logo if needed
placeholder: $(ASSETS_DIR)
	@if not exist "$(ASSETS_DIR)\university_logo.png" echo "Warning: University logo not found. Placeholder creation skipped."

# Check for required files
check-files:
	@if not exist "$(MAIN).tex" (echo Missing required file: $(MAIN).tex & exit /b 1)
	@if not exist "$(INTRODUCTION).tex" (echo Missing required file: $(INTRODUCTION).tex & exit /b 1)

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