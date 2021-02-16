#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking applications"
# ------------------------------------------------------------------------------

if has_command "brew cask"; then
  if ! has_app "1Password 7"; then
    get_consent "Install 1Password 7.app"
    if has_consent; then
      e_pending "Installing 1password"
      brew install --cask 1password
      test_app "1Password 7"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Adobe Creative Cloud"; then
    get_consent "Install Adobe Creative Cloud.app"
    if has_consent; then
      e_pending "Installing adobe-creative-cloud"
      brew install --cask adobe-creative-cloud
      test_app "Adobe Creative Cloud"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "BrowserstackLocal"; then
    get_consent "Install BrowserstackLocal.app"
    if has_consent; then
      e_pending "Installing browserstacklocal"
      brew install --cask browserstacklocal
      test_app "BrowserstackLocal"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "DiffMerge"; then
    get_consent "Install DiffMerge.app"
    if has_consent; then
      e_pending "Installing diffmerge"
      brew install --cask diffmerge
      test_app "DiffMerge"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Dropbox"; then
    get_consent "Install Dropbox.app"
    if has_consent; then
      e_pending "Installing dropbox"
      brew install --cask dropbox
      test_app "Dropbox"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Figma"; then
    get_consent "Install Figma.app"
    if has_consent; then
      e_pending "Installing figma"
      brew install --cask figma
      test_app "Figma"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Firefox Developer Edition"; then
    get_consent "Install Firefox Developer Edition.app"
    if has_consent; then
      e_pending "Installing firefox-developer-edition"
      brew install --cask firefox-developer-edition
      test_app "Firefox Developer Edition"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Google Chrome"; then
    get_consent "Install Google Chrome.app"
    if has_consent; then
      e_pending "Installing google-chrome"
      brew install --cask google-chrome
      test_app "Google Chrome"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Insomnia"; then
    get_consent "Install Insomnia.app"
    if has_consent; then
      e_pending "Installing insomnia"
      brew install --cask insomnia
      test_app "Insomnia"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "iTerm"; then
    get_consent "Install iTerm.app"
    if has_consent; then
      e_pending "Installing iterm2"
      brew install --cask iterm2
      test_app "iTerm"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "MAMP"; then
    get_consent "Install MAMP.app"
    if has_consent; then
      e_pending "Installing mamp"
      brew install --cask mamp
      test_app "MAMP"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Rectangle"; then
    get_consent "Install Rectangle.app"
    if has_consent; then
      e_pending "Installing rectangle"
      brew install --cask rectangle
      test_app "Rectangle"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sketch"; then
    get_consent "Install Sketch.app"
    if has_consent; then
      e_pending "Installing sketch"
      brew install --cask sketch
      test_app "Sketch"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Slack"; then
    get_consent "Install Slack.app"
    if has_consent; then
      e_pending "Installing slack"
      brew install --cask slack
      test_app "Slack"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sourcetree"; then
    get_consent "Install Sourcetree.app"
    if has_consent; then
      e_pending "Installing sourcetree"
      brew install --cask sourcetree
      test_app "Sourcetree"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Spotify"; then
    get_consent "Install Spotify.app"
    if has_consent; then
      e_pending "Installing spotify"
      brew install --cask spotify
      test_app "Spotify"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sublime Merge"; then
    get_consent "Install Sublime Merge.app"
    if has_consent; then
      e_pending "Installing sublime-merge"
      brew install --cask sublime-merge
      test_app "Sublime Merge"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sublime Text"; then
    get_consent "Install Sublime Text.app"
    if has_consent; then
      e_pending "Installing sublime-text"
      brew install --cask sublime-text
      test_app "Sublime Text"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Transmit"; then
    get_consent "Install Transmit.app"
    if has_consent; then
      e_pending "Installing transmit"
      brew install --cask transmit
      test_app "Transmit"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Visual Studio Code"; then
    get_consent "Install Visual Studio Code.app"
    if has_consent; then
      e_pending "Installing visual-studio-code"
      brew install --cask visual-studio-code
      test_app "Visual Studio Code"
    fi
  fi
fi
