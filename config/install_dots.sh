#!/bin/sh

set -x

cp .[^.]* ${HOME}/

mkdir -p ${HOME}/.config/nvim/
cp ./init.vim ${HOME}/.config/nvim/
