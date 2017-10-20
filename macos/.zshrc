# .zshrc

# colors
autoload -Uz colors
colors

# emacs-like key binding
bindkey -e

# LS_COLORS
eval $(dircolors -b)
export ZLS_COLORS="${LS_COLORS}"
export CLICOLOR=true

# kernel name
export KERNEL_NAME=$(uname -s)

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=2048
export SAVEHIST=2048

# completion
export LISTMAX=0

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
zstyle ":completion:*:messages" format "%F{cyan}%d%f"
zstyle ":completion:*:warnings" format "%F{red}No matches for:%f %F{yellow}%d%f"
zstyle ":completion:*:corrections" format "%F{yellow}%d%f %F{red}(error: %e)%f"
zstyle ":completion:*:descriptions" format "%F{yellow}Completing %B%d%b%f"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" verbose yes
zstyle ":completion:*" completer _expand _complete _match _prefix _approximate _list _history
zstyle ":completion:*" use-cache true
zstyle ":completion:*" cache-path "${HOME}/.cache/zsh-completion"
zstyle ":completion:*:*:-subscript-:*" tag-order local-directories path-directories indexes parameters
zstyle ":completion:*" list-separator "-->"
zstyle ":completion:*:manuals" separate-sections true
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

# misc
autoload -Uz modify-current-argument
autoload -Uz terminfo
autoload -Uz vcs_info
autoload -Uz zcalc
autoload -Uz zmv

autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn

autoload -Uz edit-command-line
zle -N edit-command-line

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word

zmodload -i zsh/complist
zmodload -i zsh/mathfunc

# common settings
setopt always_last_prompt
setopt append_history
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt auto_pushd
setopt auto_resume
setopt brace_ccl
setopt combining_chars
setopt complete_aliases
setopt complete_in_word
setopt correct
setopt correct_all
setopt equals
setopt extended_glob
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt ignore_eof
setopt interactive_comments
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt mark_dirs
setopt no_auto_remove_slash
setopt no_beep
setopt no_flow_control
setopt no_list_beep
setopt notify
setopt numeric_glob_sort
setopt print_eight_bit
setopt prompt_subst
setopt pushd_ignore_dups
setopt share_history
setopt transient_rprompt
setopt zle

# Editor environment variables
export EDITOR='vim'
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'
export CVSEDITOR='vim'

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

