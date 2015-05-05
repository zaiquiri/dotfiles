#!/bin/bash

# Logging
exec 2>&1 | tee ~/Desktop/setup.log

# install hombrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew installs
brew install git
brew install macvim
brew install ctags
brew install cmake
brew install ack
brew install the_silver_searcher
brew install curl
brew install wget
brew install go
brew install rust
brew install python
brew linkapps python # symlink python apps
brew install caskroom/cask/brew-cask
# brew cask installs
brew cask install java
brew cask install libreoffice
brew cask install firefox
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install alfred
brew cask install seil
brew cask install dropbox
brew cask install 1password
brew cask install caffeine
brew cask install evernote
brew cask install flux
brew cask install iterm2
brew cask install utorrent
brew cask install the-unarchiver
brew cask install sequel-pro

# Make dir for gopath
mkdir ~/go

# simlink macvim
ln -s /usr/local/bin/mvim /usr/local/bin/vim
# make dirs that vim needs
if [ ! -d "~/.vim" ]; then
  mkdir ~/.vim
fi
mkdir ~/.vim/backup
mkdir ~/.vim/tmp
mkdir ~/.vim/colors
# download jellybeans colorshceme
wget -O ~/.vim/colors/jellybeans.vim https://github.com/nanotech/jellybeans.vim/raw/master/colors/jellybeans.vim
# setup Vundle & plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# Compile YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
# Compile Ctrl-P cmatcher
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
cd ~/.vim/bundle/ctrlp-cmatcher/
./install.sh
cd ~

# add improved color diff for git
curl -o /usr/local/bin/icdiff https://raw.githubusercontent.com/jeffkaufman/icdiff/master/icdiff
curl -o /usr/local/bin/git-icdiff https://raw.githubusercontent.com/jeffkaufman/icdiff/master/git-icdiff
chmod +x /usr/local/bin/icdiff
chmod +x /usr/local/bin/git-icdiff

# Move chrome to /Applications, so 1Password will work
mv /opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/ /Applications/
# ...and delete brew's simlink
rm /Users/zachlindberg/Applications/Google\ Chrome.app

# set up git
git config --global user.name "zaiquiri"
git config --global user.email zdl2102@columbia.edu
git config --global core.editor vim
git config --global push.default current
touch ~/.gitignore_global
echo ".DS_Store" >> ~/.gitignore_global
git config --global core.excludesfile '~/.gitignore_global'

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

# Reboot
read -r -p "Would you like to restart now? [y/N]" response
echo
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    sudo shutdown -r now
else
    echo
    echo "You must restart your computer to complete setup."
fi
