#!/usr/bin/env bash

source ./utils.sh

e_header "Checking Git & GitFlow"

if ! type_exists 'git'; then
  e_action "Installing git"
  brew install git
fi

if ! type_exists 'git-flow'; then
  seek_confirmation "Install git-flow?"
  if is_confirmed; then
    e_action "Installing git-flow"
    brew install git-flow
  fi
fi

brew cleanup

seek_confirmation "Update gitconfig user name and email?"
if is_confirmed; then
  git config --global user.name "Michael Schwobe"
  git config --global user.email "mschwobe@gmail.com"
fi
