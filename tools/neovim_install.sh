#!/bin/sh

if [ -d install ]; then
    echo "Directory './install/' already exists."
    echo "Abort."
    exit
fi

mkdir install
cd install/

wget "https://github.com/neovim/neovim/archive/stable.tar.gz"
tar xf stable.tar.gz

cd neovim-stable/
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME/.local"
make install

cd ..
cd ..

if [ -d install ]; then
    rm -rf install/
fi

pip3 install --user --upgrade pynvim
pip3 install --user --upgrade jedi
