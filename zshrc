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
autoload gitclone
autoload macd

# Add local python functions to the path.
add_to_path ~/.local/bin

# Source virtualenvwrapper if it exists.
VIRTUALENVWRAPPER_DEFAULT_PATH=/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
if [[ -f ${DL93_VIRTUALENVWRAPPER_PATH:-$VIRTUALENVWRAPPER_DEFAULT_PATH} ]]; then
    source ${DL93_VIRTUALENVWRAPPER_PATH:-$VIRTUALENVWRAPPER_DEFAULT_PATH}
fi
