#!/bin/bash

LOAD_FILE='data/minecraft/tags/functions/load.json'

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

# Generate load tags for init functions

[ -d "$(dirname "$LOAD_FILE")" ] || mkdir -p "$(dirname "$LOAD_FILE")"

echo '{
  "values": [' > "$LOAD_FILE"

values="$(printf '    "_em:%s\",\n' $(
    find 'data/_em/functions' -name 'init.mcfunction' |
      cut -d '/' -f 4- |
      cut -d '.' -f -1 |
      sort
  ))"

echo "$values" | sed "$(echo "$values" | wc -l)s/,\$//" >> "$LOAD_FILE"

echo '  ]
}' >> "$LOAD_FILE"
