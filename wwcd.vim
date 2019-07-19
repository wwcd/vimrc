"" command moving
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

vmap > >gv
vmap < <gv
map Y y$

set nu
set rnu
set nocursorline

set completeopt=longest,menuone

" Remember info about open buffers on close
set viminfo^=%

map <leader>e :edit %:p:h<cr>

if has("patch-7.4.1500")
  set foldmethod=marker
endif
"set keywordprg=
"

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  if has('win32')
    map! <S-Insert> <C-R>+
    colorscheme molokai

    function! ToggleGuiWindowFullScreen()
      if g:GuiWindowFullScreen == 0
        call GuiWindowFullScreen(1)
      else
        call GuiWindowFullScreen(0)
      endif
    endfunction
    command! -nargs=0 ToggleFullScreen call ToggleGuiWindowFullScreen()
    nmap <F11> :ToggleFullScreen<CR>
  end

  if has('unix')
    if $TMUX != "" 
      let $TERM="screen-256color"
    else
      let $TERM="linux"
    endif

    map <leader>s :vs<cr>:term bash<cr>
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
  endif

  set listchars=tab:»\ ,eol:$,trail:~,extends:>,precedes:<,space:·
  set icm=split
else
  set t_Co=256
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

autocmd BufNewFile,BufRead *.ts setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.json setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.toml setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.proto setlocal expandtab tabstop=2 shiftwidth=2

" vim: ts=2 sw=2 et
