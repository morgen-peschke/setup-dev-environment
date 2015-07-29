brew install autoconf automake
(
    # Grab the source from github
    sudo mkdir -p  /usr/local/src/emacs
    sudo chmod 777 /usr/local/src/emacs

    if [ -e /usr/local/src/emacs/.git ]; then
        cd /usr/local/src/emacs
        git pull
    else
        git clone --depth 1 \
	    git://git.savannah.gnu.org/emacs.git \
	    /usr/local/src/emacs
    fi

    cd /usr/local/src/emacs

    # Configure
    ./autogen
    ./configure
    make bootstrap && sudo make install && {
        sudo cp /usr/local/src/emacs/nextstep/Emacs.app /Applications/
        sudo rm -rf /usr/local/src/emacs
    }

)