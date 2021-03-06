# Aliases

# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# sudo
alias sudo='sudo'

# easy navigation
alias cd..='cd ../'

# easy navigation
alias ..='cd ../'
alias ....='cd ../../'
alias ......='cd ../../../'
alias ........='cd ../../../../'

# archives
alias mktar='tar -czvf'
alias untar='tar -xvf'
alias ltar='tar -tvf'

# enable color support of ls and also add handy aliases
alias ls='ls -F --color=always'
alias dir='ls -F --color=always'

alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

alias diff='diff --color=always'

# some more ls aliases
alias l='ls -CF --color=always'
alias la='ls -A --color=always'
alias ll='ls -alF --color=always'

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

# df aliases
alias df='/bin/df'                            # df in macos

# vi -> vim
# use tabs by default
alias vi='vim -p'
alias vim='vim -p'

alias vifzf='vim -p $(fzf)'
alias vimfzf='vim -p $(fzf)'

# tree alias
alias tree='tree -C -N'

# matlab
alias matlab-cli='matlab -nodesktop -nosplash'
