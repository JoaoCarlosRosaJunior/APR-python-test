#!/usr/bin/env bash

PREVIOUS_COMMIT=$(git rev-parse HEAD^1)

COMMITTED_CODE=""
while read -r file; do
  # Check if the file is in the src directory
  if [[ $file == src/* ]]; then
    COMMITTED_CODE+=$(git show $PREVIOUS_COMMIT:"$file" | tr '\n' ' ')
  fi
done < <(git diff --name-only $PREVIOUS_COMMIT HEAD)

echo "Committed Code:"
echo "$COMMITTED_CODE"
