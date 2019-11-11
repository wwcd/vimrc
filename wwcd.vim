" language
lang en_US

" define bash style editing keys
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" maintain Visual Mode after shifting > and <
vmap > >gv
vmap < <gv

" yank from the cursor to the end of line, it like 'C' change from the cursor
map Y y$

" line number and cursorline
set nu
set rnu
set nocursorline

" complete options
set completeopt=longest,menuone

" select last seleted
" gv
" select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" remember info about open buffers on close
set viminfo^=%

" browser current file dir
map <silent><leader>e :edit %:p:h<CR>

if has("patch-7.4.1500")
  set foldmethod=marker
endif
"set keywordprg=

if !has('gui_running')
  set t_Co=256
endif

if has('nvim')
  " terminal switch
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  " Misc
  set listchars=tab:»\ ,eol:$,trail:~,extends:>,precedes:<,space:·
  set inccommand=split
endif

if has('win32')
  try
    color molokai
  catch
  endtry
endif

if v:version >= 704
  function! Undo()
    if has('win32')
      let l:tmpdir=expand('$USERPROFILE/.vimundo')
    else
      let l:tmpdir=expand('~/.vimundo')
    endif

    if !isdirectory(l:tmpdir)
      call system('mkdir ' . l:tmpdir)
    endif

    let &undodir=l:tmpdir
    set undofile
    set undolevels=500 "maximum number of changes that can be undone
  endfunction

  call Undo()
endif

" vim: ts=2 sw=2 et
