QMD_DIR="./qmd"
POSTS_DIR="./_posts"
AUTHOR="Mete Yuksel"
CATEGORY="musings"

for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file to markdown..."
  quarto render "$file" --to md

  base=$(basename "$file" .qmd)

  # Extract date and title from filename: e.g. 2025-09-17-trying-things-out.qmd
  # Assuming filename format: YYYY-MM-DD-title.qmd
  # If your filenames don't have the date, hardcode or skip date extraction

  if [[ "$base" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
    date="${BASH_REMATCH[1]}"
    title_raw="${BASH_REMATCH[2]}"
    # Replace dashes with spaces and capitalize words for the title
    title=$(echo "$title_raw" | sed -E 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')
  else
    date="2025-09-29"  # fallback date
    title=$(echo "$base" | sed -E 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')
  fi

  mdfile="$QMD_DIR/$base.md"
  postfile="$POSTS_DIR/${base}.md"

  # Create YAML frontmatter
  cat > header.tmp <<EOF
---
layout: post
title:  "$title"
date:   $date
author: $AUTHOR
categories: $CATEGORY
---
EOF

  # Prepend the header to the md file and write to _posts
  cat header.tmp "$mdfile" > "$postfile"

  # Clean up temporary header
  rm header.tmp

  # Optionally remove the original md file from qmd dir
  rm "$mdfile"

  echo "Created $postfile"
done

echo "✅ All .qmd files rendered with Jekyll frontmatter and moved to _posts."
