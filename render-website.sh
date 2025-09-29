QMD_DIR="./qmd"
POSTS_DIR="./_posts"
AUTHOR="Mete Yuksel"
CATEGORY="musings"

for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file to markdown..."
  quarto render "$file" --to md

  base=$(basename "$file" .qmd)
 
  if [[ "$base" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
    date="${BASH_REMATCH[1]}"
    title="${BASH_REMATCH[2]}"
    # Keep original capitalization as is (no change)
    # If you want to replace dashes with spaces for the title:
    title=$(echo "$title" | sed 's/-/ /g')
  else
    date=$(date +%Y-%m-%d)
    title=$(echo "$base" | sed 's/-/ /g')
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

  cat header.tmp "$mdfile" > "$postfile"

  rm header.tmp

  rm "$mdfile"

  echo "Created $postfile"
done

echo "✅ All .qmd files rendered with Jekyll frontmatter and moved to _posts."

git add -A
git commit -m "rendering website"
git push
