Personal Profile Setup
======================

This repository contains the scripts and configuration used to populate a personal
Linux account.  This repository is be used after the ansible DevBoot step is
performed on a machine.  github.com/karlmutch/DevBoot is a
public repository containing scripts etc to configure a development machine
to give it a number of development and operations tools useful for a developer doing
Go and cloud based development.

Setting up the account 
# dotfiles
```
git clone https://github.com/karlmutch/dotfiles-private.git ~/.dotfiles --recursive ;

cd ~/.dotfiles ;

cp dotbot/tools/git-submodule/install ./install.sh ;

./install.sh ;
```

Within vim use :GoInstallBinaries to load the tooling for the vim-go package from Faith at DigitalOcean

Updating the referenced open source can be done using the following command:

```git submodule foreach git pull origin master```
