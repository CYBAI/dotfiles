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

echo "Done!"
exit
