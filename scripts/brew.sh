#!/usr/bin/env bash

source ./utils.sh

e_header "Checking Homebrew"

if type_exists 'brew'; then
  seek_confirmation "Update Homebrew?"
  if is_confirmed; then
    e_action "Updating Homebrew"
    brew update
    brew upgrade
    brew doctor
    brew cleanup
  fi
else
  e_action "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

e_header "Checking Homebrew packages"

if ! type_exists 'trash'; then
  e_action "Installing trash"
  brew install trash
fi

if ! type_exists 'watchman'; then
  e_action "Installing watchman"
  brew install watchman
fi

brew cleanup
