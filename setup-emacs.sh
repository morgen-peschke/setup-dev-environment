#!/bin/bash -e
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

./emacs24/"${PLATFORM}".sh
./emacs24/install-settings.sh
./emacs24/install-cask.sh
