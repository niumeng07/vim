" 快捷命令
nnoremap <C-c> : q<CR>
inoremap <C-c> <esc>
vnoremap <C-c> "+y

command Light : set background=light | color flattened_light
command Dark : set background=dark | color flattened_dark

" command ClipAdd : set clipboard+=unnamed
" command ClipRmv : set clipboard-=unnamed

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

map Q gq

autocmd BufWritePre,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.go,*.java,*.scala
            \ :inoremap <Enter> <c-r>=BracketsEnter('}')<CR>

function BracketsEnter(endchar)
    if getline('.')[col('.')-1] == a:endchar
        return "\<Enter>\<Tab>\<Esc>mpa\<Enter>\<Esc>`pa" 
    else
        return "\<Enter>"
    endif
endf

" 滚动设置
set mouse=a
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" 光标导航设置
inoremap <C-d> <Del>
cnoremap <c-d> <Delete>

cnoremap <c-b> <Left>
inoremap <c-b> <Left>

cnoremap <c-f> <Right>
inoremap <c-f> <Right>

inoremap <C-k> <Up>
inoremap <C-j> <Down>

inoremap <C-e> <End>

inoremap <C-a> <Home>
cnoremap <C-a> <Home>
