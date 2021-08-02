#!/bin/bash

# Install brew package
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_installs="openssl zsh tmux zsh-completions ghc libffi postgresql vim git lua python3 wget"
for brew_install in $brew_installs; do
  echo "Brew install $brew_install"
  brew install $brew_install
done

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme `lambda-mod`
wget "https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme" > ~/.oh-my-zsh/themes/lambda-mod.zsh-theme

# Link config files
DOTDIR=~/.dotfiles
files="vimrc vim zshrc oh-my-zsh" # list of files/folders to symlink in homedir

# Create Symlink to each file
for file in $files; do
  echo "Creating symlink to $file in home directory"
  ln -sfv $DOTDIR/$file ~/.$file
done

echo "Remember to install Docker, Chrome, Chrome Canary, FireFox, Atom, Sublime Text"
