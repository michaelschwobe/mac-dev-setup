#!/bin/sh

. ./_utils.sh

# ------------------------------------------------------------------------------
e_message "Testing messaging"
# ------------------------------------------------------------------------------

e_failure "e_failure"
e_pending "e_pending"
e_success "e_success"

e_pending "Checking test_arm64"
test_arm64

e_pending "Checking test_path"
test_path "Downloads"

e_pending "Checking test_command"
test_command "ls"

e_pending "Checking test_brew"
test_brew "python"

e_pending "Checking test_cask"
test_cask "font-jetbrains-mono-nerd-font" "JetBrainsMono Nerd Font"

e_pending "Checking test_app"
test_app "Safari"

e_pending "Testing get_consent"
get_consent "get_consent"
if has_consent; then
    e_success "get_consent"
else
    e_failure "get_consent"
fi

# ------------------------------------------------------------------------------
e_message "Tests complete"
# ------------------------------------------------------------------------------
