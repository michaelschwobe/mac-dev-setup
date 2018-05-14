#!/bin/bash

source ./utils.sh

e_header "Summary"

# source ./scripts/os.sh
if is_os "darwin"; then
  e_success "darwin"
else
  e_error "darwin"
fi

# source ./scripts/tools.sh
if type_exists 'xcode-select'; then
  e_success "xcode-select"
else
  e_error "xcode-select"
fi

# source ./scripts/brew.sh
if type_exists 'brew'; then
  e_success "brew"
else
  e_error "brew"
fi

if type_exists 'trash'; then
  e_success "trash"
else
  e_error "trash"
fi

if type_exists 'watchman'; then
  e_success "watchman"
else
  e_error "watchman"
fi

# source ./scripts/cask.sh
if type_exists 'brew cask'; then
  e_success "brew-cask"
else
  e_error "brew-cask"
fi

# source ./scripts/zsh.sh
if type_exists 'zsh'; then
  e_success "zsh"
else
  e_error "zsh"
fi

if brew ls --versions zsh-autosuggestions > /dev/null; then
  e_success "zsh-autosuggestions"
else
  e_error "zsh-autosuggestions"
fi

if brew ls --versions zsh-syntax-highlighting > /dev/null; then
  e_success "zsh-syntax-highlighting"
else
  e_error "zsh-syntax-highlighting"
fi

OMZ=~/.oh-my-zsh
if test -d $OMZ; then
  e_success "oh-my-zsh"
else
  e_error "oh-my-zsh"
fi

# TODO: Fix powerline test
# PLFONTS=~/Library/Fonts/Source\ Code\ Pro\ for\ Powerline.otf
# if test -e $PLFONTS; then
#   e_success "powerline"
# else
#   e_error "powerline"
# fi

PL9K=~/.oh-my-zsh/custom/themes/powerlevel9k
if test -d $PL9K; then
  e_success "powerlevel9k"
else
  e_error "powerlevel9k"
fi

# source ./scripts/node.sh
if type_exists 'node'; then
  e_success "node"
else
  e_error "node"
fi

if type_exists 'npm'; then
  e_success "npm"
else
  e_error "npm"
fi

if type_exists 'yarn'; then
  e_success "yarn"
else
  e_error "yarn"
fi

# source ./scripts/git.sh
if type_exists 'git'; then
  e_success "git"
else
  e_error "git"
fi

if type_exists 'git-flow'; then
  e_success "git-flow"
else
  e_error "git-flow"
fi
