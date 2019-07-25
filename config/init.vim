" NeoVim Config File
"
" LittleBird


" Section: Preliminaries {{{

set nocompatible

" True color
try
  set termguicolors
catch
endtry

" Leader key settings
let mapleader = ","
let g:mapleader = ","

" End: Preliminaries }}}


" Section: Plugin Manager {{{

" Vim-plug Plugin Manager
let s:base_dir = expand('~/.local/share/nvim')
let s:plugin_dir = s:base_dir . '/plugged'

" Vim-plug script
if &compatible
  set nocompatible
endif

" Load vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Required:
call plug#begin(s:plugin_dir)

Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/vim-anzu'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'ilms49898723/auto-ctags.vim'
Plug 'ilms49898723/molokai'
Plug 'ilms49898723/vim-slash'

Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-zsh'

Plug 'Shougo/vimproc.vim', {'do' : 'make'} | Plug 'Shougo/vimshell'

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

" End: Plugin Manager }}}


" Section: Plugin Settings {{{

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

" Lazy update useful variables
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
       \ &ft =~ 'vimshell' ? '[VimShell]' :
       \ &ft == 'git' && fname =~ '^[0-9a-f]*$' && len(fname) == 40 ? '[Git Commit]' :
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
       \ &ft =~ 'vimshell' ? '[VimShell]' :
       \ &ft == 'git' && fname =~ '^[0-9a-f]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
       \ ('' != fname ? fname : '[New File]')
endfunction

function! MyRawMode()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? '' :
       \ fname =~ '__Gundo__' ? '' :
       \ fname =~ '__Gundo_Preview__' ? '' :
       \ fname =~ 'NERD_tree' ? '' :
       \ &ft =~ 'vimshell' ? '' :
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
       \ &ft =~ 'vimshell' ? '[VimShell]' :
       \ &ft == 'git' && fname =~ '^[0-9a-f]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
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
  return (&fenc !=# '' ? &fenc : &enc)
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
       \ &ft =~ 'vimshell' ? '' :
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
                \ &ft =~ 'vimshell' ? '[VimShell]' :
                \ &ft == 'git' && fname =~ '^[0-9a-f]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
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
  return (&fenc !=# '' ? &fenc : &enc)
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

  let encoding = (&fenc == '' ? &enc : &fenc)

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

  let encoding = (&fenc == '' ? &enc : &fenc)

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
let g:vimshell_force_overwrite_statusline = 0
" End: lightline }}}

" Plugin: deoplete {{{
try
  let g:deoplete#enable_at_startup = 1

  " Deoplete settings
  call deoplete#custom#option('auto_complete_delay', 0)
  call deoplete#custom#option('auto_refresh_delay', 0)
  call deoplete#custom#option('camel_case', 1)
  call deoplete#custom#option('ignore_case', 1)
  call deoplete#custom#option('num_processes', 0)
  call deoplete#custom#option('skip_chars', [])
  call deoplete#custom#option('smart_case', 1)

  " Do not show the word typed in completion menu
  call deoplete#custom#source('around', 'matchers', ['matcher_fuzzy', 'matcher_length'])
catch
endtry

inoremap <silent> <expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#manual_complete()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType cc setlocal omnifunc=ccomplete#Complete
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" For conceal markers
if has('conceal')
  set conceallevel=0
  set concealcursor=niv
endif
" End: deoplete }}}

" Plugin: deoplete-jedi {{{
try
  let g:deoplete#sources#jedi#enable_typeinfo = 0
  call deoplete#custom#option('ignore_sources', {'python': ['jedi']})
  " call deoplete#custom#option('sources', {'python': ['jedi', 'file']})
catch
endtry
" End: deoplete-jedi }}}

" Plugin: vimshell {{{
let g:vimshell_environment_term = 'xterm256'
let g:vimshell_disable_escape_highlight = 1
let g:vimshell_interactive_update_time = 200
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = $USER."$ "

" Initialize execute file list
let g:vimshell_execute_file_list = {}
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python3'

autocmd FileType vimshell call vimshell#hook#add('chpwd', 'my_chpwd', 'MyChpwd')

function! MyChpwd(args, context)
  call vimshell#execute('ls')
endfunction

autocmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
endfunction
" End: vimshell }}}

" Plugin: fzf.vim {{{
" Open files
noremap <silent> <A-o> :FZF<CR>
" List windows
noremap <silent> <A-w> :Windows<CR>
" List buffers
noremap <silent> <A-b> :Buffers<CR>
" Find line in current buffer
noremap <silent> <A-f> :BLines<CR>
noremap <silent> <C-g> :BLines<CR>

function! s:fzf_statusline()
endfunction

autocmd User FzfStatusLine call <SID>fzf_statusline()
" End: fzf.vim }}}

" Plugin: Gundo {{{
noremap <silent> <leader>u :GundoToggle<CR>
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

" Plugin: incsearch {{{
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" With fuzzy & easymotion
" map z/ <Plug>(incsearch-fuzzy-/)
" map z? <Plug>(incsearch-fuzzy-?)
" map zg/ <Plug>(incsearch-fuzzy-stay)
" End: incsearch }}}

" Plugin: anzu {{{
map n <Plug>(anzu-n-with-echo)
map N <Plug>(anzu-N-with-echo)
map * <Plug>(anzu-star-with-echo)
map # <Plug>(anzu-sharp-with-echo)

let g:anzu_enable_CursorHold_AnzuUpdateSearchStatus = 0
let g:anzu_enable_CursorMoved_AnzuUpdateSearchStatus = 0

let g:anzu_status_format = 'Search for %p (%i of %l)'
" End: anzu }}}

" Plugin: vim-slash {{{
let g:vim_slash_clear_command_output = 1
let g:vim_slash_remap_n = 0

" Work with anzu
map <silent> <Plug>(slash-after) <Plug>(anzu-update-search-status-with-echo)

" Remap n and N to / and ? to suppress /pattern or ?pattern commandline output
map <silent> n /<CR>
map <silent> N ?<CR>
" End: vim-slash }}}

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
nnoremap <silent> <F5> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = [
      \ '\.clean$', '\.swp$', '\.bak$', '\~$'
      \ ]
let g:NERDTreeWinSize = 32
let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeDirArrows = 0
let g:NERDTreeMouseMode = 0

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
  \ | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

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
map ]h <Plug>GitGutterNextHunk
map [h <Plug>GitGutterPrevHunk
" End: gitgutter }}}

" Plugin: vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
" End: vim-easy-align }}}

" Plugin: auto-ctags {{{
let s:ctags_dir = expand('~/.ctags_files')
if !isdirectory(s:ctags_dir)
  call mkdir(s:ctags_dir, 'p')
endif
let g:auto_ctags = 1
let g:auto_ctags_search_recursively = 1
let g:auto_ctags_directory_list = ['.git', '.svn', '.ctags.d']
let g:auto_ctags_tags_name = '.ctags.tags'
let g:auto_ctags_tags_args = ['--tag-relative=never', '--recurse=yes', '--sort=yes', '--links=no']

set tags+=./.git/.ctags.tags;,./.svn/.ctags.tags;,./.ctags.d/.ctags.tags;

autocmd BufRead * silent CtagsCreateOnly
" End: auto-ctags }}}

" Plugin: tagbar {{{
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> <leader>o :TagbarToggle<CR>
let g:tagbar_width = 32
let g:tagbar_autofocus = 1

let g:tagbar_iconchars = ['▸', '▾']
" End: tagbar }}}

" Plugin: vim-better-whitespace {{{
let g:current_line_whitespace_disabled_soft = 1
let g:better_whitespace_filetypes_blacklist = ['vimshell', 'vim', 'diff', 'gitcommit', 'qf', 'help']
autocmd BufWritePre * StripWhitespace
" End: vim-better-whitespace }}}

" Plugin: rainbow parentheses {{{
let g:rainbow#max_level = 32
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses
" End: rainbow parentheses }}}

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

let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.note'
let g:notes_word_boundaries = 1
let g:notes_smart_quotes = 1
let g:notes_tab_indents = 0
let g:notes_alt_indents = 0

autocmd BufNewFile,BufRead *.note setlocal ft=notes
autocmd BufNewFile,BufRead *.note setlocal tw=0
" End: vim-notes }}}

" End: Plugin Settings }}}


" Section: General Settings {{{

" Set how many lines of history VIM has to remember
set history=10000

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

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
set mouse=""
set mousehide

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch
set inccommand=nosplit

" Make global as default
set gdefault

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Timeout length
set timeoutlen=500

" Enable syntax highlighting
syntax enable

" Set dark background
set background=dark

" Maximum number of columns to try and highlight
set synmaxcol=2048

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

" Turn backup off, since most stuff is in svn, git, etc., anyway...
set nobackup
set nowb
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
set lbr
set tw=0

" Auto indent
set autoindent

" Line wrap
set wrap
set display=lastline

" Smart cursor moving
noremap <Down> gj
noremap <Up> gk

noremap j gj
noremap k gk

" Smart way to move between windows
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l

nnoremap <A-Left>  <C-W>h
nnoremap <A-Down>  <C-W>j
nnoremap <A-Up>    <C-W>k
nnoremap <A-Right> <C-W>l

inoremap <A-h> <C-\><C-N><C-W>h
inoremap <A-j> <C-\><C-N><C-W>j
inoremap <A-k> <C-\><C-N><C-W>k
inoremap <A-l> <C-\><C-N><C-W>l

inoremap <A-Left>  <C-\><C-N><C-W>h
inoremap <A-Down>  <C-\><C-N><C-W>j
inoremap <A-Up>    <C-\><C-N><C-W>k
inoremap <A-Right> <C-\><C-N><C-W>l

tnoremap <A-h> <C-\><C-N><C-W>h
tnoremap <A-j> <C-\><C-N><C-W>j
tnoremap <A-k> <C-\><C-N><C-W>k
tnoremap <A-l> <C-\><C-N><C-W>l

tnoremap <A-Left>  <C-\><C-N><C-W>h
tnoremap <A-Down>  <C-\><C-N><C-W>j
tnoremap <A-Up>    <C-\><C-N><C-W>k
tnoremap <A-Right> <C-\><C-N><C-W>l

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

" Undo directory
let s:undo_dir = expand('~/.local/share/nvim/undodir')
if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif
set undodir=~/.local/share/nvim/undodir
set undofile

" Map U to redo
nnoremap U <C-r>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

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

noremap zz za

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

" Syntax
syntax enable
syntax on

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

" Fillchars for vertical split
highlight VertSplit ctermbg=none guibg=none

" Fillchars for folding
set fillchars=fold:\ ,

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
set modelines=2

set nostartofline

" Disable ins-completion-menu messages
set shortmess+=c

" Disable search messages (when reach top or bottom)
set shortmess+=s

" Re-enable some messages
set shortmess-=n

" Disable gui cursor
set guicursor=

" Disable F1, K, q
noremap <F1> <Nop>
noremap K <Nop>
noremap q <Nop>

" <leader> + r to toggle relative line numbers
noremap <silent> <leader>r :set rnu!<CR>

" <leader> + m to turn off search highlight
noremap <silent> <leader>m :nohls<CR>

" Remap space
nnoremap <Space> <Esc>zz

" Remap B to build using :make!
nnoremap B :make!<CR>

" Remap W and Q
nnoremap W :w<CR>
nnoremap Q :q<CR>

" Remap Y to make it act like C, D
nnoremap Y y$

" Reselect after shift
vnoremap < <gv
vnoremap > >gv

" Jumping
noremap [] ][
noremap ][ []

noremap ` '
noremap ' `

" Using tab to jump between matching pairs
nmap <Tab> %
vmap <Tab> %

" Vimdiff option
set diffopt=vertical

let g:is_posix = 1

" Clear command output buffer once cursor moved
autocmd CursorMoved,InsertEnter,InsertLeave * call ClearCommandOutput()

function! ClearCommandOutput()
  if &hlsearch == 0
    echo ''
  endif
endfunction

" The prefix key for tab operations
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump, using t<tabnum>
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" Operation: tc, tablast (new tab at last)
noremap <silent> [Tag]c :tablast <bar> tabnew<CR>
" Operation: tx, tabclose (close tab)
noremap <silent> [Tag]x :tabclose<CR>
" Operation: tn, tabnext (next tab)
noremap <silent> [Tag]n :tabnext<CR>
" Operation: tb, tabprevious (previous tab)
noremap <silent> [Tag]b :tabprevious<CR>
" Operation: te, tab edit
noremap [Tag]e :tabedit<Space>
" Operation: tm, tab move
noremap [Tag]m :tabmove<Space>
" Operation: tg, tabnext <tabnum>
noremap [Tag]g :tabnext<Space>

" Ctrl+N and Ctrl+P to switch tab in normal mode
noremap <silent> <C-n> :tabnext<CR>
noremap <silent> <C-p> :tabprevious<CR>

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
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A

" Delete a word around the cursor
inoremap <C-w> <C-o>cw
inoremap <C-b> <C-w>

" Indent using Alt
nnoremap <A-,> <<
nnoremap <A-.> >>
vnoremap <A-,> <gv
vnoremap <A-.> >gv

inoremap <A-,> <C-d>
inoremap <A-.> <C-t>

" Map <C-d> to <C-\><C-n>
nnoremap <C-d> <C-\><C-n>
inoremap <C-d> <C-\><C-n>
vnoremap <C-d> <C-\><C-n>
snoremap <C-d> <C-\><C-n>
cnoremap <C-d> <C-\><C-n>

" End: General Settings }}}


" -----------------------------------------------------------
" vim: tabstop=2:softtabstop=2:shiftwidth=2:foldmethod=marker
