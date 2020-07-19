#!/bin/bash

# Script to generate a release
# First argument is the Minecraft version the release is targeted for.
#
# This script packages the datapack and tags a new release version,
# auto-incrementing if there is a previous release for the MC version.

# cd to repo root
cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

mcversion="$1"
[ "$mcversion" ] || read -p 'Target Minecraft Version: ' mcversion

packversion="$(( $(git tag -l | grep "^${mcversion}" | cut -d 'v' -f 2 | sort -h | tail -n 1) + 1 ))"
release="${mcversion}-v${packversion}"
filename="release/$(basename "$(pwd)")-${release}.zip"

[ -d 'release' ] || mkdir 'release'
zip -qr "$filename" 'data' 'pack.mcmeta'

git checkout -B 'build'
git add 'release'
git commit -m "Release ${release}"
git tag "$release"
