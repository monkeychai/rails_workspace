#!/bin/bash

echo "200 - Install Rails"
echo "---"

source /home/vagrant/.bash_profile

#
# Install Gems
#

# Gems are expected to be in either of these two formats:
#  1. "gem_name" e.g. "bundler", "rails"
#  2. "gem_name (0.0.0)" e.g. "rails (4.2.3)"
#
gems=()
gems+=("bundler")
gems+=("rails (4.2.3)")

echo "Using this gem binary: $(which gem)"
for gem in "${gems[@]}"; do
    if [[ -n "$(gem list --local | grep "$gem")" ]]; then
        echo "$gem already installed."
    else
        echo "Installing $gem..."
        gem_name=`echo $gem | cut -d' ' -f 1`
        gem_version=`echo $gem2 | cut -d' ' -f 2 | sed 's/[\(\)]//g'`
        if [[ -n $gem_version ]]; then
            gem install $gem_name -v $gem_version &>/dev/null
        else
            gem install $gem_name &>/dev/null
        fi
    fi
done