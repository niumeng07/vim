# Introduction

My vimrc.

## Plugins

- [google/vim-maktaba](https://github.com/google/vim-maktaba)
- [google/vim-glaive](https://github.com/google/vim-glaive)
- [Shougo/neco-vim](https://github.com/Shougo/neco-vim)
- [neoclide/coc-neco](https://github.com/neoclide/coc-neco)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [Yggdroot/LeaderF](https://github.com/Yggdroot/LeaderF)
- [bullets-vim/bullets.vim](https://github.com/bullets-vim/bullets.vim)
- [codota/tabnine-nvim](https://github.com/codota/tabnine-nvim)
- [github/copilot.vim](https://github.com/github/copilot.vim)
- [ervandew/supertab](https://github.com/ervandew/supertab)
- [derekwyatt/vim-scala](https://github.com/derekwyatt/vim-scala)
- [fatih/vim-go](https://github.com/fatih/vim-go)
- [scalameta/nvim-metals](https://github.com/scalameta/nvim-metals)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [godlygeek/tabular](https://github.com/godlygeek/tabular)
- [google/vim-codefmt](https://github.com/google/vim-codefmt)
- [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [niumeng07/vim-colorschemes](https://github.com/niumeng07/vim-colorschemes)
- [terryma/vim-smooth-scroll](https://github.com/terryma/vim-smooth-scroll)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [vim-scripts/DoxygenToolkit.vim](https://github.com/vim-scripts/DoxygenToolkit.vim)
- [vim-scripts/a.vim](https://github.com/vim-scripts/a.vim)
- [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)
- [niumeng07/vim-snippets](https://github.com/niumeng07/vim-snippets)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

## Install

```sh
cd ~ && mv .vim .vim.bak && git clone https://github.com/niumeng07/vim.git .vim --recursive
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
brew install rust     # dependency of tabnine-nvim
```

### coc plugins

```sh
vim -c "PlugUpdate"
vim -c "CocInstall coc-css coc-json coc-java coc-yaml coc-xml coc-gocode coc-go coc-html"
vim -c "CocInstall coc-vetur coc-tsserver coc-tslint coc-solargraph coc-rls coc-lists"
vim -c "CocInstall coc-pyright coc-phpls coc-marketplace coc-markdownlint"
vim -c "CocInstall coc-floaterm coc-git coc-explorer coc-emmet coc-dictionary"
vim -c "CocInstall coc-calc coc-yank coc-word coc-vimlsp coc-ultisnips coc-translator coc-tag"
vim -c "CocInstall coc-tabnine coc-snippets coc-prettier coc-pairs coc-lua"
vim -c 'CocUpdateSync|q'
```

### Coc dependencies

```sh
./third_party/coursier/coursier bootstrap \
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
        -DCMAKE_PREFIX_PATH=$(realpath $(brew --prefix llvm))/lib/cmake/

cmake --build Release
cd Release
make -j
sudo make install
```

### font

```sh
brew install homebrew/cask-fonts/font-hackgen-nerd --cask
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
brew install lua-language-server
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

### color
vim -c "TSInstall cpp python java scala"
