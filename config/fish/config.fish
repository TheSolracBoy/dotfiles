
if status is-interactive
end
set fish_greeting


export BUN_INSTALL="$HOME/.bun"
export CONFIG_DIR="$HOME/.config/lazygit"


# Path
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/Cellar/:$PATH"



#requires zoxide and starship
zoxide init fish | source
starship init fish | source

alias vim nvim


#requires kmonad executable on path
alias la "sudo kmonad ~/dotfiles/keyboard/kmonad/colemak.kbd"
