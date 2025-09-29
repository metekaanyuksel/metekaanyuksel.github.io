#!/bin/bash

QMD_DIR="./qmd"
POSTS_DIR="./_posts"
AUTHOR="Mete Yuksel"
CATEGORY="musings"

mkdir -p "$POSTS_DIR"

for file in "$QMD_DIR"/*.qmd; do
  echo "Rendering $file to markdown..."

  # Render .qmd to .md
  quarto render "$file" --to md

  base=$(basename "$file" .qmd)

  # Extract date and title from filename if formatted like YYYY-MM-DD-title.qmd
  if [[ "$base" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
    date="${BASH_REMATCH[1]}"
    raw_title="${BASH_REMATCH[2]}"
  else
    date=$(date +%Y-%m-%d)
    raw_title="$base"
  fi

  # Format title: replace dashes with spaces
  title=$(echo "$raw_title" | sed 's/-/ /g')
  # Format for cover image: replace spaces with dashes
  cover_title=$(echo "$title" | sed 's/ /-/g')

  mdfile="$QMD_DIR/$base.md"
  postfile="$POSTS_DIR/${base}.md"

  # Create custom Jekyll frontmatter
  cat > header.tmp <<EOF
---
layout: post
title:  "$title"
date:   $date
author: $AUTHOR
categories: $CATEGORY
cover:  "/assets/${cover_title}.jpeg"
---
EOF

  # Strip first level-1 heading from the body (e.g., '# Title')
  tmpfile=$(mktemp)
  awk '
    found_heading == 0 && /^# / { found_heading = 1; next }  # Skip the first H1
    { print }
  ' "$mdfile" > "$tmpfile"

  # Combine frontmatter and cleaned body
  cat header.tmp "$tmpfile" > "$postfile"

  # Cleanup
  rm -f header.tmp "$tmpfile" "$mdfile"

  echo "✅ Created $postfile"
done

echo "🎉 All .qmd files rendered with clean Jekyll frontmatter and moved to _posts."