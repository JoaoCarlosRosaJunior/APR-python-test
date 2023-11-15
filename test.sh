#!/usr/bin/env bash

COMMITTED_CODE=""
  for file in $(git diff --name-only HEAD^ HEAD | grep '^src/'); do
    COMMITTED_CODE+=$(git show HEAD:"$file" | tr '\n' ' ')
  done
  
  echo "Committed Code:"
  echo "$COMMITTED_CODE"