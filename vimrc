if v:progname =~? 'evim'
    finish
endif

" -------- BASEMENT -----------------------------------
execute 'source ~/.vim/config/base.vim'

" -------- CUSTOM COMMAND -----------------------------
execute 'source ~/.vim/config/commands.vim'

" -------- PLUGINS AND PLUGINS CONFIG -----------------
execute 'source ~/.vim/config/plugins.vim'

scriptencoding UTF-8

function! s:EndsWith(haystack, needle) abort
    return strridx(a:haystack, a:needle) == (strlen(a:haystack) - strlen(a:needle))
endfunction

let s:config_home = expand('~/.vim/config/plugins')

for plugin in g:plugs_order
    if s:EndsWith(plugin, '.vim')
        let config_file = join([s:config_home, plugin], '/')
    else
        let config_file = join([s:config_home, plugin.'.vim'], '/')
    endif
    if filereadable(config_file)
        execute 'source' fnameescape(config_file)
    endif
endfor

" ------- COLORSCHEME ---------------------------------
if has('mac') || has('unix') || has('win32')
    set background=dark
    color flattened_dark
endif

if $TERM_PROGRAM ==# 'Apple_Terminal'
    set termguicolors!    " Terminal does not support true color
    color Tomorrow-Night
endif

" Docker Compose Language Server Support
au FileType yaml if bufname("%") =~# "docker-compose.yml" | set ft=yaml.docker-compose | endif
au FileType yaml if bufname("%") =~# "compose.yml" | set ft=yaml.docker-compose | endif

if has('nvim')
    set scrollopt+=ver,hor
    set scrolljump=0
endif

" -------------- PLUGINS LUA CONFIG ------------------
if has('nvim')
    lua require("config")
    lua require("plug-gitsigns")
    lua require("plug-lsp")
    lua require("plug-mason")
    lua require("plug-conform")
    lua require("plug-treesitter")
    lua require("plug-tree")
    lua require("plug-neoscroll")
    lua require("plug-lualine")
endif
