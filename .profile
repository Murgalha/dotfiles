#!/bin/sh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export SCRIPTS="$HOME/.scripts"
export PATH="$PATH:$SCRIPTS"

export ALTERNATE_EDITOR=''
export EDITOR="emacsclient -cn"
export TERMINAL="st"
export BROWSER="firefox"

# change GNUPGHOME to use ~/.config/gnupg instead of ~/.gnupg
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
