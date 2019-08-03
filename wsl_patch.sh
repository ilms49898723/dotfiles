#!/bin/sh

echo 'Patch for WSL'

if [ -f ${HOME}/.bashrc ]; then
    echo 'Info: Updating bashrc...'

    if grep -q 'bash -c zsh' ${HOME}/.bashrc; then
        echo 'Info: Patched. Skip.'
    else
        echo '' >> ${HOME}/.bashrc
        echo 'export SHELL=/usr/bin/zsh' >> ${HOME}/.bashrc
        echo '' >> ${HOME}/.bashrc
        echo 'cd ${HOME}' >> ${HOME}/.bashrc
        echo 'bash -c zsh' >> ${HOME}/.bashrc
    fi
else
    echo 'Warning: .bashrc not found in home directory.'
fi

if [ -f ${HOME}/.zshrc ]; then
    echo 'Info: Updating zshrc...'

    if grep -q 'source ~/.zprofile' ${HOME}/.zshrc; then
        echo 'Info: Patched. Skip.'
    else
        echo '' >> ${HOME}/.zshrc
        echo 'if [ -f ~/.zprofile ]; then' >> ${HOME}/.zshrc
        echo '    source ~/.zprofile' >> ${HOME}/.zshrc
        echo 'fi' >> ${HOME}/.zshrc
    fi
else
    echo 'Warning: .zshrc not found in home directory'
fi

if [ -f ${HOME}/.config/nvim/init.vim ]; then
    echo 'Info: Updating init.vim...'

    if grep -q 'vert:\\|' ${HOME}/.config/nvim/init.vim; then
        echo 'Info: Patched. Skip.'
    else
        sed -i '/^set fillchars=.*$/ s/$/,vert:\\|/' ${HOME}/.config/nvim/init.vim
    fi
fi
