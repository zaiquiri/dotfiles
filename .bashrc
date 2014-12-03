# Path
POSTGRES=/Applications/Postgres93.app/Contents/MacOS/bin
LOCAL=/usr/local/bin
RVM=$HOME/.rvm/gems/ruby-1.9.3-p547/bin
export PATH=$RVM:$LOCAL:$POSTGRES:$PATH

# Prompt
source ~/.bash-git-prompt/gitprompt.sh

# Democracy Now! workflow
source ~/.dnow-shortcuts.sh

#Colors
export LSCOLORS=Gxexcxhxbx

# Aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cpwd='pwd | pbcopy'
alias editbash='vim ~/.bashrc'
alias editvim='vim ~/.vimrc'
alias ll='ls -alGF'
alias llc='ll | nl'
alias meow='curl -s -o ~/Pictures/cat.gif $(curl -s http://edgecats.net/random) && open ~/Pictures/cat.gif && sleep 5; rm -f ~/Pictures/cat.gif;'
alias ping10='ping -c10'
alias ping2='ping -c2'
alias play='cd ~/playground'
alias please='sudo'
alias rmx='rm -rf'
alias srcbash='source ~/.bashrc'
alias dem='cd ~/democracynow.org'
alias speed='ping -c10 8.8.8.8'
alias home='cd ~'

# git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gp='git push'
alias gpo='git push origin master'

# rails
alias be='bundle exec'

# Functions

function eclipse() {
  /Applications/eclipse/Eclipse.app/Contents/MacOS/eclipse -noSplash -data "/Users/zach/Gap/$1" > /dev/null 2>&1 &
}

function rmparent() {
  mv $1 ..
  parent=`pwd`
  cd ..
  rm -rf $parent
}

function drop() {
  if [ -z "$1"]; then
    thisdir=`pwd`
    mv $thisdir /Users/zach/Dropbox
  else
    mv $1 /Users/zach/Dropbox
  fi
}

function mkcd() {
  mkdir $1
  cd $1
}
