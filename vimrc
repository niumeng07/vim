if v:progname =~? 'evim'
    finish
endif

" -------- 基础配置 ------------------------------------------------------
execute 'source ~/.vim/config/base.vim'
execute 'source ~/.vim/config/commands.vim'
execute 'source ~/.vim/config/plugins.vim'

scriptencoding UTF-8

function CalConfigFlag()
    " 获取文件大小
    let FileSize=getfsize(expand(@%))
    if FileSize > 500 * 1024  " 大于500K
        return 'simple'
    endif
    return 'normal'
endfunction

let s:config_home = expand('~/.vim/config/plugins')
function LoadPlugConfig(ConfigFlag)
    for plugin in g:plugs_order
        if plugin ==# "vim-polyglot"
            continue
        endif
        " 如果已经安装了插件，那么载入插件配置
        if maktaba#string#EndsWith(plugin, '.vim')
            let config_file = join([s:config_home, plugin], '/')
        else
            let config_file = join([s:config_home, plugin.'.vim'], '/')
        endif
        if filereadable(config_file)
            execute 'source' fnameescape(config_file)
        endif
    endfor

    if a:ConfigFlag ==# 'simple'
        setlocal bufhidden=unload   " save memory when other file is viewed
    endif
endfunction

let config_file = join([s:config_home, 'vim-polyglot.vim'], '/')
execute 'source ' fnameescape(config_file)

" -------- 插件安装/配置 ------------------------------------------------------
let ConfigFlag=CalConfigFlag() | call LoadPlugin(ConfigFlag) | call LoadPlugConfig(ConfigFlag)

" ------- 主题配置 -------------------------------------------------------
if has('mac') || has('unix') || has('win32')
    set background=dark
    color flattened_dark
endif

if $TERM_PROGRAM ==# 'Apple_Terminal'
    set termguicolors! "Terminal不支持真彩色
    color Tomorrow-Night
endif

" docker compose file language server support
au FileType yaml if bufname("%") =~# "docker-compose.yml" | set ft=yaml.docker-compose | endif
au FileType yaml if bufname("%") =~# "compose.yml" | set ft=yaml.docker-compose | endif

let g:coc_filetype_map = {
  \ 'yaml.docker-compose': 'dockercompose',
  \ }

" let s:lua_config_home = expand('~/.vim/lua/')
" function LoadLuaConfig()
"     for plugin in g:plugs_order
"         let config_file = join([s:lua_config_home, plugin.'.lua'], '/')
"         if filereadable(config_file)
"             lua require(plugin)
"         endif
"     endfor
" endfunction

" call LoadLuaConfig()

lua require("config")
