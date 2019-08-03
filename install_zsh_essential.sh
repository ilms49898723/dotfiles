#!/bin/sh

type git > /dev/null 2>&1 || { echo >&2 'Error: git not found in current $PATH. Exit!'; exit 1; }

echo "Clone and install zsh-autosuggestions to ${HOME}"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "Clone and install zsh-syntax-highlighting to ${HOME}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
