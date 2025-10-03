let floaterm_position='bottomright'
if has('nvim')
    let floaterm_wintype='floating'
else
    let floaterm_wintype='popup'
endif

if has('mac')
    let g:floaterm_shell='zsh'
endif

function! s:FloatermNewOrFind()
    let buffer_list = floaterm#buflist#gather()
    if len(buffer_list) == 0
        call floaterm#new(v:true, '', {}, {})
    else
        call floaterm#next()
    endif
endfunction

" nnoremap <silent> <leader>t :call <SID>FloatermNewOrFind()<CR>
" tnoremap <silent> <leader>t <C-\><C-n> :call floaterm#hide(1, 0, '')<CR>

if has('nvim')
    tnoremap <C-w><C-w> <C-\><C-n> <c-w><c-w>
endif

function s:floatermSettings()
    " setlocal number
endfunction

augroup Floaterm
    autocmd FileType floaterm call s:floatermSettings()
    autocmd User Startified setlocal buflisted
augroup END
