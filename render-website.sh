#!/bin/bash
# Usage: ./deploy.sh "your commit message"

if [ -z "$1" ]; then
  echo "Error: Commit message required."
  echo "Usage: ./deploy.sh \"Your commit message\""
  exit 1
fi

bash render-qmds.sh

git add -A
git commit -m "$1"
git push
