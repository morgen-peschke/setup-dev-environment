#!/bin/bash -ex
brew install autoconf automake ghostscript texinfo gnutls
(
    SRC_DIR="/tmp/src/emacs"
    export PATH="/usr/local/opt/texinfo/bin:$PATH"

    # Grab the source from github
    mkdir -p "$SRC_DIR"

    if [ -e "$SRC_DIR"/.git ]; then
        cd "$SRC_DIR"
        git pull
    else
        git clone --depth 1 \
	    git://git.savannah.gnu.org/emacs.git \
	    "$SRC_DIR"
    fi

    cd "$SRC_DIR"

    # Configure
    ./autogen.sh
    ./configure --with-gnutls=no
    make bootstrap && sudo make install && {
        sudo cp -R "$SRC_DIR"/nextstep/Emacs.app /Applications/
        #sudo rm -rf "$SRC_DIR"
    }

)
