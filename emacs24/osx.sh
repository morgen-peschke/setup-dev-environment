brew install autoconf automake ghostscript
(
    SRC_DIR="/tmp/src/emacs"

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
    ./autogen
    ./configure
    make bootstrap && sudo make install && {
        sudo cp -R "$SRC_DIR"/nextstep/Emacs.app /Applications/
        #sudo rm -rf "$SRC_DIR"
    }

)
