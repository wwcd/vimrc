
# Install

## vim

```bash
cd ~ && rm -rf .vim
git clone --recursive https://github.com/xxvv/vimrc .vim
ln -s ~/.vim/init.vim .vimrc
```

## gvim

```batch
git clone --recursive https://github.com/xxvv/vimrc vimfiles
```

## neovim in linux

```bash
cd ~ && rm -rf .vim
git clone --recursive https://github.com/xxvv/vimrc .vim
ln -s ~/.vim ~/.config/nvim
```

## neovim in windows

```batch
cd %USERPROFILE%\AppData\Local
git clone --recursive https://github.com/xxvv/vimrc nvim
```

# Plugins

- [ack.vim](https://github.com/mileszs/ack.vim.git)
- [bufexplorer](https://github.com/jlanzarotta/bufexplorer.git)
- [fzf.vim](https://github.com/junegunn/fzf.vim.git)
- [fzf](https://github.com/junegunn/fzf.git)
- [lightline](https://github.com/itchyny/lightline.vim)
- [molokai](https://github.com/tomasr/molokai.git)
- [nerdtree](https://github.com/scrooloose/nerdtree.git)
- [plantuml-syntax](https://github.com/aklt/plantuml-syntax.git)
- [python-mode](https://github.com/python-mode/python-mode)
- [tagbar](https://github.com/majutsushi/tagbar.git)
- [typescript-vim](https://github.com/leafgarland/typescript-vim.git)
- [vim-commentary](https://github.com/tpope/vim-commentary.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-javascript](https://github.com/pangloss/vim-javascript.git)
- [vim-jdaddy](https://github.com/tpope/vim-jdaddy.git)
- [vim-markdown](https://github.com/plasticboy/vim-markdown.git)
- [vim-repeat](https://github.com/tpope/vim-repeat.git)
- [vim-signature](https://github.com/kshenoy/vim-signature.git)
- [vim-surround](https://github.com/tpope/vim-surround.git)

# Key Mappings

The leader is `,`.

## Plugin related mapping

- `<leader>e` :Open Nerdtree
- `<leader>o` :Open FZF
- `<leader>be` :Open Bufexplorer
- `<F8>` :Open Tagbar
- `<leader>g` :Ack Search
