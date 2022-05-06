#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking applications"
# ------------------------------------------------------------------------------

declare -a cask_name=(
"1password"
"brave-browser"
"diffmerge"
"discord"
"figma"
"google-chrome"
"insomnia"
"iterm2"
"rectangle"
"slack"
"sourcetree"
"spotify"
"visual-studio-code"
"warp"
"zoom"
)

declare -a cask_desc=(
"1Password 7"
"Brave Browser"
"DiffMerge"
"Discord"
"Figma"
"Google Chrome"
"Insomnia"
"iTerm"
"Rectangle"
"Slack"
"Sourcetree"
"Spotify"
"Visual Studio Code"
"Warp"
"Zoom"
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
