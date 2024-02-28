eval "$(starship init bash)"
eval "$(zoxide init bash)"

# Add the following content
if [ -t 1 ]; then
  exec zsh
fi

. "$HOME/.cargo/env"
