#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking tools"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  if ! has_command "watchman"; then
    e_pending "Installing watchman"
    brew install watchman
    test_command "watchman"
  fi
fi

if has_command "brew"; then
  if ! has_command "trash"; then
    e_pending "Installing trash"
    brew install trash
    test_command "trash"
  fi
fi

if has_command "brew"; then
  if ! has_command "git"; then
    get_consent "Install git"
    if has_consent; then
      e_pending "Installing git"
      brew install git
      test_command "git"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "git-flow"; then
    get_consent "Install git-flow"
    if has_consent; then
      e_pending "Installing git-flow"
      brew install git-flow
      test_command "git-flow"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "zsh"; then
    get_consent "Install zsh"
    if has_consent; then
      e_pending "Installing zsh"
      brew install zsh
      test_command "zsh"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    get_consent "Install zsh-autosuggestions"
    if has_consent; then
      e_pending "Installing zsh-autosuggestions"
      brew install zsh-autosuggestions
      echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
      test_brew "zsh-autosuggestions"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-syntax-highlighting"; then
    get_consent "Install zsh-syntax-highlighting"
    if has_consent; then
      e_pending "Installing zsh-syntax-highlighting"
      brew install zsh-syntax-highlighting
      echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
      test_brew "zsh-syntax-highlighting"
    fi
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "git"; then
  if ! has_path ".oh-my-zsh/custom/themes/powerlevel9k"; then
    get_consent "Install powerlevel9k (CLI theming)"
    if has_consent; then
      e_pending "Installing powerlevel9k"
      git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
      test_path ".oh-my-zsh/custom/themes/powerlevel9k"
    fi
  fi
fi

if has_command "git"; then
  get_consent "Install powerline (CLI fonts)"
  if has_consent; then
    e_pending "Installing powerline"
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
  fi
fi

if has_command "brew"; then
  if ! has_command "node"; then
    get_consent "Install node (Node via Homebrew)"
    if has_consent; then
      e_pending "Installing node"
      brew install node
      test_command "node"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "n"; then
    get_consent "Install n (Node via n)"
    if has_consent; then
      e_pending "Installing n"
      brew install n
      test_command "n"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "nvm"; then
    get_consent "Install nvm (Node via nvm)"
    if has_consent; then
      e_pending "Installing nvm"
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
      test_command "nvm"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "yarn"; then
    get_consent "Install yarn"
    if has_consent; then
      if has_command "node"; then
        e_pending "Installing yarn (without Node)"
        brew install yarn --without-node
      else
        e_pending "Installing yarn (with Node)"
        brew install yarn
      fi
      test_command "yarn"
    fi
  fi
fi

if has_command 'npm'; then
  get_consent "Upgrade npm"
  if has_consent; then
    e_pending "Upgrading npm"
    npm i -g npm@latest
    test_command "npm"
  fi
fi

if has_command "npm"; then
  get_consent "Install/Upgrade serve (globally via npm)"
  if has_consent; then
    e_pending "Installing/Upgrading serve"
    npm i -g serve@latest
    test_command "serve"
  fi
fi

if has_command "npm"; then
  get_consent "Install/Upgrade eslint/airbnb/prettier combo (globally via npm)"
  if has_consent; then
    e_pending "Installing/Upgrading eslint/airbnb/prettier combo"
    npx install-peerdeps -g eslint-config-airbnb
    npm i -g prettier@latest eslint-config-prettier@latest eslint-plugin-prettier@latest
    test_command "eslint"
    test_command "prettier"
  fi
fi
