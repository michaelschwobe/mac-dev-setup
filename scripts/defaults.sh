#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Creating defaults"
# ------------------------------------------------------------------------------

get_consent "Create Dock spacers"
if has_consent; then
  e_pending "Creating Dock spacers"
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  killall Dock
fi

get_consent "Autohide Dock"
if has_consent; then
  e_pending "Autohiding Dock"
  defaults write com.apple.dock autohide -boolean true
  killall Dock
fi

get_consent "Display hidden Finder files/folders"
if has_consent; then
  e_pending "Displaying hidden Finder files/folders"
  defaults write com.apple.finder AppleShowAllFiles -boolean true
  killall Finder
fi

if ! has_path "Projects"; then
  get_consent "Create ~/Projects folder"
  if has_consent; then
    e_pending "Creating ~/Projects folder"
    mkdir -p ~/Projects
    test_path "Projects"
  fi
fi

if ! has_command "xcode-select"; then
  e_pending "Installing xcode-select (CLI tools)"
  xcode-select --install
  test_command "xcode-select"
fi

if ! has_command "brew"; then
  e_pending "Installing brew (Homebrew)"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  test_command "brew"
fi
