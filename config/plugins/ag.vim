" Ag for vim
let ctrlp_working_path_mode = '0'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let ctrlp_use_caching = 0
endif
set runtimepath^=~/.vim/plugged/ag.vim


