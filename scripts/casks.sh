#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking applications/casks"
# ------------------------------------------------------------------------------

declare -a cask_name=(
"font-jetbrains-mono-nerd-font"
)

declare -a cask_desc=(
"JetBrainsMono Nerd Font"
)

declare -a app_name=(
"1password"
"brave-browser"
"bruno"
"discord"
"figma"
"google-chrome"
"iterm2"
"rectangle"
"slack"
"sourcetree"
"spotify"
"visual-studio-code"
"warp"
"zoom"
)

declare -a app_desc=(
"1Password"
"Brave Browser"
"Bruno"
"Discord"
"Figma"
"Google Chrome"
"iTerm"
"Rectangle"
"Slack"
"Sourcetree"
"Spotify"
"Visual Studio Code"
"Warp"
"Zoom.us"
)

if has_command "brew"; then
  for i in "${!cask_name[@]}"; do
    DESC=${cask_desc[$i]}
    NAME=${cask_name[$i]}
    test_cask "$DESC"
    if ! has_cask "$DESC"; then
      get_consent "Install $DESC"
      if has_consent; then
        e_pending "Installing $NAME"
        brew install --cask $NAME
        test_cask "$DESC"
      fi
    fi
  done
  for i in "${!app_name[@]}"; do
    DESC=${app_desc[$i]}
    NAME=${app_name[$i]}
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

if has_app "Visual Studio Code"; then
  get_consent "Install Visual Studio Code extensions, settings, and snippets"
  if has_consent; then
    e_pending "Installing Visual Studio Code extensions, settings, and snippets"
    code --install-extension alefragnani.project-manager
    code --install-extension atomiks.moonlight
    code --install-extension bradlc.vscode-tailwindcss
    code --install-extension christian-kohler.npm-intellisense
    code --install-extension christian-kohler.path-intellisense
    code --install-extension codeforge.remix-forge
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension eamodio.gitlens
    code --install-extension editorconfig.editorconfig
    code --install-extension esbenp.prettier-vscode
    code --install-extension formulahendry.auto-rename-tag
    code --install-extension github.copilot
    code --install-extension github.copilot-chat
    code --install-extension github.vscode-github-actions
    code --install-extension gruntfuggly.todo-tree
    code --install-extension l13rary.l13-diff
    code --install-extension mikestead.dotenv
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension ms-vscode.sublime-keybindings
    code --install-extension prisma.prisma
    code --install-extension qwtel.sqlite-viewer
    code --install-extension stylelint.vscode-stylelint
    code --install-extension tyriar.sort-lines
    code --install-extension unifiedjs.vscode-mdx
    code --install-extension vscode-icons-team.vscode-icons
    code --install-extension wix.vscode-import-cost
    code --install-extension yoavbls.pretty-ts-errors
    code --install-extension zignd.html-css-class-completion
    cp ~/Downloads/mac-dev-setup/Code/* ~/Library/Application\ Support/Code/User
  fi
fi

# ------------------------------------------------------------------------------
e_message "Applications/Casks complete"
# ------------------------------------------------------------------------------
