#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update
upgrade

./build-essentials.sh
#./docker.sh
./elixir.sh
./fzf.sh
./git.sh
./hugo.sh
./node.sh
./php.sh
./tmux.sh


./cleanup.sh
