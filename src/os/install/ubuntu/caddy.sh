#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Caddy\n\n"

execute "curl https://getcaddy.com | bash -s personal"

execute "sudo setcap cap_net_bind_service=+ep /usr/local/bin/caddy"
