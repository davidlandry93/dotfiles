#!/usr/bin/env zsh

fpath=( ~/repos/dotfiles "${fpath[@]}" )

autoload add_to_path
autoload add_to_ld_path

# Add libraries to path if available.
add_to_ld_path "/usr/local/lib"
add_to_ld_path "/usr/local/arrayfire/lib"
add_to_ld_path "/usr/local/cuda/lib64"
add_to_ld_path "/usr/local/cuda/nvvm/lib64"

# Add executables to path if available.
add_to_path "~/.local/bin"

# For virtualenvwrapper
export WORKON_HOME="~/.envs/"

# Load ROS distros.
# Ex. There could be a DL93_ROS_DISTRO=kinetic
# in the local file.
if [ ! -z ${DL93_ROS_DISTRO+x} ] ; then
    source /opt/ros/${DL93_ROS_DISTRO}/setup.zsh
fi

# PGI specific variables
if [[ ${DL93_PGI_COMPILER} ]] ; then
    export PGI=/opt/pgi
    export MANPATH=/opt/pgi/linux86-64/16.10/man:$MANPATH
    export LM_LICENSE_FILE=/opt/pgi/license.dat:$LM_LICENSE_FILE

    add_to_path "/opt/pgi/linux86-64/16.10/bin"
    add_to_ld_path "/opt/pgi/16.10/lib"
fi
