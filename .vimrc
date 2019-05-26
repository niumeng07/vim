" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

if has("vms")
  set nobackup
else
  set backup
endif

map Q gq

if has("autocmd") 
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=0
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif

" DiffOrig命令将当前文件状态与文件刚打开时进行对比
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Vundle
" set rtp+=~/.vim/bundle/vundle/  
" call vundle#begin()
" call vundle#rc()  

call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle' "被Plug替换
Plug 'https://github.com/vim-scripts/a.vim.git'
Plug 'vim-scripts/L9'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'powerline/powerline'
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim' "tagbar替代者
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic' "语法检查
" Plug 'w0rp/ale' "语法检查
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'https://github.com/niumeng07/vim-colorschemes.git'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'derekwyatt/vim-scala'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'CodeFalling/fcitx-vim-osx'
Plug 'hecal3/vim-leader-guide'
Plug 'mhinz/vim-signify'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Plug 'Chiel92/vim-autoformat'
Plug 'google/vim-glaive' "autoformat
Plug 'rking/ag.vim'
Plug 'https://github.com/vim-scripts/EasyGrep.git' "能Grep非文本文档
" Plug 'wsdjeg/FlyGrep.vim' "速度比ag慢
" Plug 'mileszs/ack.vim' "速度比Ag慢
" Plug 'ctrlpvim/ctrlp.vim' "被fzf替换
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.vim/plugged/fzf', 'do': './install --all' }
Plug 'skywind3000/asyncrun.vim'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'skywind3000/quickmenu.vim'
"Language Server Client and a completion framework
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install({'tag':1})}}  "Language Server,补全
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'sheerun/vim-polyglot' "语言包
" Plug 'terryma/vim-multiple-cursors' "多光标编辑
Plug 'mg979/vim-visual-multi' "多光标编辑

call plug#end()
" call vundle#end()

" the glaive#Install() should go after the call vundle#end()
call glaive#Install()

" shoud go after call glaive#Install()
Glaive codefmt plugin[mappings]

let g:codefmt="java -jar"
let g:google_java_executable=$HOME."/.vim/google-java-format-1.7-all-deps.jar"

syntax on
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set number
set backspace=indent,eol,start
set history=50
" C++ public/private关键字不缩进
set cinoptions+=g0

set tabstop=4 softtabstop=4 shiftwidth=4

" .cpp, .c, .h文件缩进两格
autocmd FileType cpp,c,h,hpp set sw=2 ts=2
" 其它文件缩进值
set sw=4 ts=4

set smarttab
set nobackup
set nocompatible
set et
set smartindent
set lbr 
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
set cul 
" set cursorcolumn
set ignorecase smartcase
set nocp  
set t_Co=256
set foldenable
" 关闭报警音
set vb

" 开启文件类型检测
filetype plugin on

" 对python文件开启列颜色
autocmd FileType python set ai
autocmd FileType python set cursorcolumn

" Java/Scala Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType scala setlocal omnifunc=scalacomplete#Complete

if has('win32')
endif
if has('unix')
    set background=dark
    color solarized
    hi Pmenu ctermfg=black ctermbg=lightgrey
    hi PmenuSel ctermfg=white ctermbg=2
    hi CursorLine term=standout ctermbg=000 cterm=NONE
    hi VistaIcon ctermbg=008 ctermfg=143
    hi VistaLineNr ctermbg=008 ctermfg=239
    hi VistaColon ctermbg=008 ctermfg=239
    hi VistaTag ctermbg=008 ctermfg=246
    hi VertSplit ctermbg=008 ctermfg=000
    hi NonText ctermfg=008
    hi TagbarHighlight ctermbg=008
endif
if has('mac')
    " colorscheme
    color solarized
    hi Pmenu ctermfg=black ctermbg=grey
    hi PmenuSel ctermfg=008 ctermbg=2
    hi CursorLine term=standout ctermbg=0 cterm=NONE
    hi VistaIcon ctermbg=008 ctermfg=143
    hi VistaLineNr ctermbg=008 ctermfg=239
    hi VistaColon ctermbg=008 ctermfg=239
    hi VistaTag ctermbg=008 ctermfg=246
    hi VertSplit ctermbg=008 ctermfg=000
    hi NonText ctermfg=008
    hi TagbarHighlight ctermbg=008
endif

hi CursorColumn term=standout ctermbg=0 cterm=NONE
hi Visual term=standout ctermbg=235
hi Search term=standout ctermfg=238 ctermbg=248
hi LineNr term=standout ctermfg=grey ctermbg=008
hi CursorLineNr term=standout ctermfg=white ctermbg=008
hi Constant ctermfg=30
hi Include ctermfg=243
hi Comment ctermfg=DarkGrey
hi MatchParen ctermfg=white cterm=NONE
hi SyntasticWarning term=standout cterm=standout
hi SyntasticStyleWarning term=standout cterm=standout
hi SyntasticError term=standout cterm=standout
hi SignColumn ctermbg=008
hi YcmErrorSign ctermfg=002
hi YcmWarningSign ctermfg=002

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

let syntastic_always_populate_loc_list = 1
let syntastic_auto_loc_list = 1
let syntastic_check_on_open = 0
let syntastic_check_on_wq = 0
let syntastic_error_symbol = '✗'
let syntastic_warning_symbol = '⚠'
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_signs = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" hi SyntasticErrorSign ctermbg=008 ctermfg=88
" hi SyntasticWarningSign ctermbg=008 ctermfg=190

" suptertab
let SuperTabDefaultCompletionType="context"

" tagbar
let tagbar_width = 30
if has('win32')
endif
if has('unix')
    let tagbar_ctags_bin='`which ctags`'
endif
if has('mac')
    let tagbar_ctags_bin='`which ctags`'
endif
let tagbar_autofocus = 1
let tagbar_zoomwidth = 0
let tagbar_autoclose = 0
let tagbar_autopreview = 0
let tagbar_sort = 0

" NERDTree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" NERDTree显示隐藏文件
let NERDTreeShowHidden=1
" open NERDTree when open a new file
" autocmd vimenter * if !argc() | NERDTree | endif
" jump to main window when open a new file
autocmd vimenter * if !argc() | wincmd p | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" powerline
set guifont=PowerlineSymbols\ for\ Powerline
let Powerline_symbols = 'fancy'
set laststatus=2
if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()} 
endif
set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim

" ctrlp
let ctrlp_working_path_mode = '0'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let ctrlp_use_caching = 0
endif

" YouCompleteMe
" let ycm_show_diagnostics_ui = 0                           " 禁用语法检查
autocmd InsertLeave * if pumvisible() == 0|pclose|endif   "离开插入模式后自动关闭预览窗口"
let ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let ycm_confirm_extra_conf=0
if has('mac')
  let ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
elseif has('unix')
  let ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf_unix.py'
elseif has('win32')
  "let ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
endif
let ycm_min_num_of_chars_for_completion=2 " 从第2个字符开始显示匹配
let ycm_seed_identifiers_with_syntax = 1  " 语法关键字补全
let ycm_max_diagnostics_to_display = 0    " 最多可检测错误个数，0为不限

" Markdown tabular, vim-markdown
let vim_markdown_folding_disabled = 1
let vim_markdown_override_foldtext = 0
let vim_markdown_folding_level = 6
let vim_markdown_toc_autofit = 1
let vim_markdown_no_default_key_mappings = 1
let vim_markdown_emphasis_multiline = 0

" fzf
set rtp+=~/.vim/plugged/fzf.vim/

" indentLine
let indentLine_char = '┊'
let indentLine_fileType = ['py']

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest
set completeopt=preview,menu
set completeopt=longest,menu

" 快捷键
" map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-e> : q<CR>
map <C-p> : FZF<CR>
map <C-]> : YcmCompleter GoToDefinitionElseDeclaration<CR>
command CO : copen 6

" Snippets
let g:UltiSnipsExpandTrigger="<C-x>"

" Ag for vim
set runtimepath^=~/.vim/plugged/ag.vim

" FlyGrep
" map <F3> :FlyGrep<CR>

" go def
let g:go_def_mode='godef'

" Leaderf
let g:Lf_WindowPosition = "right"
command LF : LeaderfFunction

if has('mac')
    " VIM copy同时Copy到系统剪切板
    set clipboard+=unnamed
endif

" QuickMenu配置
" clear all the items
call quickmenu#reset()
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"
" new section: empty action with text starts with "#" represent a new section
call quickmenu#append("# Debug", '')
" script between %{ and } will be evaluated before menu open
call quickmenu#append("Run %{expand('%:t')}", '!./%', "Run current file")
" new section
call quickmenu#append("# Git", '')
" use fugitive to show diff
call quickmenu#append("git diff", 'Gvdiff', "use fugitive's Gvdiff on current document")
call quickmenu#append("git status", 'Gstatus', "use fugitive's Gstatus on current document")
" new section
call quickmenu#append("# Misc", '')
call quickmenu#append("Turn paste %{&paste? 'off':'on'}", "set paste!", "enable/disable paste mode (:set paste!)")
call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")
" call quickmenu#append('Function List', 'TagbarToggle', 'Switch Tagbar on/off')
call quickmenu#append('Function List', 'Vista!!', 'Switch Vista on/off')
call quickmenu#append('DiffOrig', "DiffOrig", 'Diff file with original.')
command QM : call quickmenu#toggle(0)
