#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.

##########################
# Environment Variabless #
##########################

#History setup
SAVEHIST=$HISTSIZE

# Prefer English and use UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

#History setup
HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
export HISTCONTROL=ignoredups

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

##################
# Antibody Setup #
##################
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
DISABLE_AUTO_UPDATE="true"

source <(antibody init)

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

source ~/.zsh_plugins.sh

#######
# Fzf #
#######
[ -f /usr/bin/fzf ] &&
    source /usr/share/fzf/completion.zsh
[ -f /usr/bin/fzf ] &&
    source /usr/share/fzf/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source "$HOME/.config/shortcutrc" # Load shortcut aliases
source "$HOME/.config/aliasrc"


#############
# Functions #
#############
# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

function homestead() {
    ( cd ~/.Homestead && vagrant $* )
}


eval "$(starship init zsh)"
