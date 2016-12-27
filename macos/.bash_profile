# source ~/.bashrc if exists
if [ -f "${HOME}/.bashrc" ]; then
    source ${HOME}/.bashrc
fi

# bash-completion
if [ -f "/usr/local/share/bash-completion/bash_completion" ]; then
    . /usr/local/share/bash-completion/bash_completion
fi

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting Gradle Environment Variables
GRADLE_HOME="${HOME}/gradle"
export GRADLE_HOME

# Setting PATH for Gradle
PATH="${PATH}:${GRADLE_HOME}/bin"
export PATH

# Go Environment Variables
GOPATH=$HOME/.go:$HOME/Workspace/go
export GOPATH
