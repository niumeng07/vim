" -------- BASEMENT -----------------------------------
execute 'source ~/.vim/config/base.vim'

" -------- CUSTOM COMMAND -----------------------------
execute 'source ~/.vim/config/commands.vim'

" -------------- PLUGINS LUA CONFIG ------------------
if has('nvim')
    lua require("init")
endif

execute 'source ~/.config/nvim/config/plugins/fzf.vim'
execute 'source ~/.config/nvim/config/plugins/copilot.vim'

" Docker Compose Language Server Support
au FileType yaml if bufname("%") =~# "docker-compose.yml" | set ft=yaml.docker-compose | endif
au FileType yaml if bufname("%") =~# "compose.yml" | set ft=yaml.docker-compose | endif

if has('nvim')
    set scrollopt+=ver,hor
    set scrolljump=0
endif

" ------- COLORSCHEME ---------------------------------
if has('nvim') && (has('mac') || has('unix') || has('win32'))
    set background=dark
    color flattened_dark
endif

if has('nvim') && $TERM_PROGRAM ==# 'Apple_Terminal'
    set termguicolors!    " Terminal does not support true color
    color Tomorrow-Night
endif

" 不可见字符高亮显示
set listchars=tab:→\ ,trail:·,nbsp:␣,extends:>,precedes:<
" set display+=uhex  " 把不可见字符显示为Unicode
syntax match InvisibleChar /[\u00A0\u2000-\u200F\u2028\u2029\uFEFF]/
highlight InvisibleChar ctermbg=red guibg=#ff5555
