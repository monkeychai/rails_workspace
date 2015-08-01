#!/bin/bash

echo "010 - Create a .gemrc to set --no-document"
echo "---"

source /home/vagrant/.bash_profile

# Don't install docs for any gems
gemfile='/home/vagrant/.gemrc'
if [[ -f $gemfile ]]; then
    echo "Found a .gemrc."
    if [[ -z $(grep -q 'no-document' $gemfile) ]]; then
        echo "Appending no-document option to .gemrc..."
        echo "gem: --no-document" >> $gemfile
    else
        echo "no-document option already present."
    fi
else
    echo "Creating .gemrc..."
        cat <<EOF > $gemfile
gem: --no-document
EOF
fi