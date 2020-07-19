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

  for namespace in "$package" "_${package}"
  do
    if [ -d "data/${namespace}/functions" ]
    then
      while read file
      do
        objectives="$objectives"$'\n'"$(cat "$file" | grep '^#!objective ' | cut -d ' ' -f 2-)"
        constants="$constants"$'\n'"$(cat "$file" | grep '^#!constant ' | cut -d ' ' -f 2-)"
        scores="$scores"$'\n'"$(cat "$file" | grep '^#!score ' | cut -d ' ' -f 2-)"
      done <<< "$(find "data/${namespace}/functions" -name '*.mcfunction')"
    fi
  done

  # Remove empty lines
  objectives="$(echo "$objectives" | awk 'NF')"
  constants="$(echo "$constants" | awk 'NF')"
  scores="$(echo "$scores" | awk 'NF')"

  if [ "$objectives" ] || [ "$constants" ] || [ "$scores" ]
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
" > "data/_${package}/functions/_init.mcfunction"
  fi
done <<< "$(ls data | sed 's/^_//' | sort -u)"


echo 'Adding init functions to the minecraft:load tag...'

[ -d "$(dirname "$LOAD_FILE")" ] || mkdir -p "$(dirname "$LOAD_FILE")"

echo '{
  "values": [' > "$LOAD_FILE"

values="$(find 'data' -name '_init.mcfunction' -or -name 'init.mcfunction' |
  sed 's#^data/\([^/]*\)/functions/\([^.]*\)\.mcfunction$#    "\1:\2",#' |
  sort
)"

echo "$values" | sed "$(echo "$values" | wc -l)s/,\$//" >> "$LOAD_FILE"

echo '  ]
}' >> "$LOAD_FILE"

echo "Done: $(basename "$(pwd)")"
