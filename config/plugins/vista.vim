function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}

"['ctags', 'ale', 'coc', 'lcn', 'vim_lsp']
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista_echo_cursor_strategy = 'floating_win'

let g:vista#executives = ['ale', 'coc', 'ctags', 'lcn', 'nvim_lsp', 'vim_lsc', 'vim_lsp']
let g:vista#extensions = ['markdown', 'rst']
let g:vista#finders = ['clap', 'fzf', 'skim']
let g:vista#renderer#ctags = 'line'
let g:vista_blink = [2, 100]
let g:vista_cursor_delay = 100
let g:vista_disable_statusline = 0
let g:vista_echo_cursor = 1
let g:vista_ignore_kinds = []
let g:vista_no_mappings = 0
let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 30
let g:vista_top_level_blink = [2, 100]

let g:vista_executive_for = {
    \ 'python': 'coc',
    \ 'go': 'coc',
    \ 'c': 'coc', 'cc': 'coc', 'cpp': 'coc', 'h': 'coc', 'hh': 'coc', 'hpp': 'coc',
    \ }
let g:vista_close_on_jump=1
" nnoremap <silent> <leader>v :Vista!!<CR>
