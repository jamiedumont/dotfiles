#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Elixir\n\n"

execute "wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb" "Get Erlang"

update

install_package "Erlang" "esl-erlang"

install_package "Elixir" "elixir"

execute "mix local.hex" "Install Hex package manager"

execute "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez" "Install Phoenix"

execute "rm erlang-solutions_1.0_all.deb" "Remove Erlang binary"
