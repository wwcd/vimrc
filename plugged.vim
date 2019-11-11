call plug#begin($VIMFILES.'/plugged')

" colorscheme
Plug 'fatih/molokai'
Plug 'wwcd/desert'

" common edit
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" coding
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()


"-------------------------------------------------------------------------------
" Base plugins
"-------------------------------------------------------------------------------

" NERD_tree {{{
" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=40
let NERDTreeDirArrows=0
let NERDTreeHighlightCursorline=0
let NERDTreeStatusline=-1
let NERDTreeQuitOnOpen=1
if has('unix')
  let NERDTreeDirArrowExpandable='+'
  let NERDTreeDirArrowCollapsible='-'
endif
let NERDTreeMapJumpNextSibling=""
let NERDTreeMapJumpPrevSibling=""
let NERDTreeIgnore=['\.o$[[file]]', '\.pyc$[[file]]']
nmap <silent><F7> :NERDTreeToggle<CR>
map <silent><C-n> :NERDTreeToggle<CR>
" fix edit lightline missing
autocmd FileType nerdtree call lightline#update()
" }}}

" Tagbar {{{
nmap <silent><F8> :TagbarToggle<CR>
" set 'stty -ixon' in ~/.bash_profile to disable XON/XOFF
map <silent><C-s> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_hide_nonpublic = 0
let g:tagbar_show_linenumbers = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_show_visibility = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_compact = 1
let g:tagbar_sort = 0

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
  \ 'c:classes',
  \ 'n:modules',
  \ 'f:functions',
  \ 'v:variables',
  \ 'v:varlambdas',
  \ 'm:members',
  \ 'i:interfaces',
  \ 'e:enums',
  \ ]
  \ }

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
" }}}

"lightline {{{
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'wwcd',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive' ],
  \             [ 'filename' ] ],
  \  'right': [ [ 'lineinfo' ],
  \             [ 'percent' ],
  \             [ 'filetype', 'fileformat', 'fileencoding' ] ]
  \ },
  \ 'component_function': {
  \   'filename': 'LightLineFilename',
  \   'fugitive': 'LightLineFugitive',
  \   'fileformat': 'LightLineFileformat',
  \   'filetype': 'LightLineFiletype',
  \   'fileencoding': 'LightLineFileencoding',
  \   'mode': 'LightLineMode',
  \ },
  \ }

" wwcd colorscheme
let s:p = g:lightline#colorscheme#landscape#palette
let s:p.inactive.middle = s:p.normal.middle
let g:lightline#colorscheme#wwcd#palette = lightline#colorscheme#fill(s:p)

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : ''
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'RO' : ''
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo\|fzf\|tagbar\|nerdtree' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 120 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 120 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 120 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return &ft == 'tagbar' ? 'TAG' :
        \ &ft == 'nerdtree' ? 'NERD' :
        \ &ft == 'fzf' ? 'FZF' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  return &ft == 'tagbar' ? '__Tagbar__' :
        \ &ft == 'nerdtree' ? '__NERD_tree__' :
        \ &ft == 'fzf' ? '__FZF__' :
        \ ('' != expand('%') ? expand('%') : '[No Name]') .
        \ ('' != LightLineReadonly() ? ' ' . LightLineReadonly() : '') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
"}}}

"fzf{{{
let g:fzf_command_prefix = 'Fzf'

if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore-file ' . expand('$VIMFILES/tools/.ignore')
  let $FZF_DEFAULT_OPTS='--color bg:-1,bg+:-1'
elseif executable('ag')
  let $FZF_DEFAULT_COMMAND='ag --hidden  --path-to-ignore ' . expand('$VIMFILES/tools/.ignore') . ' -g ""'
  let $FZF_DEFAULT_OPTS='--color bg:-1,bg+:-1'
endif

map <silent><c-p> :FzfFiles<CR>
map <silent><c-b> :FzfBuffers<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd! User FzfStatusLine call lightline#update()
"}}}

"Ack{{{

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --ignore-file ' . expand('$VIMFILES/tools/.ignore')
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ' . expand('$VIMFILES/tools/.ignore')
endif
"}}}

"vim-commentary{{{
autocmd FileType cmake setlocal commentstring=#\ %s
"}}}

"-------------------------------------------------------------------------------
" Coding plugins
"-------------------------------------------------------------------------------

"markdown {{{
let g:vim_markdown_folding_disabled = 1
"}}}

"python-mode{{{
let g:pymode_python = 'python3'
let g:pymode_folding = 1
let g:pymode_rope = 1
let g:pymode_rope_auto_project = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_options_max_line_length = 100
let g:pymode_options_colorcolumn=0
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_lint_options_mccabe = {'complexity': 8}
" Using local .pylintrc
let g:pymode_lint_options_pylint = {'rcfile': ''}
"}}}

"vim-go{{{
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
" let g:go_lsp_log = []
" let g:go_debug = ['lsp']

let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_disabled = []
let g:go_metalinter_command = '--enable vet --enable golint --enable errcheck --exclude comment --exclude check'
let g:go_metalinter_deadline = '5s'

augroup go
  autocmd!

  autocmd FileType go nmap <C-g> :GoDeclsDir<cr>

  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup end

"}}}

"cscope{{{
if has("cscope")
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb

  map g<C-]> :cs find 1 <C-R>=expand("<cword>")<CR><CR>
  map g<C-\> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

  nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>
endif
"}}}

" vim: ts=2 sw=2 et
