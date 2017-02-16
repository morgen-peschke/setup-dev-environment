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

# Install Keepass and xclip
sudo apt-get install -y keepassx keepass2 xclip

# Install icdiff
which icdiff >/dev/null || (
    curl -s https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.7.3/icdiff | \
        sudo tee /usr/local/bin/icdiff > /dev/null && sudo chmod ugo+rx /usr/local/bin/icdiff
)

# Install docker
which docker >/dev/null || (
    # Steps from https://docs.docker.com/engine/installation/linux/ubuntu/

    # Make sure we can use aufs
    sudo apt-get install -y --no-install-recommends \
         linux-image-extra-$(uname -r) \
         linux-image-extra-virtual

    # Setup the repository
    sudo apt-get install -y --no-install-recommends \
         apt-transport-https \
         ca-certificates \
         curl \
         software-properties-common

    FINGERPRINT='5811 8E89 F3A9 1289 7C07  0ADB F762 2157 2C52 609D'
    # Install the Docker GPG key
    lookup-key () { apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D; }
    validate-key () { lookup-key | grep -F "$FINGERPRINT" >/dev/null; }

    validate-key || {
        curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
    }

    # Verify Docker's GPG key
    validate-key || {
        echo "Unable to validate GPG key" >&2
        lookup-key
        exit 1
    }

    # Install Docker Repo
    grep -F dockerproject /etc/apt/sources.list || {
        sudo add-apt-repository \
             "deb https://apt.dockerproject.org/repo/ \
              ubuntu-$(lsb_release -cs) \
              main"
    }

    sudo apt-get update
    sudo apt-get -y install docker-engine

    sudo groupadd docker || true
    sudo usermod -aG docker $USER

    echo "You'll need to logout and back in to use Docker without sudo
    "
)
