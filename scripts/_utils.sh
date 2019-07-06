#!/bin/bash

color_reset=$(tput sgr0)
color_red=$(tput setaf 1)
color_green=$(tput setaf 2)
color_yellow=$(tput setaf 3)

e_pending() {
  printf "${color_yellow}⚡️ %s...${color_reset}" "$@"
  printf "\n"
}

e_failure() {
  printf "${color_red}✕  %s${color_reset}" "$@"
  printf "\n"
}

e_success() {
  printf "${color_green}✔  %s${color_reset}" "$@"
  printf "\n"
}

e_settled() {
  printf "${color_yellow}✨ %s!${color_reset}" "$@"
  printf "\n"
}

has_command() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}

test_command() {
  if has_command $1; then
    e_success "$1"
  else
    e_failure "$1"
  fi
}

has_brew() {
  if $(brew ls --versions $1 > /dev/null); then
    return 0
  fi
  return 1
}

test_brew() {
  if has_brew $1; then
    e_success "$1"
  else
    e_failure "$1"
  fi
}

has_path() {
  local path="$@"
  if [ -e "$HOME/$path" ]; then
    return 0
  fi
  return 1
}

test_path() {
  # local path=$(echo "$@" | sed 's:.*/::')
  if has_path $1; then
    # e_success "$path"
    e_success "$1"
  else
    # e_failure "$path"
    e_failure "$1"
  fi
}

has_app() {
  local name="$@"
  if [ -e "/Applications/$name.app" ]; then
    return 0
  fi
  return 1
}

test_app() {
  if has_app $1; then
    e_success "$1"
  else
    e_failure "$1"
  fi
}

has_consent() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

get_consent() {
  printf "❔ %s [y/n]:" "$@"
  read -p " " -n 1
  printf "\n"
}

if ! [[ "${OSTYPE}" == "darwin"* ]]; then
  e_failure "Unsupported operating system (macOS only)"
  exit 1
fi

# This will clear the prompt before each sourced file.
clear
