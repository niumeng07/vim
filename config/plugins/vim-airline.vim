" Don't show word count.
scriptencoding UTF-8
let g:airline#extensions#wordcount#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_warning=''
let g:airline_section_error= ''

let g:airline_symbols = { 
     \ 'space': ' ',
     \ 'paste': 'PASTE',
     \ 'dirty': '!',
     \ 'crypt': '🔒',
     \ 'linenr': '',
     \ 'readonly': '⊝',
     \ 'spell': 'SPELL',
     \ 'modified': '+',
     \ 'notexists': '',
     \ 'keymap': 'Keymap :',
     \ 'ellipsis': '...',
     \ 'branch': 'ᚠ',
     \ 'whitespace': '',
     \ 'maxlinenr': '',
\ }
" let g:airline_section_z = '%3p%%%#__accent_bold#%{g:airline_symbols.linenr}%2l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%2v'
let g:airline_section_z = '%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%v'
let g:airline#extensions#branch#enabled = 0
