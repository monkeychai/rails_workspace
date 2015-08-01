#!/bin/bash

echo "400 - Install Postgresql"
echo "---"

#
# Install Postgresql
#

dependencies=()
dependencies+=('postgresql' 'postgresql-contrib')

to_install=()

for dep in "${dependencies[@]}"; do
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $dep 2>/dev/null | grep "install ok installed")
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

# Create a new user (a.k.a role) and give them createdb permissions

# First assume the persona of the default postgres superuser
su postgres <<EOF
psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='vagrant'" | grep -q 1 || createuser -sd vagrant
EOF