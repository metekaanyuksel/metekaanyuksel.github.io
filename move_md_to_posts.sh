#!/bin/bash

QMD_DIR="$HOME/metekaanyuksel.github.io/qmd"
POSTS_DIR="$HOME/metekaanyuksel.github.io/_posts"

mkdir -p "$POSTS_DIR"

# Loop through all .qmd files and render to markdown
for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file to markdown..."
  
  # Render .qmd to markdown (output in same directory)
  quarto render "$file"
  
  # Get base filename without extension
  basefile=$(basename "$file" .qmd)
  
  # Move the generated .md to _posts
  if [ -f "$QMD_DIR/$basefile.md" ]; then
    mv "$QMD_DIR/$basefile.md" "$POSTS_DIR/"
    echo "Moved $basefile.md to _posts"
  else
    echo "Warning: $basefile.md not found after rendering."
  fi
done
