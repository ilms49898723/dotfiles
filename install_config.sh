#!/bin/sh

set -x

cp ./config/.[^.]* ${HOME}/

mkdir -p ${HOME}/.config/nvim/
cp ./config/init.vim ${HOME}/.config/nvim/

mkdir -p ${HOME}/.config/nvim/after/syntax/
cp -r ./config/nvim/after/syntax/* ${HOME}/.config/nvim/after/syntax/

mkdir -p ${HOME}/.config/nvim/after/ftplugin/
cp -r ./config/nvim/after/ftplugin/* ${HOME}/.config/nvim/after/ftplugin/

mkdir -p ${HOME}/.tmux.plugin/
cp -r ./config/tmux-plugin/* ${HOME}/.tmux.plugin/
