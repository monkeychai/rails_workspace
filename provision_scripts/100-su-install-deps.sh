#!/bin/bash

echo "100 - Install dependencies for Ruby"
echo "---"

#
# Install Dependencies
#
# (Run quietly)

dependencies=()
dependencies+=('git-core' 'curl' 'zlib1g-dev' 'build-essential' 'libssl-dev')
dependencies+=('libreadline-dev' 'libyaml-dev' 'libsqlite3-dev' 'libxml2-dev')
dependencies+=('libxslt1-dev' 'libcurl4-openssl-dev' 'libffi-dev')
dependencies+=('python-software-properties' 'libpq-dev')

to_install=()

for dep in "${dependencies[@]}"; do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $dep 2>/dev/null | grep "install ok installed") &>/dev/null
    if [[ -z $PKG_OK ]]; then
        to_install+=("$dep")
    fi
done

if [ ${#to_install[@]} -eq 0 ]; then
    echo "All dependencies already installed."
else
    echo "Updating apt-get..."
    apt-get -yq update &>/dev/null
    for dep in "${to_install[@]}"; do
        echo "Installing $dep..."
        apt-get -yq install $dep &>/dev/null
    done
fi