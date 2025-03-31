function! LoadPlugin(ConfigFlag)
    call plug#begin('~/.vim/plugged')
    " vimscript plugin library for plugin authors.
    Plug 'google/vim-maktaba'
    " utility for configuring maktaba plugins
    Plug 'google/vim-glaive'

    " Vim completion source for coc.nvim using neco-vim
    Plug 'Shougo/neco-vim'
    Plug 'neoclide/coc-neco'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " efficient fuzzy finder to locate files
    Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

    " plugin for automated bullet lists.
    Plug 'bullets-vim/bullets.vim'

    " AI pair programmer tool
    Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
    " Plug 'github/copilot.vim'

    " use <Tab> for all your insert completion needs
    Plug 'ervandew/supertab'
    " langauage tools for building off of the initial Scala plugin modules
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    " go language suppor
    Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'}
    " Lua plugin provide better experience when using metals(scala language server)
    Plug 'scalameta/nvim-metals'

    " language server protocol support
    Plug 'neovim/nvim-lspconfig'
    " A collection of language packs for Vim.
    Plug 'sheerun/vim-polyglot'

    " helps you remember your Neovim keymaps
    Plug 'folke/which-key.nvim'
    " tools for line up text
    Plug 'godlygeek/tabular'
    " utility for syntax-aware code formatting
    Plug 'google/vim-codefmt'

    " insert or delete brackets, parens, quotes in pair.
    Plug 'jiangmiao/auto-pairs'
    " provides the basic library functions

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " provides a variety of useful commands
    Plug 'junegunn/fzf.vim'

    " vim-visual-multi in analogy with visual-block
    Plug 'mg979/vim-visual-multi'

    " All the lua functions I don't want to write twice.
    Plug 'nvim-lua/plenary.nvim'

    " both to provide a simple and easy way to use the interface for tree-sitter 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'niumeng07/vim-colorschemes'

    " makes scrolling in Vim nice and smooth
    Plug 'terryma/vim-smooth-scroll'

    " git plugin for vim
    Plug 'tpope/vim-fugitive'

    " about surroundings: parentheses, brackets ...
    Plug 'tpope/vim-surround'

    " generate auther, license, and copyright, ...
    Plug 'vim-scripts/DoxygenToolkit.vim'
    " swtich between source files and header files quickly.

    Plug 'vim-scripts/a.vim', {'for': 'c,cc,cpp,h,hh,hpp'}

    " popup command window
    Plug 'voldikss/vim-floaterm'

    Plug 'niumeng07/vim-snippets'
    if a:ConfigFlag ==# 'normal'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
    endif
    call plug#end()
endfunction
