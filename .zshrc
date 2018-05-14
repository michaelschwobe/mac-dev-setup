# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# PowerLevel9K Customization.
prompt_pkg_version() {
  local version=$("$1" --version 2>/dev/null)
  [[ -z "${version}" ]] && return
  printf "${1}@${version}"
}
POWERLEVEL9K_CUSTOM_NPM_VERSION="echo $(prompt_pkg_version npm)"
POWERLEVEL9K_CUSTOM_NPM_VERSION_BACKGROUND="cyan"
POWERLEVEL9K_CUSTOM_YARN_VERSION="echo $(prompt_pkg_version yarn)"
POWERLEVEL9K_CUSTOM_YARN_VERSION_BACKGROUND="white"
POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time rbenv node_version custom_npm_version custom_yarn_version dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(npm yarn)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:`yarn global bin`"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Show or hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Sublime alias
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# Open this file (.zshrc) in Sublime
alias zshconfig="subl ~/.zshrc"

# One-liner for updating Homebrew and other installed packages (such as Node)
alias brewup="brew update && brew upgrade && brew doctor && brew cleanup"

# Helper function: Create folder and switch into it
mcd() {
  mkdir -p $1
  cd $1
}

# Helper function: Ensures eslint-config-airbnb packages are installed with correct version numbers
airbnb() {
  read "UseYarn?Use Yarn? [y/n]: "
  read "ForDev?For Dev? [y/n]: "
  if [[ "$UseYarn" =~ ^[Yy]$ ]] then
    if [[ ! "$ForDev" =~ ^[Yy]$ ]] then
      (
        export PKG=eslint-config-airbnb;
        npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs yarn global add "$PKG@latest"
      )
    else
      (
        export PKG=eslint-config-airbnb;
        npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs yarn add --dev "$PKG@latest"
      )
    fi
  else
    if [[ ! "$ForDev" =~ ^[Yy]$ ]] then
      (
        export PKG=eslint-config-airbnb;
        npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest"
      )
    else
      (
        export PKG=eslint-config-airbnb;
        npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install --save-dev "$PKG@latest"
      )
    fi
  fi
  unset UseYarn
  unset ForDev
}
