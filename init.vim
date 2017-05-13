
execute pathogen#infect()
execute pathogen#helptags()

if has('win32')
    if has('nvim')
        let $VIMFILES=expand('$USERPROFILE/AppData/Local/nvim')
    else
        let $VIMFILES=expand('$VIM/vimfiles')
    endif
else
    let $VIMFILES=expand('~/.vim')
endif

let $PATH=$PATH.";".$VIMFILES/tools

source $VIMFILES/.vimrc_amix
source $VIMFILES/.vimrc_xxvv
source $VIMFILES/.vimrc_plugin

