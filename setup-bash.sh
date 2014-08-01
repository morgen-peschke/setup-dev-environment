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
	  git://github.com/morgen-peschke/bash-config.git \
	  .bash-config
  fi

  # Clear old symlinks
  rm -f .bash_profile .profile .bashrc .bash-config/current-platform .gitconfig

  # Install new symlinks
  ln -s .bash-config/bash_profile .bash_profile
  ln -s .bash-config/profile      .profile
  ln -s .bash-config/bashrc       .bashrc
  ln -s .bash-config/gitconfig    .gitconfig
  ln -s ".bash-config/platform/${PLATFORM}" .bash-config/current-platform
)

# Platform specific installs
./bash/"${PLATFORM}.sh"
