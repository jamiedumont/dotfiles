#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Docker\n\n"

# These should all be present already

# install_package "apt-transport-https" "apt-transport-https"
# install_package "ca-certificates" "ca-certificates"
# install_package "curl" "curl"
# install_package "software-properties-common" "software-properties-common"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

update

install_package "docker-ce" "docker-ce"
