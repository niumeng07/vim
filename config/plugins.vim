function! LoadPlugin(ConfigFlag)
    call plug#begin('~/.vim/plugged')
    Plug 'google/vim-maktaba'
    Plug 'google/vim-glaive'
    Plug 'google/vim-codefmt'
    Plug 'niumeng07/vim-colorschemes'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'godlygeek/tabular'  " use for alignment
    Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'}
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    Plug 'niumeng07/vim-snippets'
    Plug 'junegunn/fzf', {'dir': '~/.vim/plugged/fzf', 'do': './install --all'}
    Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
    Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!']}
    Plug 'Shougo/neco-vim'
    Plug 'neoclide/coc-neco'  " competion source for coc.nvim, depend on neco-vim
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': '~/.vim/third_party/yarn/bin/yarn install --frozen-lockfile'}
    Plug 'sheerun/vim-polyglot'  " language pack for vim
    Plug 'mg979/vim-visual-multi'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'tpope/vim-fugitive'
    Plug 'voldikss/vim-floaterm'
    Plug 'vim-scripts/a.vim', {'for': 'c,cc,cpp,h,hh,hpp'}
    Plug 'ervandew/supertab'  " perform all insert cpmpletion using the tab key.
    Plug 'jiangmiao/auto-pairs'  " substitute for coc-pairs
    Plug 'github/copilot.vim'  " Open AIpair programmer
    Plug 'scalameta/nvim-metals'
    if a:ConfigFlag ==# 'normal'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
    endif
    Plug 'vim-scripts/DoxygenToolkit.vim'
    call plug#end()
endfunction
