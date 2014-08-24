#!/bin/sh
install -m 644 -o root -g root dvmcp.xkb         /usr/share/X11/xkb/symbols/dvmcp
cat > /etc/default/keyboard <<EOF
# KEYBOARD CONFIGURATION FILE
# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="dvmcp"
XKBVARIANT=""
XKBOPTIONS="terminate:ctrl_alt_bksp"

BACKSPACE="guess"
EOF
chmod 644 /etc/default/keyboard

cat > /etc/xdg/autostart/gnome-keyboard-settings-fix.desktop <<EOF
[Desktop Entry]
Type=Application
TryExec=setxkbmap
Exec=setxkbmap dvmcp
Hidden=false
NoDisplay=true
X-GNOME-Autostart-enabled=true
Name[en_US]=System Keyboard Fix
Name=System Keyboard Fix
Comment[en_US]=Apply system-wide keyboard settings to the session
Comment=Applies system-wide keyboard settings to session
EOF
chmod 644 /etc/xdg/autostart/gnome-keyboard-settings-fix.desktop

setxkbmap dvmcp
