#!/bin/bash

$scripts_dir='./provision_scripts'

# Provision scripts are run in the
# order of the 3 digit prefix in
# the script's filename
for script in "$scripts_dir/*"; do
    sh $script
done