# Introduction

My vimrc.

## Plugins

- [google/vim-maktaba](https://github.com/google/vim-maktaba)
- [google/vim-glaive](https://github.com/google/vim-glaive)
- [google/vim-codefmt](https://github.com/google/vim-codefmt)
- [niumeng07/vim-colorschemes](https://github.com/niumeng07/vim-colorschemes)
- [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
- [godlygeek/tabular](https://github.com/godlygeek/tabular)
- [fatih/vim-go](https://github.com/fatih/vim-go)
- [derekwyatt/vim-scala](https://github.com/derekwyatt/vim-scala)
- [niumeng07/vim-snippets](https://github.com/niumeng07/vim-snippets)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [Yggdroot/LeaderF](https://github.com/Yggdroot/LeaderF)
- [liuchengxu/vim-which-key](https://github.com/liuchengxu/vim-which-key)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [Shougo/neco-vim](https://github.com/Shougo/neco-vim)
- [neoclide/coc-neco](https://github.com/neoclide/coc-neco)
- [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [terryma/vim-smooth-scroll](https://github.com/terryma/vim-smooth-scroll)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-scripts/DoxygenToolkit.vim](https://github.com/vim-scripts/DoxygenToolkit.vim)
- [voldikss/vim-floaterm.git](https://github.com/voldikss/vim-floaterm.git)
- [vim-scripts/a.vim](https://github.com/vim-scripts/a.vim)
- [ervandew/supertab](https://github.com/ervandew/supertab)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [codota/tabnine-vim](https://github.com/codota/tabnine-vim)

## Install

```sh
cd ~ && /bin/rm -rf .vim && git clone https://github.com/niumeng07/vim.git .vim --recursive
vim +PlugInstall
```

## third-party

### go support

```sh
vim +GoInstallBinaries
npm i -g neovim
go install github.com/stamblerre/gocode@latest
```

### tools

```sh
brew install ripgrip  # brew install the_silver_searcher
brew install node     # curl -sL install-node.now.sh/lts | sh
brew install ctags    # dependencies of LeaderF
```

### vim tools

```sh
vim -c "PlugUpdate"
vim -c "CocInstall coc-explorer coc-floaterm coc-git coc-pairs coc-prettier|q"
vim -c "CocInstall coc-lists coc-marketplace coc-tsserver|q"
vim -c "CocInstall coc-vetur coc-rls coc-solargraph coc-calc coc-translator coc-yank|q"
vim -c "CocInstall coc-phpls coc-vimlsp coc-go coc-html|q"
vim -c "CocInstall coc-java coc-json coc-xml coc-yaml coc-css coc-emmet coc-tslint|q"
vim -c "CocInstall coc-dictionary coc-word coc-snippets coc-tag coc-ultisnips coc-gocode|q"
vim -c "CocInstall coc-markdownlint|q"
vim -c "CocInstall coc-pyright"

vim -c 'CocUpdateSync|q'
```

### Coc dependencies

```sh
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.9.9 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f
```

### C++ support

```sh
cd third_party/ccls
cmake -S. -BRelease -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=$(realpath $(brew --prefix llvm))/*/lib/cmake/

cmake --build Release
cd Release
make -j
sudo make install
```

### font

```sh
brew install homebrew/cask-fonts/font-hackgen-nerd --cask
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} \
      brew install --cask {} || true
```

### java

```sh
download google-java-format-1.9-all-third_party.jar
from https://github.com/google/google-java-format/releases/
to ~/.vim/third_party/format
```

### Other Language Support

```sh
npm i -g sql-language-server  # or brew install sql-language-server
npm i -g bash-language-server # or brew install bash-language-server
npm install -g dockerfile-language-server-nodejs

go install github.com/mattn/efm-langserver@latest   # or brew install efm-langserver
go install golang.org/x/tools/gopls@latest

sudo pip3 install pynvim --break-system-packages
sudo pip3 install cmake-language-server --break-system-packages
sudo pip3 install 'python-language-server[all]' --break-system-packages
sudo pip3 install vim-vint --break-system-packages
sudo pip3 install neovim-remote

sudo pip install 'python-language-server[all]'
sudo pip install pynvim
sudo pip install vim-vint
```
