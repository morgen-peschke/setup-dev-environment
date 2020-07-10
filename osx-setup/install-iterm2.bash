#!/bin/bash -ex

if [ -e '/Applications/iTerm.app' ]; then
    echo 'iTerm2 already installed!'
else
    INSTALL_DIR=tmp.iterm2-install-dir

    if [ -e "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
    fi

    mkdir "$INSTALL_DIR"
    pushd "$INSTALL_DIR"

    curl -L https://iterm2.com/downloads/stable/latest -o iterm2.zip

    unzip iterm2.zip
    mv iTerm.app /Applications/

    popd
    rm -rf "$INSTALL_DIR"
fi
