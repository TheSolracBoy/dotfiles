#!/bin/bash


# Get the absolute path to the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Function to create symbolic links
create_for_file() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ]; then
    echo "Backing up existing file: $target"
    mv "$target" "${target}.backup"
  fi

  ln  "$source" "$target"
  echo "Created link: $target -> $source"
}


create_hard_links() {
    source_folder="$1"
    target_folder="$2"

    # Create target folder if it doesn't exist
    mkdir -p "$target_folder"

    # Use find to get a list of all files in the source folder
    find "$source_folder" -type f -print | while read file; do
        # Calculate the relative path of the file from the source folder
        relative_path="${file#$source_folder}"

        # Create the target directory structure
        target_path="$target_folder$relative_path"
        target_directory=$(dirname "$target_path")
        mkdir -p "$target_directory"

        # Create the hard link
        ln "$file" "$target_path"
    done
}



# Check the operating system
if [[ "$OSTYPE" == "linux-gnu"* || "$(uname -a)" =~ "Microsoft" || "$(uname -a)" =~ "WSL" ]]; then
  echo "Detected Linux or WSL"
  create_for_file "./.bashrc" "$HOME/.bashrc"
  create_for_file "./.zshrc" "$HOME/.zshrc"

  # Common Linux/WSL symlinks
#   create_symlink "$SCRIPT_DIR/linux_or_wsl/.bashrc" "$HOME/.bashrc"
#   create_symlink "$SCRIPT_DIR/linux_or_wsl/.vimrc" "$HOME/.vimrc"
  # Add more symlinks as needed

elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected macOS"
  create_for_file "./.bashrc" "$HOME/.bashrc"
  create_for_file "./.zshrc" "$HOME/.zshrc"


elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  echo "Detected Windows"
  echo "Only run in git bash terminal or zsh inside git bash"

  #TERMINAL
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

  # VSCODE
  create_for_file "./vscode/keybinding.json" "$HOME/AppData/Roaming/Code/User/keybindings.json"
  create_for_file "./vscode/settings.json" "$HOME/AppData/Roaming/Code/User/settings.json"

  create_for_file "./.bashrc" "$HOME/.bashrc"
  create_for_file "./.zshrc" "$HOME/.zshrc"


else
  echo "Unsupported operating system: $OSTYPE"
  exit 1
fi

