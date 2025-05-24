#!/bin/sh

# Check if running on macOS and fail quickly if not
if [ "$(uname)" != "Darwin" ]; then
    e_failure "Unsupported operating system (macOS only)"
    exit 1
fi


# Using tput so this works in both zsh and bash
color_reset=$(tput sgr0)
color_red=$(tput setaf 1)
color_green=$(tput setaf 2)
color_yellow=$(tput setaf 3)
color_blue=$(tput setaf 4)

e_failure() {
    printf "${color_red}🔴  %s${color_reset}\n" "$@"
}

e_pending() {
    printf "${color_yellow}⏳  %s...${color_reset}\n" "$@"
}

e_success() {
    printf "${color_green}🟢  %s${color_reset}\n" "$@"
}

e_message() {
    printf "\n${color_blue}✨  %s${color_reset}\n\n" "$@"
}

has_command() {
    command -v "$1" >/dev/null 2>&1
}

test_fn() {
    local condition=$1
    local name=$2
    if eval "$condition"; then
        e_success "$name"
        return 0
    else
        e_failure "$name"
        return 1
    fi
}

has_arm64() {
    [ "$(uname -m)" = "arm64" ]
}

test_arm64() {
    if has_arm64; then
        e_success "arm64"
        return 0
    else
        e_failure "arm64"
        return 0
    fi
}

has_path() {
    [ -e "$HOME/$1" ]
}

test_path() {
    test_fn "has_path $1" "$1"
}

test_command() {
    test_fn "has_command $1" "$1"
}

has_brew() {
    brew list --versions "$1" >/dev/null 2>&1
}

test_brew() {
    test_fn "has_brew $1" "$1"
}

has_cask() {
    brew list --cask "$1" >/dev/null 2>&1
}

test_cask() {
    test_fn "has_cask $1" "$2"
}

has_app() {
    [ -e "/Applications/$1.app" ] || [ -d "$HOME/Applications/$1.app" ]
}

test_app() {
    test_fn "has_app \"$1\"" "$1"
}

has_consent() {
    echo "$REPLY" | grep -qE '^[Yy]$'
}

get_consent() {
    printf "❔  %s? [y/n]: " "$@"
    read REPLY
    printf "\n"
}
