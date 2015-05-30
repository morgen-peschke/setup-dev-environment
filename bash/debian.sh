#!/bin/bash

# Install The Silver Searcher (ag)
which ag >/dev/null || (
    # Ensure dependencies
    sudo apt-get install -y git-core automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

    # Get the source
    sudo mkdir -p  /usr/local/src/silversearcher
    sudo chmod 777 /usr/local/src/silversearcher

    git clone --depth 1 \
	https://github.com/ggreer/the_silver_searcher.git \
	/usr/local/src/silversearcher

    cd /usr/local/src/silversearcher/
    ./build.sh && sudo make install
    cd /
    sudo rm -rf /usr/local/src/silversearcher
)

# Install KeepassX
which keepass2 >/dev/null || (
    sudo apt-get install keepassx
)

# Install xclip
which xclip >/dev/null || (
    sudo apt-get install xclip
)
