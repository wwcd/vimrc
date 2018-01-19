
# Install

## vim

```bash
cd ~ && rm -rf .vim
git clone --recursive https://github.com/shoulinwong/vimrc .vim
ln -s ~/.vim/init.vim .vimrc
```

## gvim

```batch
git clone --recursive https://github.com/shoulinwong/vimrc vimfiles
```

## neovim in linux

```bash
cd ~ && rm -rf .vim
git clone --recursive https://github.com/shoulinwong/vimrc .vim
ln -s ~/.vim ~/.config/nvim
```

## neovim in windows

```batch
cd %USERPROFILE%\AppData\Local
git clone --recursive https://github.com/shoulinwong/vimrc nvim
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
- [splitjon.vim](https://github.com/AndrewRadev/splitjoin.vim.git)
- [tagbar](https://github.com/majutsushi/tagbar.git)
- [typescript-vim](https://github.com/leafgarland/typescript-vim.git)
- [ultisnips](https://github.com/SirVer/ultisnips.git)
- [vim-commentary](https://github.com/tpope/vim-commentary.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-go](https://github.com/fatih/vim-go.git)
- [vim-javascript](https://github.com/pangloss/vim-javascript.git)
- [vim-jdaddy](https://github.com/tpope/vim-jdaddy.git)
- [vim-markdown](https://github.com/plasticboy/vim-markdown.git)
- [vim-repeat](https://github.com/tpope/vim-repeat.git)
- [vim-signature](https://github.com/kshenoy/vim-signature.git)
- [vim-snippets](https://github.com/honza/vim-snippets.git)
- [vim-surround](https://github.com/tpope/vim-surround.git)
- [vim-toml](https://github.com/cespare/vim-toml.git)

# Key Mappings

The leader is `,`.

## Plugin related mapping

- `<leader>e` :Open Nerdtree
- `<leader>o` :Open FZF
- `<leader>be` :Open Bufexplorer
- `<F8>` :Open Tagbar
- `<leader>g` :Ack Search
