#!/usr/bin/env bash

source ./utils.sh

e_header "Checking CLI tools"

if ! type_exists 'xcode-select'; then
  e_action "Installing xcode-select"
  xcode-select --install
fi
