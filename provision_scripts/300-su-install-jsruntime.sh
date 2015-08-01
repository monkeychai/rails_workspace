#!/bin/bash

echo "300 - Install a JS Runtime"
echo "---"

#
# Install the NodeJS runtime
#

package='nodejs'

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $package 2>/dev/null | grep "install ok installed")
if [[ -z $PKG_OK ]]; then
    echo "Installing $package..."
    add-apt-repository ppa:chris-lea/node.js &>/dev/null
    apt-get update &>/dev/null
    apt-get -yq install $package &>/dev/null
else
    echo "$package already installed."
fi