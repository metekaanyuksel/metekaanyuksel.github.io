QMD_DIR="./qmd"
POSTS_DIR="./_posts"

for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file to markdown..."
  quarto render "$file" --to md

  # Get filename without extension
  base=$(basename "$file" .qmd)

  # Move the rendered md to _posts with date prefix (adjust date as needed)
  # You could parse date from the md frontmatter, or hardcode for now:
  mv "$QMD_DIR/$base.md" "$POSTS_DIR/$base.md"
done

echo "✅ All .qmd files rendered and moved to _posts."

