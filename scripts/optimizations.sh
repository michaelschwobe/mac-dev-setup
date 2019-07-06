#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Running optimizations"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  e_pending "Optimizing Homebrew"
  # brew update && brew upgrade && brew doctor && brew cleanup
fi
