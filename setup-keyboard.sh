#!/bin/bash
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

if [ "$PLATFORM" = "debian" ]; then
    (
        cd keyboard/debian
        sudo ./install.sh
    )
fi
