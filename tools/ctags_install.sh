#!/bin/sh

if [ -d install ]; then
    echo "Directory './install/' already exists."
    echo "Abort."
    exit
fi

mkdir install
cd install/

git clone "https://github.com/universal-ctags/ctags.git"

cd ctags/
./autogen.sh
./configure --prefix="$HOME/.local"
make
make install

cd ..
cd ..

if [ -d install ]; then
    rm -rf install/
fi
