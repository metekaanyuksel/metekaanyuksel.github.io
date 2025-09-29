#!/bin/bash

QMD_DIR="$HOME/metekaanyuksel.github.io/qmd"
POSTS_DIR="$HOME/metekaanyuksel.github.io/_posts"

echo "Cleaning $QMD_DIR to keep only .qmd files ..."
find "$QMD_DIR" -mindepth 1 ! -name '*.qmd' -exec rm -rf {} +
echo "Non-.qmd files and directories removed from $QMD_DIR."

mkdir -p "$POSTS_DIR"

for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file to markdown..."

  quarto render "$file"

  basefile=$(basename "$file" .qmd)

  if [ -f "$QMD_DIR/$basefile.md" ]; then
    mv "$QMD_DIR/$basefile.md" "$POSTS_DIR/"
    echo "Moved $basefile.md to _posts"
  else
    echo "Warning: $basefile.md not found after rendering."
  fi
done