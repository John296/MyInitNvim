# 我的 neovim 配置

## 安装

- Windows
```sh
$git clone https://github.com/john2972/myinitnvim.git ~/AppData/Local/nvim/
```

- Linux/macOS
```sh
$git clone https://github.com/john2972/myinitnvim.git ~/.config/nvim/
```

打开 neovim 执行
```
:PlugInstall
```

Linux/macOS 需要授予 fzf 预览脚本执行权限
```sh
$sudo chmod +x .config/nvim/plugged/fzf.vim/bin/preview.sh
```
