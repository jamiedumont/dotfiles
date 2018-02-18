#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PHP\n\n"

install_package "PHP 7 CLI" "php7.0-cli"

install_package "PHP 7 FPM" "php7.0-fpm"
