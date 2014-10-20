#!/bin/bash
(
    mkdir -p ~/.cask
    git clone --depth 1 https://github.com/cask/cask.git ~/.cask
    cask upgrade-cask
    cd ~/.emacs.d
    cask install
)
