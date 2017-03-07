Personal Profile Setup
======================
<pre>
# dotfiles
git clone https://github.com/karlmutch/dotfiles-private.git ~/.dotfiles --recursive ;

cd ~/.dotfiles ;

cp dotbot/tools/git-submodule/install ./install.sh ;

./install.sh ;
</pre>

Within vim use :GoInstallBinaries to load the tooling for the vim-go package from Faith at DigitalOcean

Updating the referenced open source can be done using the following command:
<pre>
git submodule foreach git pull origin master
</pre>
