#!/bin/sh
set +x -e

# if argument given, normalize and use as root directory
[ -d "$1" ] && XKB_ROOT=$(readlink -f $1) || XKB_ROOT=/usr/share/X11/xkb

# remove files from the file system
[ -f /usr/share/X11/xkb/symbols/dvmcp ] && rm -f /usr/share/X11/xkb/symbols/dvmcp
cat > /etc/default/keyboard <<EOF
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="us"
XKBVARIANT="query"
XKBOPTIONS=""

BACKSPACE="guess"

EOF
