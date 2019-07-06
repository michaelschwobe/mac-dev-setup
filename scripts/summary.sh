#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Creating summary"
# ------------------------------------------------------------------------------

echo "\r"

e_success "Create Dock spacers"
e_success "Autohide Dock"
e_success "Display hidden Finder files/folders"
if has_path "Projects"; then
  e_success "Create '~/Projects' folder"
else
  e_failure "Create '~/Projects' folder"
fi
test_command "xcode-select"
test_command "brew"
test_command "watchman"
test_command "trash"
test_command "git"
test_command "git-flow"
test_command "zsh"
test_brew "zsh-autosuggestions"
test_brew "zsh-syntax-highlighting"
test_path ".oh-my-zsh"
test_path ".oh-my-zsh/custom/themes/powerlevel9k"
test_command "node"
test_command "n"
test_command "nvm"
test_command "yarn"
test_command "npm"
test_command "serve"
test_command "eslint"
test_command "prettier"
test_app "1Password"
test_app "Adobe Creative Cloud"
test_app "BrowserstackLocal"
test_app "DiffMerge"
test_app "Dropbox"
test_app "Firefox Developer Edition"
test_app "Google Chrome"
test_app "Insomnia"
test_app "iTerm"
test_app "MAMP"
test_app "Sketch"
test_app "Slack"
test_app "Sourcetree"
test_app "Spectacle"
test_app "Spotify"
test_app "Sublime Merge"
test_app "Sublime Text"
test_app "Transmit"
test_app "Visual Studio Code"

echo "\r"

e_settled "Installation complete!"
