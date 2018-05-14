#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

e_header() {
  printf "\n${magenta}%s...${reset}\n\n" "$@"
}

e_success() {
  printf "${green}✔  %s${reset}\n" "$@"
}

e_error() {
  printf "${red}✕  %s${reset}\n" "$@"
}

e_warning() {
  printf "${yellow}⚠  %s${reset}\n" "$@"
}

e_action() {
  printf "⚡️ $@\n"
}

e_finish() {
  printf "\n✨ %s\n\n" "$@"
}

seek_confirmation() {
  printf "${cyan}➡  $@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

type_exists() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}

is_os() {
  if [[ "${OSTYPE}" == $1* ]]; then
    return 0
  fi
  return 1
}

test_utils() {
  e_action "e_action"
  e_finish "e_finish"

  e_header "e_header"

  e_success "e_success"
  e_error "e_error"
  e_warning "e_warning"

  seek_confirmation "seek_confirmation"
  if is_confirmed; then
    e_success "is_confirmed"
  else
    e_error "is_confirmed"
  fi

  if is_os "darwin"; then
    e_success "is_os"
  else
    e_error "is_os"
    exit 1
  fi

  if type_exists 'git'; then
    e_success "type_exists"
  else
    e_error "type_exists"
    exit 1
  fi
}
