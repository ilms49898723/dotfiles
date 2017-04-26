# Aliases

# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

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
alias ls='ls -F --color=auto'
alias dir='ls -F --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alF --color=auto'

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
alias gdf='env LC_ALL=C /usr/local/bin/df'    # gnu df

# vi -> vim
# use tabs by default
alias vi='vim -p'
alias vim='vim -p'

# tree alias
alias tree='tree -C -N'

# matlab
alias matlab-cli='matlab -nodesktop -nosplash'
