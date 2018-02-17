#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   neovim\n\n"

install_package "software-properties-common"
add_apt_repo "ppa:neovim-ppa/stable"
install_package "neovim"
