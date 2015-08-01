#!/bin/bash

echo "150 - Install Ruby"
echo "---"

source /home/vagrant/.bash_profile

#
# Install rbenv and ruby-build if not already installed
#
if [[ ! -x $(which rbenv) ]]; then
    echo "Need to install rbenv..."

    cd /home/vagrant
    if [[ ! -d .rbenv ]]; then
        echo "Cloning rbenv repo..."
        git clone git://github.com/sstephenson/rbenv.git .rbenv &>/dev/null
    else
        echo ".rbenv already exists at $(pwd)"
    fi

    if [[ -n $(grep -q 'rbenv init' ~/.bash_profile) ]]; then
        echo "rbenv already in bash_profile."
    else
        echo "Adding rbenv to PATH and bash_profile..."
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
        echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
        source ~/.bash_profile
    fi

    # if [[ -n $(sudo grep -q 'rbenv init' /root/.bashrc) ]]; then
    #     echo "rbenv already in root's .bashrc."
    # else
    #     echo "Adding rbenv to PATH and root's .bashrc..."
    #     sudo echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /root/.bashrc
    #     sudo echo 'eval "$(rbenv init -)"' >> /root/.bashrc
    #     sudo source /root/.bashrc &>/dev/null
    # fi

    if [[ ! -d ~/.rbenv/plugins/ruby-build ]]; then
        echo "Cloning ruby-build repo..."
        git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build &>/dev/null
    else
        echo "ruby-build plugin already exists."
    fi

    if [[ -n $(grep -q 'ruby-build' ~/.bash_profile) ]]; then
        echo "ruby-build already in bash_profile"
    else
        echo "Adding ruby-build to PATH and bash_profile"
        echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
        source ~/.bash_profile &>/dev/null
    fi

    # if [[ -n $(sudo grep -q 'ruby-build' /root/.bashrc) ]]; then
    #     echo "ruby-build already in root's .bashrc"
    # else
    #     echo "Adding ruby-build to PATH and root's .bashrc"
    #     sudo echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc
    #     sudo source /root/.bashrc &>/dev/null
    # fi
else
    echo "rbenv is already installed."
fi

#
# Install Ruby version 2.2.2
#
VERSION_TO_INSTALL='2.2.2'
if [[ $(ruby --version) =~ "$VERSION_TO_INSTALL" ]]; then
    echo "Ruby already installed."
else
    echo "Installing Ruby $VERSION_TO_INSTALL..."
    echo "(This bit takes a *while*, get some coffee or make yourself some chai)"
    echo "rbenv is located at: $(which rbenv)"
    rbenv install -v $VERSION_TO_INSTALL &>/dev/null
    rbenv global $VERSION_TO_INSTALL &>/dev/null
    if [[ $(ruby --version) =~ "$VERSION_TO_INSTALL" ]]; then
        echo "Ruby installed."
    else
        echo "rbenv didn't install the required version of Ruby"
        exit 1
    fi
fi