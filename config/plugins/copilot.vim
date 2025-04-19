" copilot 配置
let g:copilot_proxy = 'http://127.0.0.1:10086'

imap <C-d> <Plug>(copilot-dismiss)

imap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<Plug>(copilot-next)"
imap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<Plug>(copilot-previous)"

imap <C-o> <Plug>(copilot-accept-word)
imap <C-l> <Plug>(copilot-accept-line)

" 不使用tab,tab留给默认补全
" let g:copilot_no_tab_map = v:true
