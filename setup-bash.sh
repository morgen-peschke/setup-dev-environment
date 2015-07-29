#!/bin/bash
PLATFORM="$1"
[ -z "$PLATFORM" ] && PLATFORM="debian"

#########################
# Install BASH settings #
#########################

( cd "${HOME}"

  # Grab the settings repo
  mkdir -p .bash-config
  if [ -d .bash-config/.git ]; then
      (
	  cd .bash-config
	  git pull
      )
  else
      git clone --depth 1 \
	  https://github.com/morgen-peschke/bash-config.git \
	  .bash-config
  fi

  # Clear old symlinks
  rm -f .bash_profile .profile .bashrc .bash-config/current-platform .gitconfig

  # Install new symlinks
  ln -s .bash-config/bash_profile "${HOME}/.bash_profile"
  ln -s .bash-config/profile      "${HOME}/.profile"
  ln -s .bash-config/bashrc       "${HOME}/.bashrc"
  ln -s .bash-config/gitconfig    "${HOME}/.gitconfig"
  ln -s "${HOME}/.bash-config/platform/${PLATFORM}" "${HOME}/.bash-config/current-platform"
  ln -s "${HOME}/.bash-config/platform/${PLATFORM}-bin" "${HOME}/.bash-config/current-platform-bin"
)

# Platform specific installs
sudo ./bash/"${PLATFORM}.sh"
