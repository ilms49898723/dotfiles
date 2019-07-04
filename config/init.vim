" NeoVim

set nocompatible

" leader settings
let mapleader = ","
let g:mapleader = ","

" Vim-plug Plugin Manager
let s:base_dir = expand('~/.local/share/nvim')
let s:plugin_dir = s:base_dir . '/plugged'

" Vim-plug script begin

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
Plug 'junegunn/vim-slash'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/vim-anzu'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

Plug 'Shougo/vimproc.vim', {'do' : 'make'} | Plug 'Shougo/vimshell'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug '~/.fzf' | Plug 'junegunn/fzf.vim'
endif

" Required:
call plug#end()

" Required:
filetype plugin indent on

" Vim-plug script end

" Plugin Settings

" lightline
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
  \     'fileformat': 'MyFileformat',
  \     'filetype': 'MyFiletype',
  \     'fileencoding': 'MyFileencoding',
  \     'mode': 'MyMode',
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

" let inactive = active
let g:lightline.inactive = g:lightline.active
" let tab.inactive = tab.active
let g:lightline.tab.inactive = g:lightline.tab.active
" setting seperator
let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '>', 'right': '<'}
" setting tab seperator
let g:lightline.tabline_separator = {'left': '', 'right': ''}
let g:lightline.tabline_subseparator = {'left': '', 'right': ''}

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fname = expand('#'.buflist[winnr - 1].':t')
  return fname =~ '__Tagbar__' ? '[Tagbar]' :
       \ fname =~ '__Gundo__' ? '[Gundo]' :
       \ fname =~ '__Gundo_Preview__' ? '[GundoPreview]' :
       \ fname =~ 'NERD_tree' ? '[NERDTree]' :
       \ fname =~ '#FZF' ? '[FZF]' :
       \ fname =~ '--graph' ? 'Git Graph' :
       \ &ft =~ 'vimshell' ? '[VimShell]' :
       \ &ft == 'git' && fname =~ '^[0-9a-f]*$' && len(fname) == 40 ? 'Git Commit' :
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

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '[R]' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? '[Tagbar]' :
       \ fname =~ '__Gundo__' ? '[Gundo]' :
       \ fname =~ '__Gundo_Preview__' ? '[GundoPreview]' :
       \ fname =~ 'NERD_tree' ? '[NERDTree]' :
       \ fname =~ '#FZF' ? '[FZF]' :
       \ fname =~ '--graph' ? 'Git Graph > ' . fname[0:len(fname) - 9] :
       \ &ft =~ 'vimshell' ? '[VimShell]' :
       \ &ft == 'git' && fname =~ '^[0-9a-f]*$' && len(fname) == 40 ? 'Git Commit > ' . fname[0:6] :
       \ ('' != fname ? fname : '[New File]') .
       \ ('' != MyReadonly() ? ' ' . MyReadonly() : '') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyLineInfo()
  if winwidth('.') < 50
    let shortinfo = printf('%d/%d:%d/%d', col('.'), col('$'), line('.'), line('$'))
    return shortinfo
  endif
  let lineinfo = printf('%2d/%-2d : %d/%d', col('.'), col('$'), line('.'), line('$'))
  return lineinfo
endfunction

function! MyFugitive()
  if winwidth('.') < 90
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

function! MyFiletype()
  return winwidth('.') >= 60 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth('.') >= 70 ? &fileformat : ''
endfunction

function! MyFileencoding()
  return winwidth('.') >= 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? '' :
       \ fname =~ '__Gundo__' ? '' :
       \ fname =~ '__Gundo_Preview__' ? '' :
       \ fname =~ 'NERD_tree' ? '' :
       \ &ft =~ 'vimshell' ? 'VimShell' :
       \ lightline#mode()
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') < 100
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

let g:vimshell_force_overwrite_statusline = 0

" deoplete
try
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#source('around', 'matchers', ['matcher_fuzzy', 'matcher_length'])
catch
endtry

inoremap <silent> <expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType cc setlocal omnifunc=ccomplete#Complete
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

" vimshell
let g:vimshell_environment_term = 'xterm256'
let g:vimshell_disable_escape_highlight = 1
let g:vimshell_interactive_update_time = 200
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = $USER."$ "

" Initialize execute file list.
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

" FZF
noremap <A-f> :FZF<CR>
noremap <F9>  :FZF<CR>

" Gundo
noremap <silent> <leader>u :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
let g:gundo_preview_bottom = 1

" easymotion
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
map  <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
map  <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" incsearch
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" incsearch with fuzzy & easymotion
" map z/ <Plug>(incsearch-fuzzy-/)
" map z? <Plug>(incsearch-fuzzy-?)
" map zg/ <Plug>(incsearch-fuzzy-stay)

" anzu
map n <Plug>(anzu-n-with-echo)
map N <Plug>(anzu-N-with-echo)
map * <Plug>(anzu-star-with-echo)
map # <Plug>(anzu-sharp-with-echo)

let g:anzu_enable_CursorHold_AnzuUpdateSearchStatus = 0
let g:anzu_enable_CursorMoved_AnzuUpdateSearchStatus = 0

" vim-slash with anzu
map <silent> <Plug>(slash-after) <Plug>(anzu-update-search-status-with-echo)

" emmet-vim
let g:user_zen_removetag_key = ''
let g:use_zen_complete_tag = 1

" fugitive
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>GM
nnoremap <silent> <leader>gl :<C-u>Glog<CR>
nnoremap <silent> <leader>ga :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit -v<CR>
nnoremap <silent> <leader>gC :<C-u>Git commit -v --amend<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gn :<C-u>w<CR>:Git now<CR>
nnoremap <silent> <leader>gN :<C-u>w<CR>:Git now --all<CR>

" vim-gv
nnoremap <silent> <leader>b :GV<CR>

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:NERDCustomDelimiters = {'python': {'left': '#'}}

map <silent> <leader>/ <Plug>NERDCommenterToggle

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = [
      \ '\.clean$', '\.swp$', '\.bak$', '\~$',
      \ '\.svn$', '\.git$',
      \ ]
let g:NERDTreeWinSize = 32
let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeDirArrows = 0
let g:NERDTreeMouseMode = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
  \ | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" gitgutter
set signcolumn=yes
let g:gitgutter_max_signs = 1024
map ]h <Plug>GitGutterNextHunk
map [h <Plug>GitGutterPrevHunk

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" auto-ctags
let s:ctags_dir = expand('~/.ctags_files')
if !isdirectory(s:ctags_dir)
  call mkdir(s:ctags_dir, 'p')
endif
let g:auto_ctags = 0
let g:auto_ctags_directory_list = [ s:ctags_dir, '.git', '.svn' ]
let g:auto_ctags_filetype_mode = 1
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'

" tagbar
nnoremap <silent> <leader>o :TagbarToggle<CR>
let g:tagbar_width = 32
let g:tagbar_autofocus = 1

" vim-better-whitespace
let g:current_line_whitespace_disabled_soft = 1
let g:better_whitespace_filetypes_blacklist = ['vimshell', 'vim', 'diff', 'gitcommit', 'qf', 'help']
autocmd BufWritePre * StripWhitespace

" rainbow parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" vim-journal
autocmd BufNewFile,BufRead *.journal setlocal ft=journal
autocmd BufNewFile,BufRead *.journal setlocal tw=0

" vim-notes
let s:vim_note_dir = expand('~/Documents/Notes')
if !isdirectory(s:vim_note_dir)
  call mkdir(s:vim_note_dir, 'p')
endif

let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.note'
let g:notes_word_boundaries = 1
let g:notes_smart_quotes = 0
let g:notes_tab_indents = 0
let g:notes_alt_indents = 0

autocmd BufNewFile,BufRead *.note setlocal ft=notes
autocmd BufNewFile,BufRead *.note setlocal tw=0

" Sets how many lines of history VIM has to remember
set history=10000

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set ttyfast

" shell
set shell=$SHELL
set termencoding=utf-8
set encoding=utf-8

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7
set sidescrolloff=7

" Turn on the Wild menu
set wildmenu
set wildignorecase

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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
set tm=500

" Enable syntax highlighting
syntax enable

set background=dark

" Maximum number of lines to try and highlight
set synmaxcol=1024

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Show line number
set number

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround

" Linebreak
set lbr
set tw=0

" Auto indent
set autoindent

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

" Fold method
" (use indent as default)
set foldenable
set foldmethod=indent
set foldlevelstart=99

" File type completion options

let python_highlight_all = 1

autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal tabstop=4
autocmd FileType python syn keyword pythonDecorator True None False self

autocmd BufNewFile,BufRead *.jinja setlocal syntax=htmljinja
autocmd BufNewFile,BufRead *.mako setlocal ft=mako

autocmd FileType javascript setlocal fen
autocmd FileType javascript setlocal nocindent

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" makefile
autocmd FileType Makefile setlocal noexpandtab

" c, cpp
autocmd FileType c,cpp,cc setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

" general
syntax enable
syntax on

" color scheme
let g:rehash256 = 1

try
  set termguicolors
  colorscheme molokai
catch
endtry

highlight Normal ctermbg=none guibg=none

" cursor line
set cursorline
highlight LineNr term=none cterm=none ctermfg=94 ctermbg=none guibg=none
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=237 guibg=#3f3030
highlight CursorLineNr term=bold cterm=bold ctermfg=226 ctermbg=237 guibg=#3f3030

" gitgutter
highlight GitGutterAdd cterm=bold gui=bold ctermfg=2 ctermbg=none guifg=#009900 guibg=none
highlight GitGutterChange cterm=bold gui=bold ctermfg=3 ctermbg=none guifg=#bbbb00 guibg=none
highlight GitGutterDelete cterm=bold gui=bold ctermfg=1 ctermbg=none guifg=#ff2222 guibg=none

" autocompletion popup menu
highlight Pmenu guifg=#8a8a8a guibg=#3a3a3a
highlight PmenuSel guifg=#efefef guibg=#2c2c2c
highlight PmenuSBar guifg=#2f2f2f guibg=#2f2f2f

" warning msg
highlight WarningMsg ctermbg=none guibg=none

" error msg
highlight Error ctermbg=none guibg=none
highlight ErrorMsg ctermbg=none guibg=none

" folding
highlight Folded ctermbg=none guibg=none
highlight FoldColumn ctermbg=none guibg=none

" fillchars for vertical split
highlight VertSplit ctermbg=none guibg=none

" fillchars
set fillchars=fold:\ ,

" update time
set updatetime=100

" report
set report=65535

" split settings
set splitright
set splitbelow

set noshowcmd
set hlsearch
set noshowmode
set nojoinspaces

set virtualedit=block

set secure

set modeline
set modelines=2

set nostartofline

" disable ins-completion-menu messages
set shortmess+=c

" disable gui cursor
set guicursor=

" disable F1, K, q
noremap <F1> <Nop>
noremap K <Nop>
noremap q <Nop>

" <leader> + m to turn off search highlight
noremap <silent> <leader>m :nohls<CR>

" remap space
nnoremap <Space> <Esc>zz

" remap W and Q
nnoremap W :w<CR>
nnoremap Q :q<CR>

" remap Y to make it act like C, D
nnoremap Y y$

" reselect after shift
vnoremap < <gv
vnoremap > >gv

" using tab to jumping between matching pairs
nmap <Tab> %
vmap <Tab> %

" vimdiff option
set diffopt=vertical

let g:is_posix = 1

" clear command output buffer once cursor moved
autocmd CursorMoved,InsertEnter,InsertLeave * echo ''

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump, using t<tabnum>
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc, tablast (new tab at last)
noremap <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx, tabclose (close tab)
noremap <silent> [Tag]x :tabclose<CR>
" tn, tabnext (next tab)
noremap <silent> [Tag]n :tabnext<CR>
" tb, tabprevious (previous tab)
noremap <silent> [Tag]b :tabprevious<CR>
" te, tab edit
noremap [Tag]e :tabedit<Space>
" tm, tab move
noremap [Tag]m :tabmove<Space>
" tg, tabnext <tabnum>
noremap [Tag]g :tabnext<Space>

" Ctrl+N and Ctrl+P to switch tab in normal mode
noremap <silent> <C-n> :tabnext<CR>
noremap <silent> <C-p> :tabprevious<CR>

" mappings to move lines
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv

nnoremap <silent> <C-Down> :m .+1<CR>==
nnoremap <silent> <C-Up> :m .-2<CR>==
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv

" moving in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" map C-d to Esc
nnoremap <C-d> <Esc>
inoremap <C-d> <Esc>
vnoremap <C-d> <Esc>
cnoremap <C-d> <Esc>
