#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Running optimizations"
# ------------------------------------------------------------------------------

get_consent "Re-sort Launchpad applications"
if has_consent; then
  e_pending "Re-sorting Launchpad applications"
  defaults write com.apple.dock ResetLaunchPad -boolean true
  killall Dock
fi

if has_command "zsh"; then
  if has_path ".oh-my-zsh"; then
    get_consent "Update oh-my-zsh"
    if has_consent; then
      e_pending "Updating oh-my-zsh"
      $ZSH/tools/upgrade.sh
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew"; then
  get_consent "Optimize Homebrew"
  if has_consent; then
    e_pending "Running brew update"
    brew update
    e_pending "Running brew upgrade"
    brew upgrade
    e_pending "Running brew doctor"
    brew doctor
    e_pending "Running brew cleanup"
    brew cleanup
  fi
fi
