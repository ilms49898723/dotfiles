#!/bin/sh

if [ -d temp ]; then
    echo "Directory ./temp/ already exists."
    echo "Failed to create temporary directory."
    echo "Abort."
    exit
fi

mkdir temp
cd temp/

git clone "https://github.com/universal-ctags/ctags.git"

cd ctags/
./autogen.sh
./configure --prefix="$HOME/.local"
make
make install

cd ..
cd ..

if [ -d temp ]; then
    rm -rf temp/
fi
