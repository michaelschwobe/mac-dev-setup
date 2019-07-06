#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------

e_pending "Testing messaging"

echo "\r"

e_pending "e_pending"
e_failure "e_failure"
e_success "e_success"
e_settled "e_settled"

echo "\r"

e_pending "Testing verifications"

echo "\r"

test_command "ls"
test_brew "python"
test_path "Downloads"
test_app "Safari"

echo "\r"

e_pending "Testing user input"

echo "\r"

get_consent "get_consent"
if has_consent; then
  e_success "has_consent"
else
  e_failure "has_consent"
fi

echo "\r"

e_settled "Tests complete!"
