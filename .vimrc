"auto load vimrc
" if has('win32')
"     au! BufWritePost $VIM/vimfiles/* so $VIM/vimfiles/vimrc
" else
"     au! BufWritePost ~/.vim/* so ~/.vimrc
" endif

execute pathogen#infect()
execute pathogen#helptags()

if has('win32')
    source $VIM/vimfiles/.vimrc_amix
    source $VIM/vimfiles/.vimrc_xxvv
    source $VIM/vimfiles/.vimrc_plugin
else
    source ~/.vim/.vimrc_amix
    source ~/.vim/.vimrc_xxvv
    source ~/.vim/.vimrc_plugin
endif

