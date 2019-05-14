
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

## Base

- [ack.vim](https://github.com/mileszs/ack.vim.git)
- [fzf.vim](https://github.com/junegunn/fzf.vim.git)
- [fzf](https://github.com/junegunn/fzf.git)
- [lightline](https://github.com/itchyny/lightline.vim)
- [molokai](https://github.com/fatih/molokai)
- [desert](https://github.com/wwcd/desert)
- [nerdtree](https://github.com/scrooloose/nerdtree.git)
- [tagbar](https://github.com/majutsushi/tagbar.git)
- [targets.vim](https://github.com/wellle/targets.vim)
- [vim-commentary](https://github.com/tpope/vim-commentary.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-repeat](https://github.com/tpope/vim-repeat.git)
- [vim-surround](https://github.com/tpope/vim-surround.git)

## Snips

- [ultisnips](https://github.com/SirVer/ultisnips.git)
- [vim-snippets](https://github.com/honza/vim-snippets.git)

## Coding

- [python-mode](https://github.com/python-mode/python-mode)
- [typescript-vim](https://github.com/leafgarland/typescript-vim.git)
- [vim-go](https://github.com/fatih/vim-go.git)
- [vim-markdown](https://github.com/plasticboy/vim-markdown.git)
- [vim-toml](https://github.com/cespare/vim-toml.git)

# Key Mappings

The leader is `,`.

## Plugin related mapping

- `<c-n>` :Open Nerdtree
- `<c-s>` :Open Tagbar
- `<c-b>` :Open FZF buffers
- `<c-p>` :Open FZF files
- `<leader>g` :Ack Search using ripgrep

*Note: `<c-s>` need set 'stty -ixon' in ~/.bash_profile to disable XON/XOFF*
