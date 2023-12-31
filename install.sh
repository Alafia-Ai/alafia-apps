#!/bin/bash

# install.sh

# Enable the building of cross-platform docker images
docker run --privileged --rm tonistiigi/binfmt --install all

# Exit immediately if a command exits with a non-zero status.
set -e

# Get the path to the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Loop through each subdirectory in app-root
for d in "$DIR"/*/ ; do
    # Enter the directory
    cd "$d"
    echo "Entering directory $d"

    # Check if Makefile exists
    if [ -f Makefile ]; then
        # Run make and make install
        make
        make install
    else
        echo "No Makefile found in $d"
    fi

    # Go back to the app-root directory
    cd "$DIR"
done

echo "Installation complete. Restart the computer to start Alafia network apps automatically."

