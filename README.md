Personal Profile Setup
======================

This repository contains the scripts and configuration used to populate a personal
Linux account.  This repository is be used after the ansible DevBoot step is
performed on a machine.  github.com/karlmutch/DevBoot is a
public repository containing scripts etc to configure a development machine
to give it a number of development and operations tools useful for a developer doing
Go and cloud based development.

Prerequisties
---

To determine if you are already setup for github access the command 'ssh -T git@github.com' can be used to test access.  If this command is not able to autheticate your account then the following instructions need to be applied.

Github functionality will be automatically configured with the user details found in the gitconfig file.  Using this repo will probably mean that you first fork or copy everything in it in which case this file should be modified to match your github access details.  This also means that before using the installation instructions you will need to take one of your public keys from the machine being configured and add it to your github account, see https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/, so that you can access the repositories needed during installation.  Installation can complete without this however you will be prompted for your user name and github password when using the git clone command and the install.sh script will not successfully install some of the binary tools from 3rd party github repositories.

If you have used the Devboot package from github.com/karlmutch/DevBoot to provision your machine the github SSH keys will likely be already deployed to github for you.

If you find that using submodules causes timeouts you might need to use InsteadOf directives to force the https protocol.  This is caused by some corporate firewalls etc.

Setting up the account
---
# dotfiles
```
git clone https://github.com/karlmutch/dotfiles.git ~/.dotfiles --recurse-submodules -j8

cd ~/.dotfiles ;

cp dotbot/tools/git-submodule/install ./install.sh ;

./install.sh ;
```

Within vim use :GoInstallBinaries to load the tooling for the vim-go package from Fatih at DigitalOcean

Updating the referenced open source can be done using the following command:

```git submodule update --init --recursive --remote```

Font management can be a little complex, here are some commands that might help:

To get the version from a font file
```
fc-query -f '%{fontversion}\n' filename.ttf| perl -E 'printf "%.3f\n", <>/65536.0'
```
