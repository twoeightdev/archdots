#!/bin/bash
# https://github.com/twoeightdev
# Author: twoeightdev

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
srcdir="$HOME/.local/src"
dmenudir="$HOME/.local/src/archdmenu"
startdir="$HOME/.local/src/startpage"
name="$USER"

menu() {
    echo -e "\e[1;4;35mUsage:\e[0m \e[1;37m" "$me" "[OPTION]\e[0m"
    echo " "
    echo -e "\e[1;92maurhelper:\e[0m ............ \e[37myay AUR helper installation.\e[0m"
    echo -e "\e[1;92marchpkg:\e[0m .............. \e[37mARCH packages installation.\e[0m"
    echo -e "\e[1;92mdotfiles:\e[0m ............. \e[37mclone my personal dotfiles.\e[0m"
    echo -e "\e[1;92maurpkg:\e[0m ............... \e[37mAUR packages installation.\e[0m"
    echo -e "\e[1;92mclean:\e[0m ................ \e[37mremove unwanted files and directory.\e[0m"
    echo -e "\e[1;92mdmenu:\e[0m ................ \e[37mdmenu personal build.\e[0m"
    echo -e "\e[1;92mstartpage:\e[0m ............ \e[37mstartpage for qutebrowser.\e[0m"
    echo -e "\e[1;92mgenkey:\e[0m ............... \e[37mgenerate ssh-key.\e[0m"
    echo -e "\e[1;92mremoteurl:\e[0m ............ \e[37mchange src remote urls.\e[0m"
}

aurhelper() {
    cd /tmp/ || exit
    curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
    tar xvzf yay.tar.gz
    cd yay || exit
    makepkg -sci
}

archpkg() {
    pkgs=(
        # xorg
        xorg-xdpyinfo xorg-xev xorg-xinit xorg-xinput xorg-xprop xcape
        xorg-xset xorg-xsetroot xorg-xwininfo xterm xclip xdo xdotool xwallpaper
        # amd
        lib32-vulkan-radeon mesa-utils mesa-vdpau vulkan-tools
        # audio
        pipewire pipewire-alsa pipewire-pulse pulsemixer
        # fonts
        libertinus-font noto-fonts noto-fonts-emoji ttf-dejavu ttf-liberation
        ttc-iosevka ttc-iosevka-aile ttf-iosevka-nerd ttf-joypixels
        ttf-inconsolata ttf-inconsolata-nerd ttf-roboto-mono
        # utilities
        evtest exfat-utils brightnessctl dosfstools bc btop htop nvtop
        ffmpeg ffmpegthumbnailer highlight imagemagick maim gnome-keyring
        libnotify man-db mediainfo moreutils ntfs-3g picom poppler psutils
        unrar unzip yt-dlp zip tesseract tesseract-data-eng tesseract-data-osd
        wget tree ripgrep fd unclutter polkit cpupower pacutils npm
        # python
        python-dbus-next python-iwlib python-mpd2 python-pip python-psutil
        # programs
        emacs firefox firefox-dark-reader firefox-tridactyl firefox-ublock-origin
        mpc mpd mpv ncmpcpp nsxiv lf newsboat qtile gimp gucharmap steam dunst
        alacritty transmission-cli zathura zathura-pdf-mupdf spotify-launcher
    )
    # install all listed pkgs
    yay --needed --noconfirm -Syu "${pkgs[@]}"
}

dotfiles() {
    cd ~ || exit
    git clone --bare https://github.com/twoeightdev/archdots.git "$HOME"/.config/.dots
    git --git-dir="$HOME"/.config/.dots/ --work-tree="$HOME" checkout
    echo -e "\e[1;31mdone!\e[0m"
}

aurpkg() {
    aurpkgs=(
        tremc-git
        catppuccin-gtk-theme-mocha
        firefox-tridactyl-native
        python-pulsectl-asyncio
    )
    # install all aur packages
    yay --needed --noconfirm --answerclean None --answerdiff None --removemake -S "${aurpkgs[@]}"
}

clean() {
    rm -rf /home/"$name"/.bash_logout
    rm -rf /home/"$name"/.bash_profile
    rm -rf /home/"$name"/.bashrc
    rm -rf /home/"$name"/.zshrc
    rm -rf /home/"$name"/.nimble
    mkdir -p /home/"$name"/.venv
    mkdir -p /home/"$name"/.local/downloads
    mkdir -p /home/"$name"/.local/drafts
    mkdir -p /home/"$name"/.local/screenshot
    mkdir -p /home/"$name"/.local/src
    mkdir -p /home/"$name"/.local/testfiles
    mkdir -p /home/"$name"/.local/torrent
    echo -e "\e[1;31mdone!\e[0m"
}

dmenu() {
    cd "$srcdir" || exit
    git clone https://github.com/twoeightdev/archdmenu.git
    cd "$dmenudir" || exit
    make && sudo make install
}

startpage() {
    cd "$srcdir" || exit
    git clone https://github.com/twoeightdev/startpage.git
}

genkey() {
    yes "y" | ssh-keygen -t ed25519 -C "twoeightdev@gmail.com" -f ~/.ssh/githubkey -N "" -q
    echo -e "\e[1;31mdone!\e[0m"
}

remoteurl() {
    cd "$dmenudir" || exit
    git remote set-url origin git@github.com:twoeightdev/archdmenu.git
    cd "$startdir" || exit
    git remote set-url origin git@github.com:twoeightdev/startpage.git
    cd ~/ || exit
    git --git-dir="$HOME"/.config/.dots --work-tree="$HOME" remote set-url origin git@github.com:twoeightdev/archdots.git
    echo -e "\e[1;31mdone!\e[0m"
}

if [ -n "$1" ]; then
    $1
else
    menu
fi
