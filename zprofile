#!/usr/bin/env zsh

fpath=( ~/repos/dotfiles "${fpath[@]}" )

autoload add_to_path
autoload add_to_ld_path

# Library load path
add_to_ld_path "/usr/local/arrayfire/lib"
add_to_ld_path "/usr/local/cuda/lib64"
add_to_ld_path "/usr/local/cuda/nvvm/lib64"


export WORKON_HOME=~/.envs