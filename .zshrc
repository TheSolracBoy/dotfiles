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


# Constants
target_folder="$HOME/.erasedFiles"  # Use $HOME for home directory

# Create the target folder if it doesn't exist
mkdir -p "$target_folder"

#PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin

#ALIAS
#alias rm="mv -t $target_folder"
alias RM="\rm"

rm() {
  mv "$1" "$target_folder/"
}


#CaskaydiaMono Nerd FontAutomatic scripts
~/dotfiles/shellScripts/erase_recycle_bin.sh "$target_folder"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/charlieman/.bun/_bun" ] && source "/Users/charlieman/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"


