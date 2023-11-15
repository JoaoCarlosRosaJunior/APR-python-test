#!/usr/bin/env bash

COMMITTED_CODE=""
while read -r file; do
  # Check if the file is in the src directory
  if [[ $file == src/* ]]; then
    COMMITTED_CODE+=$(git show HEAD:"$file" | tr '\n' ' ')
  fi
done < <(git diff --name-only HEAD^ HEAD)

echo "Committed Code:"
echo "$COMMITTED_CODE"