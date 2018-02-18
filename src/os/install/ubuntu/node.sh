#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Node\n\n"

execute "curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -"

install_package "NodeJS" "nodejs"

install_package "NPM" "npm"
