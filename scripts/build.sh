#!/bin/bash

LOAD_FILE='data/minecraft/tags/functions/load.json'

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

# Generate load tags for init functions

[ -d "$(dirname "$LOAD_FILE")" ] || mkdir -p "$(dirname "$LOAD_FILE")"

echo '{
  "values": [' > "$LOAD_FILE"

values="$(find 'data' -name 'init.mcfunction' |
  sed 's#^data/\([^/]*\)/functions/\([^.]*\)\.mcfunction$#    "\1:\2",#' |
  sort
)"

echo "$values" | sed "$(echo "$values" | wc -l)s/,\$//" >> "$LOAD_FILE"

echo '  ]
}' >> "$LOAD_FILE"
