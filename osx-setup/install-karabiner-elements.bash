#!/bin/bash -ex

INSTALL_DIR=tmp.install-karabiner-elements


function get-download-path () {
    curl -L https://github.com/pqrs-org/karabiner-elements/releases/latest |
        grep 'href.*Karabiner-Elements.*dmg' |
        cut -d'"' -f2
}

if [ -e '/Applications/Karabiner-Elements.app/' ]; then
    echo 'Karabiner-Elements already installed!'
else
    if [ -e "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
    fi

    mkdir "$INSTALL_DIR"
    pushd "$INSTALL_DIR"

    curl -L "http://github.com$(get-download-path)" -o install.dmg

    sudo hdiutil attach -mountpoint karabiner-install install.dmg
    find karabiner-install -iname 'Karabiner-Elements*pkg' -print0 |
        while read -rd $'' pkg
        do
            sudo installer -package "$pkg" -target /
        done

    sudo hdiutil detach karabiner-install
    rm install.dmg

    popd
    rm -rf "$INSTALL_DIR"
    rm -rf ~/.config/karabiner
    cp -R resources/karabiner ~/.config/
fi
