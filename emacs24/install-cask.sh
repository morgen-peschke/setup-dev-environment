#!/bin/bash
(
    mkdir -p ~/.cask
    git clone --depth 1 git://github.com/cask/cask.git ~/.cask
    cd ~/.cask
    bin/cask upgrade-cask
)
    
    
    