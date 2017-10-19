# .zshrc

# colors
autoload -Uz colors
colors

# emacs-like key binding
bindkey -e

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=2048
export SAVEHIST=2048
export LISTMAX=2048

# prompt
PROMPT=$'\n%{\e[01;32m%}%n%{\e[00m%}:%{\e[01;34m%}%~%{\e[00m%}$ '

# word
autoload -Uz select-word-style
select-word-style default
zstyle ":zle:*" word-chars " ,./|:;()[]{}<>~+-=_!@#$%^&*?"
zstyle ":zle:*" word-style unspecified
export WORDCHARS=" ,./|:;()[]{}<>~+-=_!@#$%^&*?"

# auto-completion
if [[ ! -d "${HOME}/.cache/zsh-completion" ]]; then
    mkdir -p "${HOME}/.cache/zsh-completion"
fi
autoload -Uz compinit
compinit
zstyle ":completion:*:default" menu select=2
zstyle ":completion:*:options" description "yes"
zstyle ":completion:*:descriptions" format "%F{yellow}Completing %B%d%b%f"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" verbose yes
zstyle ":completion:*" completer _expand _complete _match _prefix _approximate _list
zstyle ":completion:*" use-cache true
zstyle ":completion:*" cache-path "${HOME}/.cache/zsh-completion"
zstyle ":completion:*:*:-subscript-:*" tag-order indexes parameters
zstyle ":completion:*" list-separator "-->"
zstyle ":completion:*:manuals" separate-sections true
# LS_COLORS
export CLICOLOR=1
eval $(dircolors -b)
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# cdr
if [[ ! -d "${HOME}/.cache/zsh-cdr" ]]; then
    mkdir -p "${HOME}/.cache/zsh-cdr"
fi
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs
autoload -Uz cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":completion:*" recent-dirs-insert both
zstyle ":chpwd:*" recent-dirs-max 2048
zstyle ":chpwd:*" recent-dirs-file "${HOME}/.cache/zsh-cdr/recent-dirs"
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":chpwd:*" recent-dirs-pushd true

# zmv
autoload -Uz zmv

# misc
autoload -Uz modify-current-argument
autoload -Uz terminfo
autoload -Uz vcs_info
autoload -Uz zcalc

autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn

autoload -Uz edit-command-line
zle -N edit-command-line

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word

# common settings
setopt no_beep
setopt no_list_beep

setopt print_eight_bit
setopt combining_chars

setopt no_flow_control

setopt ignore_eof

setopt interactive_comments

setopt auto_pushd
setopt pushd_ignore_dups

setopt equals

setopt append_history
setopt share_history
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_history

setopt correct

setopt extended_glob

setopt complete_aliases

setopt auto_menu
setopt auto_list
setopt list_packed
setopt list_types
setopt prompt_subst
setopt magic_equal_subst

setopt no_auto_remove_slash
setopt notify
setopt auto_param_slash
setopt mark_dirs
setopt complete_in_word

setopt always_last_prompt
setopt transient_rprompt

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
