#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Docker\n\n"

execute "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"

execute "sudo apt-key fingerprint 0EBFCD88"

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

update

install_package "Docker" "docker-ce"

execute "sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose" "Install docker compose"

execute "sudo chmod +x /usr/local/bin/docker-compose" "Make executable"
