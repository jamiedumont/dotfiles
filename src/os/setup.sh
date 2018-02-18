#!/bin/bash

declare -r GITHUB_REPO="jamiedumont/dotfiles-in-progress"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPO.git"

declare dotfilesDirectory="$HOME/dotfiles"
declare skipQuestions=false


# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {

    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then

        curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

        return $?

    elif command -v "wget" &> /dev/null; then

        wget -qO "$output" "$url" &> /dev/null
        #     │└─ write output to file
        #     └─ don't show output

        return $?
    fi

    return 1

}


verify_os() {

    declare -r MINIMUM_MACOS_VERSION="10.10"
    declare -r MINIMUM_UBUNTU_VERSION="14.04"

    local os_name=""
    local os_version=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if the OS is `macOS` and
    # it's above the required version.

    os_name="$(uname -s)"

    if [ "$os_name" == "Darwin" ]; then

        os_version="$(sw_vers -productVersion)"

        if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
            return 0
        else
            printf "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if the OS is `Ubuntu` and
    # it's above the required version.

    elif [ "$os_name" == "Linux" ] && [ -e "/etc/lsb-release" ]; then

        os_version="$(lsb_release -d | cut -f2 | cut -d' ' -f2)"

        if is_supported_version "$os_version" "$MINIMUM_UBUNTU_VERSION"; then
            return 0
        else
            printf "Sorry, this script is intended only for Ubuntu %s+" "$MINIMUM_UBUNTU_VERSION"
        fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    else
        printf "Sorry, this script is intended only for macOS and Ubuntu!"
    fi

    return 1

}




#------
# MAIN
#------

main() {

	# Ensure that the following actions
	# are made relative to this file's path.

	cd "$(dirname "${BASH_SOURCE[0]}")" \
		|| exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# Load utilities

	if [ -x "utils.sh" ]; then
		. "utils.sh" || exit 1
	else
		# Download utils once download written"
		exit 1
	fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Ensure the OS is supported and
  # it's above the required version.

   verify_os \
     || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./create_symbolic_links.sh "$@"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./install/main.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


}


main "$@"
