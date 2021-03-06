" Notes file type additional settings
"
" Author: LittleBird

" Indent list items using < and >
nnoremap <buffer> <silent> << :<C-u>call xolox#notes#indent_list(-1, line('.'), line('.'))<CR>
vnoremap <buffer> <silent> <  :<C-u>call xolox#notes#indent_list(-1, line("'<"), line("'>"))<CR>gv
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | execute "nunmap <buffer> <<"'
  let b:undo_ftplugin .= ' | execute "vunmap <buffer> <"'
endif

nnoremap <buffer> <silent> >> :<C-u>call xolox#notes#indent_list(1, line('.'), line('.'))<CR>
vnoremap <buffer> <silent> >  :<C-u>call xolox#notes#indent_list(1, line("'<"), line("'>"))<CR>gv
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | execute "nunmap <buffer> >>"'
  let b:undo_ftplugin .= ' | execute "vunmap <buffer> >"'
endif

" Indent list items using <Alt-,> and <Alt-.>
nnoremap <buffer> <silent> <A-,> :<C-u>call xolox#notes#indent_list(-1, line('.'), line('.'))<CR>
inoremap <buffer> <silent> <A-,> <C-o>:call xolox#notes#indent_list(-1, line('.'), line('.'))<CR>
vnoremap <buffer> <silent> <A-,> :<C-u>call xolox#notes#indent_list(-1, line("'<"), line("'>"))<CR>gv
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | execute "nunmap <buffer> <A-,>"'
  let b:undo_ftplugin .= ' | execute "iunmap <buffer> <A-,>"'
  let b:undo_ftplugin .= ' | execute "vunmap <buffer> <A-,>"'
endif

nnoremap <buffer> <silent> <A-.> :<C-u>call xolox#notes#indent_list(1, line('.'), line('.'))<CR>
inoremap <buffer> <silent> <A-.> <C-o>:call xolox#notes#indent_list(1, line('.'), line('.'))<CR>
vnoremap <buffer> <silent> <A-.> :<C-u>call xolox#notes#indent_list(1, line("'<"), line("'>"))<CR>gv
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | execute "nunmap <buffer> <A-.>"'
  let b:undo_ftplugin .= ' | execute "iunmap <buffer> <A-.>"'
  let b:undo_ftplugin .= ' | execute "vunmap <buffer> <A-.>"'
endif
