# Source ~/.bashrc if exists
if [ -f "${HOME}/.bashrc" ]; then
    source ${HOME}/.bashrc
fi

# bash-completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# gnu coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu findutils
PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu make
PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/make/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu bison
PATH="/usr/local/opt/bison/bin:${PATH}"
export PATH

# flex
PATH="/usr/local/opt/flex/bin:${PATH}"
export PATH

# curl
PATH="/usr/local/opt/curl/bin:${PATH}"
export PATH

# openssl 1.1
PATH="/usr/local/opt/openssl@1.1/bin:${PATH}"
export PATH

# PATH for MATLAB
PATH="/Applications/MATLAB_R2017b.app/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
PATH="${HOME}/Library/Python/3.6/bin:${PATH}"
export PATH

# Go Environment Variables
PATH=${PATH}:/usr/local/opt/go/libexec/bin
GOPATH=${HOME}/.go:${HOME}/Workspace/go
export PATH
export GOPATH

