#!/bin/bash

# Script to generate init files and add to minecraft:load tag
#
# This script scans for files named "init.mcfunction" and adds them to the load tag.

LOAD_FILE='data/minecraft/tags/functions/load.json'

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

echo "Starting build for $(basename "$(pwd)")..."


echo 'Generating _init functions...'

# A package includes public and private namespaces.
# The public namespace is the package name, e.g. "em".
# The private namespace is the package name prefixed by an underscore, e.g. "_em".
while read package
do
  echo " - package '${package}'"
  objectives=
  constants=
  scores=
  inits=

  for namespace in "$package" "_${package}"
  do
    if [ -d "data/${namespace}/functions" ]
    then
      while read file
      do
        objectives="${objectives}$(grep '^#!objective ' "$file" | cut -d ' ' -f 2-)"$'\n'
        constants="${constants}$(grep '^#!constant ' "$file" | cut -d ' ' -f 2-)"$'\n'
        scores="${scores}$(grep '^#!score ' "$file" | cut -d ' ' -f 2-)"$'\n'
        inits="${inits}$(grep '^#!init ' "$file" | cut -d ' ' -f 2-)"$'\n'
      done <<< "$(find "data/${namespace}/functions" -name '*.mcfunction')"
    fi
  done

  # Remove empty lines
  objectives="$(echo "$objectives" | awk 'NF')"
  constants="$(echo "$constants" | awk 'NF')"
  scores="$(echo "$scores" | awk 'NF')"
  inits="$(echo "$inits" | awk 'NF')"

  if [ "$objectives" ] || [ "$constants" ] || [ "$scores" ] || [ "$inits" ]
  then
    [ -d "data/_${package}/functions" ] || mkdir -p "data/_${package}/functions"
    echo "\
##### GENERATED FILE -- DO NOT EDIT #####
$([ "$objectives" ] && echo "
# Objectives
$(
  while read objective
  do
    name="$(echo "${objective} " | cut -d ' ' -f 1)"
    type="$(echo "${objective} " | cut -d ' ' -f 2)"
    [ "$type" ] || type='dummy'

    echo "scoreboard objectives add ${name} ${type}"
  done <<< "$(echo "$objectives" | sort -u)"
)
")\
$([ "$constants" ] && echo "

# Constants
$(
  while read constant
  do
    value="$(echo "${constant} " | cut -d ' ' -f 1)"
    objective="$(echo "${constant} " | cut -d ' ' -f 2)"
    [ "$objective" ] || objective='constant'

    echo "scoreboard players set #${value} ${objective} ${value}"
  done <<< "$(echo "$constants" | sort -u)"
)
")\
$([ "$scores" ] && echo "

# Scores
$(
  while read score
  do
    player="$(echo "${score} " | cut -d ' ' -f 1)"
    objective="$(echo "${score} " | cut -d ' ' -f 2)"
    value="$(echo "${score} " | cut -d ' ' -f 3)"

    echo "scoreboard players set ${player} ${objective} ${value}"
  done <<< "$(echo "$scores" | sort -u)"
)
")\
$([ "$inits" ] && echo "

# Initialization Functions
$(
  while read init
  do
    function="$(echo "${init} " | cut -d ' ' -f 1)"

    echo "function ${function}"
  done <<< "$(echo "$inits" | sort -u)"
)
")\
" > "data/_${package}/functions/_init.mcfunction"
  fi
done <<< "$(ls data | sed 's/^_//' | sort -u)"


echo 'Adding _init functions to the minecraft:load tag...'

[ -d "$(dirname "$LOAD_FILE")" ] || mkdir -p "$(dirname "$LOAD_FILE")"

echo '{
  "values": [' > "$LOAD_FILE"

values="$(find 'data' -name '_init.mcfunction' |
  sed 's#^data/\([^/]*\)/functions/\([^.]*\)\.mcfunction$#    "\1:\2",#' |
  sort
)"

echo "$values" | sed "$(echo "$values" | wc -l)s/,\$//" >> "$LOAD_FILE"

echo '  ]
}' >> "$LOAD_FILE"

echo "Done: $(basename "$(pwd)")"
