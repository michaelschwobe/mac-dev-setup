#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking applications"
# ------------------------------------------------------------------------------

if has_command "brew cask"; then
  if ! has_app "1Password"; then
    get_consent "Install 1Password.app"
    if has_consent; then
      e_pending "Installing 1password"
      brew cask install 1password
      test_app "1Password"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Adobe Creative Cloud"; then
    get_consent "Install Adobe Creative Cloud.app"
    if has_consent; then
      e_pending "Installing adobe-creative-cloud"
      brew cask install adobe-creative-cloud
      test_app "Adobe Creative Cloud"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "BrowserstackLocal"; then
    get_consent "Install BrowserstackLocal.app"
    if has_consent; then
      e_pending "Installing browserstacklocal"
      brew cask install browserstacklocal
      test_app "BrowserstackLocal"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "DiffMerge"; then
    get_consent "Install DiffMerge.app"
    if has_consent; then
      e_pending "Installing diffmerge"
      brew cask install diffmerge
      test_app "DiffMerge"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Dropbox"; then
    get_consent "Install Dropbox.app"
    if has_consent; then
      e_pending "Installing dropbox"
      brew cask install dropbox
      test_app "Dropbox"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Firefox Developer Edition"; then
    get_consent "Install Firefox Developer Edition.app"
    if has_consent; then
      e_pending "Installing firefox-developer-edition"
      brew cask install firefox-developer-edition
      test_app "Firefox Developer Edition"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Google Chrome"; then
    get_consent "Install Google Chrome.app"
    if has_consent; then
      e_pending "Installing google-chrome"
      brew cask install google-chrome
      test_app "Google Chrome"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Insomnia"; then
    get_consent "Install Insomnia.app"
    if has_consent; then
      e_pending "Installing insomnia"
      brew cask install insomnia
      test_app "Insomnia"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "iTerm"; then
    get_consent "Install iTerm.app"
    if has_consent; then
      e_pending "Installing iterm2"
      brew cask install iterm2
      test_app "iTerm"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "MAMP"; then
    get_consent "Install MAMP.app"
    if has_consent; then
      e_pending "Installing mamp"
      brew cask install mamp
      test_app "MAMP"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sketch"; then
    get_consent "Install Sketch.app"
    if has_consent; then
      e_pending "Installing sketch"
      brew cask install sketch
      test_app "Sketch"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Slack"; then
    get_consent "Install Slack.app"
    if has_consent; then
      e_pending "Installing slack"
      brew cask install slack
      test_app "Slack"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sourcetree"; then
    get_consent "Install Sourcetree.app"
    if has_consent; then
      e_pending "Installing sourcetree"
      brew cask install sourcetree
      test_app "Sourcetree"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Spectacle"; then
    get_consent "Install Spectacle.app"
    if has_consent; then
      e_pending "Installing spectacle"
      brew cask install spectacle
      test_app "Spectacle"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Spotify"; then
    get_consent "Install Spotify.app"
    if has_consent; then
      e_pending "Installing spotify"
      brew cask install spotify
      test_app "Spotify"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sublime Merge"; then
    get_consent "Install Sublime Merge.app"
    if has_consent; then
      e_pending "Installing sublime-merge"
      brew cask install sublime-merge
      test_app "Sublime Merge"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Sublime Text"; then
    get_consent "Install Sublime Text.app"
    if has_consent; then
      e_pending "Installing sublime-text"
      brew cask install sublime-text
      test_app "Sublime Text"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Transmit"; then
    get_consent "Install Transmit.app"
    if has_consent; then
      e_pending "Installing transmit"
      brew cask install transmit
      test_app "Transmit"
    fi
  fi
fi

if has_command "brew cask"; then
  if ! has_app "Visual Studio Code"; then
    get_consent "Install Visual Studio Code.app"
    if has_consent; then
      e_pending "Installing visual-studio-code"
      brew cask install visual-studio-code
      test_app "Visual Studio Code"
    fi
  fi
fi
