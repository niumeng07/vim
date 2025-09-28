# Introduction

## Install

```sh
cd ~ && mv .vim .vim.bak && git clone https://github.com/niumeng07/vim.git .vim --recursive
vim +PlugInstall
```

## third-party

### tools

```sh
brew install ripgrip
brew install coursier
coursier install scalafmt
```

### font

```sh
brew install homebrew/cask-fonts/font-hackgen-nerd --cask
brew install --cask font-hack-nerd-font
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} \
      brew install --cask {} || true
```

### Other Language Support

```sh
vim -c "MasonInstall black clang-format clangd isort jq prettier prettierd pyright ruff rustfmt shfmt stylua"
```

### colorscheme
```sh
vim -c "TSInstall cpp python java scala"
```
