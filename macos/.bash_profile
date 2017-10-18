# bash-completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# Source ~/.bashrc if exists
if [ -f "${HOME}/.bashrc" ]; then
    source ${HOME}/.bashrc
fi

PATH="/usr/local/sbin:${PATH}"
export PATH

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

# gnu inetutils
PATH="/usr/local/opt/inetutils/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/inetutils/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu make
PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/make/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu tar
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:${MANPATH}"
export PATH
export MANPATH

# gnu bison
PATH="/usr/local/opt/bison/bin:${PATH}"
export PATH

# flex
PATH="/usr/local/opt/flex/bin:${PATH}"
export PATH

# unzip
PATH="/usr/local/opt/unzip/bin:${PATH}"
export PATH

# curl
PATH="/usr/local/opt/curl/bin:${PATH}"
export PATH

# openssl 1.1
PATH="/usr/local/opt/openssl@1.1/bin:${PATH}"
export PATH

# Go Environment Variables
PATH="/usr/local/opt/go/libexec/bin:${PATH}"
GOPATH="${HOME}/.go:${HOME}/Workspace/go"
export PATH
export GOPATH

# PATH for MATLAB
PATH="/Applications/MATLAB_R2017b.app/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
PATH="${HOME}/Library/Python/3.6/bin:${PATH}"
export PATH

# Setting fzf environment variables
FZF_DEFAULT_OPTS='--multi --no-mouse --height=40% --reverse --inline-info --tabstop=4 --preview='\''[ -f {} ] && file {} && [[ "$(file -b {})" =~ "text" ]] && echo && head -11 {}'\'''
export FZF_DEFAULT_OPTS
