# 我的 neovim 配置

## 安装

- Windows
```sh
$git clone https://github.com/john2972/myinitnvim.git ~/AppData/Local/nvim/
```
打开 neovim 执行
```
:PlugInstall
```

- Linux/macOS
```sh
$git clone https://github.com/john2972/myinitnvim.git ~/.config/nvim/
```
打开 neovim 执行
```
:PlugInstall
```
授予 fzf 预览脚本执行权限
```sh
$sudo chmod +x .config/nvim/plugged/fzf.vim/bin/preview.sh
```

## 配置

- 自动补全设置
安装对应的 language server, 并添加至 lua/settings/nvim-cmp.lua 的 servers 列表中
