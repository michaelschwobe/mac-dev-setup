# Mac dev setup

> A macOS setup guide specific to front-end development.

## Getting Started

Open up **Terminal.app** and follow this guide from top down.

### Automagically

Run the following command for a guided install:

```sh
cd ~/Downloads && \
curl -LJO https://github.com/michaelschwobe/mac-dev-setup/archive/master.zip && \
unzip mac-dev-setup-master.zip && \
rm mac-dev-setup-master.zip && \
cd mac-dev-setup-master/scripts && \
sh install.sh
```

And then you're done, no need to read further.

### OR... Manually

Turn on invisible files:

```sh
defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder
```

Install Xcode command line tools

```sh
xcode-select --install
```

## Homebrew

Install [Homebrew](https://brew.sh/):

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Check if its working:

```sh
brew update && brew doctor
```

## Oh My Zsh

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Node/Yarn

Install both [Node/npm](https://nodejs.org/en/) & [Yarn](https://yarnpkg.com/en/):

```sh
brew install yarn
```

Install global packages:

```sh
npm i -g @storybook/cli create-react-app eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-import eslint-plugin-json eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react gulp-cli prettier serve
```

## Apps

Install [Cask](https://caskroom.github.io/):

```sh
brew tap caskroom/cask
```

Install apps:

```sh
brew cask install adobe-creative-cloud browserstacklocal diffmerge dropbox google-chrome insomnia iterm2 mamp sketch slack sourcetree spectacle spotify sublime-text transmit visual-studio-code
```

## iTerm

Download the [base16 Ocean Dark theme](https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-ocean.dark.itermcolors) colors then follow these [installation instructions](https://github.com/chriskempson/base16-iterm2#installation).

Install [Powerline Fonts](https://github.com/powerline/fonts), use "Source Code Pro", then check if they’re working via:

```sh
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
```

Install [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) theme:

```sh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) & [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) plugins:

```sh
brew install zsh-autosuggestions zsh-syntax-highlighting
```

Open `~/.zshrc`, paste in this [zsh config file](https://github.com/michaelschwobe/mac-dev-setup/blob/master/.zshrc), then save. If you have iTerm open, restart it.

## Sublime Text

Install [Package Control](https://packagecontrol.io/installation) then quit.

Open `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User` with Finder, replace the contents of `User/` with these [files](https://github.com/michaelschwobe/mac-dev-setup/tree/master/Sublime/).

Restart ST3 to let Package Control auto-install missing packages. When Package Control finishes, restart again to resolve any lingering UI problems.

Extra - [Syncing with Dropbox](https://packagecontrol.io/docs/syncing#dropbox-osx)

## Visual Studio Code

Install extensions:

```sh
code --install-extension dbaeumer.vscode-eslint zhuangtongfa.material-theme esbenp.prettier-vscode ms-vscode.sublime-keybindings robertohuertasm.vscode-icons
```

Open `~/Library/Application\ Support/Code/User` with Finder, replace the contents of `User/` with these [files](https://github.com/michaelschwobe/mac-dev-setup/tree/master/Code/).
