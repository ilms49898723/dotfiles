#!/bin/sh

if [ -d temp ]; then
    echo "Directory ./temp/ already exists."
    echo "Failed to create temporary directory."
    echo "Abort."
    exit
fi

mkdir temp
cd temp/

wget "https://github.com/neovim/neovim/archive/stable.tar.gz"
tar xf stable.tar.gz

cd neovim-stable/
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME/.local"
make install

cd ..
cd ..

if [ -d temp ]; then
    rm -rf temp/
fi

pip3 install --user --upgrade pynvim
pip3 install --user --upgrade jedi
