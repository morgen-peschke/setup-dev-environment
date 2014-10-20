#!/bin/bash

# Ensure Dependencies 
sudo apt-get install git-core autoconf automake

sudo apt-get install libxaw7-dev libxpm-dev libpng12-dev libtiff5-dev libgif-dev libjpeg8-dev libgtk2.0-dev libncurses5-dev

sudo apt-get build-deps emacs

(
    # Grab the source from github
    sudo mkdir -p  /usr/local/src/emacs
    sudo chmod 777 /usr/local/src/emacs
    
    git clone --depth 1 \
	https://git.savannah.gnu.org/emacs.git \
	/usr/local/src/emacs
    
    cd /usr/local/src/emacs
    
    # Configure
    ./autogen
    ./configure --prefix /usr/local/etc/emacs24
    make && sudo make install

    # Cleanup
    cd /
    sudo rm -rf /usr/local/src/emacs
)