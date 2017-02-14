#!/usr/bin/env zsh

fpath=( ~/repos/dotfiles "${fpath[@]}" )

autoload add_to_path
autoload add_to_ld_path

# Library load path
add_to_ld_path "/usr/local/arrayfire/lib"
add_to_ld_path "/usr/local/cuda/lib64"
add_to_ld_path "/usr/local/cuda/nvvm/lib64"
add_to_ld_path "/opt/pgi/16.10/lib"
add_to_ld_path "/usr/local/lib"

# Path
add_to_path "/opt/pgi/linux86-64/16.10/bin"

# PGI specific variables
if [ ! -z ${DL93_PGI_COMPILER+x} ] ; then
    export PGI=/opt/pgi
    export MANPATH=/opt/pgi/linux86-64/16.10/man:$MANPATH
    export LM_LICENSE_FILE=/opt/pgi/license.dat:$LM_LICENSE_FILE
fi
