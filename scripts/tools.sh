#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking tools"
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

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "powerlevel10k"; then
    get_consent "Install powerlevel10k (CLI theming)"
    if has_consent; then
      e_pending "Installing powerlevel10k"
      brew install romkatv/powerlevel10k/powerlevel10k
      echo '# Theme configuration: PowerLevel10K' >> ~/.zshrc
      echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
      echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
      echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
      test_brew "powerlevel10k"
      p10k configure
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    get_consent "Install zsh-autosuggestions"
    if has_consent; then
      e_pending "Installing zsh-autosuggestions"
      brew install zsh-autosuggestions
      echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
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
      echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc
      echo "# Warning: Must be last sourced!" >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
      test_brew "zsh-syntax-highlighting"
    fi
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
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
      test_command "nvm"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "yarn"; then
    get_consent "Install yarn"
    if has_consent; then
      e_pending "Installing yarn"
      brew install yarn
      test_command "yarn"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "pnpm"; then
    get_consent "Install pnpm"
    if has_consent; then
      e_pending "Installing pnpm"
      brew install pnpm
      test_command "pnpm"
    fi
  fi
fi

if has_command 'npm'; then
  get_consent "Upgrade npm"
  if has_consent; then
    e_pending "Upgrading npm"
    npm install --location=global npm@latest
    test_command "npm"
  fi
fi

if has_command "npm"; then
  get_consent "Install/Upgrade serve (globally via npm)"
  if has_consent; then
    e_pending "Installing/Upgrading serve"
    npm install --location=global serve@latest
    test_command "serve"
  fi
fi

# ------------------------------------------------------------------------------
e_message "Tools complete"
# ------------------------------------------------------------------------------
