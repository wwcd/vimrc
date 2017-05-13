
# install

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
