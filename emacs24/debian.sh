#!/bin/bash

# Ensure Dependencies
sudo apt-get install git-core autoconf automake texinfo

sudo apt-get install libxaw7-dev libxpm-dev libpng12-dev libtiff5-dev libgif-dev libjpeg8-dev libgtk2.0-dev libncurses5-dev

sudo apt-get build-dep emacs

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
    ./configure --prefix /usr/local/etc/emacs24
    make bootstrap && sudo make install && {
            # Cleanup only if no errors
            cd /
            sudo rm -rf /usr/local/src/emacs
        }
)
