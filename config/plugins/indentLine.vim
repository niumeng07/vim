scriptencoding UTF-8
" indentLine
let g:indentLine_char = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileType = ['py']

let g:indentLine_enabled = 1

" 只打开py类型文件的IndentLine
" autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter *.py IndentLinesReset
