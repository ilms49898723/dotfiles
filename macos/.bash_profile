# source ~/.bashrc if exists
if [ -f "${HOME}/.bashrc" ]; then
    source ${HOME}/.bashrc
fi

# bash-completion
if [ -f "/usr/local/share/bash-completion/bash_completion" ]; then
    . /usr/local/share/bash-completion/bash_completion
fi

# PATH for MATLAB
PATH="/Applications/MATLAB_R2016b.app/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting Gradle Environment Variables
GRADLE_HOME="${HOME}/gradle"
export GRADLE_HOME

# Setting PATH for Gradle
PATH="${GRADLE_HOME}/bin:${PATH}"
export PATH

# Go Environment Variables
GOPATH=$HOME/.go:$HOME/Workspace/go
export GOPATH

# Tex PATH
PATH="/usr/local/texlive/2016/bin/x86_64-darwin:${PATH}"
export PATH

# Qt PATH
PATH="/usr/local/Qt/5.8/clang_64/bin:${PATH}"
export PATH

# GNU binutils PATH
PATH="/usr/local/gnu/bin:${PATH}"
export PATH

# GNU GCC PATH
PATH="/usr/local/gcc/bin:${PATH}"
export PATH
