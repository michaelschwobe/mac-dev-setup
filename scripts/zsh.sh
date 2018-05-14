#!/usr/bin/env bash

source ./utils.sh

e_header "Checking ZSH & Oh-My-ZSH"

if ! type_exists 'zsh'; then
  e_action "Installing zsh"
  brew install zsh
fi

if ! brew ls --versions zsh-autosuggestions > /dev/null; then
  e_action "Installing zsh-autosuggestions"
  brew install zsh-autosuggestions
fi

if ! brew ls --versions zsh-syntax-highlighting > /dev/null; then
  e_action "Installing zsh-syntax-highlighting"
  brew install zsh-syntax-highlighting
fi

OMZ=~/.oh-my-zsh
if test ! -d $OMZ; then
  e_action "Installing Oh-My-ZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

seek_confirmation "Install the Powerline Fonts?"
if is_confirmed; then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
fi

seek_confirmation "Install the Powerlevel9k Theme?"
if is_confirmed; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi
