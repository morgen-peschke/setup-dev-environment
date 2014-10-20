#!/bin/bash
(
    # Pull down settings
    mkdir -p ~/.emacs.d
    git clone --depth 1 https://github.com/morgen-peschke/emacs-config.git ~/.emacs.d

    # Install nxhtml
    mkdir -p ~/.emacs.d/lisp/nxhtml
    git clone --depth 1 https://github.com/emacsmirror/nxhtml.git ~/.emacs.d/lisp/nxhtml

)
