# 我的 neovim 配置
<img width="810" alt="20220427104753" src="https://user-images.githubusercontent.com/22301072/165429827-cd018a8b-2c3e-49a3-9c1d-ab7e98e44c0b.png">

## 安装

- Windows
```sh
git clone https://github.com/john2972/myinitnvim.git ~/AppData/Local/nvim/
```
打开 neovim 执行
```
:PlugInstall
```

- Linux/macOS
```sh
git clone https://github.com/john2972/myinitnvim.git ~/.config/nvim/
```
打开 neovim 执行
```
:PlugInstall
```
授予 fzf 预览脚本执行权限
```sh
sudo chmod +x ~/.config/nvim/plugged/fzf.vim/bin/preview.sh
```

## 配置

- 自动补全设置
安装对应的 language server, 并添加至 lua/settings/nvim-cmp.lua 的 servers 列表中

- airline-themes
可替换 gruvbox 的配色至皮肤：

`nvim/plugged/vim-airline-theme/autoload/airline/themes/bubblegum.vim`
