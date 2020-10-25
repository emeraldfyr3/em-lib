#!/bin/bash

# Script to generate initialization functions and add to minecraft:load tag
#
# One _init.mcfunction is generated per package.
# A package includes public and private namespaces.
# The public namespace is the package name, e.g. "em".
# The private namespace is the package name prefixed by an underscore, e.g. "_em".
# The generated init file is placed in the private namespace.
#
# Init files are generated based on compiler directives. Available directives:
# #!bossbar <id> [name]                    # Create a bossbar. Default name is "".
# #!constant <value> [objective]           # Set a scoreboard constant: player name is "#<value>", score is <value>. Default objective is "constant".
# #!init <function>                        # Run another function on initialization.
# #!objective <name> [type] [displayname]  # Create a scoreboard objective. Default type is dummy, default displayname is the name.
# #!score <player> <objective> [value]     # Set a player's score, or reset the score if no value is given.

LOAD_FILE='data/minecraft/tags/functions/load.json'

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

echo "Starting build for $(basename "$(pwd)")..."


echo 'Generating _init functions...'

while read package
do
  echo " - package '${package}'"
  objectives=
  constants=
  scores=
  bossbars=
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
        bossbars="${bossbars}$(grep '^#!bossbar ' "$file" | cut -d ' ' -f 2-)"$'\n'
        inits="${inits}$(grep '^#!init ' "$file" | cut -d ' ' -f 2-)"$'\n'
      done <<< "$(find "data/${namespace}/functions" -name '*.mcfunction')"
    fi
  done

  # Remove empty lines
  objectives="$(echo "$objectives" | awk 'NF')"
  constants="$(echo "$constants" | awk 'NF')"
  scores="$(echo "$scores" | awk 'NF')"
  bossbars="$(echo "$bossbars" | awk 'NF')"
  inits="$(echo "$inits" | awk 'NF')"

  if [ "$objectives" ] || [ "$constants" ] || [ "$scores" ] || [ "$bossbars" ] || [ "$inits" ]
  then
    [ -d "data/_${package}/functions" ] || mkdir -p "data/_${package}/functions"
    echo "\
##### GENERATED FILE -- DO NOT EDIT #####\
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

    if [ "$value" ]
    then
      echo "scoreboard players set ${player} ${objective} ${value}"
    else
      echo "scoreboard players reset ${player} ${objective}"
    fi
  done <<< "$(echo "$scores" | sort -u)"
)
")\
$([ "$bossbars" ] && echo "

# Boss Bars
$(
  while read bossbar
  do
    id="$(echo "${bossbar} " | cut -d ' ' -f 1)"
    name="$(echo "${bossbar} " | cut -d ' ' -f 2)"
    [ "$name" ] || name='""'

    echo "bossbar add ${id} ${name}"
  done <<< "$(echo "$bossbars" | sort -u)"
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
