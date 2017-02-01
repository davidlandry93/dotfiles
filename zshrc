
# Configure oh-my-zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh


# Load my custom functions

fpath=( ~/repos/dotfiles "${fpath[@]}" )
autoload gitclone
