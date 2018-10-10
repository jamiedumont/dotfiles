#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PHP\n\n"

install_package "PHP 7.2 CLI" "php7.2-cli"

install_package "PHP 7.2 FPM" "php7.2-fpm"
