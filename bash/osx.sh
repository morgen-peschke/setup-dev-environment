#!/bin/bash -xe
sudo -k

hash brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install ag coreutils ispell findutils icdiff rlwrap go jq fx

brew install --cask rectangle
defaults write com.googlecode.iterm2 DisableWindowSizeSnap -integer 1

go install github.com/josephburnett/jd@latest
