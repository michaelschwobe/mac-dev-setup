#!/usr/bin/env bash

source ./utils.sh

e_header "Checking Homebrew-Cask"

if ! type_exists 'brew cask'; then
  e_action "Installing Homebrew-Cask"
  brew tap caskroom/cask
fi

if type_exists 'brew cask'; then
  e_action "Installing applications"

  seek_confirmation "Install adobe-creative-cloud?"
  if is_confirmed; then
    brew cask install adobe-creative-cloud
  fi

  seek_confirmation "Install browserstacklocal?"
  if is_confirmed; then
    brew cask install browserstacklocal
  fi

  seek_confirmation "Install diffmerge?"
  if is_confirmed; then
    brew cask install diffmerge
  fi

  seek_confirmation "Install dropbox?"
  if is_confirmed; then
    brew cask install dropbox
  fi

  seek_confirmation "Install google-chrome?"
  if is_confirmed; then
    brew cask install google-chrome
  fi

  seek_confirmation "Install insomnia?"
  if is_confirmed; then
    brew cask install insomnia
  fi

  seek_confirmation "Install iterm2?"
  if is_confirmed; then
    brew cask install iterm2
  fi

  seek_confirmation "Install mamp?"
  if is_confirmed; then
    brew cask install mamp
  fi

  seek_confirmation "Install sketch?"
  if is_confirmed; then
    brew cask install sketch
  fi

  seek_confirmation "Install slack?"
  if is_confirmed; then
    brew cask install slack
  fi

  seek_confirmation "Install sourcetree?"
  if is_confirmed; then
    brew cask install sourcetree
  fi

  seek_confirmation "Install spectacle?"
  if is_confirmed; then
    brew cask install spectacle
  fi

  seek_confirmation "Install spotify?"
  if is_confirmed; then
    brew cask install spotify
  fi

  seek_confirmation "Install sublime-text?"
  if is_confirmed; then
    brew cask install sublime-text
  fi

  seek_confirmation "Install transmit?"
  if is_confirmed; then
    brew cask install transmit
  fi

  seek_confirmation "Install visual-studio-code?"
  if is_confirmed; then
    brew cask install visual-studio-code
  fi

fi

brew cleanup
