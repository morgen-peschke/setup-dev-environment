#!/bin/bash
(
    # Pull down settings
    mkdir -p ~/.emacs.d
    git clone --depth 1 https://github.com/morgen-peschke/emacs-config.git ~/.emacs.d
)
