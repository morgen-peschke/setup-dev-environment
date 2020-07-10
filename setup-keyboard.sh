#!/bin/bash -ex
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

if [ "$PLATFORM" = "debian" ]; then
    (
        cd keyboard/debian
        sudo ./install.sh
    )
elif [ "$PLATFORM" = "osx" ]; then
    (
        cd keyboard/osx
        sudo cp -R "Morgen Custom Layout.bundle" "/Library/Keyboard Layouts/"
        echo "You will probably need to restart to get the new keyboard layout"
    )
fi
