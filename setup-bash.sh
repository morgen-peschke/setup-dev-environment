#!/bin/bash
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

#########################
# Install BASH settings #
#########################

# Grab the settings repo
mkdir -p "${HOME}/.bash-config"
if [ -d "${HOME}/.bash-config/.git" ]; then
    (
	cd "${HOME}/.bash-config"
	git pull
    )
else 
    git clone --depth 1 \
	git://github.com/morgen-peschke/bash-config.git \
	"${HOME}/.bash-config"
fi

# Clear old symlinks
rm -f "${HOME}/.bash_profile" "${HOME}/.profile" "${HOME}/.bashrc" "${HOME}/.bash-config/current-platform"

# Install new symlinks
ln -s "${HOME}/.bash-config/bash_profile" "${HOME}/.bash_profile"
ln -s "${HOME}/.bash-config/profile"      "${HOME}/.profile"
ln -s "${HOME}/.bash-config/bashrc"       "${HOME}/.bashrc"
ln -s "${HOME}/.bash-config/platform/#{PLATFORM}" \
    "${HOME}/.bash-config/current-platform"

# Platform specific installs
./bash/"${PLATFORM}".sh