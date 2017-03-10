#!/usr/bin/env zsh

# Load my custom functions
autoload add_to_path
autoload add_to_ld_path
autoload cbcopy
autoload gitclone
autoload macd

# Configure oh-my-zsh
export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Source virtualenvwrapper if it exists.
VIRTUALENVWRAPPER_DEFAULT_PATH=/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
if [[ -f ${DL93_VIRTUALENVWRAPPER_PATH:-$VIRTUALENVWRAPPER_DEFAULT_PATH} ]]; then
    source ${DL93_VIRTUALENVWRAPPER_PATH:-$VIRTUALENVWRAPPER_DEFAULT_PATH}
fi
