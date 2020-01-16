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

##### Create `~/Projects` folder:

```sh
mkdir -p ~/Projects
```

##### Installing xcode-select (CLI tools):

```sh
xcode-select --install
```

##### Installing brew ([Homebrew](https://brew.sh/)):

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
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

##### Install [zsh](https://github.com/robbyrussell/oh-my-zsh/):

```sh
brew install zsh
```

##### Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/):

```sh
brew install zsh-autosuggestions && \
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
```

Restart you’re CLI for this to take effect.

##### Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/):

```sh
brew install zsh-syntax-highlighting && \
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

Restart you’re CLI for this to take effect.

##### Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

##### Install [powerlevel9k](https://github.com/bhilburn/powerlevel9k/) (CLI theming):

```sh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Visit the docs for how to set this up.

##### Install [powerline](https://github.com/powerline/fonts/) (CLI fonts):

```sh
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

Verify the fonts glyphs work:

```sh
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
```

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

##### Install [yarn](https://yarnpkg.com/):

```sh
brew install yarn
# brew install yarn --without-node
```

##### Upgrade [npm](https://www.npmjs.com/):

```sh
npm i -g npm@latest
```

##### Install/Upgrade [serve](https://github.com/zeit/serve/) (globally via npm):

```sh
npm i -g serve@latest
```

##### Install/Upgrade [eslint](https://eslint.org/)/[airbnb](https://www.npmjs.com/package/eslint-config-airbnb/)/[prettier](https://prettier.io/) combo (globally via npm):

```sh
npx install-peerdeps -g eslint-config-airbnb && \
npm i -g prettier@latest eslint-config-prettier@latest eslint-plugin-prettier@latest
```

### Applications

##### Install 1Password:

```sh
brew cask install 1password
```

##### Install Adobe Creative Cloud:

```sh
brew cask install adobe-creative-cloud
```

##### Install BrowserstackLocal:

```sh
brew cask install browserstacklocal
```

##### Install DiffMerge:

```sh
brew cask install diffmerge
```

##### Install Dropbox:

```sh
brew cask install dropbox
```

##### Install Firefox Developer Edition:

```sh
brew cask install firefox-developer-edition
```

##### Install Google Chrome:

```sh
brew cask install google-chrome
```

##### Install Insomnia:

```sh
brew cask install insomnia
```

##### Install iTerm:

```sh
brew cask install iterm2
```

1. Copy my iTerm settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/.zshrc ~/
   ```
2. Restart iTerm and resolve any remaining issues.

##### Install MAMP:

```sh
brew cask install mamp
```

##### Install Sketch:

```sh
brew cask install sketch
```

##### Install Slack:

```sh
brew cask install slack
```

##### Install Sourcetree:

```sh
brew cask install sourcetree
```

##### Install Spectacle:

```sh
brew cask install spectacle
```

##### Install Spotify:

```sh
brew cask install spotify
```

##### Install Sublime Merge:

```sh
brew cask install sublime-merge
```

##### Install Sublime Text:

```sh
brew cask install sublime-text
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
brew cask install transmit
```

##### Install Visual Studio Code:

```sh
brew cask install visual-studio-code
```

1. Install my Extensions:
   ```sh
   code --install-extension alefragnani.project-manager
   code --install-extension asvetliakov.snapshot-tools
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
   code --install-extension johnpapa.vscode-peacock
   code --install-extension liviuschera.noctis
   code --install-extension mikestead.dotenv
   code --install-extension ms-vscode.sublime-keybindings
   code --install-extension sdras.night-owl
   code --install-extension Tyriar.sort-lines
   code --install-extension vscode-icons-team.vscode-icons
   code --install-extension wix.vscode-import-cost
   code --install-extension zhuangtongfa.material-theme
   code --install-extension Zignd.html-css-class-completion
   ```
2. Copy my Visual Studio Code User settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/Code/* ~/Library/Application\ Support/Code/User
   ```
3. Restart Visual Studio Code and resolve any remaining issues.

### Optimizations

##### Optimizing [Homebrew](https://brew.sh/):

```sh
brew update && brew upgrade && brew doctor && brew cleanup
```

##### Upgrading [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/):

```sh
upgrade_oh_my_zsh
```

##### Re-sort Launchpad applications:

```sh
defaults write com.apple.dock ResetLaunchPad -boolean true; killall Dock
```
