#!/bin/bash
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

./setup-bash     "$PLATFORM"
./setup-keyboard "$PLATFORM"
./setup-emacs    "$PLATFORM"
