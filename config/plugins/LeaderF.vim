" Leaderf
let g:Lf_WindowPosition = 'popup'
nnoremap <silent> <leader>v :LeaderfFunction <CR>
" nnoremap <silent> <leader>c :LeaderfHistoryCmd <CR>
" nnoremap <silent> <leader>s :LeaderfHistorySearch <CR>
" nnoremap <silent> <leader>m :LeaderfMru <CR>

let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': 'DejaVu Sans Mono for Powerline' }
let g:Lf_CursorBlink = 0
let g:Lf_RgConfig = ['--max-columns=150', '--no-ignore']
" let g:Lf_ShortcutF = '<C-P>'
let g:Lf_UseVersionControlTool = 0
let g:Lf_ShowHidden=1
let g:Lf_DefaultExternalTool = ''
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', '.svn'],
        \ 'file': ['*.pyc', '*.so', '*.a', '*.o']
        \}

function! s:FindWithRg()
    Leaderf rg --hidden --smart-case --glob !.ccls-cache --glob !.git
endfunction

nnoremap <silent><leader>rg :call <SID>FindWithRg()<CR>
