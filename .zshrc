# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git)

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

# Adds a single Dock spacer.
alias addDockSpacer="defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"spacer-tile\";}'; killall Dock"

# Open this file (.zshrc) in VSCode.
alias zshconfig="code ~/.zshrc"

# One-liner for updating Homebrew and other installed packages (such as Node).
alias brewup="brew update && brew upgrade && brew doctor && brew cleanup"

# ------------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------------

# Convert string to PascalCase.
toPascalCase() {
  printf $1 | awk 'BEGIN{FS="";RS="-";ORS=""} {$0=toupper(substr($0,1,1)) substr($0,2)} 1'
}

# Create folder and switch into it.
mcd() {
  mkdir -p $1
  cd $1
}

# Scaffold a React component folder/files.
cray() {
  read "WITH_FOLDER?🟡 With Folder? [y/n]: "
  read "WITH_NAMED_FILES?🟡 With Named Files? [y/n]: "
  read "WITH_TYPESCRIPT?🟡 With Typescript? [y/n]: "
  read "WITH_STORIES?🟡 With Stories? [y/n]: "
  read "WITH_TESTS?🟡 With Tests? [y/n]: "
  read "WITH_CSS?🟡 With CSS, CSS Modules, CSS-in-JS, or none? [1/2/3/4]: "

  local COMP_NAME=$(toPascalCase $1)

  local FILE_NAME="index"
  if [[ "$WITH_NAMED_FILES" =~ ^[Yy]$ ]] then
    FILE_NAME="$1"
  fi

  local SCRIPT_EXT="js"
  local SCRIPT_EXT_JSX="jsx"
  if [[ "$WITH_TYPESCRIPT" =~ ^[Yy]$ ]] then
    SCRIPT_EXT="ts"
    SCRIPT_EXT_JSX="tsx"
  fi

  local STYLE_EXT="css"
  if [[ "$WITH_CSS" == 2 ]] then
    STYLE_EXT="module.css"
  fi
  if [[ "$WITH_CSS" == 3 ]] then
    STYLE_EXT="css.${SCRIPT_EXT}"
  fi

  if [[ "$WITH_FOLDER" =~ ^[Yy]$ ]] then
    mkdir -p $1
    cd $1
  fi

  printf "/* TODO: Write <$COMP_NAME /> component. */\n">>$FILE_NAME.$SCRIPT_EXT_JSX

  if [[ "$WITH_NAMED_FILES" =~ ^[Yy]$ ]] then
    printf "export { default as $COMP_NAME } from './$FILE_NAME';\n">>index.$SCRIPT_EXT
    if [[ "$WITH_TYPESCRIPT" =~ ^[Yy]$ ]] then
      local PROPS="Props"
      printf "export type { $COMP_NAME$PROPS } from './$FILE_NAME';\n">>index.$SCRIPT_EXT
    fi
  fi

  if [[ "$WITH_STORIES" =~ ^[Yy]$ ]] then
    printf "/* TODO: Write <$COMP_NAME /> stories. */\n">>$FILE_NAME.stories.$SCRIPT_EXT_JSX
  fi

  if [[ "$WITH_TESTS" =~ ^[Yy]$ ]] then
    printf "/* TODO: Write <$COMP_NAME /> tests. */\n">>$FILE_NAME.test.$SCRIPT_EXT_JSX
  fi

  if [[ "$WITH_CSS" == 1 || "$WITH_CSS" == 2 || "$WITH_CSS" == 3 ]] then
    printf "/* TODO: Write <$COMP_NAME /> styles. */\n">>$FILE_NAME.$STYLE_EXT
  fi

  if [[ "$WITH_FOLDER" =~ ^[Yy]$ ]] then
    cd ..
  fi
}

# Deletes the current directory's generated files and reinstalls Node modules.
trashy() {
  printf "🟡 Deleting generated files...\n"
  rm -rf .cache/ .next/ .turbo/ build/ coverage/ dist/ node_modules/ out/ public/build storybook-static/ .eslintcache .stylelintcache
  printf "🟡 Deleted generated files.\n"
  read "DeleteLockFiles?🟡 Delete npm, pnpm, or yarn lockfiles? [y/n]: "
    if [[ "$DeleteLockFiles" =~ ^[Yy]$ ]] then
      printf "🟡 Deleting lockfiles...\n"
      rm -rf package-lock.json pnpm-lock.yaml yarn.lock
      printf "🟡 Deleted lockfiles.\n"
  fi
  read "PackageManager?🟡 Install packages via npm, pnpm, or yarn? [n/p/y]: "
  if [[ "$PackageManager" =~ ^[Yy]$ ]] then
    printf "🟡 Installing packages via pnpm...\n"
    yarn install
  elif [[ "$PackageManager" =~ ^[Pp]$ ]] then
    printf "🟡 Installing packages via yarn...\n"
    pnpm install
  else
    printf "🟡 Installing packages via npm...\n"
    npm install
  fi
}

# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------

# Theme configuration: PowerLevel10K
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Fish shell-like fast/unobtrusive autosuggestions for Zsh.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fish shell-like syntax highlighting for Zsh.
# Warning: Must be last sourced!
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
