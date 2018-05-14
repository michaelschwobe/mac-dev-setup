#!/usr/bin/env bash

source ./utils.sh

if is_os "darwin"; then
  e_header "Checking OS setup"
else
  e_error "You are not on a mac, aborting."
  exit 1
fi

seek_confirmation "Create 'Projects' directory?"
if is_confirmed; then
  mkdir -p ~/Projects
fi

seek_confirmation "Turn on invisible files?"
if is_confirmed; then
  defaults write com.apple.finder AppleShowAllFiles -boolean true
  killall Finder
fi

seek_confirmation "Add Dock spacers?"
if is_confirmed; then
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  killall Dock
fi

seek_confirmation "Automatically hide and show the Dock?"
if is_confirmed; then
  defaults write com.apple.dock autohide -boolean true
  killall Dock
fi
