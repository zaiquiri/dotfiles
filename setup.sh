#!/bin/bash

#install hombrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew installs
brew install macvim
brew install ctags
brew install ack
brew install caskroom/cask/brew-cask
# brew cask installs
brew cask install libreoffice
brew cask install firefox
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install alfred
# simlink macvim
ln -s /usr/local/bin/mvim /usr/local/bin/vim
# make dirs that vim needs
mkdir ~/.vim/backup
mkdir ~/.vim/tmp
mkdir ~/.vim/colors
# download jellybeans colorshceme
curl -o ~/.vim/colors/jellybeans.vim https://github.com/nanotech/jellybeans.vim/raw/master/colors/jellybeans.vim
# setup Vundle & plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd ~
