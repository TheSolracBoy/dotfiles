#!/bin/bash


# Get the absolute path to the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Function to create symbolic links
create_for_file() {
  local source="$1"
  local target="$2"

  echo "$target"
  echo "$source"

  if [ -e "$target" ]; then
    echo ""
    echo "Backing up existing file: $target"
    mv "$target" "${target}.backup"
    echo ""
  fi

    echo ""
  ln  -s "$source" "$target"
  echo "Created link: $target -> $source"
    echo ""
}





  create_for_file "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
  create_for_file "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
  create_for_file "$HOME/dotfiles/config/wezterm/wezterm.lua" "$HOME/.wezterm.lua"
  create_for_file "$HOME/dotfiles/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
  create_for_file "$HOME/dotfiles/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
# else
#   echo "Unsupported operating system: $OSTYPE"
#   exit 1
# fi

