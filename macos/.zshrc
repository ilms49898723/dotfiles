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
zstyle ":zle:*" word-chars " ,./|:;()[]{}<>~+-=_!@#$%^&*?"
zstyle ":zle:*" word-style unspecified
export WORDCHARS=" ,./|:;()[]{}<>~+-=_!@#$%^&*?"

# auto-completion
mkdir -p "${HOME}/.cache/zsh-completion"
autoload -Uz compinit
compinit
zstyle ":completion:*:default" menu select=2
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" verbose yes
zstyle ":completion:*" completer _expand _complete _match _prefix _approximate _list
zstyle ":completion:*" use-cache true
zstyle ":completion:*" cache-path "${HOME}/.cache/zsh-completion"
zstyle ":completion:*:*:-subscript-:*" tag-order indexes parameters
zstyle ":completion:*" list-separator "-->"
zstyle ":completion:*:manuals" seperate-sections true
# LS_COLORS
eval $(dircolors)
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# cdr
mkdir -p "${HOME}/.cache/zsh-cdr"
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs
autoload -Uz cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":completion:*" recent-dirs-insert both
zstyle ":chpwd:*" recent-dirs-max 1024
zstyle ":chpwd:*" recent-dirs-file "${HOME}/.cache/zsh-cdr/recent-dirs"
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":chpwd:*" recent-dirs-pushd true

# zmv
autoload -Uz zmv

# common settings
setopt no_beep

setopt print_eight_bit
setopt combining_chars

setopt no_flow_control

setopt ignore_eof

setopt interactive_comments

setopt auto_pushd
setopt pushd_ignore_dups

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

setopt extended_glob

setopt complete_aliases

setopt auto_menu
setopt auto_list
setopt list_packed
setopt list_types
setopt magic_equal_subst

setopt no_auto_remove_slash
setopt auto_param_slash
setopt mark_dirs
setopt complete_in_word
setopt always_last_prompt

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
