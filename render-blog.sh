QMD_DIR="./qmd"

for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file..."
  quarto render "$file"
done

echo "✅ All .qmd files rendered."
