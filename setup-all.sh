#!/bin/bash -ex
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

./setup-bash.sh     "$PLATFORM"
./setup-keyboard.sh "$PLATFORM"
./setup-emacs.sh    "$PLATFORM"

find "$PLATFORM-setup" -executable -print0 -maxdepth 1 -mindepth 1 |
    while read -rd $'' script
    do
        ./"$script"
    done
