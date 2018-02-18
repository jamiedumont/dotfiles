#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh
./caddy.sh
#./docker.sh
./elixir.sh
./fzf.sh
./git.sh
./node.sh
./php.sh
./tmux.sh


./cleanup.sh
