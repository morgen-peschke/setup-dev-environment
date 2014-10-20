#!/bin/bash
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

./setup-bash.sh     "$PLATFORM"
./setup-keyboard.sh "$PLATFORM"
./setup-emacs.sh    "$PLATFORM"
