#!/bin/bash

# Script to generate initialization functions and add to minecraft:load tag.
# Also generates documentation and creates a test function to run all tests.
#
# One _init.mcfunction is generated per package.
# A package includes public and private namespaces.
# The public namespace is the package name, e.g. "em".
# The private namespace is the package name prefixed by an underscore, e.g. "_em".
# The generated init file is placed in the private namespace.
#
# Init files are generated based on compiler directives. Available directives:
# #!bossbar <id> [name]                    # Create a bossbar. Default name is "".
# #!constant <value> <objective>           # Set a scoreboard constant: player name is "#<value>", objective is <objective>, score is <value>.
# #!init <function>                        # Run another function on initialization.
# #!objective <name> [type] [displayname]  # Create a scoreboard objective. Default type is dummy, default displayname is the name.
# #!reset <function>                       # Run another function on reset.
# #!score <player> <objective> [value]     # Set a player's score, or reset the score if no value is given.
#
# Documentation is generated using these compiler directives:
# #!doc <comment>                           # Doc comment for the function
# #!param <selector> <objective> [comment]  # Function takes input from a score value for <selector> on <objective>
# #!return <selector> <objective> [comment] # Function sets output to a score value for <selector> on <objective>
# #!video <URL> [title]                     # Link to a video for the function

dir_docs() {
  local package="$1"

  echo "docs/${package}"
}

dir_help() {
  local namespace="$1"

  echo "data/${namespace}/functions/help"
}

dir_test() {
  local namespace="$1"

  echo "data/${namespace}/functions/test"
}

file_init() {
  local package="$1"

  echo "data/_${package}/functions/_init.mcfunction"
}

file_reset() {
  local package="$1"

  echo "data/_${package}/functions/_reset.mcfunction"
}

fileToFunction() {
  sed 's#^data/\([^/]*\)/functions/\([^.]*\)\.mcfunction$#\1:\2#'
}

listFunctionFiles() {
  local namespace="$1"

  find "data/${namespace}/functions"\
    -name '*.mcfunction'\
    -not -path "$(dir_help "$namespace")/*"\
    -not -path "$(dir_test "$namespace")/*"
}

makeDocs() {
  local package="$1"

  local docsDir="$(dir_docs "$package")"
  local helpDir="$(dir_help "$package")"

  local funcName=
  local docFile=
  local helpFile=

  local docComments=
  local params=
  local returns=
  local videos=

  local player=
  local objective=
  local description=
  local videoUrl=
  local videoTitle=

  [ -d "$docsDir" ] && rm -rf "$docsDir"
  [ -d "$helpDir" ] && rm -rf "$helpDir"

  if [ -d "data/${package}/functions" ]
  then
    while read file
    do
      (
        funcName="$(cut -d '/' -f 4- <<< "$file" | sed 's/\.mcfunction$//')"
        docFile="${docsDir}/${funcName}.md"
        helpFile="${helpDir}/${funcName}.mcfunction"

        docComments=
        params=
        returns=

        while read line
        do
          case "$line" in
            '#!doc '*)
              docComments="${docComments}${line#* }"$'\n'
              ;;
            '#!param '*)
              params="${params}${line#* }"$'\n'
              ;;
            '#!return '*)
              returns="${returns}${line#* }"$'\n'
              ;;
            '#!video '*)
              videos="${videos}${line#* }"$'\n'
              ;;
          esac
        done < "$file"

        # Remove empty lines
        docComments="$(awk 'NF' <<< "$docComments")"
        params="$(awk 'NF' <<< "$params")"
        returns="$(awk 'NF' <<< "$returns")"
        videos="$(awk 'NF' <<< "$videos")"

        [ -d "$(dirname "$docFile")" ] || mkdir -p "$(dirname "$docFile")"
        [ -d "$(dirname "$helpFile")" ] || mkdir -p "$(dirname "$helpFile")"

        echo "\
$(markdownBreadcrumbs "$package" "$funcName")

# ${package}:${funcName}

> Source: [${file}]($(realpath "$file" --relative-to "$(dirname "$docFile")"))" > "$docFile"

        printf 'tellraw @s [""' > "$helpFile"
        printf ',{"text":"%s","bold":true,"color":"yellow"}' "${package}:${funcName}" >> "$helpFile"

        if [ "$docComments" ]
        then
          sed $'s/^/\\\n/' <<< "$docComments" >> "$docFile"
          sed 's/^/,{"text":"\\\n/;s/$/"}/' <<< "$docComments" | tr -d '\n' >> "$helpFile"
        fi

        if [ "$params" ]
        then
          printf '\n## Parameters\n\nSet these scoreboard values to pass in arguments to the function.\n\n' >> "$docFile"
          markdownTable 3 $'Player/Selector Objective Description\n'"$params" >> "$docFile"

          printf ',{"text":"\\n\\nParameters","bold":true}' >> "$helpFile"

          while read param
          do
            player="$(cut -d ' ' -f 1 <<< "$param")"
            objective="$(cut -sd ' ' -f 2 <<< "$param")"
            description="$(cut -sd ' ' -f 3- <<< "$param")"

            printf ',{"text":"\\n["},{"text":"set","underlined":true,"color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set %s %s "}},{"text":"] "},{"text":"%s","color":"gold"},{"text":" | "},{"text":"%s","color":"green"}'\
              "$player"\
              "$objective"\
              "$player"\
              "$objective" >> "$helpFile"

            [ "$description" ] && printf ',{"text":" | %s"}' "$description" >> "$helpFile"
          done <<< "$params"
        fi

        if [ "$returns" ]
        then
          printf "\n## Returns\n\nThe function's output will be saved to these scoreboard values.\n\n" >> "$docFile"
          markdownTable 3 $'Player/Selector Objective Description\n'"$returns" >> "$docFile"

          printf ',{"text":"\\n\\nReturns","bold":true}' >> "$helpFile"

          while read return
          do
            player="$(cut -d ' ' -f 1 <<< "$return")"
            objective="$(cut -sd ' ' -f 2 <<< "$return")"
            description="$(cut -sd ' ' -f 3- <<< "$return")"

            printf ',{"text":"\\n%s","color":"gold"},{"text":" | "},{"text":"%s","color":"green"}'\
              "$player"\
              "$objective" >> "$helpFile"

            [ "$description" ] && printf ',{"text":" | %s"}' "$description" >> "$helpFile"
          done <<< "$returns"
        fi

        if [ "$videos" ]
        then
          printf "\n## Video$([ $(wc -l <<< "$videos") -gt 1 ] && echo 's')\n" >> "$docFile"
          printf ',{"text":"\\n\\nVideo%s","bold":true}' "$([ $(wc -l <<< "$videos") -gt 1 ] && echo 's')" >> "$helpFile"

          while read video
          do
            videoUrl="$(cut -d ' ' -f 1 <<< "${video}")"
            videoTitle="$(cut -sd ' ' -f 2- <<< "${video}")"

            [ "$videoTitle" ] && printf "\n### ${videoTitle}\n" >> "$docFile"

            if [[ "$videoUrl" = *//*.youtube.com/watch?v=* ]]
            then
              printf "\n[![YouTube video for ${package}:${funcName}](https://i3.ytimg.com/vi/$(sed 's/^.*?v=//;s/[&#].*//' <<< "$videoUrl")/maxresdefault.jpg)](${videoUrl})\n" >> "$docFile"
            else
              printf "\n[${videoUrl}](${videoUrl})\n" >> "$docFile"
            fi

            printf ',{"text":"\\n%s","underlined":true,"color":"aqua","clickEvent":{"action":"open_url","value":"%s"}}'\
              "$([ "$videoTitle" ] && echo "$videoTitle" || echo "$videoUrl")"\
              "$videoUrl" >> "$helpFile"
          done <<< "$videos"
        fi

        printf ']' >> "$helpFile"

        echo "  - file '${docFile}'"
        echo "  - file '${helpFile}'"
      ) &
    done <<< "$(listFunctionFiles "$package")"

    wait

    [ -f "${docsDir}.md" ] && rm "${docsDir}.md"
    [ -d "$docsDir" ] && makeDocIndex "$docsDir"
  fi
}

makeDocIndex() {
  local directory="${1%/}"

  local package=$(cut -d '/' -f 2 <<< "$directory")
  local subDirectories="$(find -s "$directory" -depth 1 -type d)"

  local docsDir="$(dir_docs "$package")"

  local indexFile="${directory}.md"
  local funcName="$(cut -d '/' -f 3- <<< "$directory")"

  local formatting=

  if [ "$subDirectories" ]
  then
    while read subDirectory
    do
      makeDocIndex "$subDirectory" &
    done <<< "$subDirectories"

    wait
  fi

  if [ ! -f "$indexFile" ]
  then
    [ "$funcName" ] && echo "$(markdownBreadcrumbs "$package" "$funcName")"$'\n' > "$indexFile"
    echo "# ${package}${funcName:+:}${funcName}" >> "$indexFile"
  fi

  echo "
## Functions

$(
  while read funcName
  do
    formatting="*$([ -f "data/${package}/functions/$(realpath "${directory}/${funcName}" --relative-to "$docsDir").mcfunction" ] && echo '*')"

    sed "s#[^/]*/#  #g;s#\([^ ]*\)\$#- [${formatting}\1${formatting}]\($(realpath "${directory}/${funcName}.md" --relative-to "$(dirname "$indexFile")")\)#" <<< "$funcName"
  done <<< "$(find "$directory" -name '*.md' | sed "s#^${directory}/##;s/\.md\$//" | sort -u)"
)" >> "$indexFile"

  echo "  - file '${indexFile}'"
}

makeInitFile() {
  local package="$1"

  local initFile="$(file_init "$package")"
  local resetFile="$(file_reset "$package")"

  local bossbars=
  local constants=
  local inits=
  local objectives=
  local resets=
  local scores=

  [ -f "$initFile" ] && rm "$initFile"
  [ -f "$resetFile" ] && rm "$resetFile"

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
            '#!reset '*)
              resets="${resets}${line#* }"$'\n'
              ;;
            '#!score '*)
              scores="${scores}${line#* }"$'\n'
              ;;
          esac
        done < "$file"
      done <<< "$(listFunctionFiles "$namespace")"
    fi
  done

  # Remove empty lines
  bossbars="$(awk 'NF' <<< "$bossbars")"
  constants="$(awk 'NF' <<< "$constants")"
  inits="$(awk 'NF' <<< "$inits")"
  objectives="$(awk 'NF' <<< "$objectives")"
  resets="$(awk 'NF' <<< "$resets")"
  scores="$(awk 'NF' <<< "$scores")"

  # Generate init file

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
    name="$(cut -d ' ' -f 1 <<< "$objective")"
    type="$(cut -sd ' ' -f 2 <<< "$objective")"
    [ "$type" ] || type='dummy'

    echo "scoreboard objectives add ${name} ${type}"
  done <<< "$(sort -u <<< "$objectives")"
)
")\
$([ "$constants" ] && echo "

# Constants
$(
  while read constant
  do
    value="$(cut -d ' ' -f 1 <<< "$constant")"
    objective="$(cut -sd ' ' -f 2 <<< "$constant")"

    echo "scoreboard players set #${value} ${objective} ${value}"
  done <<< "$(sort -u <<< "$constants")"
)
")\
$([ "$scores" ] && echo "

# Scores
$(
  while read score
  do
    player="$(cut -d ' ' -f 1 <<< "$score")"
    objective="$(cut -sd ' ' -f 2 <<< "$score")"
    value="$(cut -sd ' ' -f 3 <<< "$score")"

    if [ "$value" ]
    then
      echo "scoreboard players set ${player} ${objective} ${value}"
    else
      echo "scoreboard players reset ${player} ${objective}"
    fi
  done <<< "$(sort -u <<< "$scores")"
)
")\
$([ "$bossbars" ] && echo "

# Boss Bars
$(
  while read bossbar
  do
    id="$(cut -d ' ' -f 1 <<< "$bossbar")"
    name="$(cut -sd ' ' -f 2 <<< "$bossbar")"
    [ "$name" ] || name='""'

    echo "bossbar add ${id} ${name}"
  done <<< "$(sort -u <<< "$bossbars")"
)
")\
$([ "$inits" ] && echo "

# Initialization Functions
$(
  while read init
  do
    function="$(cut -d ' ' -f 1 <<< "$init")"

    echo "function ${function}"
  done <<< "$(sort -u <<< "$inits")"
)
")\
" > "$initFile"

    echo "  - file '${initFile}'"
  fi

  # Generate reset file

  if [ "${bossbars}${objectives}${resets}" ]
  then
    [ -d "data/_${package}/functions" ] || mkdir -p "data/_${package}/functions"
    echo "\
##### GENERATED FILE -- DO NOT EDIT #####\
$([ "$objectives" ] && echo "

# Objectives
$(
  while read objective
  do
    name="$(cut -d ' ' -f 1 <<< "$objective")"

    echo "scoreboard objectives remove ${name}"
  done <<< "$(sort -u <<< "$objectives")"
)
")\
$([ "$bossbars" ] && echo "

# Boss Bars
$(
  while read bossbar
  do
    id="$(cut -d ' ' -f 1 <<< "$bossbar")"

    echo "bossbar remove ${id}"
  done <<< "$(sort -u <<< "$bossbars")"
)
")\
$([ "$resets" ] && echo "

# Reset Functions
$(
  while read reset
  do
    function="$(cut -d ' ' -f 1 <<< "$reset")"

    echo "function ${function}"
  done <<< "$(sort -u <<< "$resets")"
)
")\
" > "$resetFile"

    echo "  - file '${resetFile}'"
  fi
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

makeTestFiles() {
  local package="$1"

  local publicTestsDir="$(dir_test "$package")"
  local privateTestsDir="$(dir_test "_${package}")"

  local publicTests="$([ -d "$publicTestsDir" ] && find "$publicTestsDir" -name '*.mcfunction')"
  local allTests="$(awk 'NF' <<< "$publicTests"$'\n'"$([ -d "$privateTestsDir" ] && find "$privateTestsDir" -name '*.mcfunction')")"

  local tests=("$publicTests" "$allTests")
  local testFiles=("${publicTestsDir}.mcfunction" "${privateTestsDir}.mcfunction")

  local initFile="$(file_init "$package")"
  local resetFile="$(file_reset "$package")"

  local objective="test_${package}"

  for (( i=0; i<${#tests[@]}; i++ ))
  do
    [ -f "${testFiles[$i]}" ] && rm "${testFiles[$i]}"

    if [ "${tests[$i]}" ]
    then
      printf "\
##### GENERATED FILE -- DO NOT EDIT #####
$(
  [ -f "$resetFile" ] && printf "\nfunction $(fileToFunction <<< "$resetFile")"
  [ -f "$initFile" ] && printf "\nfunction $(fileToFunction <<< "$initFile")"
)\

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

markdownBreadcrumbs() {
  local package="$1"
  local funcName="$2"

  local docsDir="$(dir_docs "$package")"
  local docFile="${docsDir}/${funcName}.md"

  local numBreadcrumbs=$(( $(grep -o '/' <<< "$funcName" | wc -l) + 2 ))

  for (( i=1; i<=$numBreadcrumbs; i++ ))
  do
    if [ $i -eq $numBreadcrumbs ]
    then
      printf "$(cut -d '/' -f "$i" <<< "${package}/${funcName}")"
    else
      printf '[%s](%s) > '\
        "$(cut -d '/' -f "$i" <<< "${package}/${funcName}")"\
        "$(realpath "${docsDir}$(cut -d '/' -f "-${i}" <<< "/${funcName}").md" --relative-to "$(dirname "$docFile")")"
    fi
  done
}

markdownTable() {
  local columns="$1"
  local content="$2"

  local columnWidths
  local text=
  local headerPrinted=

  for (( col=1; col<=$columns; col++ ))
  do
    columnWidths[$col]=3
  done

  while read row
  do
    for (( col=1; col<=$columns; col++ ))
    do
      text="$(cut -d ' ' -f "${col}$([ $col -eq $columns ] && echo '-')" <<< "$row")"
      [ ${#text} -gt ${columnWidths[$col]} ] && columnWidths[$col]=${#text}
    done
  done <<< "$content"

  while read row
  do
    for (( col=1; col<=$columns; col++ ))
    do
      text="$(cut -d ' ' -f "${col}$([ $col -eq $columns ] && echo '-')" <<< "$row")"
      printf "| ${text}%$(( ${columnWidths[$col]} - ${#text} + 1 ))s"
    done

    echo '|'

    if [ ! "$headerPrinted" ]
    then
      for (( col=1; col<=$columns; col++ ))
      do
        printf "| $(printf "%${columnWidths[$col]}s" | tr ' ' '-') "
      done

      echo '|'
      headerPrinted='true'
    fi
  done <<< "$content"
}

tellrawBreadcrumbs() {
  local package="$1"
  local funcName="$2"

  local numBreadcrumbs=$(( $(grep -o '/' <<< "$funcName" | wc -l) + 2 ))

  for (( i=1; i<=$numBreadcrumbs; i++ ))
  do
    if [ $i -eq $numBreadcrumbs ]
    then
      printf ",{\"text\":\"$(cut -d '/' -f "$i" <<< "${package}/${funcName}")\\\n\\\n\"}"
    else
      printf ',{"text":"%s","underlined":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/function %s"}},{"text":" > "}'\
        "$(cut -d '/' -f "$i" <<< "${package}/${funcName}")"\
        "$(cut -d '/' -f "-${i}" <<< "${package}:help/${funcName}")"
    fi
  done
}

### Main ###

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

echo "Building $(basename "$(pwd)")..."

while read package
do
  echo "- package '${package}'"

  files="$(sort <<< "$(
    makeDocs "$package" &
    makeInitFile "$package"
    makeTestFiles "$package"
    wait
  )")"

  [ "$files" ] && echo "$files"
done <<< "$(ls data | sed 's/^_//' | sort -u)"

makeLoadFile

echo "Done: $(basename "$(pwd)")"
