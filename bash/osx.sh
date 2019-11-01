sudo -k

hash brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ag coreutils ispell findutils icdiff rlwrap go

go get github.com/josephburnett/jd
