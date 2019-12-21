#!/bin/sh

# Global ignores
git config --global core.excludesfile ~/.gitignore_global

# Conflict diff style
git config --global merge.conflictstyle diff3

# Merge tool
git config --global mergetool.keepBackup false

# Setting for vim-mergetool
git config --global merge.tool nvimMerge
git config --global mergetool.nvimMerge.cmd 'nvim -c "MergetoolStart" "$MERGED" "$BASE" "$LOCAL" "$REMOTE"'
git config --global mergetool.nvimMerge.trustExitCode true
