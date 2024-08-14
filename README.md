### Introduction 
My vimrc.  
Most used languages: C/C++, Golang, Python2/Python3, Java/Scala, Shell, Lua, Rust, PHP  
 
### Plugins 
- [google/vim-maktaba](https://github.com/google/vim-maktaba) Maktaba is a vim script plugin library 
- [google/vim-glaive](https://github.com/google/vim-glaive) Glaive is a utility for configuring maktaba plugins 
- [google/vim-codefmt](https://github.com/google/vim-codefmt) codefmt is a utility for syntax-aware code formatting(Support: Bazel,c,cc,Dart,css,go,java,python...) 
- [niumeng07/vim-colorschemes](https://github.com/niumeng07/vim-colorschemes) 
- [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion) 
- [godlygeek/tabular](https://github.com/godlygeek/tabular) align tool, must come before plasticboy/vim-markdown 
- [fatih/vim-go](https://github.com/fatih/vim-go) 
- [derekwyatt/vim-scala](https://github.com/derekwyatt/vim-scala) 
- [niumeng07/vim-snippets](https://github.com/niumeng07/vim-snippets) 
- [junegunn/fzf](https://github.com/junegunn/fzf) 
- [Yggdroot/LeaderF](https://github.com/Yggdroot/LeaderF) 
- [liuchengxu/vim-which-key](https://github.com/liuchengxu/vim-which-key) 
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) 
- [Shougo/neco-vim](https://github.com/Shougo/neco-vim) neco-vim is the framework for coc.nvim 
- [neoclide/coc-neco](https://github.com/neoclide/coc-neco) vim completion source for coc.nvim 
- [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot) A collection of language packs for Vim 
- [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi) 
- [terryma/vim-smooth-scroll](https://github.com/terryma/vim-smooth-scroll) 
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) Git command tool 
- [vim-scripts/DoxygenToolkit.vim](https://github.com/vim-scripts/DoxygenToolkit.vim) 
- [voldikss/vim-floaterm.git](https://github.com/voldikss/vim-floaterm.git) 
- [vim-scripts/a.vim](https://github.com/vim-scripts/a.vim) 
- [ervandew/supertab](https://github.com/ervandew/supertab) All complete in <TAB> 
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) 
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) 
- [codota/tabnine-vim](https://github.com/codota/tabnine-vim)
 
### Install 
Install with vim-plug. 
```sh 
cd ~ && /bin/rm -rf .vim && git clone https://github.com/niumeng07/vim.git .vim --recursive
vim +PlugInstall 
wget https://github.com/google/google-java-format/releases/download/google-java-format-1.9/google-java-format-1.9-all-third_party.jar ~/.vim/third_party/format
or download latest version from https://github.com/google/google-java-format/releases/
``` 
 
### third-party 
1. go support 
```sh
vim +GoInstallBinaries
npm i -g neovim
go get -u github.com/stamblerre/gocode
```
 
2. support for ag 
```sh
brew install the_silver_searcher
# For Ubuntu, apt-get install the_silver_searcher
# For CentOS, yum install the_silver_searcher
```
 
3. third_party of coc. 
```sh
# curl -sL install-node.now.sh/lts | sh
brew install node
```
yarn is necessary if install coc from source. 
```sh
alias vim="PATH=$HOME/.vim/third_party/yarn/bin:$PATH vim"
$HOME/.vim/third_party/yarn/bin/yarn add coc-json coc-snippets
```
If coc can't find package.json, delete ~/.config/coc/extensions/node_modules/* and reinstall coc-plugins.
```sh
vim -c "PlugUpdate"
vim -c "CocInstall coc-explorer coc-floaterm coc-git coc-pairs coc-prettier coc-lists coc-marketplace|q"
vim -c "CocInstall coc-vetur coc-rls coc-solargraph coc-calc coc-translator coc-yank|q"
vim -c "CocInstall coc-phpls coc-vimlsp coc-go coc-html|q"  # langserver
vim -c "CocInstall coc-java coc-json coc-xml coc-yaml coc-css coc-emmet coc-tslint coc-tsserver|q"
vim -c "CocInstall coc-dictionary coc-word coc-snippets coc-tag coc-ultisnips coc-gocode|q"  # completion
vim -c "CocInstall coc-markdownlint|q"

# vim -c "CocInstall @yaegassy/coc-black-formatter"   # 更严格的 python formatter, 该formater过于啰嗦
# vim -c "CocCommand black-formatter.installServer"

# vim -c "CocInstall coc-omni|q" # will block vim on completion
# vim -c "CocInstall coc-tabnine|q" # Too much cpu used.
# vim -c "CocInstall coc-ccls coc-sh|q"  # Use language server instead.
# vim -c "CocInstall coc-syntax|q"  # get words from syntax for completion, use coc-dictionary/coc-word instead.
# vim -c "CocInstall coc-highlight|q" # call Node, too much CPU used.

vim -c 'CocUpdateSync|q'
```

Install coc dependencies:
```
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.9.9 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f
```
coc-java cashe:
  Version 57 of JDT Lang Sever works fine
  https://download.eclipse.org/jdtls/milestones/0.57.0/

  Quick hack for those who are facing this issue
  Replace all directories/files in ~/.config/coc/extensions/coc-java-data/server with directories/files from above extracted JDT lang server tar.

Try build coc if errors found following coc updates.
```sh
cd ~/.vim/plugged/coc.nvim && $HOME/.vim/third_party/yarn/bin/yarn install --frozen-lockfile && cd -
```
Or config in plugin configs. 
```vim
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
```

4. Python support 
```sh
# vim -c "CocInstall coc-python" # Too much CPU used.
vim -c "CocInstall coc-pyright"
```

5. C++ support 
build ccls from source. 
```sh
git clone https://github.com/MaskRay/ccls --recursive
cd ccls
brew info llvm
cmake -S. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/local/Cellar/llvm/18.1.8/lib/cmake/
cmake --build Release
cd Release
make -j
sudo make install
```
 
6. hack nerd font
```sh
brew install homebrew/cask-fonts/font-hackgen-nerd --cask
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true
```

7. floaterm for neovim 
```sh
sudo pip3 install neovim-remote
```
 
9. Other Language Support 
```sh
npm i -g sql-language-server
# orbrew install sql-language-server

npm i -g bash-language-server
# or brew install bash-language-server
npm install -g dockerfile-language-server-nodejs
# 以下是tex language server (cp third_party/digestif /usr/local/bin/digestif && chmod +x /usr/local/bin/digestif)
sudo curl -o /usr/local/bin/digestif https://raw.githubusercontent.com/astoff/digestif/master/scripts/digestif
sudo chmod +x /usr/local/bin/digestif

go get github.com/mattn/efm-langserver
# or brew install efm-langserver

sudo pip3 install cmake-language-server
npm install -g dockerfile-language-server-nodejs
sudo pip install 'python-language-server[all]'
sudo pip3 install 'python-language-server[all]'
sudo pip install pynvim
sudo pip3 install pynvim
sudo pip install vim-vint
sudo pip3 install vim-vint
```


### Plugins deprecated 
- [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine) 
- [iamcco/markdown-preview.vim](https://github.com/iamcco/markdown-preview.vim) 
- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown) 
- [iamcco/mathjax-support-for-mkdp](https://github.com/iamcco/mathjax-support-for-mkdp) MathJax support for markdown-preview.vim 
- [skywind3000/asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) 
- [skywind3000/quickmenu.vim](https://github.com/skywind3000/quickmenu.vim) 
- [t9md/vim-choosewin](https://github.com/t9md/vim-choosewin.git) 
- [liuchengxu/vista.vim](https://github.com/liuchengxu/vista.vim) 
- [rizzatti/dash.vim](https://github.com/rizzatti/dash.vim) 
- [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter) 
- [gmarik/vundle](https://github.com/gmarik/vundle) Use plugin instead. 
- [vim-scripts/L9](https://github.com/vim-scripts/L9) Vim-script library, Use vim-maktaba instead. 
- [majutsushi/tagbar](https://github.com/majutsushi/tagbar) Use vista instead. 
- [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe) Use coc-language-server/tabnine instead. 
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) Use coc-explorer instead. 
- [Shougo/defx.nvim](https://github.com/Shougo/defx.nvim) Use coc-explorer instead. 
- [kristijanhusak/defx-icons](https://github.com/kristijanhusak/defx-icons) 
- [roxma/nvim-yarp](https://github.com/roxma/nvim-yarp) 
- [roxma/vim-hug-neovim-rpc](https://github.com/roxma/vim-hug-neovim-rpc) 
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim) Use coc-emmet instead. 
- [artur-shaik/vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2) Use coc-metals instead. 
- [SirVer/ultisnips](https://github.com/SirVer/ultisnips) 
- [CodeFalling/fcitx-vim-osx](https://github.com/CodeFalling/fcitx-vim-osx) 
- [hecal3/vim-leader-guide](https://github.com/hecal3/vim-leader-guide) 
- [mhinz/vim-signify](https://github.com/mhinz/vim-signify) 
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) Use vim-fugitive instead. 
- [gregsexton/gitv](https://github.com/gregsexton/gitv) Use vim-fugitive instead. 
- [python-mode/python-mode](https://github.com/python-mode/python-mode) 
- [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region) 
- [tell-k/vim-autopep8](https://github.com/tell-k/vim-autopep8) Use coc-format/code-formatter instead 
- [liuchengxu/vim-clap](https://github.com/liuchengxu/vim-clap) Use Leaderf + rg + git-fugitive instead 
- [rking/ag.vim](https://github.com/rking/ag.vim) Use rg instead 
- [Shougo/neoinclude.vim](https://github.com/Shougo/neoinclude.vim) neoinclude is the framework for neocomplete/deoplete/ncm 
- [jsfaint/coc-neoinclude](https://github.com/jsfaint/coc-neoinclude) neoinclude completion source for coc.nvim 
- [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate) Use coc-pairs instead 
- [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch) Use asyncrun instead 
- [dense-analysis/ale](https://github.com/dense-analysis/ale) Asynchronous Lint Engine, Use coc-language-server instead 
- [nsf/gocode](https://github.com/nsf/gocode)  suggest you use the Go language server, gopls.
