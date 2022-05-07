scriptencoding UTF-8
" let g:coc_global_extensions =
"     \ ['coc-pairs', 'coc-highlight', 'coc-snippets', 'coc-yank', 'coc-explorer',
"     \  'coc-git', 'coc-lists', 'coc-prettier', 'coc-tabnine', 'coc-tsserver']
" let g:coc_global_extensions =
"     \ ['coc-calc', 'coc-ccls', 'coc-css', 'coc-emmet', 'coc-explorer', 'coc-git',
"     \ 'coc-go', 'coc-highlight', 'coc-html', 'coc-java', 'coc-json', 'coc-lists',
"     \ 'coc-marketplace', 'coc-metals', 'coc-pairs', 'coc-phpls', 'coc-prettier',
"     \ 'coc-python', 'coc-rls', 'coc-sh', 'coc-snippets', 'coc-solargraph',
"     \ 'coc-tabnine', 'coc-translator', 'coc-tsserver', 'coc-vetur', 'coc-vimlsp',
"     \ 'coc-xml', 'coc-yaml', 'coc-yank']

" 定义/引用等的跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 自动补全
imap <C-l> <Plug>(coc-snippets-expand)

" Format selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" 使用K悬浮显示定义
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:CocExplorer()
    CocCommand explorer --width=30 --toggle --content-width-type vim-width
    " CocCommand explorer --width=30 --toggle --quit-on-open --content-width-type win-width
endfunction

command! Tree :call <SID>CocExplorer()
nnoremap <silent> <leader>e :call <SID>CocExplorer()<CR>
nnoremap <silent> <leader>h :CocList --number-select --regex --ignore-case<CR>
