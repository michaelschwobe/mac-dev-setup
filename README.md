# Mac dev setup

> A macOS setup guide specific to front-end development.

## Prerequisites

🔐 **Required Permissions:**

- Administrator access to your Mac
- Full disk access for certain applications
- Permission to install applications from identified developers

## Guided Setup

For a guided setup, open up **Terminal.app** and run the following commands.

1. Save the repo to the `~/Downloads` folder:
   ```sh
   git clone https://github.com/michaelschwobe/mac-dev-setup.git ~/Downloads/mac-dev-setup && \
   cd ~/Downloads/mac-dev-setup/scripts
   ```
2. Run the installer script.
   ```sh
   sh install.sh
   ```

🔥 **Recommended:** Rerun as many times as needed. The scripts will auto-skip prompts for items already installed.

✨ And that’s it! For additional CLI and IDE customizations, refer to the related **Manual Setup** section below.

## Manual Setup

For those who prefer à la carte, this section contains everything that the **Guided Setup** attempts to do including CLI and IDE customizations.

1. If you haven’t already, save repo to `~/Downloads` folder:
   ```sh
   git clone https://github.com/michaelschwobe/mac-dev-setup.git ~/Downloads/mac-dev-setup && \
   cd ~/Downloads/mac-dev-setup/scripts
   ```
2. Continue with setup below.

### Quick Navigation

- [Defaults](#defaults)
- [Tools](#tools)
- [Applications](#applications)
- [Optimizations](#optimizations)

### Defaults

#### System Preferences

##### Create 3 Dock spacers:

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

#### Directory Structure

##### Create a `~/Developer` folder:

```sh
mkdir -p ~/Developer
```

##### Create a `~/Sandbox` folder:

```sh
mkdir -p ~/Sandbox
```

#### Core Dependencies

##### Installing xcode-select (CLI tools):

```sh
xcode-select --install
```

##### Installing brew ([Homebrew](https://brew.sh/)):

If: Apple Silicon/ARM Architecture:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile && \
eval "$(/opt/homebrew/bin/brew shellenv)" && \
brew doctor
```

If Intel Architecture:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew doctor
```

### Tools

#### Development Tools

##### Install [git](https://git-scm.com/):

```sh
brew install git
```

#### Shell Configuration

##### Install [zsh](https://www.zsh.org/):

```sh
brew install zsh
```

##### Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### Install [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) (CLI theming):

```sh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
echo '# Theme configuration: Oh My Posh' >> ~/.zshrc
echo 'if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then' >> ~/.zshrc
echo '  if [ -f ~/.moonlight.omp.json ]; then' >> ~/.zshrc
echo '    eval "$(oh-my-posh init zsh --config ~/.moonlight.omp.json)"' >> ~/.zshrc
echo '  else' >> ~/.zshrc
echo '    eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"' >> ~/.zshrc
echo '  fi' >> ~/.zshrc
echo 'fi' >> ~/.zshrc
```

Copy my Oh My Posh settings:

```sh
cp ~/Downloads/mac-dev-setup/.moonlight.omp.json ~/.moonlight.omp.json
```

Restart your CLI for this to take effect.

##### Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/):

```sh
brew install zsh-autosuggestions && \
echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc && \
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
```

Restart your CLI for this to take effect.

##### Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/):

```sh
brew install zsh-syntax-highlighting && \
echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc && \
echo "# Warning: Must be last sourced!" >> ~/.zshrc && \
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

Restart your CLI for this to take effect.
Note the `source` command must be **at the end** of `~/.zshrc`.

##### Install [n](https://github.com/tj/n/) to install/manage Node versions:

```sh
brew install n
# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
```

##### Install [nvm](https://github.com/nvm-sh/nvm/) to install/manage Node versions:

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

##### Install [node](https://nodejs.org/) versioned managed by Homebrew:

```sh
brew install node
```

##### Install [pnpm](https://pnpm.io/):

```sh
brew install pnpm
```

##### Install [yarn](https://yarnpkg.com/):

```sh
brew install yarn
```

##### Upgrade [npm](https://www.npmjs.com/) (globally via npm):

```sh
npm install -g npm@latest
```

##### Install [serve](https://github.com/vercel/serve/) (globally via npm):

```sh
npm install -g serve@latest
```

### Applications/Casks

##### Install JetBrainsMono Nerd Font:

```sh
brew tap homebrew/cask-fonts # You only need to do this once!
brew install font-jetbrains-mono-nerd-font
```

##### Install 1Password:

```sh
brew install --cask 1password
```

##### Install Brave Browser:

```sh
brew install --cask brave-browser
```

##### Install Discord:

```sh
brew install --cask discord
```

##### Install Ghostty:

```sh
brew install --cask ghostty
```

1. Copy the theme:
   ```sh
   mkdir -p ~/.config/ghostty/ && \
   cp ~/Downloads/mac-dev-setup/Moonlight.ghostty.config ~/.config/ghostty/config
   ```
2. Check the theme by going to:
   - "Settings…"
3. Reload Ghostty and resolve any remaining issues.
   - "Reload Configuration"

##### Install Google Chrome:

```sh
brew install --cask google-chrome
```

##### Install Rectangle:

```sh
brew install --cask rectangle
```

##### Install Sourcetree:

```sh
brew install --cask sourcetree
```

1. Set the font by going to:
   - "Settings… &rarr; Diff &rarr; Internal Diff Visualization &rarr; Diff View font"
   - Font name: "JetBrainsMono NFM" or "JetBrainsMono Nerd Font Mono"
2. Restart Sourcetree and resolve any remaining issues.

##### Install Spotify:

```sh
brew install --cask spotify
```

##### Update Terminal:

1. Set the theme and font by going to:
   - "Settings… &rarr; Profiles &rarr; Import…" (bottom left next to the "+/-" buttons)
   - Theme location: `~/Downloads/mac-dev-setup/Moonlight.terminal`
   - Font name: "JetBrainsMono NFM" or "JetBrainsMono Nerd Font Mono"
2. Restart Terminal and resolve any remaining issues.

##### Install Visual Studio Code:

```sh
brew install --cask visual-studio-code
```

1. Install my Extensions (`code` alias required in `.zshrc`):
   ```sh
   code --install-extension alefragnani.project-manager
   code --install-extension atomiks.moonlight
   code --install-extension bierner.markdown-mermaid
   code --install-extension biomejs.biome
   code --install-extension bradlc.vscode-tailwindcss
   code --install-extension christian-kohler.npm-intellisense
   code --install-extension christian-kohler.path-intellisense
   code --install-extension dbaeumer.vscode-eslint
   code --install-extension docker.docker
   code --install-extension eamodio.gitlens
   code --install-extension editorconfig.editorconfig
   code --install-extension formulahendry.auto-rename-tag
   code --install-extension github.copilot
   code --install-extension github.copilot-chat
   code --install-extension github.vscode-github-actions
   code --install-extension gruntfuggly.todo-tree
   code --install-extension l13rary.l13-diff
   code --install-extension mikestead.dotenv
   code --install-extension ms-azuretools.vscode-containers
   code --install-extension ms-azuretools.vscode-docker
   code --install-extension orta.vscode-twoslash-queries
   code --install-extension oxc.oxc-vscode
   code --install-extension prettier.prettier-vscode
   code --install-extension prisma.prisma
   code --install-extension qwtel.sqlite-viewer
   code --install-extension stylelint.vscode-stylelint
   code --install-extension tyriar.sort-lines
   code --install-extension unifiedjs.vscode-mdx
   code --install-extension vscode-icons-team.vscode-icons
   code --install-extension yoavbls.pretty-ts-errors
   code --install-extension zignd.html-css-class-completion
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
