#!/usr/bin/env zsh

function add_to_ld_path {
    if [ -d $1 ] ; then
        export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH"
    fi
}

add_to_ld_path "/usr/local/lib"
add_to_ld_path "/usr/local/arrayfire/lib"
add_to_ld_path "/usr/local/cuda/lib64"
add_to_ld_path "/usr/local/cuda/nvvm/lib64"

# Virtualenvwraper.
# Don't forget to add a local "source <path-to-virtualenvwrapper.sh>"
export WORKON_HOME="~/envs"
