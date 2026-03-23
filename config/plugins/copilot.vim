let g:copilot_proxy = 'http://127.0.0.1:10086'

imap <silent><script><expr> <C-e> copilot#Accept("\<CR>")

let g:copilot_no_tab_map = v:true
let g:copilot_idle_delay = 200

imap <expr> <Plug>(vimrc:copilot-dummy-map) copilot#Accept("\<Tab>")
