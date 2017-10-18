# .zshrc

# colors
autoload -Uz colors
colors

# emacs-like key binding
bindkey -e

# history
HISTFILE=~/.zsh_history
HISTSIZE=1024
SAVEHIST=2048

# prompt
PROMPT=$'\n%{\e[01;32m%}%n%{\e[00m%}:%{\e[01;34m%}%~%{\e[00m%}$ '

# word
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " ,./|:;()[]{}+-=_@"
zstyle ":zle:*" word-style unspecified

# auto-completion
autoload -Uz compinit
compinit
zstyle ":completion:*" matcher-list 'm:{a-z}={A-Z}'

# cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs
autoload -Uz cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":completion:*" recent-dirs-insert both
zstyle ":chpwd:*" recent-dirs-max 1024
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":chpwd:*" recent-dirs-pushd true

# zmv
autoload -Uz zmv

# common settings
setopt no_beep

setopt print_eight_bit

setopt no_flow_control

setopt ignore_eof

setopt interactive_comments

setopt auto_pushd
setopt pushd_ignore_dups

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

setopt extended_glob

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh alias
[ -f ~/.zalias ] && source ~/.zalias

# zsh-auto-suggestion
if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
ZSH_HIGHLIGHT_STYLES[path]=''

# Editor environment variables
export EDITOR='vim'

# Filter environment variables
export FILTER='fzf'

# Pager settings
export LESS='ij.5KMRX'
export PAGER='less'

# locale settings
export LANG="ja_JP.UTF-8"
export LC_COLLATE="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LC_MESSAGES="ja_JP.UTF-8"
export LC_MONETARY="ja_JP.UTF-8"
export LC_NUMERIC="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"
