# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/connor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#

# Fixing zsh history problems on multiple terminals
setopt inc_append_history
setopt share_history

# Ignore duplicate commands in history file
# setopt histignorealldups

# Fixing some keys inside zsh
autoload -Uz select-word-style
select-word-style bash

# Add highlight enabled tab completion with colors
zstyle ':completion:*' menu select
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Get bash's compgen
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

# Sourcing the different plugins 
# source $HOME/.plugins.zsh

# source fuzzy find
# instructions to install fzf are found on github
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
# end

# ROS setup file
# source /opt/ros/noetic/setup.zsh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# add binaries to $PATH
export PATH=$HOME/.local/bin:$PATH
#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/cuda/bin
#export PATH=$PATH:/usr/local/cuda/bin:/opt/cuda/bin
#export PATH=$PATH:$HOME/.local/bin
# end of $PATH exports

# bash's command not found auto suggest
command_not_found_handler () {
    if [ -x /usr/lib/command-not-found ]
    then
        /usr/lib/command-not-found -- "$1"
        return $?
    else
        if [ -x /usr/share/command-not-found/command-not-found ]
        then
            /usr/share/command-not-found/command-not-found -- "$1"
            return $?
        else
            printf "%s: command not found\n" "$1" >&2
            return 127
        fi
    fi
}

# custom ZSH keybinds
bindkey "^[[1;5L" forward-word
bindkey "^[[1;5H" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# loop through and source all aliases files
for aliases_file in $(\ls -a $HOME | \grep -E "\.aliases.*\.zsh"); do
    source $HOME/$aliases_file
done

# set editor
export EDITOR=nvim

# lf config
# Open directory lf in loaded dir
lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}
zle -N lfcd
# USE LF TO SWITCH DIRECTORIES AND BIND IT TO CTRL-O
 LFCD="/path/to/lfcd.sh"
 if [ -f "$LFCD" ]; then
     source "$LFCD"
 fi

#bind '"\C-o":"lfcd\C-m"'  # bash
bindkey "\C-o" lfcd #zsh
#bindkey -A "^[[1;5o" main #zsh

#fastfetch config
alias 'fastfetch=fastfetch --logo "$HOME/Pictures/3 Resources/snoopy.png" --logo-type "kitty" --logo-preserve-aspect-ratio'

# enable starship
eval "$(starship init zsh)"
