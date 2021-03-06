" File: Neovim Configurations
" Note: For macOS and Linux
" Author: LittleBird


" Section: Preliminaries {{{

" True color
try
  set termguicolors
catch
endtry

" Leader key settings
let mapleader = ','
let g:mapleader = ','

" End: Preliminaries }}}


" Section: Plugin Manager {{{

" Vim-plug Plugin Manager
let s:base_dir = expand('~/.local/share/nvim')
let s:plugin_dir = s:base_dir . '/plugged'

" Load vim-plug if not installed
let s:vimplug_setup_completed = 1
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  let s:vimplug_setup_completed = 0
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | call confirm('Setup completed. Please restart Neovim.') | qa!
endif

" Required:
call plug#begin(s:plugin_dir)

Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deol.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'junegunn/vim-peekaboo'
Plug 'kassio/neoterm'
Plug 'keith/swift.vim'
Plug 'lambdalisue/gina.vim'
Plug 'lambdalisue/suda.vim'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'samoshkin/vim-mergetool'
Plug 'simeji/winresizer'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-python/python-syntax'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'glts/vim-textobj-comment'
Plug 'junegunn/vim-after-object'
Plug 'machakann/vim-textobj-delimited'
Plug 'rbonvall/vim-textobj-latex'

Plug 'ilms49898723/molokai'
Plug 'ilms49898723/vim-better-whitespace'
Plug 'ilms49898723/vim-gutentags'
Plug 'ilms49898723/vim-lastplace'
Plug 'ilms49898723/vim-slash'

Plug 'Shougo/neco-vim'
Plug 'deoplete-plugins/deoplete-zsh'
Plug 'ilms49898723/neco-syntax'
Plug 'ilms49898723/neoinclude.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}

Plug 'ilms49898723/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug '~/.fzf' | Plug 'junegunn/fzf.vim'
endif

" Required:
call plug#end()

" Required:
filetype on
filetype plugin on
filetype indent on
syntax enable

" End: Plugin Manager }}}


" Section: Plugin Settings {{{

if s:vimplug_setup_completed == 1

" Plugin: lightline {{{
let g:lightline = {
  \   'colorscheme': 'jellybeans',
  \   'active': {
  \     'left': [
  \       ['mode', 'paste'],
  \       ['filename', 'fugitive', 'gitgutter'],
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileencoding', 'fileformat', 'filetype'],
  \     ]
  \   },
  \   'tabline': {
  \     'left': [['tabsinfo'], ['tabs']],
  \     'right': [],
  \   },
  \   'tab': {
  \     'active': ['tabnum', 'filename', 'readonly', 'modified']
  \   },
  \   'component': {
  \     'tagbartags': '%{tagbar#currenttag("%s", "", "f")}',
  \   },
  \   'component_function': {
  \     'tabsinfo': 'MyTabsInfo',
  \     'modified': 'MyModified',
  \     'readonly': 'MyReadonly',
  \     'lineinfo': 'MyLineInfo',
  \     'fugitive': 'MyFugitive',
  \     'filename': 'MyFilename',
  \     'fileformat': 'MyFileFormat',
  \     'filetype': 'MyFileType',
  \     'fileencoding': 'MyFileEncoding',
  \     'mode': 'MyMode',
  \     'percent': 'MyPercent',
  \     'charcode': 'MyCharCode',
  \     'utf8code': 'MyUTF8Code',
  \     'gitgutter': 'MyGitGutter',
  \     'anzu': 'anzu#search_status',
  \   },
  \   'tab_component_function': {
  \     'filename': 'MyTabFilename',
  \     'readonly': 'MyTabReadonly',
  \     'modified': 'MyTabModified',
  \   }
  \ }

" Let inactive = active
let g:lightline.inactive = g:lightline.active
" Let tab.inactive = tab.active
let g:lightline.tab.inactive = g:lightline.tab.active
" Setting separator
let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '>', 'right': '<'}
" Setting tab separator
let g:lightline.tabline_separator = {'left': '', 'right': ''}
let g:lightline.tabline_subseparator = {'left': '', 'right': ''}

" Update events for lightline
autocmd VimEnter,BufWinEnter,FileType * call lightline#update()

" Update useful variables
autocmd BufNew,BufRead,BufWrite,WinEnter,TabEnter * let b:raw_current_filename = MyRawFileName()
autocmd BufNew,BufRead,BufWrite,WinEnter,TabEnter * let b:raw_mode_length = (MyRawMode() == '' ? 2 : 10)

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fname = expand('#'.buflist[winnr - 1].':t')
  let isdiff = gettabwinvar(a:n, winnr, '&diff')
  return fname =~ '__Tagbar__' ? '[Tagbar]' :
       \ fname =~ '__Gundo__' ? '[Gundo]' :
       \ fname =~ '__Gundo_Preview__' ? '[GundoPreview]' :
       \ fname =~ 'NERD_tree' ? '[NERDTree]' :
       \ fname =~ '#FZF' ? '[FZF]' :
       \ fname =~ '--graph' ? '[Git Graph]' :
       \ isdiff == 1 ? '[File Diffs]' :
       \ (&filetype) =~ 'git' && fname =~ '^[0-9a-fA-F]*$' && len(fname) == 40 ? '[Git Commit]' :
       \ ('' != fname ? fname : '[New File]')
endfunction

function! MyTabReadonly(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly') ? '[R]' : ''
endfunction

function! MyTabModified(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? '[+]' : gettabwinvar(a:n, winnr, '&modifiable') ? '' : '[-]'
endfunction

function! MyTabsInfo()
  let tabsinfo = printf('(%d/%d)', tabpagenr(), tabpagenr('$'))
  return tabsinfo
endfunction

function! MyFilenameGetter()
  let fname = get(b:, 'raw_current_filename', '')
  if fname != ''
    return fname
  endif
  return fname =~ '__Tagbar__' ? '[Tagbar]' :
       \ fname =~ '__Gundo__' ? '[Gundo]' :
       \ fname =~ '__Gundo_Preview__' ? '[GundoPreview]' :
       \ fname =~ 'NERD_tree' ? '[NERDTree]' :
       \ fname =~ '#FZF' ? '[FZF]' :
       \ fname =~ '--graph' ? 'Git Graph > ' . fname[0:len(fname) - 9] :
       \ (&filetype) =~ 'git' && fname =~ '^[0-9a-fA-F]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
       \ ('' != fname ? fname : '[New File]')
endfunction

function! MyRawMode()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? '' :
       \ fname =~ '__Gundo__' ? '' :
       \ fname =~ '__Gundo_Preview__' ? '' :
       \ fname =~ 'NERD_tree' ? '' :
       \ 'RawMode'
endfunction

function! MyRawFileName()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? '[Tagbar]' :
       \ fname =~ '__Gundo__' ? '[Gundo]' :
       \ fname =~ '__Gundo_Preview__' ? '[GundoPreview]' :
       \ fname =~ 'NERD_tree' ? '[NERDTree]' :
       \ fname =~ '#FZF' ? '[FZF]' :
       \ fname =~ '--graph' ? 'Git Graph > ' . fname[0:len(fname) - 9] :
       \ (&filetype) =~ 'git' && fname =~ '^[0-9a-fA-F]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
       \ ('' != fname ? fname : '[New File]')
endfunction

function! MyRawReadonly()
  return (&readonly ? ' [R]' : '')
endfunction

function! MyRawModifiable()
  return (&modifiable ? '' : ' [-]')
endfunction

function! MyRawFileStat()
  let is_modifiable = &modifiable
  let is_readonly = &readonly
  if is_modifiable || is_readonly
    return ' [x] [x]'
  else
    return ' [x]'
  endif
endfunction

function! MyRawFileType()
  return (&filetype !=# '' ? &filetype : 'none')
endfunction

function! MyRawFileFormat()
  return &fileformat
endfunction

function! MyRawFileEncoding()
  return (&fileencoding !=# '' ? &fileencoding : &encoding)
endfunction

function! MyPercent()
  let required_space = 6
  if winwidth('.') < required_space
    return ''
  endif
  return printf('%3d%%', 100 * line('.') / line('$'))
endfunction

function! MyMode()
  let required_space = 16
  if winwidth('.') < required_space
    return ''
  endif
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? '' :
       \ fname =~ '__Gundo__' ? '' :
       \ fname =~ '__Gundo_Preview__' ? '' :
       \ fname =~ 'NERD_tree' ? '' :
       \ lightline#mode()
endfunction

function! MyFilename()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let required_space = len(fname) + mode_space + 8
  if winwidth('.') < required_space
    return ''
  endif
  let fname = expand('%:t')
  let ret_fname = fname =~ '__Tagbar__' ? '[Tagbar]' :
                \ fname =~ '__Gundo__' ? '[Gundo]' :
                \ fname =~ '__Gundo_Preview__' ? '[GundoPreview]' :
                \ fname =~ 'NERD_tree' ? '[NERDTree]' :
                \ fname =~ '#FZF' ? '[FZF]' :
                \ fname =~ '--graph' ? 'Git Graph > ' . fname[0:len(fname) - 9] :
                \ (&filetype) =~ 'git' && fname =~ '^[0-9a-fA-F]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
                \ ('' != fname ? fname : '[New File]')
  let ret_fname = ret_fname . ('' != MyReadonly() ? ' ' . MyReadonly() : '') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
  return ret_fname
endfunction

function! MyReadonly()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + mode_space + readmodify_space + 8
  if winwidth('.') < required_space
    return ''
  endif
  return (&readonly ? '[R]' : '')
endfunction

function! MyModified()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + mode_space + readmodify_space + 8
  if winwidth('.') < required_space
    return ''
  endif
  return (&modified ? '[+]' : &modifiable ? '' : '[-]')
endfunction

function! MyLineInfo()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let readmodify_space = len(MyRawFileStat())
  let required_space = 0
  " Not enough
  let required_space = len(fname) + mode_space + readmodify_space + 18
  if winwidth('.') < required_space
    return ''
  endif
  " VeryShort
  let required_space = len(fname) + mode_space + readmodify_space + 27
  if winwidth('.') < required_space
    let shortinfo = printf('%d:%d', col('.'), line('.'))
    return shortinfo
  endif
  " Short
  let required_space = len(fname) + mode_space + readmodify_space + 29
  if winwidth('.') < required_space
    let shortinfo = printf('%d/%d:%d/%d', col('.'), col('$'), line('.'), line('$'))
    return shortinfo
  endif
  " Long
  let lineinfo = printf('%2d/%-2d : %d/%d', col('.'), col('$'), line('.'), line('$'))
  return lineinfo
endfunction

function! MyFileType()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b) +
  "   line(21) + ft(z) + ftsp(2)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let ftype = MyRawFileType()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + len(ftype) + mode_space + readmodify_space + 31
  if winwidth('.') < required_space
    return ''
  endif
  return (&filetype !=# '' ? &filetype : 'none')
endfunction

function! MyFileFormat()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b) +
  "   line(21) + ft(z) + ftsp(2) + ff(w) + ffsp(2) + sep(1)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let ftype = MyRawFileType()
  let fformat = MyRawFileFormat()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + len(ftype) + len(fformat) + mode_space + readmodify_space + 34
  if winwidth('.') < required_space
    return ''
  endif
  return &fileformat
endfunction

function! MyFileEncoding()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b) + line(21) +
  "   ft(z) + ftsp(2) + ff(w) + ffsp(2) + fe(u) + fesp(2) + sep(2)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let ftype = MyRawFileType()
  let fformat = MyRawFileFormat()
  let fencoding = MyRawFileEncoding()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + len(ftype) + len(fformat) + len(fencoding) + mode_space + readmodify_space + 37
  if winwidth('.') < required_space
    return ''
  endif
  return (&fileencoding !=# '' ? &fileencoding : &encoding)
endfunction

function! MyFugitive()
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b) + line(21)
  "   ft(z) + ftsp(2) + ff(w) + ffsp(2) + fe(u) + fesp(2) +
  "   br(12) + brsp(2) + sep(3)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let ftype = MyRawFileType()
  let fformat = MyRawFileFormat()
  let fencoding = MyRawFileEncoding()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + len(ftype) + len(fformat) + len(fencoding) + mode_space + readmodify_space + 52
  if winwidth('.') < required_space
    return ''
  endif
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
      let mark = '# '
      let _ = fugitive#head()
      return _ !=# '' ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyGitGutter()
  if !exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
    return ''
  endif
  " percent(6) + mode(x) + Fn(y) + Fnsp(2) + Read(a) + Mod(b) + line(21) +
  "   ft(z) + ftsp(2) + ff(w) + ffsp(2) + fe(u) + fesp(2) +
  "   br(12) + brsp(2) + gut(17) + gutsp(2) + sep(4)
  let mode_space = get(b:, 'raw_mode_length', 0)
  let fname = MyFilenameGetter()
  let ftype = MyRawFileType()
  let fformat = MyRawFileFormat()
  let fencoding = MyRawFileEncoding()
  let readmodify_space = len(MyRawFileStat())
  let required_space = len(fname) + len(ftype) + len(fformat) + len(fencoding) + mode_space + readmodify_space + 72
  if winwidth('.') < required_space
    return ''
  endif
  let symbols = [
        \ '+' . ' ',
        \ '~' . ' ',
        \ '-' . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! MyCharCode()
  if winwidth('.') < 100
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  let encoding = (&fileencoding == '' ? &encoding : &fileencoding)

  if match(ascii, 'NUL') != -1
    if encoding == 'utf-8'
      return 'NUL 0x0000'
    else
      return 'NUL 0x00'
    endif
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

function! MyUTF8Code()
  if winwidth('.') < 100
    return ''
  endif

  let encoding = (&fileencoding == '' ? &encoding : &fileencoding)

  if encoding != 'utf-8'
    return ''
  endif

  let p = getpos('.')

  redir => utfseq
  silent normal! g8
  redir END

  call setpos('.', p)

  if match(utfseq, 'NUL') != -1
    return '0x000000'
  endif

  let command_result = matchstr(utfseq, '\v[0-9a-zA-Z]+([ ][0-9a-zA-Z]+)*([ ][0-9a-zA-Z]+)*')
  if len(command_result) <= 2
    return '0x0000' . command_result
  elseif len(command_result) <= 5
    let codes = split(command_result, ' ', 0)
    return '0x00' . join(codes, '')
  else
    let codes = split(command_result, ' ', 0)
    return '0x' . join(codes, '')
  endif
endfunction

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
" End: lightline }}}

" Plugin: deoplete {{{
try
  let g:deoplete#enable_at_startup = 1

  " Deoplete settings
  call deoplete#custom#option('auto_complete_delay', 0)
  call deoplete#custom#option('auto_refresh_delay', 0)
  call deoplete#custom#option('camel_case', 1)
  call deoplete#custom#option('ignore_case', 1)
  call deoplete#custom#option('on_insert_enter', 0)
  call deoplete#custom#option('skip_chars', [])
  call deoplete#custom#option('smart_case', 1)

  " Disable file source
  call deoplete#custom#option('ignore_sources', {'_': ['file']})

  " Change member source rank
  call deoplete#custom#source('member', 'rank', 400)

  " Change syntax source rank
  call deoplete#custom#source('syntax', 'rank', 200)

  " Do not show the word typed in completion menu
  call deoplete#custom#source('around', 'matchers', ['matcher_fuzzy', 'matcher_length'])

  " Change around source settings
  call deoplete#custom#var('around', {
    \ 'mark_above': '[A]',
    \ 'mark_below': '[A]',
    \ 'mark_changes': '[A]'})
catch
endtry

inoremap <silent> <expr> <CR>
  \ pumvisible() ? deoplete#close_popup() :
  \ "\<CR>"

inoremap <silent> <expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ deoplete#manual_complete()

inoremap <silent> <expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<C-d>" :
  \ deoplete#manual_complete()

inoremap <silent> <expr> <C-p>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "" :
  \ deoplete#manual_complete()

inoremap <silent> <expr> <C-n>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "" :
  \ deoplete#manual_complete()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Enable omni completion
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType cc setlocal omnifunc=ccomplete#Complete
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" End: deoplete }}}

" Plugin: neco-syntax {{{
let g:necosyntax#min_keyword_length = 2
let g:necosyntax#max_syntax_lines = 8192
" End: neco-syntax }}}

" Plugin: fzf.vim {{{
" Open files
noremap <silent> <M-o> :FZF<CR>
" List windows
noremap <silent> <M-w> :Windows<CR>
" List buffers
noremap <silent> <M-b> :Buffers<CR>
" Find line in current buffer
noremap <silent> <M-f> :BLines<CR>
noremap <silent> <C-g> :BLines<CR>

function! s:fzf_statusline()
endfunction

autocmd User FzfStatusLine call <SID>fzf_statusline()
" End: fzf.vim }}}

" Plugin: Gundo {{{
noremap <silent> <C-u> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
let g:gundo_preview_bottom = 1
" End: Gundo }}}

" Plugin: easymotion {{{
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
map  <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
map  <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
" End: easymotion }}}

" Plugin: anzu {{{
map n <Plug>(anzu-n-with-echo)
map N <Plug>(anzu-N-with-echo)
map * <Plug>(anzu-star-with-echo)
map # <Plug>(anzu-sharp-with-echo)

let g:anzu_enable_CursorHold_AnzuUpdateSearchStatus = 0
let g:anzu_enable_CursorMoved_AnzuUpdateSearchStatus = 0

let g:anzu_status_format = '%#Normal#Searching for %#SearchPatterns#%p%#Normal# (%i / %l)'
" End: anzu }}}

" Plugin: vim-slash {{{
let g:vim_slash_clear_anzu_search_status = 0
let g:vim_slash_clear_command_output = 1
let g:vim_slash_map_silently = 1

" Work with anzu
map <silent> <Plug>(slash-after) <Plug>(anzu-update-search-status-with-echo)
" End: vim-slash }}}

" Plugin: ack.vim {{{
let g:ackprg ='rg --vimgrep'

nnoremap <leader>a :Ack!<Space>
" End: ack.vim }}}

" Plugin: emmet-vim {{{
let g:user_zen_removetag_key = ''
let g:use_zen_complete_tag = 1
" End: emmet-vim }}}

" Plugin: fugitive {{{
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>GM
nnoremap <silent> <leader>gl :<C-u>Glog<CR>
nnoremap <silent> <leader>ga :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit -v<CR>
nnoremap <silent> <leader>gC :<C-u>Git commit -v --amend<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gn :<C-u>w<CR>:Git now<CR>
nnoremap <silent> <leader>gN :<C-u>w<CR>:Git now --all<CR>
" End: fugitive }}}

" Plugin: vim-gv {{{
nnoremap <silent> <C-h> :GV<CR>
nnoremap <silent> <leader>b :GV<CR>
" End: vim-gv }}}

" Plugin: vim-mergetool {{{
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

command MStart  MergetoolStart
command MStop   MergetoolStop
command MToggle MergetoolToggle
" End: vim-mergetool }}}

" Plugin: NERDCommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:NERDCustomDelimiters = {'python': {'left': '#'}}

map <silent> <leader>/ <Plug>NERDCommenterToggle
" End: NERDCommenter }}}

" Plugin: NERDTree {{{
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

let g:NERDTreeIgnore = [
      \ '\.clean$', '\.swp$', '\.bak$', '\~$'
      \ ]
let g:NERDTreeWinSize = 32
let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeDirArrows = 0
let g:NERDTreeMouseMode = 0

let g:NERDTreeMapOpenVSplit = 'v'

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if (argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in'))
  \ | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0]
  \ | call lightline#update() | endif
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree())
  \ | q | endif

let g:LittleBird_NERDTreeAutoRefresh = 0
if g:LittleBird_NERDTreeAutoRefresh == 1
  autocmd FocusGained * silent NERDTreeRefreshRoot
  autocmd WinEnter * call CheckRefreshNERDTree()
endif

function! CheckRefreshNERDTree()
  if &filetype =~ 'nerdtree'
    silent NERDTreeRefreshRoot
  endif
endfunction
" End: NERDTree }}}

" Plugin: gitgutter {{{
set signcolumn=yes
let g:gitgutter_max_signs = 2048
map <silent> ]h <Plug>(GitGutterNextHunk)
map <silent> [h <Plug>(GitGutterPrevHunk)
map <silent> <leader>u <Plug>(GitGutterUndoHunk)
" End: gitgutter }}}

" Plugin: vim-easy-align {{{
vmap <C-a> <Plug>(EasyAlign)
vmap <Enter> <Plug>(EasyAlign)
" End: vim-easy-align }}}

" Plugin: vim-gutentags {{{
let g:gutentags_project_root = ['.ctags.d']
let g:gutentags_ctags_tagfile = '.ctags.tags'
let g:gutentags_ctags_extra_args = ['--tag-relative=never', '--recurse=yes', '--sort=yes', '--links=no']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_resolve_symlinks = 0

let g:gutentags_suppress_warning_messages = 1

set tags+=./.git/.ctags.tags;,./.svn/.ctags.tags;,./.ctags.d/.ctags.tags;,./.ctags.tags;
" End: vim-gutentags }}}

" Plugin: tagbar {{{
nnoremap <silent> <leader>o :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_silent = 1
let g:tagbar_width = 32

let g:tagbar_iconchars = ['▸', '▾']
" End: tagbar }}}

" Plugin: vim-sandwich {{{
" Key mappings (disable default and operator mappings)
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1

" Add
nmap <unique> sa <Plug>(operator-sandwich-add)
xmap <unique> sa <Plug>(operator-sandwich-add)
omap <unique> sa <Plug>(operator-sandwich-g@)

" Remove (delete)
xmap <unique> sr <Plug>(operator-sandwich-delete)
nmap <unique><silent> sr  <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <unique><silent> srd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" Change (replace)
xmap <unique> sc <Plug>(operator-sandwich-replace)
nmap <unique><silent> sc  <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <unique><silent> scd <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" Edit (replace)
xmap <unique> se <Plug>(operator-sandwich-replace)
nmap <unique><silent> se  <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <unique><silent> sed <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
  \   {
  \     'buns'        : ['{', '}'],
  \     'motionwise'  : ['line'],
  \     'kind'        : ['add'],
  \     'linewise'    : 1,
  \     'command'     : ["'[+1,']-1normal! >>"],
  \   },
  \   {
  \     'buns'        : ['{', '}'],
  \     'motionwise'  : ['line'],
  \     'kind'        : ['delete'],
  \     'linewise'    : 1,
  \     'command'     : ["'[,']normal! <<"],
  \   }
  \ ]
" End: vim-sandwich }}}

" Plugin: suda.vim {{{
let g:suda_smart_edit = 1
let g:suda#prefix = ['suda://', 'sudo://']
" End: suda.vim }}}

" Plugin: vim-better-whitespace {{{
let g:strip_whitelines_at_eof = 1
let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'qf', 'help']

autocmd InsertEnter * DisableWhitespace
autocmd InsertLeave * EnableWhitespace

autocmd BufWritePre * call ClearWhitespaceInFile()

function! ClearWhitespaceInFile()
  let retv = StripWhitespaceInFile()
  if retv == 1
    let g:suppress_clear_message = 1
  endif
endfunction
" End: vim-better-whitespace }}}

" Plugin: rainbow parentheses {{{
let g:rainbow#max_level = 32
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses
" End: rainbow parentheses }}}

" Plugin: vim-after-object {{{
autocmd VimEnter * call after_object#enable('#', '-', '=', ':', ',', '.', ' ')
" End: vim-after-object }}}

" Plugin: limelight {{{
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

nnoremap <silent> <C-l> :Limelight!!<CR>
" End: limelight }}}

" Plugin: vim-journal {{{
autocmd BufNewFile,BufRead *.journal setlocal ft=journal
autocmd BufNewFile,BufRead *.journal setlocal tw=0
" End: vim-journal }}}

" Plugin: vim-notes {{{
let s:vim_note_dir = expand('~/Documents/Notes')
if !isdirectory(s:vim_note_dir)
  call mkdir(s:vim_note_dir, 'p')
endif

let g:notes_directories = [s:vim_note_dir]
let g:notes_suffix = '.note'
let g:notes_word_boundaries = 1
let g:notes_smart_quotes = 1
let g:notes_tab_indents = 0
let g:notes_alt_indents = 0

autocmd BufNewFile,BufRead *.note setlocal ft=notes
autocmd BufNewFile,BufRead *.note setlocal tw=0
" End: vim-notes }}}

" Plugin: vim-lastplace {{{
let g:lastplace_ignore_centering = 1
" End: vim-lastplace }}}

" Plugin: neoterm {{{
let g:neoterm_autoinsert = 1
let g:neoterm_repl_python = 'python3'
" End: neoterm }}}

" Plugin: winresizer {{{
let g:winresizer_start_key = '<M-e>'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
" End: winresizer }}}

endif

" End: Plugin Settings }}}


" Section: General Settings {{{

" Set how many lines of history VIM has to remember
set history=10000

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable

" Set to auto read when a file is changed from the outside
set autoread

autocmd FocusGained,BufEnter * checktime

" TTY Fast
set ttyfast

" Shell
set shell=$SHELL
set termencoding=utf-8
set encoding=utf-8

" Set lines to the cursor - when moving vertically using j/k
set scrolloff=10
set sidescrolloff=10

" Turn on the wild menu
set wildmenu
set wildignorecase

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Wrap settings
set whichwrap+=<,>,h,l

" Mouse settings
set mouse=
set mousehide

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Tag searching
set tagcase=match

" Makes search act like search in modern browsers
set incsearch
set inccommand=nosplit

" Make global as default
set gdefault

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchtime=1

" No annoying sound on errors
set noerrorbells
set novisualbell

" Timeout length
set timeoutlen=2000

" Maximum number of columns to try and highlight
set synmaxcol=4096

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,mac,dos

" Turn backup off, since most stuff is in svn, git, etc., anyway...
set nobackup
set nowritebackup
set noswapfile

" Show line number
set number

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Let 1 tab == 4 spaces
set tabstop=4
set softtabstop=4

set shiftwidth=4
set shiftround

" Line break
set linebreak
set textwidth=0

" Auto indent
set autoindent

" Line wrap
set wrap

" The way text is displayed
set display=lastline,msgsep

" For conceal markers
if has('conceal')
  set conceallevel=0
  set concealcursor=niv
endif

" Grep
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f\ %l%m
endif

" Smart cursor moving
noremap <Down> gj
noremap <Up>   gk

noremap j gj
noremap k gk

inoremap <silent> <expr> <Down> pumvisible() ? "\<Down>" : "\<C-o>gj"
inoremap <silent> <expr> <Up>   pumvisible() ? "\<Up>"   : "\<C-o>gk"

" Smart way to move between windows
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap <M-Left>  <C-w>h
nnoremap <M-Down>  <C-w>j
nnoremap <M-Up>    <C-w>k
nnoremap <M-Right> <C-w>l

inoremap <M-h> <C-\><C-n><C-w>h
inoremap <M-j> <C-\><C-n><C-w>j
inoremap <M-k> <C-\><C-n><C-w>k
inoremap <M-l> <C-\><C-n><C-w>l

inoremap <M-Left>  <C-\><C-n><C-w>h
inoremap <M-Down>  <C-\><C-n><C-w>j
inoremap <M-Up>    <C-\><C-n><C-w>k
inoremap <M-Right> <C-\><C-n><C-w>l

vnoremap <M-h> <C-\><C-n><C-w>h
vnoremap <M-j> <C-\><C-n><C-w>j
vnoremap <M-k> <C-\><C-n><C-w>k
vnoremap <M-l> <C-\><C-n><C-w>l

vnoremap <M-Left>  <C-\><C-n><C-w>h
vnoremap <M-Down>  <C-\><C-n><C-w>j
vnoremap <M-Up>    <C-\><C-n><C-w>k
vnoremap <M-Right> <C-\><C-n><C-w>l

tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l

tnoremap <M-Left>  <C-\><C-n><C-w>h
tnoremap <M-Down>  <C-\><C-n><C-w>j
tnoremap <M-Up>    <C-\><C-n><C-w>k
tnoremap <M-Right> <C-\><C-n><C-w>l

" Ctrl-F and Ctrl-B mapped to Ctrl-D and Ctrl-U
noremap <C-f> <C-d>
noremap <C-b> <C-u>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Map H and L to Home and End (^ and $)
noremap H ^
noremap L $

" Toggle paste mode on and off
noremap <silent> <leader>p :setlocal paste!<CR>

" Path for find, etc.
" set path=.,,**

" Undo directory
let s:undo_dir = expand('~/.local/share/nvim/undodir')
if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif
set undodir=~/.local/share/nvim/undodir
set undofile

" Map u to undo silently
nnoremap <silent> u :execute ":silent undo"<CR>

" Map U to redo silently
nnoremap <silent> U :execute ":silent redo"<CR>

" Map <C-r> to redo silently
nnoremap <silent> <C-r> :execute ":silent redo"<CR>

" Bash like keys for the command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-u>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Map ; as : in normal mode and visual mode
nnoremap ; :
vnoremap ; :

" Completion options
set completeopt=longest,menuone,preview

" Pop up menu height
set pumheight=9

" Fold method (use indent as default)
set foldenable
set foldmethod=indent
set foldlevelstart=99
set foldignore=''
set foldminlines=0

" Map zz to toggle folding
noremap zz za

" Disable ZZ and ZQ
noremap ZZ <Nop>
noremap ZQ <Nop>

" Complete options
set completeopt-=preview

" File type options
let python_highlight_all = 1

autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal tabstop=4

autocmd BufNewFile,BufRead *.jinja setlocal syntax=htmljinja
autocmd BufNewFile,BufRead *.mako setlocal ft=mako

autocmd FileType javascript setlocal fen
autocmd FileType javascript setlocal nocindent

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

autocmd FileType Makefile setlocal noexpandtab

autocmd FileType c,cpp,cc setlocal cindent
autocmd FileType c,cpp,cc setlocal comments=sr:/*,mb:*,el:*/,://
autocmd FileType c,cpp,cc setlocal cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

autocmd FileType vim setlocal tabstop=2
autocmd FileType vim setlocal softtabstop=2
autocmd FileType vim setlocal shiftwidth=2
autocmd FileType vim setlocal foldmethod=marker

" Disable auto text wrapping in formatoptions
autocmd FileType * setlocal formatoptions-=c
autocmd FileType * setlocal formatoptions-=t

" Syntax
syntax enable
syntax on

" Set dark background
set background=dark

" Colorscheme settings
try
  set termguicolors
  colorscheme molokai
catch
endtry

" Overwrite some highlighting
highlight Normal ctermbg=none guibg=none

" Cursor line
set cursorline
highlight LineNr term=none cterm=none ctermfg=94 ctermbg=none guibg=none
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=237 guibg=#323232
highlight CursorLineNr term=bold cterm=bold ctermfg=226 ctermbg=237 guibg=#323232

" Sign Column
highlight SignColumn term=none cterm=none ctermfg=118 ctermbg=none guifg=#a6e22e guibg=none

" Gitgutter
highlight GitGutterAdd cterm=bold gui=bold ctermfg=2 ctermbg=none guifg=#009900 guibg=none
highlight GitGutterChange cterm=bold gui=bold ctermfg=3 ctermbg=none guifg=#bbbb00 guibg=none
highlight GitGutterDelete cterm=bold gui=bold ctermfg=1 ctermbg=none guifg=#ff2222 guibg=none

" Autocompletion popup menu (referenced from jetBrains IDE)
highlight Pmenu guifg=#88898a guibg=#3c3f41
highlight PmenuSel guifg=#fafafa guibg=#4b4e50
highlight PmenuSBar guifg=#3c3f41 guibg=#3c3f41
highlight PmenuThumb guifg=#595b5d guibg=#595b5d

" Statusline when wild menu popups
highlight StatusLine gui=bold guifg=#88898a guibg=#2b2e30

" Statusline wild menu selection
highlight WildMenu gui=bold guifg=#fafafa guibg=#424547

" Warning msg
highlight WarningMsg ctermbg=none guibg=none

" Error msg
highlight Error ctermbg=none guibg=none
highlight ErrorMsg ctermbg=none guibg=none

" Folding
highlight Folded ctermbg=none guibg=none
highlight FoldColumn ctermbg=none guibg=none

" Statusline
highlight StatusLine guibg=#30302c
highlight StatusLineNC guifg=#30302c

" Message Separator
highlight MsgSeparator gui=bold guifg=#af9c8a guibg=none

" Fillchars for vertical split
highlight VertSplit ctermbg=none guibg=none

" Fillchars settings
set fillchars=fold:\ ,msgsep:~

" Update time
set updatetime=100

" Report
set report=65535

" Split settings
set splitright
set splitbelow

" Highlight search
set nohlsearch

" Others
set noshowcmd
set noshowmode
set nojoinspaces

set virtualedit=block

set modeline
set modelines=5

set nostartofline

" Disable ins-completion-menu messages
set shortmess+=c

" Disable search messages (when reach top or bottom)
set shortmess+=s

" Re-enable some messages
set shortmess-=n

" Disable gui cursor
set guicursor=

" Map K to split lines in normal mode
nnoremap <silent> K <C-\><C-n>i<CR><C-\><C-n>^:.-1StripWhitespace<CR>

" <leader> + r to toggle relative line numbers
noremap <silent> <leader>r :set rnu!<CR>

" <leader> + m to turn off search highlight
noremap <silent> <leader>m :nohls<CR>

" Remap space
nnoremap <Space> <C-\><C-n>zz

" Remap B to build using :make!
nnoremap B :make!<CR>

" Remap W and Q
nnoremap <silent> W :w<CR>
nnoremap <silent> Q :q<CR>

" Remap Y to make it act like C, D
nnoremap Y y$

" Reselect after shift
vnoremap < <gv
vnoremap > >gv

" Jumping
noremap <silent> [[ ?{<CR>w99[{
noremap <silent> ]] j0?{<CR>w99[{%/{<CR>

noremap <silent> [] /}<CR>b99]}
noremap <silent> ][ k$/}<CR>b99]}%?}<CR>

noremap ` '
noremap ' `

" Switch 0 and ^
noremap 0 ^
noremap ^ 0

" Using tab to jump between matching pairs
nmap <Tab> %
vmap <Tab> %

" Map s as the prefix key to split windows
noremap s <Nop>
noremap S <Nop>

noremap SS :split<Space>
noremap SV :vsplit<Space>

noremap SD :diffsplit<Space>
noremap sd :diffsplit<Space>

noremap <silent> ss :split<CR>
noremap <silent> sv :vsplit<CR>

" Use s as the prefix key to switch between windows
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap sp <C-w>W
nnoremap sn <C-w>w
nnoremap sw <C-w>p
nnoremap st <C-w>t
nnoremap sb <C-w>b
nnoremap so <C-w>o
nnoremap sq <C-w>q

vnoremap sh <C-\><C-n><C-w>h
vnoremap sj <C-\><C-n><C-w>j
vnoremap sk <C-\><C-n><C-w>k
vnoremap sl <C-\><C-n><C-w>l

vnoremap sp <C-\><C-n><C-w>W
vnoremap sn <C-\><C-n><C-w>w
vnoremap sw <C-\><C-n><C-w>p
vnoremap st <C-\><C-n><C-w>t
vnoremap sb <C-\><C-n><C-w>b
vnoremap so <C-\><C-n><C-w>o
vnoremap sq <C-\><C-n><C-w>q

" Terminal emulator settings
autocmd TermOpen term://* startinsert

tnoremap <Esc> <C-\><C-n>

" Terminal colors
let g:terminal_color_0  = '#2E3436'
let g:terminal_color_1  = '#CC0000'
let g:terminal_color_2  = '#4E9A06'
let g:terminal_color_3  = '#C4A000'
let g:terminal_color_4  = '#3465A4'
let g:terminal_color_5  = '#75507B'
let g:terminal_color_6  = '#06989A'
let g:terminal_color_7  = '#D3D7CF'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#EF2929'
let g:terminal_color_10 = '#8AE234'
let g:terminal_color_11 = '#FCE94F'
let g:terminal_color_12 = '#729FCF'
let g:terminal_color_13 = '#AD7FA8'
let g:terminal_color_14 = '#34E2E2'
let g:terminal_color_15 = '#EEEEEC'

" Vimdiff option
set diffopt=vertical

" POSIX
let g:is_posix = 1

" Clear register
function! s:clear_register() abort
  let rs = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in rs
    call setreg(r, [])
  endfor
endfunction

command ClearRegister call s:clear_register()

" Clear command output buffer once cursor moved
autocmd CursorMoved,InsertEnter,InsertLeave * call ClearCommandOutput()
autocmd BufEnter,BufWinEnter,TabEnter,WinEnter * call ClearCommandOutput()

function! ClearCommandOutput()
  let whether_skip = get(g:, 'suppress_clear_message', 0)
  if whether_skip > 0
    let g:suppress_clear_message = 0
    return
  endif
  if &hlsearch == 0
    echon ''
  endif
endfunction

" Force redraw once cursor moved to another location (such as window or tab)
autocmd BufEnter,BufWinEnter,TabEnter,WinEnter * let b:force_redraw_after_move = 3

autocmd CursorMoved * call RedrawIfNecessary(1)
autocmd InsertEnter,InsertLeave * call RedrawIfNecessary(0)

function! RedrawIfNecessary(delta)
  let redraw_times = get(b:, 'force_redraw_after_move', 0)
  if redraw_times > 0
    if a:delta > 0
      let b:force_redraw_after_move = redraw_times - a:delta
    elseif a:delta == 0
      let b:force_redraw_after_move = 0
    endif
    redraw!
  endif
endfunction

" Map :W to :w
command! W w

" The prefix key for tab operations
noremap [Tabs] <Nop>
map t [Tabs]

" Tab jump, using t<tabnum>
for n in range(1, 9)
  execute 'noremap <silent> [Tabs]'.n '<C-\><C-n>:<C-u>tabnext'.n.'<CR>'
endfor
noremap <silent> [Tabs]0 <C-\><C-n>:<C-u>tabnext10<CR>

" Operation: tc, tablast (new tab at last)
noremap <silent> [Tabs]c <C-\><C-n>:tablast <Bar> tabnew<CR>
" Operation: tx, tabclose (close tab)
noremap <silent> [Tabs]x <C-\><C-n>:tabclose<CR>
" Operation: tn, tabnext (next tab)
noremap <silent> [Tabs]n <C-\><C-n>:tabnext<CR>
" Operation: tb, tabprevious (previous tab)
noremap <silent> [Tabs]b <C-\><C-n>:tabprevious<CR>
" Operation: tf, tab find
noremap [Tabs]f <C-\><C-n>:tabfind<Space>
" Operation: te, tab edit
noremap [Tabs]e <C-\><C-n>:tabedit<Space>
" Operation: tg, tabnext <tabnum>
noremap [Tabs]g <C-\><C-n>:tabnext<Space>

" Operation: tm, tab move
" Alt-n and Alt-p to move current tab to the right/left
noremap <silent> <M-n> <C-\><C-n>:+tabmove<CR>
noremap <silent> <M-p> <C-\><C-n>:-tabmove<CR>

function! TabMove(dest_pagenr)
  let s:current_tabpagenr = tabpagenr()
  let s:total_tabpagenr = tabpagenr('$')
  if a:dest_pagenr <= 0
    execute 'tabmove 0'
  elseif a:dest_pagenr <= s:current_tabpagenr
    execute 'tabmove '.(a:dest_pagenr - 1)
  elseif a:dest_pagenr <= s:total_tabpagenr
    execute 'tabmove '.a:dest_pagenr
  else
    execute 'tabmove'
  endif
endfunction

for n in range(0, 9)
  execute 'noremap <silent> [Tabs]m'.n.' <C-\><C-n>:<C-u>call TabMove('.n.')<CR>'
endfor

" Ctrl-n and Ctrl-p to switch tab in normal mode
noremap <silent> <C-n> <C-\><C-n>:tabnext<CR>
noremap <silent> <C-p> <C-\><C-n>:tabprevious<CR>

" Use function keys for tab navigation
for n in range(1, 12)
  execute 'noremap <silent> <F'.n.'>'.' <C-\><C-n>:<C-u>tabnext '.n.'<CR>'
endfor

" Mappings to move lines
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv

nnoremap <silent> <C-Down> :m .+1<CR>==
nnoremap <silent> <C-Up> :m .-2<CR>==
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv

" Moving cursor in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <Right>

" C-a to the beginning of line, C-e to the end of line
nnoremap <C-a> ^
nnoremap <C-e> $
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A

" Delete a word around the cursor
inoremap <C-w> <C-o>cw
inoremap <C-b> <C-w>

" Indent using Alt
nnoremap <M-,> <<
nnoremap <M-.> >>
vnoremap <M-,> <gv
vnoremap <M-.> >gv

inoremap <M-,> <C-d>
inoremap <M-.> <C-t>

" Map <C-d> to <C-\><C-n>
nnoremap <C-d> <C-\><C-n>
inoremap <C-d> <C-\><C-n>
vnoremap <C-d> <C-\><C-n>
snoremap <C-d> <C-\><C-n>
cnoremap <C-d> <C-\><C-n>

" Map q to <C-\><C-n> in normal and visual mode
nnoremap q <C-\><C-n>
vnoremap q <C-\><C-n>
snoremap q <C-\><C-n>

" End: General Settings }}}


" -----------------------------------------------------------
" vim: tabstop=2:softtabstop=2:shiftwidth=2:foldmethod=marker
