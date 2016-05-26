set nocompatible               " Be iMproved

" leader settings
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" dein.vim
let s:plugin_dir = expand('~/.vim/dein')
let s:dein_dir = s:plugin_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, 'p')
    silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
execute 'set runtimepath^=' . s:dein_dir

" Required:
call dein#begin(s:plugin_dir)

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/vimshell', {'depends': 'Shougo/vimproc.vim'})

call dein#add('airblade/vim-gitgutter')
call dein#add('alvan/vim-closetag')
call dein#add('artur-shaik/vim-javacomplete2')
call dein#add('flazz/vim-colorschemes')
call dein#add('glidenote/memolist.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('itchyny/landscape.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('kchmck/vim-coffee-script')
call dein#add('kien/ctrlp.vim')
call dein#add('LeafCage/yankround.vim')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('majutsushi/tagbar')
call dein#add('mattn/emmet-vim')
call dein#add('moll/vim-node')
call dein#add('nanotech/jellybeans.vim')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('osyo-manga/vim-anzu')
call dein#add('othree/html5.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('rking/ag.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('shawncplus/skittles_berry')
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/neco-syntax')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('sickill/vim-monokai')
call dein#add('sjl/badwolf')
call dein#add('sjl/gundo.vim')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('tomasr/molokai')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('vim-ctrlspace/vim-ctrlspace')
call dein#add('vim-scripts/matchit.zip')
call dein#add('vim-scripts/Smart-Home-Key')

call dein#add('Shougo/neomru.vim', {'depends' : 'Shougo/unite.vim'})

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Plugin Settings
" lightline
let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \     ['tagbartags', 'ctrlpmark'],
        \   ],
        \   'right': [
        \     ['lineinfo'],
        \     ['percent'],
        \     ['fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'tab': {
        \   'active': [ 'tabnum', 'filename', 'readonly', 'modified' ]
        \ },
        \ 'component': {
        \   'tagbartags': '%{tagbar#currenttag("%s", "", "f")}',
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \   'anzu': 'anzu#search_status',
        \   'ctrlpmark': 'MyCtrlpmark',
        \ },
        \ 'tab_component_function': {
        \   'filename': 'MyTabFilename',
        \   'readonly': 'MyTabReadonly',
        \   'modified': 'MyTabModified',
        \ }
        \}

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
  let _ = expand('#'.buflist[winnr - 1].':t')
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! MyTabReadonly(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly') ? '[R]' : ''
endfunction

function! MyTabModified(n)
    let winnr = tabpagewinnr(a:n)
    return gettabwinvar(a:n, winnr, '&modified') ? '[+]' : gettabwinvar(a:n, winnr, '&modifiable') ? '' : '[-]'
endfunction

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[R]' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? '[VimShell]' :
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyReadonly() ? ' ' . MyReadonly() : '') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '# '  " edit here for cool mark
      let _ = fugitive#head()
      return _ !=# '' ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyCtrlpmark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 100
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
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

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

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

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" neocomplete
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Completion for Underbar
let g:neocomplete#enable_underbar_completion = 1
" Completion for camel case
let g:neocomplete#enable_camel_case_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" auto popup candidate number
let g:neocomplete#max_list = 20
" auto popup minimum words
let g:neocomplete#auto_completion_start_length = 2
" Disable auto popup
" let g:neocomplete#disable_auto_complete = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" inoremap <expr><C-p> neocomplete#start_manual_complete()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Select by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>\<Space>" : "\<Space>"
" Select by dot.
inoremap <expr>. pumvisible() ? "\<C-y>." : "."
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" vimshell
let g:vimshell_environment_term = 'xterm256'

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."$ "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."$ "
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python3'
call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell call vimshell#hook#add('chpwd', 'my_chpwd', 'MyChpwd')

function! MyChpwd(args, context)
  call vimshell#execute('ls')
endfunction

autocmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
endfunction

" anzu
nmap <silent><expr> n '<Plug>(anzu-n-with-echo):normal! zz<cr>'
nmap <silent><expr> N '<Plug>(anzu-N-with-echo):normal! zz<cr>'
nmap <silent><expr> * '<Plug>(anzu-star-with-echo):normal! N<cr>'
nmap <silent><expr> # '<Plug>(anzu-sharp-with-echo):normal! N<cr>'

nmap <silent><expr> g* 'g*<Plug>(anzu-update-search-status-with-echo):normal! N<cr>'

" ag
"  :Ag [options] {pattern} [{directory}]
"  :bufdo AgAdd {pattern}
"  :LAg, LAgAdd
"  :AgFile
"  :AgHelp
"
"  If [!] is not given the first error is jumped to.
"
"   o    to open (same as enter)
"   go   to preview file (open but maintain focus on ack.vim results)
"   t    to open in new tab
"   T    to open in new tab silently
"   h    to open in horizontal split
"   H    to open in horizontal split silently
"   v    to open in vertical split
"   gv   to open in vertical split silently
"   q    to close the quickfix window
" -------------------------------------------------
" フォーマット
let g:agprg="ag -S --nogroup --column"

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" emmet-vim
let g:user_zen_removetag_key = ''
let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'html' : {
\    'filters' : 'html',
\    'snippets' : {
\      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script>\n<script>\n\\$(function() {\n\t|\n})()\n</script>",
\      'cd' : "<![CDATA[|]]>",
\    },
\  },
\  'perl' : {
\    'aliases' : {
\      'req' : "require '|'"
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'w' : "warn \"${cursor}\";",
\    },
\  },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'javascript' : {
\    'snippets' : {
\      'jq' : "\\$(function() {\n\t\\${cursor}\\${child}\n});",
\      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
\      'jq:each' : "\\$.each(data, function(index, item) {\n\t\\${child}\n});",
\      'fn' : "(function() {\n\t\\${cursor}\n})();",
\      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
\    },
\    'use_pipe_for_cursor' : 0,
\  },
\  'css' : {
\    'filters' : 'fc',
\    'snippets' : {
\      'box-shadow' : "-webkit-box-shadow: 0 0 0 # 000;\n-moz-box-shadow: 0 0 0 0 # 000;\nbox-shadow: 0 0 0 # 000;",
\    },
\  },
\  'less' : {
\    'filters' : 'fc',
\    'extends' : 'css',
\  },
\ 'java' : {
\  'snippets' : {
\   'main': "public static void main(String[] args) {\n\t|\n}",
\   'println': "System.out.println(\"|\");",
\   'class': "public class | {\n}\n",
\  },
\ },
\}

" fugitive
" http://d.hatena.ne.jp/cohama/20120317/1331978764
" http://yuku-tech.hatenablog.com/entry/20110427/1303868482
" 現在のソースの変更点をvimdiffで表示
nnoremap <Space>gd :<C-u>Gdiff<cr>
" 新しい窓を作ってgit statusを表示
nnoremap <Space>gs :<C-u>Gstatus<cr>GM
" gitlogを表示
nnoremap <Space>gl :<C-u>Glog<cr>
" 現在開いているソースをgit add
nnoremap <Space>ga :<C-u>Gwrite<cr>
" staged なファイルがあれば git commit なければ git status
nnoremap <Space>gc :<C-u>Gcommit -v<cr>
" git commit --amend
nnoremap <Space>gC :<C-u>Git commit -v --amend<cr>
" 現在のソースをgit blame。vimが色づけしてくれる
nnoremap <Space>gb :<C-u>Gblame<cr>
" git-now
nnoremap <Space>gn :<C-u>w<CR>:Git now<CR>
nnoremap <Space>gN :<C-u>w<CR>:Git now --all<CR>

" gundo
nnoremap U :<C-u>GundoToggle<CR>
" 移動と同時にプレビューを表示しない
" r を押すとプレビュー表示
" 履歴表示が遅い場合に設定すると良い
"let g:gundo_auto_preview = 0

" nerdtree
"  http://blog.livedoor.jp/kumonopanya/archives/51048805.html

"  Commands
"    NERDTreeFromBookmark
"    NERDTreeFind
"    NERDTreeCWD
"
"  Mappings
"    o/Enter : Open the item and the cursor move in the window.
"    O : Recursively open the selected directory.
"    go : Open the item but the cursor dose not move.
"    t : Open in a new tab.
"    T : The same as t except that the focus is kept in the current tab.
"    i : Opne in a new horizonatal split window.
"    I : The same as i except that the cursor is not moved.
"    s : Opne in a new vertical split window.
"    S : The same as i except that the cursor is not moved.
"    x : Closes the parent of the selected node.
"    X : Recursively closes all children of the selected directory.
"    p : Jump to the parent node of the selected node.
"    K : Jump to the first child of the current nodes parent.
"    J : Jump to the last child of the current nodes parent.
"    u : Move the tree root up a dir (like doing a "cd ..").
"    r.R : Refresh.
"    m : Menu.
"    cd : Change vims current working directory to that of the selected node.
"    CD : Change tree root to vims current working directory.
"    ? : Quick help.
"-------------------------------------------------------------
" ツリー表示幅
"let g:NERDTreeWinSize=31

" 無視するファイルを設定 (正規表現)
let g:NERDTreeIgnore = [
      \ '\.clean$', '\.swp$', '\.bak$', '\~$',
      \ '\.svn$', '\.git$',
      \ ]

" 隠しファイル表示ON
let g:NERDTreeShowHidden=1
" ツリー上部のヘルプ表示OFF
let g:NERDTreeMinimalUI=1
" ツリーに矢印などを表示OFF
let g:NERDTreeDirArrows=0

"マウス操作方法
" 1 : ファイル、ディレクトリ両方共ダブルクリックで開く(default)
" 2 : ディレクトリのみシングルクリックで開く
" 3 : ファイル、ディレクトリ両方共シングルクリックで開く
let g:NERDTreeMouseMode=1

" トグル
" nmap <silent> <F5> :call <SID>toggle_nerdtree()<cr>
" function! s:toggle_nerdtree()
"   NERDTreeToggle
"   if &buftype ==# 'nofile' && bufname('') ==# '-MiniBufExplorer-'
"     execute 'wincmd w'
"   endif
" endfunction

" 自動実行
" if has('vim_starting') && len(expand('%:p')) == 0
"     autocmd VimEnter * if !argc() | NERDTreeToggle | execute 'wincmd w'
" endif

" unite
" help: g?
" The prefix key.
nnoremap    [unite]   <Nop>
xnoremap    [unite]   <Nop>
nmap    ;f   [unite]
xmap    ;f   [unite]

" === Mappinigs {{{{
" Files.
nnoremap <silent> <space>ff
    \ :<C-u>Unite -buffer-name=files -no-split -multi-line -unique -silent
    \ jump_point file_point file_mru
    \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec/async'`
    \ buffer_tab:- file file/new<CR>

nnoremap <silent> <space>fc  :<C-u>UniteWithCurrentDir
    \ -buffer-name=files buffer bookmark file<CR>

nnoremap <silent> <space>fb  :<C-u>UniteWithBufferDir
    \ -buffer-name=files buffer bookmark file<CR>

" Change jump.
nnoremap <silent> <space>j
    \ :<C-u>Unite change jump<CR>

nnoremap <silent> <space>n  :UniteNext<CR>
nnoremap <silent> <space>p  :UnitePrevious<CR>

" Unite.
nnoremap <silent> [unite]f  :<C-u>Unite <CR>

" Outline.
nnoremap <silent> [unite]o
      \ :<C-u>Unite outline -no-start-insert -resume<CR>

" Tag.
nnoremap <silent> [unite]t
      \ :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>

" History.
xnoremap <silent> [unite]r
    \ :<C-u>Unite -buffer-name=register -default-action=append register history/yank<CR>

" Grep.
nnoremap <silent> [unite]g
    \ :<C-u>Unite grep -buffer-name=grep`tabpagenr()` -auto-preview -no-split -no-empty -resume<CR>

" Tab pages.
nnoremap <silent> <space>t
    \ :<C-u>Unite -auto-resize -select=`tabpagenr()-1` tab<CR>

" Window.
nnoremap <silent> [unite]w  :<C-u>Unite window<CR>

" Help.
nnoremap <silent> [unite]hh  :<C-u>Unite -buffer-name=help help<CR>
" Help by cursor keyword.
nnoremap <silent> [unite]hk  :<C-u>UniteWithCursorWord help<CR>

" Search.
nnoremap <silent> [unite]/
    \ :<C-u>Unite -buffer-name=search%`bufnr('%')` -start-insert line:forward:wrap<CR>
nnoremap <silent> [unite]?
    \ :<C-u>Unite -buffer-name=search%`bufnr('%')` -start-insert line:backward<CR>
nnoremap <silent> [unite]*
    \ :<C-u>UniteWithCursorWord -buffer-name=search%`bufnr('%')` line:forward:wrap<CR>

nnoremap <silent> [unite]j
    \ :<C-u>UniteResume search%`bufnr('%')`
    \  -no-start-insert -force-redraw<CR>
" }}}}

" === Commands {{{{
" dotfiles以下のファイルを表示
command! Ufd :Unite file:~/dotfiles -input=. -winwidth=60
" }}}}

" === Menu {{{{
let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.enc = {
      \     'description' : 'Open with a specific character code again.',
      \ }
let g:unite_source_menu_menus.enc.command_candidates = [
      \       ['utf8', 'Utf8'],
      \       ['iso2022jp', 'Iso2022jp'],
      \       ['cp932', 'Cp932'],
      \       ['euc', 'Euc'],
      \       ['utf16', 'Utf16'],
      \       ['utf16-be', 'Utf16be'],
      \       ['jis', 'Jis'],
      \       ['sjis', 'Sjis'],
      \       ['unicode', 'Unicode'],
      \     ]
let g:unite_source_menu_menus.fenc = {
      \     'description' : 'Change file fenc option.',
      \ }
let g:unite_source_menu_menus.fenc.command_candidates = [
      \       ['utf8', 'WUtf8'],
      \       ['iso2022jp', 'WIso2022jp'],
      \       ['cp932', 'WCp932'],
      \       ['euc', 'WEuc'],
      \       ['utf16', 'WUtf16'],
      \       ['utf16-be', 'WUtf16be'],
      \       ['jis', 'WJis'],
      \       ['sjis', 'WSjis'],
      \       ['unicode', 'WUnicode'],
      \     ]
let g:unite_source_menu_menus.ff = {
      \     'description' : 'Change file format option.',
      \ }
let g:unite_source_menu_menus.ff.command_candidates = {
      \       'unix'   : 'WUnix',
      \       'dos'    : 'WDos',
      \       'mac'    : 'WMac',
      \     }
let g:unite_source_menu_menus.unite = {
      \     'description' : 'Start unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = {
      \       'bookmark'   : 'Unite bookmark',
      \       'history'    : 'Unite history/command',
      \       'quickfix'   : 'Unite qflist -no-quit',
      \       'resume'     : 'Unite -buffer-name=resume resume',
      \       'directory'  : 'Unite -buffer-name=files '.
      \             '-default-action=lcd directory_mru',
      \       'mapping'    : 'Unite mapping',
      \       'message'    : 'Unite output:message',
      \       'scriptnames': 'Unite output:scriptnames',
      \       'colorscheme': 'Unite -auto-preview -winwidth=15',
      \     }
" }}}}

" === Aliases {{{{
let g:unite_source_alias_aliases = {}
let g:unite_source_alias_aliases.test = {
      \ 'source' : 'file_rec',
      \ 'args'   : '~/',
      \ }
let g:unite_source_alias_aliases.line_migemo = 'line'
let g:unite_source_alias_aliases.calc = 'kawaii-calc'
let g:unite_source_alias_aliases.l = 'launcher'
let g:unite_source_alias_aliases.kill = 'process'
let g:unite_source_alias_aliases.message = {
      \ 'source' : 'output',
      \ 'args'   : 'message',
      \ }
let g:unite_source_alias_aliases.mes = {
      \ 'source' : 'output',
      \ 'args'   : 'message',
      \ }
let g:unite_source_alias_aliases.scriptnames = {
      \ 'source' : 'output',
      \ 'args'   : 'scriptnames',
      \ }
" }}}}

" === Global variables. {{{{
let g:unite_enable_auto_select = 0
let g:unite_source_history_yank_enable = 1
let g:unite_ignore_source_files = []
let g:unite_source_rec_max_cache_files = -1
let g:unite_cursor_line_highlight = 'CursorLine'

if executable('ag')
  " For ag
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-S --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " For ack.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
else
  let g:unite_source_grep_default_opts="-niE --color=never"
endif

" My custom split action.
let s:my_split = {'is_selectable': 1}
function! s:my_split.func(candidate)
  let split_action = 'vsplit'
  if winwidth(winnr('#')) <= 2 * (&tw ? &tw : 80)
    let split_action = 'split'
  endif
  call unite#take_action(split_action, a:candidate)
endfunction
call unite#custom_action('openable', 'context_split', s:my_split)
unlet s:my_split

" }}}}

" === Custom profile. {{{{
call unite#custom#profile('action', 'context', {
      \ 'start_insert' : 1,
      \ })

" Default context.
let default_context = {
      \ 'start_insert' : 1,
      \ 'vertical' : 0,
      \ 'short_source_names' : 1,
      \ }
call unite#custom#profile('default', 'context', default_context)
" }}}}

" === Custom source. {{{{
" migemo.
call unite#custom#source('line_migemo', 'matchers', 'matcher_migemo')

" Custom filters.
call unite#custom#source(
      \ 'buffer,file_rec,file_rec/async,file_rec/git', 'matchers',
      \ ['converter_relative_word', 'matcher_fuzzy',
      \  'matcher_project_ignore_files'])
call unite#custom#source(
      \ 'file_mru', 'matchers',
      \ ['matcher_project_files', 'matcher_fuzzy',
      \  'matcher_hide_hidden_files', 'matcher_hide_current_file'])
call unite#custom#source(
      \ 'file_rec,file_rec/async,file_rec/git,file_mru', 'converters',
      \ ['converter_file_directory'])
call unite#filters#sorter_default#use(['sorter_rank'])
" }}}}

" === My settings in AutoCmd. {{{{
autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
  " Directory partial match.
  call unite#custom#alias('file', 'h', 'left')
  call unite#custom#default_action('directory', 'narrow')

  call unite#custom#default_action('versions/git/status', 'commit')

  " Overwrite settings.
  nmap <buffer> <ESC>      <Plug>(unite_exit)
  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
  imap <buffer>  jj        <Plug>(unite_insert_leave)
  imap <buffer>  <Tab>     <Plug>(unite_complete)
  imap <buffer> '          <Plug>(unite_quick_match_default_action)
  nmap <buffer> '          <Plug>(unite_quick_match_default_action)
  nmap <buffer> cd         <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-z>      <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>      <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-w>      <Plug>(unite_delete_backward_path)
  nmap <buffer> <C-j>      <Plug>(unite_toggle_auto_preview)
  nnoremap <silent><buffer> <Tab>     <C-w>w
  nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))
  nnoremap <silent><buffer><expr> P
        \ unite#smart_map('P', unite#do_action('insert'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <silent><buffer><expr> !     unite#do_action('start')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
  nmap <buffer> x     <Plug>(unite_quick_match_jump)
endfunction
" }}}}

" gitgutter
let g:gitgutter_sign_column_always=1
let g:gitgutter_max_signs=1024
map ]h <Plug>GitGutterNextHunk
map [h <Plug>GitGutterPrevHunk

" Smart-Home-Key
map <silent> <Home> :SmartHomeKey <CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR>

" vimfilter
"
" Normal mode default mappings.
" -------------------------------------
"   <Tab>            switch to another vimfiler
"   j                loop cursor down
"   k                loop cursor up
"   gg               cursor top
"   <C-l>            redraw screen
"   <Space>          toggle mark current line
"   <S-LeftMouse>    toggle mark current line
"   <S-Space>        toggle mark current line up
"   *                toggle mark all lines
"   #                mark similar lines
"   U                clear mark all lines
"   c                copy file
"   m                move file
"   d                delete file
"   Cc               clipboard copy file
"   Cm               clipboard move file
"   Cp               clipboard paste
"   r                rename file
"   K                make directory
"   N                new file
"   <Enter>          cd or edit
"   o                expand or edit
"   l                smart l
"   x                execute system associated
"   h                smart h
"   L                switch to drive
"   ~                switch to home directory
"   \                switch to root directory
"   &                switch to project directory
"   <C-j>            switch to history directory
"   <BS>             switch to parent directory
"   .                toggle visible ignore files
"   H                popup shell
"   e                edit file
"   E                split edit file
"   B                edit binary file
"   ge               execute external filer
"   <RightMouse>     execute external filer
"   !                execute shell command
"   q                hide
"   Q                exit
"   -                close
"   g?               help
"   v                preview file
"   O                sync with current vimfiler
"   go               open file in another vimfiler
"   <C-g>            print filename
"   g<C-g>           toggle maximize window
"   yy               yank full path
"   M                set current mask
"   gr               grep
"   gf               find
"   S                select sort type
"   <C-v>            switch vim buffer mode
"   gc               cd vim current dir
"   gs               toggle safe mode
"   gS               toggle simple mode
"   a                choose action
"   Y                pushd
"   P                popd
"   t                expand tree
"   T                expand tree recursive
"   I                cd input directory
"   <2-LeftMouse>    double click
"   gj               jump last child
"   gk               jump first child
"
"   Visual mode mappings.
" -------------------------------------
"   <Space>          <Plug>(vimfiler toggle mark selected lines

" Open Vimfiler.
nnoremap <silent> <Space>v :<C-u>VimFiler -invisible -parent<CR>
nnoremap <silent> <F5> :VimFilerExplorer<cr>
nnoremap <silent> <F6> :VimFilerBufferDir -buffer-name=explorer -split -toggle -no-quit<cr>

" OS flag.
let is_windows = has('win16') || has('win32') || has('win64')
let is_cygwin = has('win32unix')
let is_mac = !is_windows && !is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \ || (!executable('xdg-open') && system('uname') =~? '^darwin'))

" Profile Settings.
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 1,
      \ 'auto_expand' : 1,
      \ 'edit_action' : 'tabopen',
      \ 'parent' : 1,
      \ })

" Basic Settings.
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.svn\)$'
let g:vimfiler_time_format = '%Y/%m/%d %H:%M:%S'

let g:vimfiler_detect_drives = is_windows ? [
      \ 'C:/', 'D:/', 'E:/', 'F:/', 'G:/', 'H:/', 'I:/',
      \ 'J:/', 'K:/', 'L:/', 'M:/', 'N:/'] :
      \ split(glob('/mnt/*'), '\n') + split(glob('/media/*'), '\n') +
      \ split(glob('/Users/*'), '\n')

" %p : full path
" %d : current directory
" %f : filename
" %F : filename removed extensions
" %* : filenames
" %# : filenames fullpath
let g:vimfiler_sendto = {
      \ 'unzip' : 'unzip %f',
      \ 'zip' : 'zip -r %F.zip %*',
      \ 'Inkscape' : 'inkspace',
      \ 'GIMP' : 'gimp %*',
      \ 'gedit' : 'gedit',
      \ }

" Icons.
if is_windows
  " Use trashbox.
  let g:unite_kind_file_use_trashbox = 1
else
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_readonly_file_icon = 'X'
  let g:vimfiler_marked_file_icon = '*'
endif

let g:vimfiler_quick_look_command =
      \ is_windows ? 'maComfort.exe -ql' :
      \ is_mac ? 'qlmanage -p' : 'gloobus-preview'

" AutoCmd.
autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
  call vimfiler#set_execute_file('vim', 'vim')
  call vimfiler#set_execute_file('txt', 'vim')

  " Overwrite settings.
  nmap <buffer> q <Plug>(vimfiler_close)
  nnoremap <silent><buffer><expr> gy vimfiler#do_action('tabopen')
  nmap <buffer> p <Plug>(vimfiler_quick_look)

  nmap <buffer> o <Plug>(vimfiler_expand_tree)

  " Unite.
  nnoremap <silent><buffer> J
        \ <C-u>:Unite -buffer-name=files -default-action=lcd directory_mru<CR>

  " Open and split window.
  nnoremap <buffer> s :call vimfiler#mappings#do_action('my_split')<cr>
  let s:my_action = { 'is_selectable' : 1 }
  function! s:my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_split', s:my_action)
  unlet s:my_action

  " Opent and split vertilacally window.
  nnoremap <buffer> v :call vimfiler#mappings#do_action('my_vsplit')<cr>
  let s:my_action = { 'is_selectable' : 1 }
  function! s:my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_vsplit', s:my_action)
  unlet s:my_action

  " Migemo search.
  if !empty(unite#get_filters('matcher_migemo'))
    nnoremap <silent><buffer><expr> /  line('$') > 10000 ?  'g/' :
          \ ":\<C-u>Unite -buffer-name=search -start-insert line_migemo\<CR>"
  endif

endfunction

" yankaround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>

" memolist
let g:memolist_path = expand('~/GoogleDrive/memolist')
let g:memolist_gfixgrep = 1
let g:memolist_unite = 1
let g:memolist_unite_option = "-vertical -start-insert"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>

" easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" auto-ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = [ '.git', '.svn', '.' ]
let g:auto_ctags_filetype_mode = 1

" tagbar
nnoremap <silent><F9> :TagbarToggle<cr>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" vim-better-whitespace
let g:better_whitespace_filetypes_blacklist=['vimshell', 'vim', 'diff', 'gitcommit', 'unite', 'qf', 'help']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" let mapleader = ","
" let g:mapleader = ","

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>W :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Quit
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>

" Save and quit
" nmap <leader>wq :wq<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

set wildignorecase

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
" set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
" set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line number
set number

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
" map ½ $
" cmap ½ $
" imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i
" inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1

au FileType python setlocal completeopt-=preview

au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja setlocal syntax=htmljinja
au BufNewFile,BufRead *.mako setlocal ft=mako

au Filetype python setlocal tabstop=8

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setlocal fen
au FileType javascript setlocal nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" makefile
au FileType Makefile setlocal noexpandtab

" c, cpp
au FileType c,cpp,cc setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

" littlebird settings

" general
syntax on
colorscheme molokai
highlight Normal ctermbg=none

" map for :make
nmap <C-F9> :make<CR>

" map for :VimShellTab
nmap <C-F12> :VimShellTab<CR>

" set so(set 0 for vimshell, 7 for others)
function! SetScrolloff()
    if &ft == 'vimshell'
        set so=0
    else
        set so=7
    endif
endfunction
autocmd FileType * call SetScrolloff()
autocmd BufEnter * call SetScrolloff()

" updatetime
set updatetime=250

set title
set noshowmode

set cursorline
highlight LineNr ctermfg=none ctermbg=none guibg=bg guifg=bg
highlight CursorLine cterm=none ctermbg=none ctermfg=none
highlight CursorLineNr term=bold cterm=none ctermfg=226 ctermbg=none

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>
" te tab edit
map [Tag]e :tabedit 
" tm tab move
map [Tag]m :tabmove 
" tg tabnext (number to enter)
map [Tag]g :tabnext 

