# Introduction

## Install

```sh
brew install ripgrip git rust fzf

cd ~
mv .vim .vim.bak

git clone https://github.com/niumeng07/vim.git .vim --recursive

ln -sf ~/.vim ~/.config/nvim
```

## third-party

### tools

```sh
brew install autojump
brew install coursier
coursier install scalafmt
```

### font

```sh
brew install --cask font-hack-nerd-font
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} \
      brew install --cask {} || true
```


<img width="1512" height="932" alt="4" src="https://github.com/user-attachments/assets/94494f2a-4e68-4503-9fb3-5011992c16b1" />
<img width="1512" height="933" alt="3" src="https://github.com/user-attachments/assets/8e87f10c-53aa-45a6-b71b-e325b7ca3a86" />
<img width="1509" height="931" alt="2" src="https://github.com/user-attachments/assets/73e333c8-998f-4cb5-94df-bbad596c6338" />
<img width="1508" height="930" alt="1" src="https://github.com/user-attachments/assets/cc09c8a3-8525-4254-b79a-21da442ffbf1" />









