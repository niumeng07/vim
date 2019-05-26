### Vim Settings

#### Install
**子库不需要下载，用以下命令安装**  
```python
0. cd ~
1. git clone https://github.com/niumeng07/vim.git && mv vim .vim
   Update plug.vim with curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   Update dependices with wget https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar ./.vim/
2. ln -sf ~/.vim/.vimrc ~/.vimrc
3. :PlugInstall in vim.
4. :GoInstallBinaries in vim.
5. Macos: cd plugged/YouCompleteMe && ./install.py --all
   Linux: cd plugged/YouCompleteMe && python34 ./install.py --clang-completer --go-completer --ts-completer --java-completer #不包含C#,Rust支持
6. Add export GOPATH=$GOPATH:~/.vim/plugged/vim-go/binary:"项目路径1":"项目路径2" to ~/.bash_profile
   Add export GOROOT="GO安装路径" to ~/.bash_profile #go version > 1.10.? #可以直接下载go1.12 wget https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz解压可用
   Add export PATH="$GOROOT/bin/:$PATH"
7. For MacOS, brew install the_silver_searcher  
   For Ubuntu, apt-get install the_silver_searcher
   For CentOS, yum install the_silver_searcher
8. 安装coc依赖
   curl -sL install-node.now.sh/lts | sh
   #下面是coc用的yarn命令,和Hadoop的Yarn命令不是一样
   # curl --compressed -o- -L https://yarnpkg.com/install.sh | bash #该命令会直接把yarn安装到~目录并且修改PATH,会导致Hadoop-Yarn命令不可用,所以用以下方法替代
   wget https://nightly.yarnpkg.com/latest.tar.gz && tar -xzvf latest.tar.gz
   # 把 export PATH="$HOME/.vim/yarn-v1.17.0-20190429.1820/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" 添加到~/.bash_profile中,但会导致hadoop-yarn命令不可用
   或者alias vim="PATH=$HOME/.vim/yarn-v1.17.0-20190429.1820/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH vim"
   $HOME/.vim/yarn-v1.17.0-20190429.1820/bin/yarn add coc-json coc-snippets
```
