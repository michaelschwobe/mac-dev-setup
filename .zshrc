# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Show or hide hidden files.
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"

# Re-sort Launchpad applications.
alias sortapps="defaults write com.apple.dock ResetLaunchPad -boolean true; killall Dock"

# SublimeText alias.
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Open this file (.zshrc) in VSCode.
alias zshconfig="code ~/.zshrc"

# One-liner for updating Homebrew and other installed packages (such as Node).
alias brewup="brew update && brew upgrade && brew doctor && brew cleanup"

# ------------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------------

# Reinstalls xcode-select to fix missing receipt for command line tools.
fixcli() {
  echo "⚡️ Reinstalling xcode-select..."
  sudo rm -rf $(xcode-select --print-path)
  xcode-select --install
}

# Re-signs Firewall permissions for Node caused by switching versions via `nvm` or `n`.
fixnode() {
  echo "⚡️ Re-signing Firewall permissions for Node..."
  /usr/libexec/ApplicationFirewall/socketfilterfw --remove $(which node)
  codesign --force --sign - $(which node)
  /usr/libexec/ApplicationFirewall/socketfilterfw --add $(which node)
}

# Deletes all globally installed Node modules except for `npm`, `nvm`, or `n`.
trashg() {
  echo "⚡️ Deleting global packages..."
  npm ls -gp --depth=0 | awk -F/ '/node_modules/ && !/\/(npm|nvm|n)$/ {print $NF}' | xargs npm -g rm
}

# Deletes the current directory's generated files and reinstalls Node modules.
trashy() {
  echo "⚡️ Deleting generated files..."
  rm -rf node_modules/ build/ coverage/ dist/ storybook-static/ package-lock.json yarn.lock .eslintcache .stylelintcache
  read "UseYarn?Use yarn? [y/n]: "
  if [[ "$UseYarn" =~ ^[Yy]$ ]] then
    echo "⚡️ Installing packages via yarn..."
    yarn
  else
    echo "⚡️ Installing packages via npm..."
    npm i
  fi
}

# Create folder and switch into it.
mcd() {
  mkdir -p $1
  cd $1
}

# Scaffold a React component folder/files.
cray() {
  local TXT_RE_EXPORT="export { default } from './$1';"
  local TXT_JS="/* TODO: Write <$1 /> component. */"
  local TXT_CSS="/* TODO: Write <$1 /> styles. */"
  local TXT_STORY="/* TODO: Write <$1 /> stories. */"
  local TXT_TEST="/* TODO: Write <$1 /> tests. */"
  read "WithFolder?With Folder? [y/n]: "
  if [[ "$WithFolder" =~ ^[Yy]$ ]] then
    read "WithNamed?With named files? [y/n]: "
    mkdir -p $1
    cd $1
    if [[ "$WithNamed" =~ ^[Yy]$ ]] then
      echo $TXT_RE_EXPORT>>index.js
      echo $TXT_JS>>$1.js
      echo $TXT_CSS>>$1.module.css
      echo $TXT_STORY>>$1.stories.js
      echo $TXT_TEST>>$1.test.js
    else
      echo $TXT_JS>>index.js
      echo $TXT_CSS>>index.module.css
      echo $TXT_STORY>>index.stories.js
      echo $TXT_TEST>>index.test.js
    fi
    cd ..
  else
    echo $TXT_JS>>$1.js
    echo $TXT_CSS>>$1.module.css
    echo $TXT_STORY>>$1.stories.js
    echo $TXT_TEST>>$1.test.js
  fi
}

# Ensures eslint-config-airbnb packages are installed with correct version numbers.
airbnb() {
  read "UseYarn?Use yarn? [y/n]: "
  if [[ "$UseYarn" =~ ^[Yy]$ ]] then
    echo "⚡️ Installing packages via yarn..."
    npx install-peerdeps -D -Y eslint-config-airbnb
    yarn add -D prettier@latest eslint-config-prettier@latest eslint-plugin-prettier@latest
  else
    echo "⚡️ Installing packages via npm..."
    npx install-peerdeps -D eslint-config-airbnb
    npm i -D prettier@latest eslint-config-prettier@latest eslint-plugin-prettier@latest
  fi
}

# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------

# Theme configuration: PowerLevel10K
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fish shell-like fast/unobtrusive autosuggestions for Zsh.
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fish shell-like syntax highlighting for Zsh.
# Warning: Must be last sourced!
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
