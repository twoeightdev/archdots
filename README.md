# 🍚 Arch Linux Dotfiles

![archlinux_logo](.local/wallpapers/archlinux-logo.svg)

## 📔 Overview

Personal _dotfiles_ for [archlinux](https://archlinux.org/) and
[qtile](https://qtile.org/).

| **Dependencies**  | **Description** |
| ----------------- | --------------- |
| Qtile             | Window manager  |
| Neovim            | Editor          |
| Alacritty         | Terminal        |
| Iosevka Nerd Font | System font     |

## 📸 Screenshots

![screenshot01](.local/wallpapers/screenshot001.png)

![screenshot02](.local/wallpapers/screenshot002.png)

## 🚀 Dotfiles Installation

I use **Git Bare** repository to manage my dotfiles and use a wrapper script
[dot](.local/bin/dot) after initial configuration below.

```zsh
mkdir ~/script
cd ~/script
curl -LO https://raw.githubusercontent.com/twoeightdev/archdots/main/setup.sh
chmod +x setup.sh
./setup.sh [OPTIONS]
rm -rf ~/script
reboot
```
