#!/bin/sh

set -x

cp .[^.]* ${HOME}/

mkdir -p ${HOME}/.config/nvim/
cp ./init.vim ${HOME}/.config/nvim/

mkdir -p ${HOME}/.config/nvim/after/syntax
cp ./nvim/after/syntax/* ${HOME}/.config/nvim/after/syntax/
