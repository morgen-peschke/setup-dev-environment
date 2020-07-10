#!/bin/bash -ex
(
    mkdir -p ~/.cask
    git clone --depth 1 https://github.com/cask/cask.git ~/.cask
    ~/.cask/bin/cask upgrade-cask
    cd ~/.emacs.d
    ~/.cask/bin/cask install
)
