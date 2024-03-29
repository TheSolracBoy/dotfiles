
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


#set nvim in colemak mode or in qwertyMode

function start_nvim_with_qwerty
    set -x COLEMAK_MODE "false"
    nvim
end

function start_nvim_with_colemak
    set -x COLEMAK_MODE "true"
    nvim
end


#requires zoxide and starship
zoxide init fish | source
starship init fish | source

alias vim 'start_nvim_with_colemak'
alias vimq 'start_nvim_with_qwerty'


#requires kmonad executable on path
alias qwerty "sudo kmonad ~/dotfiles/keyboard/kmonad/qwerty.kbd"
alias dvorack "sudo kmonad ~/dotfiles/keyboard/kmonad/dvorak.kbd"
alias colemak "sudo kmonad ~/dotfiles/keyboard/kmonad/colemak.kbd"
