#!/usr/bin/env zsh

autoload add_to_path

# Configure oh-my-zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh


# Export encfs config
export ENCFS6_CONFIG=~/insync/encfs6.xml


# Load my custom functions

fpath=( ~/repos/dotfiles "${fpath[@]}" )
autoload gitclone
autoload macd

# Add local python functions to the path.
add_to_path ~/.local/bin
