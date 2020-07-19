#!/bin/bash

# Script to generate init files and add to minecraft:load tag
#
# This script scans for files named "init.mcfunction" and adds them to the load tag.

LOAD_FILE='data/minecraft/tags/functions/load.json'

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"


# Generate _init functions

while read namespace
do
  objectives=
  constants=
  scores=

  if [ -d "data/${namespace}/functions" ]
  then
    while read file
    do
      objectives="$objectives"$'\n'"$(cat "$file" | grep '^#!objective ' | cut -d ' ' -f 2-)"
      constants="$constants"$'\n'"$(cat "$file" | grep '^#!constant ' | cut -d ' ' -f 2-)"
      scores="$scores"$'\n'"$(cat "$file" | grep '^#!score ' | cut -d ' ' -f 2-)"
    done <<< "$(find "data/${namespace}/functions" -name '*.mcfunction')"
  fi

  # Remove the leading newline
  objectives="$(echo "$objectives" | tail -n +2)"
  constants="$(echo "$constants" | tail -n +2)"
  scores="$(echo "$scores" | tail -n +2)"

  if [ "$objectives" ] || [ "$constants" ] || [ "$scores" ]
  then
    [ -d "data/_${namespace}/functions" ] || mkdir -p "data/_${namespace}/functions"
    echo "\
##### GENERATED FILE -- DO NOT EDIT #####

$([ "$objectives" ] && echo "\
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
")

$([ "$constants" ] && echo "\
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
")

$([ "$scores" ] && echo "\
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
")
" > "data/_${namespace}/functions/_init.mcfunction"
  fi
done <<< "$(ls data | sed 's/^_//' | sort -u)"


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
