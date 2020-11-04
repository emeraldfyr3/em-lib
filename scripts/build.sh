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

fileToFunction() {
  sed 's#^data/\([^/]*\)/functions/\([^.]*\)\.mcfunction$#\1:\2#'
}

makeInitFile() {
  local package="$1"

  local initFile="data/_${package}/functions/_init.mcfunction"

  local bossbars=
  local constants=
  local inits=
  local objectives=
  local scores=

  [ -f "$initFile" ] && rm "$initFile"

  for namespace in "$package" "_${package}"
  do
    if [ -d "data/${namespace}/functions" ]
    then
      while read file
      do
        while read line
        do
          case "$line" in
            '#!bossbar '*)
              bossbars="${bossbars}${line#* }"$'\n'
              ;;
            '#!constant '*)
              constants="${constants}${line#* }"$'\n'
              ;;
            '#!init '*)
              inits="${inits}${line#* }"$'\n'
              ;;
            '#!objective '*)
              objectives="${objectives}${line#* }"$'\n'
              ;;
            '#!score '*)
              scores="${scores}${line#* }"$'\n'
              ;;
          esac
        done < "$file"
      done <<< "$(find "data/${namespace}/functions" -name '*.mcfunction' -not -path "data/${namespace}/functions/test/*")"
    fi
  done

  # Remove empty lines
  bossbars="$(awk 'NF' <<< "$bossbars")"
  constants="$(awk 'NF' <<< "$constants")"
  inits="$(awk 'NF' <<< "$inits")"
  objectives="$(awk 'NF' <<< "$objectives")"
  scores="$(awk 'NF' <<< "$scores")"

  if [ "${bossbars}${constants}${inits}${objectives}${scores}" ]
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
" > "$initFile"

    echo "  - file '${initFile}'"
  fi
}

makeTestFiles() {
  local package="$1"

  local publicTests="$([ -d "data/${package}/functions/test" ] && find "data/${package}/functions/test" -name '*.mcfunction')"
  local allTests="$(awk 'NF' <<< "$publicTests"$'\n'"$([ -d "data/_${package}/functions/test" ] && find "data/_${package}/functions/test" -name '*.mcfunction')")"

  local tests=("$publicTests" "$allTests")
  local testFiles=(
    "data/${package}/functions/test.mcfunction"
    "data/_${package}/functions/test.mcfunction"
  )

  local objective="test_${package}"

  for (( i=0; i<${#tests[@]}; i++ ))
  do
    [ -f "${testFiles[$i]}" ] && rm "${testFiles[$i]}"

    if [ "${tests[$i]}" ]
    then
      printf "\
##### GENERATED FILE -- DO NOT EDIT #####

scoreboard objectives add ${objective} dummy
scoreboard players set successes ${objective} 0
scoreboard players set failures ${objective} 0

" > "${testFiles[$i]}"

      while read test
      do
        printf "\
scoreboard players set ran ${objective} 0
scoreboard players set result ${objective} 0
execute store success score ran ${objective} run function $(fileToFunction <<< "$test")
execute if score result ${objective} matches 0 run scoreboard players add failures ${objective} 1
execute unless score result ${objective} matches 0 run scoreboard players add successes ${objective} 1

" >> "${testFiles[$i]}"
      done <<< "${tests[$i]}"

      printf "execute %s score successes ${objective} matches 1 %s score failures ${objective} matches 1 run tellraw @s [\"Tests completed with \", {\"score\": {\"name\": \"successes\", \"objective\": \"${objective}\"}}, \" %s and \", {\"score\": {\"name\": \"failures\", \"objective\": \"${objective}\"}}, \" %s.\"]\n"\
        'if' 'if' 'success' 'failure'\
        'if' 'unless' 'success' 'failures'\
        'unless' 'if' 'successes' 'failure'\
        'unless' 'unless' 'successes' 'failures' >> "${testFiles[$i]}"

      echo "  - file '${testFiles[$i]}'"
    fi
  done
}

makeLoadFile() {
  local loadFile='data/minecraft/tags/functions/load.json'

  values="$(find 'data' -name '_init.mcfunction' |
    fileToFunction |
    sort |
    sed 's/^/    "/;s/$/",/'
  )"

  if [ "$values" ]
  then
    [ -d "$(dirname "$loadFile")" ] || mkdir -p "$(dirname "$loadFile")"

    echo '{
  "values": [' > "$loadFile"
    echo "$values" | sed "$(echo "$values" | wc -l)s/,\$//" >> "$loadFile"
    echo '  ]
}' >> "$loadFile"

    echo "- file '${loadFile}'"
  else
    [ -f "$loadFile" ] && rm "$loadFile"
  fi
}

### Main ###

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

echo "Building $(basename "$(pwd)")..."

while read package
do
  echo "- package '${package}'"
  makeInitFile "$package"
  makeTestFiles "$package"
done <<< "$(ls data | sed 's/^_//' | sort -u)"

makeLoadFile

echo "Done: $(basename "$(pwd)")"
