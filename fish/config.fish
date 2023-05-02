if status is-interactive
  fastfetch
    # Commands to run in interactive sessions can go here
end

## Hide welcome message
set fish_greeting

## Source .profile to apply its values
# source ~/.profile


function fish_user_key_bindings
  fish_vi_key_bindings
end

starship init fish | source
zoxide init fish | source


# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# Define the function that creates the tmux session and opens neovim and lazygit
# Definir la función que crea la sesión de tmux y abre neovim y lazygit
function tmux_new_session
  # Obtener el nombre personalizado de la sesión (si se ha proporcionado)
  set nombre_sesion $argv[1]

  # Si no se ha proporcionado un nombre personalizado, usar uno predeterminado
  if test -z "$nombre_sesion"
    set nombre_sesion "mi_sesion"
  end

  # Verificar si la sesión ya existe
  if tmux has-session -t "$nombre_sesion" > /dev/null 2>&1
    tmux attach-session -t "$nombre_sesion"
  else    # Crear una nueva sesión de tmux
    tmux new-session -s "$nombre_sesion" -d

    # Correr Neovim en la primera ventana
    tmux send-keys -t "$nombre_sesion":0.0 "nvim" Enter

    tmux new-window -t "$nombre_sesion" -n MiOtraVentana

    # Crear una nueva ventana llamada Git y correr Lazygit
    tmux new-window -t "$nombre_sesion" -n Git
    tmux send-keys -t "$nombre_sesion":2 "lazygit" Enter

    # Crear un split horizontal en la ventana de Git
    tmux split-window -t "$nombre_sesion":2
    # Obtener el tamaño actual del panel vertical en líneas
    tmux resize-pane -t "$nombre_sesion":2.1 -y 2
    # Seleccione el panel de lazygit
    tmux select-pane -t "$nombre_sesion":2.0

    tmux select-window -t "$nombre_sesion":0

    tmux attach-session -t "$nombre_sesion"
  end
end

if test -d ~/go/bin
    set -x PATH ~/go/bin $PATH
end
set -x PATH ~/.local/ $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.cargo/bin/ $PATH
set -x PATH ~/.local/share/nvim/mason/bin/ $PATH
set -x PATH ~/.local/go/bin/ $PATH
set -x PATH ~/.config/emacs/bin/ $PATH
set -x PATH ~/flutter/bin/ $PATH

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

set -Ux ANDROID_HOME $HOME/Library/Android/sdk
set -U fish_user_paths $ANDROID_HOME/emulator $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/tools $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/tools-bin $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths

# set -x PATH ~/dev/ucr/insecure-ring/build/ $PATH
# export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

  
# Create an alias for the function
alias tn tmux_new_session
alias .. "cd .."
alias cl clear
alias emacs "emacs -nw"