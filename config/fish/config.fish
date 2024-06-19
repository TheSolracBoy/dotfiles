
if status is-interactive
end
set fish_greeting

set -x COLEMAK_MODE "true"

export BUN_INSTALL="$HOME/.bun"
export CONFIG_DIR="$HOME/.config/lazygit"


# Path
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/Cellar/:$PATH"
export PATH="/usr/local/Cellar/postgresql@15/15.7/bin:$PATH"

#set nvim in colemak mode or in qwertyMode

function start_nvim_with_qwerty
    set -x COLEMAK_MODE "false" && nvim
end

function start_nvim_with_colemak
    set -x COLEMAK_MODE "true" && nvim
end


#requires zoxide and starship
zoxide init fish | source
starship init fish | source
function dev
    # Save the current directory
    set prev_dir (pwd)

    # Run fzf to select a directory from ~/dev
    set selected_dir (cd ~/dev; fdfind --type d --strip-cwd-prefix | fzf)

    # Check the exit status of fzf
    if test $status -eq 0
        # If fzf was successful (i.e., a selection was made), change to the selected directory
        cd ~/dev/$selected_dir
    else
        # If fzf was cancelled (non-zero exit status), change to the previous directory
        cd $prev_dir
    end
end
 
function cdd 
    set selected_dir (cd ~; fdfind -H --type d --strip-cwd-prefix | fzf)
    # Check the exit status of fzf
    if test $status -eq 0
        # If fzf was successful (i.e., a selection was made), change to the selected directory
        cd ~/$selected_dir
    end
end
    

function n
    # Save the current directory
    set prev_dir (pwd)

    # Run fzf to select a directory from ~/dev
    set selected_file (cd ~; fdfind -H --type f --strip-cwd-prefix | fzf)

    # Check the exit status of fzf
    if test $status -eq 0
        # If fzf was successful (i.e., a selection was made), change to the selected directory
        nvim ~/$selected_file
    else
        # If fzf was cancelled (non-zero exit status), change to the previous directory
        cd $prev_dir
    end
end

function clone
    set repo (gh repo list --limit 100 | fzf --prompt="Select a repository to clone: " | awk '{print $1}')
    if test -n "$repo"
        gh repo clone "$repo"
    else
        echo "No repository selected."
    end
end




alias vimc 'start_nvim_with_colemak'
alias vimq 'start_nvim_with_qwerty'
alias vim nvim

alias pomodoro "timer 30m && terminal-notifier -message 'TAKE CARE OF YOUR EYES' \
    -title 'Work timer is up! Take a break'\
    -sound Crystal "


#requires kmonad executable on path
alias qwerty "sudo kmonad ~/dotfiles/keyboard/kmonad/qwerty.kbd"
alias dvorack "sudo kmonad ~/dotfiles/keyboard/kmonad/dvorak.kbd"
alias colemak "sudo kmonad ~/dotfiles/keyboard/kmonad/colemak.kbd"
