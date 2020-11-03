nnoremap <C-c> : q<CR>
inoremap <C-c> <esc>
vnoremap <C-c> "+y

command Light : set background=light | color flattened_light
command Dark :  set background=dark | color flattened_dark

command ClipAdd : set clipboard+=unnamed
command ClipRmv : set clipboard-=unnamed

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
