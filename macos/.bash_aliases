# Aliases

# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# sudo
alias please='sudo'

# easy navigation
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# archives
alias mktar='tar pvczf'
alias untar='tar xf'

# enable color support of ls and also add handy aliases
alias ls='ls -FG'
alias dir='ls -FG'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias l='ls -CFG'
alias la='ls -AG'
alias ll='ls -alFG'

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort

# vi -> vim
# use the version located in /usr/local/bin
alias vi='/usr/local/bin/vim -p'
# vim use tabs by default
alias vim='/usr/local/bin/vim -p'

# tree alias
alias tree='tree -C -N'

# ipython
# only alias for ipython with python3
alias ipython='python3 -m IPython'
alias ipython3='python3 -m IPython'
