#!/bin/bash

#install hombrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew installs
brew install macvim
brew install ctags
brew install ack
brew install the_silver_searcher
brew install curl
brew install wget
brew install go
brew install rust
brew install lua
brew install python
brew install caskroom/cask/brew-cask
# brew cask installs
brew cask install libreoffice
brew cask install firefox
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install alfred
brew cask install seil
brew cask install 1password
brew cask install caffeine
brew cask install dropbox
brew cask install evernote
brew cask install flux
brew cask install iterm2
brew cask install u-torrent
brew cask install the-unarchiver
brew cask install sequel-pro
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

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
