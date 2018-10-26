#!/usr/bin/env bash

set -x

mkdir "${HOME}/.vim"
mkdir "${HOME}/.vim/autoload"

curl -fLo "${HOME}/.vim/autoload/plug.vim" "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
