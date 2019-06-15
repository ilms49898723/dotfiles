#!/usr/bin/env bash

set -x

echo 'Note: git must be installed first'

echo 'Clone zsh-autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo 'Clone zsh-syntax-highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
