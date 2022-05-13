# nvim

Neovim 配置文件（for Mac OS）

## 需要安装的软件

* [glow](https://github.com/charmbracelet/glow)
* [nnn](https://github.com/jarun/nnn)
* [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli)
* [stylua](https://github.com/JohnnyMorganz/StyLua)
* ripgrep
* gnu-sed
* exiftool

安装命令：

```shell
brew install glow
brew install nnn
npm install -g markdownlint-cli
brew install ripgrep
brew install gnu-sed
brew install exiftool
cargo install stylua
```

## 需要安装的 LSP Server

* [rust-analyzer](https://rust-analyzer.github.io)
* [lua-language-server](https://github.com/sumneko/lua-language-server)
* cmake-language-server
* clangd（如果要格式化的话，还需要确保安装了 clang-format

> clangd 正常工作，还需要在项目根目录生成一个 compile_commands.json 文件

例如使用 CMake 可以这样生成（先生成 json 文件，再软链接到项目根目录）：

```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build
ln -s build/compile_commands.json .
```

## 需要安装的字体

* [nerd-fonts](https://www.nerdfonts.com)
