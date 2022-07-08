#!/bin/bash -xe
sudo -k

hash brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install ag coreutils ispell findutils icdiff rlwrap go jq

brew install --cask rectangle
defaults write com.googlecode.iterm2 DisableWindowSizeSnap -integer 1

go install github.com/josephburnett/jd@latest
