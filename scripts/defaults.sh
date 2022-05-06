#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Creating defaults"
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

if ! has_path "Developer"; then
  get_consent "Create ~/Developer folder"
  if has_consent; then
    e_pending "Creating ~/Developer folder"
    mkdir -p ~/Developer
    test_path "Developer"
  fi
fi

if ! has_path "Sandbox"; then
  get_consent "Create ~/Sandbox folder"
  if has_consent; then
    e_pending "Creating ~/Sandbox folder"
    mkdir -p ~/Sandbox
    test_path "Sandbox"
  fi
fi

if ! has_command "xcode-select"; then
  e_pending "Installing xcode-select (CLI tools)"
  xcode-select --install
  test_command "xcode-select"
fi

if ! has_command "brew"; then
  e_pending "Installing brew (Homebrew)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew doctor
  test_command "brew"
fi

# ------------------------------------------------------------------------------
e_message "Defaults complete"
# ------------------------------------------------------------------------------
