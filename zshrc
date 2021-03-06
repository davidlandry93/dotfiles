#!/usr/bin/env zsh

# Load my custom functions
autoload add_to_path add_to_ld_path cbcopy gitclone grecov jobstat lcmake macd rmkcd

unsetopt auto_cd
cdpath=($HOME $HOME/repos)

# Configure oh-my-zsh
export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"
COMPLETION_WAITING_DOTS="true"

plugins=(git fasd)


source $ZSH/oh-my-zsh.sh

python3 $HOME/repos/dotfiles/check_repos $DL93_REPOS_TO_UPDATE

# Source virtualenvwrapper if it exists.
VIRTUALENVWRAPPER_DEFAULT_PATH=/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
if [[ -f ${DL93_VIRTUALENVWRAPPER_PATH:-$VIRTUALENVWRAPPER_DEFAULT_PATH} ]]; then
    source ${DL93_VIRTUALENVWRAPPER_PATH:-$VIRTUALENVWRAPPER_DEFAULT_PATH}
fi

# Load ROS distros.
# Ex. There could be a DL93_ROS_DISTRO=kinetic
# in the local file.
if [ ! -z $DL93_ROS_DISTRO ] ; then
    source /opt/ros/$DL93_ROS_DISTRO/setup.zsh
fi
