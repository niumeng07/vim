function! LoadPlugin(ConfigFlag)
    call plug#begin('~/.vim/plugged') " 初始化 vim-plug，并指定插件安装目录

    " =======================================================================
    " 基础库与框架 (Libraries & Frameworks)
    " =======================================================================
    " 为其他 Google 插件提供支持的 Vimscript 插件库
    Plug 'google/vim-maktaba'
    " 用于配置 Maktaba 插件的实用工具，是上面插件的搭档
    Plug 'google/vim-glaive'
    " 许多现代 Lua 插件的依赖库，提供了大量通用的 Lua 函数
    Plug 'nvim-lua/plenary.nvim'
    " 一个外部工具管理器，用于轻松安装和管理 LSP 服务器、Linter、Formatter 等
    Plug 'williamboman/mason.nvim'
    " A File Explorer For Neovim Written In Lua, 比coc-explorer快
    " Plug 'nvim-tree/nvim-tree.lua'

    " =======================================================================
    " Completion & LSP
    " =======================================================================
    " Conquer of Completion (CoC)，一个强大的智能补全框架，类似 VS Code 的 IntelliSense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " neco-vim 是一个为多种补全引擎提供当前缓冲区关键字补全的源
    Plug 'Shougo/neco-vim'
    " CoC 的一个扩展，用于集成 neco-vim 作为其补全源之一
    Plug 'neoclide/coc-neco'
    " AI 代码助手，提供智能的代码补全建议, Tabnine 全面收费了
    " Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
    " 让你可以使用 <Tab> 键来触发和选择所有类型的插入模式补全
    Plug 'ervandew/supertab'

    " =======================================================================
    " 语言支持与语法 (Language Support & Syntax)
    " =======================================================================
    " Neovim 内置 LSP 客户端的配置文件集合，极大简化了 LSP 服务器的配置
    Plug 'neovim/nvim-lspconfig'
    " 通过 Tree-sitter 提供更先进、更精确的语法解析，用于改善语法高亮、缩进和代码导航
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " 一个大型语言包集合，为大量编程语言提供高质量的语法高亮和缩进支持
    Plug 'sheerun/vim-polyglot'
    " 提供对 Go 语言的全面支持（格式化、代码检查、调试等）
    Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'}
    " 为 Scala 语言提供语法高亮和缩进等基础支持
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    " 辅助插件，用于改善 Metals (Scala 语言服务器) 与 Neovim LSP 的集成体验
    Plug 'scalameta/nvim-metals'
    " 在 C/C++ 源文件 (.c/.cpp) 和头文件 (.h/.hpp) 之间快速切换
    Plug 'vim-scripts/a.vim', {'for': 'c,cc,cpp,h,hh,hpp'}

    " =======================================================================
    " 界面与美化 (UI & Aesthetics)
    " =======================================================================
    " 一个美观且高度可定制的状态栏/标签栏插件
    Plug 'vim-airline/vim-airline'
    " vim-airline 的主题集合
    Plug 'vim-airline/vim-airline-themes'
    " 让 Neovim 的滚动变得平滑流畅
    Plug 'terryma/vim-smooth-scroll'
    " 在一个浮动窗口中管理终端
    Plug 'voldikss/vim-floaterm'
    " 在你按下按键前缀（如<leader>）后，弹窗提示后续可用键位，帮你记忆快捷键
    Plug 'folke/which-key.nvim'
    " 一个作者收集的色彩主题方案
    Plug 'niumeng07/vim-colorschemes'


    " =======================================================================
    " 实用工具与效率提升 (Utilities & Productivity)
    " =======================================================================
    " LeaderF，一个高效的模糊搜索工具，用于查找文件、缓冲区、最近使用文件等
    Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
    " FZF 的核心，一个通用的命令行模糊搜索工具 (是 fzf.vim 的依赖)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " FZF 的 Vim 插件封装，提供了 :Files, :Buffers, :Ag 等方便的命令
    Plug 'junegunn/fzf.vim'
    " Git 的 Vim 封装插件，让你可以在 Vim 内部无缝执行 Git 命令
    Plug 'tpope/vim-fugitive'
    " 轻松地添加、修改和删除包围符号，如括号、引号、XML 标签等
    Plug 'tpope/vim-surround'
    " 自动插入和删除成对的括号、引号等
    Plug 'jiangmiao/auto-pairs'
    " 提供了多光标编辑功能，类似于 VS Code 或 Sublime Text
    Plug 'mg979/vim-visual-multi'
    " 用于自动创建和管理项目符号列表（bullet lists）
    Plug 'bullets-vim/bullets.vim'
    " 一个强大的文本对齐工具，可以根据指定的分隔符（如=, :, |）将文本对齐成列
    Plug 'godlygeek/tabular'
    " 调用外部格式化工具（如 gofmt, clang-format）来格式化代码
    Plug 'google/vim-codefmt'
    " 用于生成 Doxygen 风格的注释，方便编写代码文档
    Plug 'vim-scripts/DoxygenToolkit.vim'
    " 作者收集和编写的代码片段集合
    Plug 'niumeng07/vim-snippets'


    " =======================================================================
    " 现代 Lua 插件 (Modern Lua Plugins)
    " =======================================================================
    " 注: 以下是更现代的、基于 Lua 的插件，通常用于替代一些旧的 Vimscript 插件。
    " 您可以根据需要选择启用它们，并禁用功能重叠的旧插件。

    " 一个功能丰富的 Lua 代码片段引擎
    Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
    " 一个现代的、模块化的 Neovim 补全引擎，可与 LSP、代码片段等多种源配合使用
    Plug 'hrsh7th/nvim-cmp'
    " 用一个漂亮的悬浮窗或列表来展示诊断信息、LSP 引用、Quickfix 列表等
    Plug 'folke/trouble.nvim'
    " 一个轻量级但功能强大的格式化插件，可以集成各种外部格式化工具
    Plug 'stevearc/conform.nvim'

    call plug#end() " 结束 vim-plug 配置块
endfunction
