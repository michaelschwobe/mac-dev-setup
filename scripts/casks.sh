#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking applications"
# ------------------------------------------------------------------------------

declare -a cask_name=(
"1password"
"adobe-creative-cloud"
"browserstacklocal"
"diffmerge"
"dropbox"
"figma"
"firefox-developer-edition"
"google-chrome"
"insomnia"
"iterm2"
"mamp"
"rectangle"
"sketch"
"slack"
"sourcetree"
"spotify"
"transmit"
"visual-studio-code"
)

declare -a cask_desc=(
"1Password 7"
"Adobe Creative Cloud"
"BrowserstackLocal"
"DiffMerge"
"Dropbox"
"Figma"
"Firefox Developer Edition"
"Google Chrome"
"Insomnia"
"iTerm"
"MAMP"
"Rectangle"
"Sketch"
"Slack"
"Sourcetree"
"Spotify"
"Transmit"
"Visual Studio Code"
)

if has_command "brew"; then
  for i in "${!cask_name[@]}"; do
    DESC=${cask_desc[$i]}
    NAME=${cask_name[$i]}
    test_app "$DESC"
    if ! has_app "$DESC"; then
      get_consent "Install $DESC.app"
      if has_consent; then
        e_pending "Installing $NAME"
        brew install --cask $NAME
        test_app "$DESC"
      fi
    fi
  done
fi
