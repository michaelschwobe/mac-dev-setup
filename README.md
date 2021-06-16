# Mac dev setup

> A macOS setup guide specific to front-end development.

## Guided Setup

For a guided setup, open up **Terminal.app** and run the following command:

1. Save repo to `~/Downloads` folder:
   ```sh
   git clone https://github.com/michaelschwobe/mac-dev-setup.git ~/Downloads/mac-dev-setup && \
   cd ~/Downloads/mac-dev-setup/scripts
   ```
2. Run the installer script (rerun as many times as needed).
   ```sh
   sh install.sh
   ```
   **OR** Run the installer scripts individually:
   ```sh
   sh defaults.sh
   sh tools.sh
   sh casks.sh
   sh optimizations.sh
   sh summary.sh
   ```

✨ And thats it! No need to do anything further.

## Manual Setup

For those who prefer à la carte, this section contains everything that the **Guided Setup** attempts to do, except for IDE customization.

- [Defaults](#defaults)
- [Tools](#tools)
- [Applications](#applications)
- [Optimizations](#optimizations)

### Defaults

##### Create Dock spacers:

```sh
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
killall Dock
```

##### Autohide Dock:

```sh
defaults write com.apple.dock autohide -boolean true && \
killall Dock
```

##### Display hidden Finder files/folders:

```sh
defaults write com.apple.finder AppleShowAllFiles -boolean true && \
killall Finder
```

##### Create `~/Developer` folder:

```sh
mkdir -p ~/Developer
```

##### Installing xcode-select (CLI tools):

```sh
xcode-select --install
```

##### Installing brew ([Homebrew](https://brew.sh/)):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew doctor
```

### Tools

##### Install [watchman](https://facebook.github.io/watchman/):

```sh
brew install watchman
```

##### Install [trash](https://hasseg.org/trash/):

```sh
brew install trash
```

##### Install [git](https://git-scm.com/):

```sh
brew install git
```

##### Install [git-flow](https://github.com/nvie/gitflow/):

```sh
brew install git-flow
```

##### Install [zsh](https://www.zsh.org/):

```sh
brew install zsh
```

##### Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh):

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### Install [powerlevel10k](https://github.com/romkatv/powerlevel10k/) (CLI theming):

```sh
brew install romkatv/powerlevel10k/powerlevel10k && \
echo '# Theme configuration: PowerLevel10K' >>! ~/.zshrc && \
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc && \
echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >>! ~/.zshrc && \
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >>! ~/.zshrc
```

Restart you’re CLI for this to take effect, or run:

```sh
p10k configure
```

##### Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/):

```sh
brew install zsh-autosuggestions && \
echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc && \
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
```

Restart you’re CLI for this to take effect.

##### Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/):

```sh
brew install zsh-syntax-highlighting && \
echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc && \
echo "# Warning: Must be last sourced!" >> ~/.zshrc && \
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

Restart you’re CLI for this to take effect.
Note the `source` command must be **at the end** of `~/.zshrc`.

##### Install [node](https://nodejs.org/) (Node via [Homebrew](https://brew.sh/)):

```sh
brew install node
```

##### Install [n](https://github.com/tj/n/) (Node via n):

```sh
brew install n
```

##### Install [nvm](https://github.com/nvm-sh/nvm/) (Node via nvm):

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

##### Install [yarn](https://yarnpkg.com/):

```sh
brew install yarn
```

##### Upgrade [npm](https://www.npmjs.com/):

```sh
npm i -g npm@latest
```

##### Install/Upgrade [serve](https://github.com/zeit/serve/) (globally via npm):

```sh
npm i -g serve@latest
```

### Applications

##### Install 1Password:

```sh
brew install --cask 1password
```

##### Install Adobe Creative Cloud:

```sh
brew install --cask adobe-creative-cloud
```

##### Install BrowserstackLocal:

```sh
brew install --cask browserstacklocal
```

##### Install DiffMerge:

```sh
brew install --cask diffmerge
```

##### Install Dropbox:

```sh
brew install --cask dropbox
```

##### Install Firefox Developer Edition:

```sh
brew install --cask firefox-developer-edition
```

##### Install Figma:

```sh
brew install --cask figma
```

##### Install Google Chrome:

```sh
brew install --cask google-chrome
```

##### Install Insomnia:

```sh
brew install --cask insomnia
```

##### Install iTerm:

```sh
brew install --cask iterm2
```

1. Copy my iTerm settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/.zshrc ~/
   ```
2. Restart iTerm and resolve any remaining issues.

##### Install MAMP:

```sh
brew install --cask mamp
```

##### Install Rectangle:

```sh
brew install --cask rectangle
```

##### Install Sketch:

```sh
brew install --cask sketch
```

##### Install Slack:

```sh
brew install --cask slack
```

##### Install Sourcetree:

```sh
brew install --cask sourcetree
```

##### Install Spotify:

```sh
brew install --cask spotify
```

##### Install Sublime Merge:

```sh
brew install --cask sublime-merge
```

##### Install Sublime Text:

```sh
brew install --cask sublime-text
```

1. Ensure [Package Control](https://packagecontrol.io/installation) is installed then quit.
2. Copy my Sublime Text User settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/Sublime/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
   ```
3. Restart Sublime Text to let Package Control auto-install missing packages. When Package Control finishes, restart and resolve any remaining issues.

See also [Syncing with Dropbox](https://packagecontrol.io/docs/syncing#dropbox-osx)

##### Install Transmit:

```sh
brew install --cask transmit
```

##### Install Visual Studio Code:

```sh
brew install --cask visual-studio-code
```

1. Install my Extensions:
   ```sh
   code --install-extension alefragnani.project-manager
   code --install-extension atomiks.moonlight
   code --install-extension bungcip.better-toml
   code --install-extension christian-kohler.npm-intellisense
   code --install-extension christian-kohler.path-intellisense
   code --install-extension CoenraadS.bracket-pair-colorizer
   code --install-extension dbaeumer.vscode-eslint
   code --install-extension dsznajder.es7-react-js-snippets
   code --install-extension eamodio.gitlens
   code --install-extension EditorConfig.EditorConfig
   code --install-extension eg2.vscode-npm-script
   code --install-extension esbenp.prettier-vscode
   code --install-extension formulahendry.auto-rename-tag
   code --install-extension gruntfuggly.todo-tree
   code --install-extension johnpapa.vscode-peacock
   code --install-extension mikestead.dotenv
   code --install-extension ms-vscode.sublime-keybindings
   code --install-extension msjsdiag.debugger-for-chrome
   code --install-extension Prisma.prisma
   code --install-extension stylelint.vscode-stylelint
   code --install-extension Tyriar.sort-lines
   code --install-extension vscode-icons-team.vscode-icons
   code --install-extension wayou.vscode-todo-highlight
   code --install-extension wix.vscode-import-cost
   code --install-extension Zignd.html-css-class-completion
   ```
2. Copy my Visual Studio Code User settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/Code/* ~/Library/Application\ Support/Code/User
   ```
3. Restart Visual Studio Code and resolve any remaining issues.

### Optimizations

##### Re-sort Launchpad applications:

```sh
defaults write com.apple.dock ResetLaunchPad -boolean true; killall Dock
```

##### Updating [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh):

```sh
omz update
```

##### Optimizing [Homebrew](https://brew.sh/):

```sh
brew update && brew upgrade && brew doctor && brew cleanup
```
