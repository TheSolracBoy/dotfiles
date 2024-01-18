# Created by newuser for 5.9

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/c/Users/carlo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


#Constants
target_folder="~/.erasedFiles"

#PATH
export PATH=$PATH:~/.local/bin

#ALIAS
alias rm="mv -t $target_folder"
alias RM="\rm"

#Automatic scripts
~/dotfiles/shellScripts/erase_recycle_bin.sh
