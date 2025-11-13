call plug#begin('~/.vim/plugged') " 初始化 vim-plug，并指定插件安装目录

" =======================================================================
" 基础库和管理工具
" =======================================================================
" 许多现代 Lua 插件的依赖库，提供了大量通用的 Lua 函数
Plug 'nvim-lua/plenary.nvim'

" 一个外部工具管理器，用于轻松安装和管理 LSP 服务器、Linter、Formatter 等
Plug 'williamboman/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'

" =======================================================================
" 语言支持与语法 (Language Support & Syntax)
" =======================================================================
" Neovim 内置 LSP 客户端的配置文件集合
Plug 'neovim/nvim-lspconfig'
" 通过 Tree-sitter 提供更先进、更精确的语法解析，用于改善语法高亮、缩进和代码导航
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'}
" 辅助插件，用于改善 Metals (Scala 语言服务器) 与 Neovim LSP 的集成体验
Plug 'scalameta/nvim-metals'

" =======================================================================
" 界面与美化 (UI & Aesthetics)
" =======================================================================
" Status Line
Plug 'nvim-lualine/lualine.nvim'

" 一个作者收集的色彩主题方案
Plug 'niumeng07/vim-colorschemes'

" =======================================================================
" 实用工具与效率提升 (Utilities & Productivity)
" =======================================================================
" A File Explorer For Neovim Written In Lua
Plug 'nvim-tree/nvim-tree.lua'
" FZF 的核心，一个通用的命令行模糊搜索工具 (是 fzf.vim 的依赖)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" FZF 的 Vim 插件封装，提供了 :Files, :Buffers, :Ag 等方便的命令
Plug 'junegunn/fzf.vim'
" Git 的 Vim 封装插件，让你可以在 Vim 内部无缝执行 Git 命令
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" 轻松地添加、修改和删除包围符号，如括号、引号、XML 标签等
Plug 'kylechui/nvim-surround'
" 自动插入和删除成对的括号、引号等
Plug 'windwp/nvim-autopairs'

" AI coding
Plug 'github/copilot.vim'

" 提供了多光标编辑功能，类似于 VS Code 或 Sublime Text
Plug 'mg979/vim-visual-multi'
" 一个轻量级但功能强大的格式化插件，可以集成各种外部格式化工具
Plug 'stevearc/conform.nvim'

" 文本对齐工具
Plug 'junegunn/vim-easy-align'

" 一个功能丰富的 Lua 代码片段引擎
Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
" 一个现代的、模块化的 Neovim 补全引擎，可与 LSP、代码片段等多种源配合使用
Plug 'hrsh7th/nvim-cmp'
" 用一个漂亮的悬浮窗或列表来展示诊断信息、LSP 引用、Quickfix 列表等
Plug 'folke/trouble.nvim'

" 补全源
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/cmp-nvim-lsp'     " LSP 补全
Plug 'hrsh7th/cmp-buffer'       " buffer 补全
Plug 'hrsh7th/cmp-path'         " 路径补全
Plug 'hrsh7th/cmp-cmdline'      " 命令行补全
Plug 'saadparwaiz1/cmp_luasnip' " LuaSnip 片段补全

call plug#end() " 结束 vim-plug 配置块
