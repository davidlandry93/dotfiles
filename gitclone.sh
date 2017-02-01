#!/usr/bin/env bash

GITHUB_USERNAME=davidlandry93

gitclone() {
    if [ -z "$1" ];
    then echo "usage: gitclone <name_of_repo>";
    else git clone git@github.com:$GITHUB_USERNAME/$1;
    fi
}
