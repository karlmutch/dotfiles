Personal Profile Setup
======================

# dotfiles
git clone https://github.com/karlmutch/dotfiles-private.git ~/dotfiles --recursive

git submodule update --recursive

cp dotbot/tools/git-submodule/install ./install.sh

export GOPATH
Within vim used :GoInstallBinaries
