#!/bin/bash
(
    mkdir -p ~/.cask
    git clone --depth 1 git://github.com/cask/cask.git ~/.cask
    cask upgrade-cask
    cd ~/.emacs.d
    cask install
)
