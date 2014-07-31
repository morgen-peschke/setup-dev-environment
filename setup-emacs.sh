#!/bin/bash
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

./emacs24/"${PLATFORM}".sh
./emacs24/install-cask.sh