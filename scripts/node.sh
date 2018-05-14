#!/usr/bin/env bash

source ./utils.sh

e_header "Checking Node/NPM & Yarn"

if ! type_exists 'yarn'; then
  e_action "Installing yarn"
  brew install yarn
fi

brew cleanup

e_header "Checking global NPM packages"

if type_exists 'npm'; then

  seek_confirmation "Install create-react-app?"
  if is_confirmed; then
    npm i -g create-react-app@latest
  fi

  seek_confirmation "Install serve?"
  if is_confirmed; then
    npm i -g serve@latest
  fi

  seek_confirmation "Install @storybook/cli?"
  if is_confirmed; then
    npm i -g @storybook/cli@latest
  fi

  seek_confirmation "Install eslint/airbnb/prettier combo?"
  if is_confirmed; then
    (
      export PKG=eslint-config-airbnb;
      npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm i -g "$PKG@latest"
    )
    npm i -g eslint-plugin-json@latest
    npm i -g prettier@latest
    npm i -g eslint-config-prettier@latest
    npm i -g eslint-plugin-prettier@latest
  fi

fi
