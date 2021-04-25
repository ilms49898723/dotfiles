# zprofile

# NVIDIA Cuda 10.0
PATH="/usr/local/cuda-10.0/bin:${PATH}"
export PATH
LD_LIBRARY_PATH="/usr/local/cuda-10.0/lib64:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH

# linux local bin (user)
PATH="${HOME}/.local/bin:${PATH}"
export PATH

# /usr/local/sbin
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

# zip
PATH="/usr/local/opt/zip/bin:${PATH}"
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
GOPATH="${HOME}/.golang:${HOME}/Workspace/golang"
export PATH
export GOPATH

# PATH for MATLAB
PATH="/Applications/MATLAB_R2017b.app/bin:${PATH}"
export PATH

# Setting PATH for Python 3.9
PATH="${HOME}/Library/Python/3.9/bin:${PATH}"
export PATH

# Setting fzf environment variables
FZF_DEFAULT_COMMAND='rg --files'
FZF_DEFAULT_OPTS='--multi --no-mouse --height=17 --reverse --inline-info --tabstop=4'
export FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS

FZF_COMPLETION_OPTS='--preview='\''[ -f {} ] && file -b {} && [[ "$(file -b {})" =~ "text" ]] && echo && head -13 {}'\'''
export FZF_COMPLETION_OPTS

FZF_CTRL_T_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND

# Homebrew
fpath=(/usr/local/share/zsh/site-functions $fpath)

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
