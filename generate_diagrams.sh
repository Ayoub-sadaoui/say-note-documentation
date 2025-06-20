#!/bin/bash

# Set the output directory for the generated diagrams
OUTPUT_DIR="../assets/docs"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to encode a string to Base64 URL safe
encode_base64() {
  local string="$1"
  local encoded=$(echo -n "$string" | base64)
  # Make base64 URL safe
  encoded=${encoded//+/-}
  encoded=${encoded//\//_}
  echo "$encoded"
}

echo "Generating diagrams from PlantUML files..."

# Process each PlantUML file in the diagrams directory
for puml_file in diagrams/*.puml; do
    # Extract the base name without extension
    base_name=$(basename "$puml_file" .puml)
    echo "Processing: $base_name"
    
    # Read the file content
    content=$(cat "$puml_file")
    
    # Alternative 1: Create a preview link for the user to manually download
    encoded=$(encode_base64 "$content")
    preview_link="http://www.plantuml.com/plantuml/uml/$encoded"
    
    echo "Preview link for $base_name: $preview_link"
    echo "Please visit this link in your browser to view and download the diagram."
    echo "Save it as $OUTPUT_DIR/$base_name.png"
    
    # Save the link to a text file for reference
    echo "$preview_link" > "$OUTPUT_DIR/${base_name}_preview_link.txt"
    
    # Attempt to download directly (may not work with complex diagrams)
    curl -s "$preview_link.png" -o "$OUTPUT_DIR/$base_name.png"
    
    if [ -s "$OUTPUT_DIR/$base_name.png" ]; then
        echo "Downloaded: $OUTPUT_DIR/$base_name.png"
    else
        echo "Could not download automatically. Please use the preview link."
    fi
    
    echo "-----------------------------------"
done

echo "All diagrams have been processed."
echo "If some diagrams could not be downloaded automatically,"
echo "please use the preview links provided to manually download them."
echo "Don't forget to uncomment the image references in your LaTeX files!" 