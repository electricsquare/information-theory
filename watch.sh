#!/bin/bash

# Watch to see if presentation.md gets modified, and if so rebuild index.html

inotifywait -q -m -e close_write presentation.md |
while read -r filename event; do
  ./build.sh
  echo "rebuilding"
done
