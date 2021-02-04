#!/bin/sh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$PATH:$HOME/bin"

export EDITOR="emacs"
export TERMINAL="st"
export BROWSER="firefox"

# change GNUPGHOME to use ~/.config/gnupg instead of ~/.gnupg
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
