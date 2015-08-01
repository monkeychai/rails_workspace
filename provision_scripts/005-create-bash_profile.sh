#!/bin/bash

echo "005 - Create a .bash_profile for user 'vagrant'"
echo "---"

# Don't install docs for any gems
bash_profile='/home/vagrant/.bash_profile'
if [[ -f $bash_profile ]]; then
    echo ".bash_profile already exists."
else
    echo "Creating a .bash_profile..."
    touch $bash_profile
fi