#!/bin/sh
install -m 644 -o root -g root dvmcp.xkb         /usr/share/X11/xkb/symbols/dvmcp
install -m 644 -o root -g root console-settings /etc/default/keyboard
setxkbmap dvmcp
