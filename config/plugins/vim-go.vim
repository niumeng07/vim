" go def
let g:go_def_mode='godef'

let g:codefmt='java -jar'
let g:google_java_executable=$HOME.'/.vim/deps/format/google-java-format-1.7-all-deps.jar'

" the glaive#Install() should go after the call vundle#end()
call glaive#Install()
" shoud go after call glaive#Install()
Glaive codefmt plugin[mappings]
