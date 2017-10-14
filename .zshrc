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

#-------------------------------------------------------------------------------
# Helper functions
#-------------------------------------------------------------------------------

# Helper function: Create folder and switch into it
mcd() {
  mkdir -p $1
  cd $1
}

# Helper function: Start a server from the current directory, watching all files
bs-serve() {
  browser-sync start --port ${1:-3000} --server "./" --files "./"
}

# Helper function: Start a create-react-app project with customizations
cray() {
  # Initialize
  read "UseCustom?Use custom-react-scripts? [y/n]: "
  if [[ "$UseCustom" =~ ^[Yy]$ ]] then
    create-react-app $1 --scripts-version custom-react-scripts
  else
    create-react-app $1
  fi
  cd $1
  # Add (dev)Dependencies
  yarn add classnames core-js prop-types sanitize.css
  # Scaffolding
  read "UseScaffold?Scaffold architecture defaults? [y/n]: "
  if [[ "$UseScaffold" =~ ^[Yy]$ ]] then
    cray-scaffold
  fi
  # Options...
  cray-styles
  cray-eslint
  cray-storybook
  cray-routing
  cray-redux
  # Launch editor
  subl .
  # Exit cleanup
  unset UseCustom
  unset UseScaffold
}

# Helper function: Modify a create-react-app project with: default folders/files
cray-scaffold() {
  # Archive src folder
  mv src _archive-src
  # Scaffold: root files
  mkdir src
  touch src/index.js .editorconfig
  # Scaffold: _Components
  mkdir src/components src/components/_Component
  touch src/components/_Component/index.js
  # Scaffold: _Containers
  mkdir src/containers src/containers/_Container src/containers/App
  touch src/containers/_Container/index.js src/containers/App/index.js
  # Scaffold: utils
  mkdir src/utils
  touch src/utils/index.js src/utils/polyfills.js
  cp _archive-src/registerServiceWorker.js src/utils
}

# Helper function: Modify a create-react-app project with: CSS
cray-css() {
  # Scaffold: CSS
  mkdir src/styles src/components src/components/_Component
  touch src/styles.css src/components/_Component/styles.css src/containers/_Container/styles.css
  yarn add classnames
}

# Helper function: Modify a create-react-app project with: Sass
cray-sass() {
  # Scaffold: CSS (temporary placholders - will be overwritten by Sass)
  cray-css
  # Scaffold: Sass
  mkdir src/styles src/components src/components/_Component
  touch src/styles.scss src/components/_Component/styles.scss src/containers/_Container/styles.scss src/styles/_variables.colors.scss src/styles/_variables.layout.scss src/styles/_variables.typography.scss
  yarn add npm-run-all node-sass-chokidar
}

# Helper function: Modify a create-react-app project with: Less
cray-less() {
  # Scaffold: CSS (temporary placholders - will be overwritten by Less)
  cray-css
  # Scaffold: Less
  mkdir src/styles src/components src/components/_Component
  touch src/styles.less src/components/_Component/styles.less src/containers/_Container/styles.less src/styles/_variables.colors.less src/styles/_variables.layout.less src/styles/_variables.typography.less
  yarn add npm-run-all node-less-chokidar
}

# Helper function: Modify a create-react-app project with: Sass, Less, or CSS
cray-styles() {
  # Initialize
  read "UseSass?Use Sass? [y/n]: "
  # Scaffolding...
  if [[ "$UseSass" =~ ^[Yy]$ ]] then
    # Scaffold: Sass
    cray-sass
  else
    read "UseLess?Use Less? [y/n]: "
    if [[ "$UseLess" =~ ^[Yy]$ ]] then
      # Scaffold: Less
      cray-less
    else
      # Scaffold: CSS
      cray-css
    fi
    # Exit cleanup
    unset UseLess
  fi
  # Exit cleanup
  unset UseSass
}

# Helper function: Modify a create-react-app project with: Eslint and Prettier
cray-eslint() {
  # Initialize
  read "UseEslint?Use Eslint? [y/n]: "
  # Scaffold: Eslint
  if [[ "$UseEslint" =~ ^[Yy]$ ]] then
    touch .eslintrc.json .eslintignore
    airbnb
    yarn add --dev eslint-plugin-json
    # Scaffold: Prettier
    read "UsePrettier?Use Prettier? [y/n]: "
    if [[ "$UsePrettier" =~ ^[Yy]$ ]] then
      yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier
    fi
    # Exit cleanup
    unset UsePrettier
  fi
  # Exit cleanup
  unset UseEslint
}

# Helper function: Modify a create-react-app project with: Storybook
cray-storybook() {
  # Initialize
  read "UseStorybook?Use Storybook? [y/n]: "
  # Scaffold: Storybook
  if [[ "$UseStorybook" =~ ^[Yy]$ ]] then
    getstorybook
    # Archive stories folder
    mv stories _archive-stories
    mkdir src/components src/components/_Component
    touch .storybook/styles.css src/components/_Component/stories.js
    # Scaffold: Storybook config
    read "UseStorybookConfig?Use Storybook with custom config? [y/n]: "
    if [[ "$UseStorybookConfig" =~ ^[Yy]$ ]] then
      touch .storybook/webpack.config.js
    fi
    # Exit cleanup
    unset UseStorybookConfig
  fi
  # Exit cleanup
  unset UseStorybook
}

# Helper function: Modify a create-react-app project with: React Router
cray-routing() {
  # Initialize
  read "UseRouting?Use Routing? [y/n]: "
  # Scaffold: Routing
  if [[ "$UseRouting" =~ ^[Yy]$ ]] then
    mkdir src/containers src/containers/PageHome src/containers/PageNoMatch
    touch src/containers/PageHome/index.js src/containers/PageNoMatch/index.js
    yarn add react-router-dom
  fi
  # Exit cleanup
  unset UseRouting
}

# Helper function: Modify a create-react-app project with: Redux
cray-redux() {
  # Initialize
  read "UseRedux?Use Redux? [y/n]: "
  # Scaffold: Redux
  if [[ "$UseRedux" =~ ^[Yy]$ ]] then
    mkdir src/components src/components/_Component
    touch src/components/_Component/actions.js src/components/_Component/constants.js src/components/_Component/reducer.js
    yarn add redux react-redux
  fi
  # Exit cleanup
  unset UseRedux
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
