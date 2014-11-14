#!/bin/bash

# clone dotfiles repo
git clone https://github.com/CYBAI/dotfiles.git ~/.dotfiles

# install zsh
curl -sSL http://install.ohmyz.sh | sh

dotdir=~/.dotfiles
files="bashrc vimrc vim zshrc oh-my-zsh" # list of files/folders to symlink in homedir

# Create Symlink to each file
for file in $files; do
    echo "Creating symlink to $file in home directory"
    ln -sfv $dotdir/$file ~/.$file
done

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
anyenv install rbenv
anyenv install pyenv
anyenv install ndenv
anyenv install goenv
anyenv install phpenv

# node.js
ndenv install 0.10.33
ndenv global 0.10.33
npm install -g bower coffee-script coffeelint csslint jshint gulp hexo lodash leven node-emoji node-inspector

# ruby
rbenv install 2.1.5
rbenv global 2.1.5

# php
phpenv install 5.6.2
phpenv global 5.6.2

# vim
sudo apt-get install vim

echo "Install dotfiles DONE!"
exit
