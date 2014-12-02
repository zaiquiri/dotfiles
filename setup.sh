#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install macvim
ln -s /usr/local/bin/mvim /usr/local/bin/vim
brew install ctags
brew install caskroom/cask/brew-cask
brew cask install libreoffice
brew cask install firefox
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install alfred
mkdir ~/.vim/backup
mkdir ~/.vim/tmp
mkdir ~/.vim/colors
curl -o ~/.vim/colors/jellybeans.vim https://github.com/nanotech/jellybeans.vim/raw/master/colors/jellybeans.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd ~
