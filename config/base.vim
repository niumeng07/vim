set encoding=UTF-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936,ucs-bom,latin1,cp1250
if !has('nvim')
    set termencoding=utf-8
endif

" 按打开顺序排列窗口
set splitright
set splitbelow

scriptencoding UTF-8
if has('vms')
    set nobackup
else
    set backup
endif

syntax on

set fileformats=unix,dos

augroup Base
    set number relativenumber
    autocmd InsertEnter * :set norelativenumber number
    autocmd InsertLeave * :set relativenumber
augroup END

set backspace=indent,eol,start
set history=50
set cinoptions+=g0
set tabstop=4 softtabstop=4 shiftwidth=4

augroup Base
    autocmd FileType cpp,c,h,hpp set sw=4 ts=4
augroup END

set sw=4 ts=4

set smarttab
set nobackup nowritebackup
set smartindent
set linebreak
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set ruler
set showcmd
set autoindent
set cindent
set expandtab
set hlsearch
set incsearch
set cursorline
" set cursorcolumn
set ignorecase
set smartcase
set nocompatible

" 只能判断vim支持真彩色,但无法判断Terminal工具是否支持真彩色
if has('termguicolors')
    set t_Co=256
    set termguicolors
endif

set foldenable
set noerrorbells
set nowrap
" set hidden
" set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

set completeopt=menuone,menu,longest
set completeopt=preview,menu
set completeopt=longest,menu

if has('mac') && !has('nvim')
    set clipboard+=unnamed   " leading to block paste error in nvim
elseif has('nvim')
    let $GIT_EDITOR = 'nvr -cc split --remote-wait'
    let python_host_prog='/usr/local/bin/python'
    let python3_host_prog=join([$PYTHON3_HOME, '/bin/python3.10'], '/')
    let ruby_host_prog = exepath('neovim-ruby-host')
    set listchars=
    let g:perl_host_prog = '/usr/bin/perl'
endif

" 开启文件类型检测
filetype plugin on

" 对python文件开启列颜色
augroup Python
    autocmd FileType python set autoindent
    " autocmd FileType python set cursorcolumn
augroup END

augroup Scala
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
augroup END

augroup Base
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif
augroup END

if has('autocmd')
    filetype plugin indent on
    augroup vimrcEx
        autocmd!
        autocmd FileType text setlocal textwidth=0
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g`\"" | endif
    augroup END
else
    set autoindent
endif

set signcolumn=yes

" 滚动设置
set mouse=a
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" 光标导航设置
inoremap <C-d> <Del>
cnoremap <c-d> <Delete>

cnoremap <c-b> <Left>
inoremap <c-b> <Left>

cnoremap <c-f> <Right>
inoremap <c-f> <Right>

inoremap <C-k> <Up>
inoremap <C-j> <Down>

inoremap <C-e> <End>

inoremap <C-a> <Home>
cnoremap <C-a> <Home>
