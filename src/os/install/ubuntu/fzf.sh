#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   FZF\n\n"

# --depth 1 means only grab the last 1 commit. Shallow clone, more akin to
# download of the repos current state
execute "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf"
execute "~/.fzf/install"

# Add FZF to command line
execute "source ~/.bashrc"
