Personal Profile Setup
======================

# dotfiles
git clone https://github.com/karlmutch/dotfiles-private.git ~/dotfiles --recursive

cd ~/dotbot

git submodule foreach git pull origin master

cp dotbot/tools/git-submodule/install ./install.sh

./install.sh

export GOPATH
Within vim used :GoInstallBinaries
