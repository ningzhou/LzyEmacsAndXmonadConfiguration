#!/bin/bash

# Time-stamp: <2013-03-01 15:38:46 Friday by lzy>

BASE_DIR=$(cd $(dirname $0); pwd)
SCREEN_XRES=$(xrandr|grep "current"|cut -d " " -f 8)
TMP_DIR=$HOME/.tmp

if [ -z $1 ]; then
    echo "Please input OS: (e.g. centos, arch, ubuntu, fedora)"
    echo -n "OS Name: "
    read OS_NAME
    if [ -z $OS_NAME ]; then
        echo "OS Name can't be null."
        exit 1
    fi
else
    OS_NAME=$1
fi

OS_NAME="$(echo $OS_NAME | tr '[A-Z]' '[a-z]')"
if [ $OS_NAME = "ubuntu" ]; then
    INSTALL_CMD="sudo apt-get install"
else
    if [ $OS_NAME = "arch" ]; then
        INSTALL_CMD="sudo pacman -S"
    else
        if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
            INSTALL_CMD="sudo yum install"
        else
            echo "Unknown system name."
            exit 1
        fi
    fi
fi

# Create temporary directory
mkdir -p $TMP_DIR

# Common Installation
echo "installing backgrounds... .. ."
if [ ! -e $HOME/.WallPaper ]; then
    mkdir -p $HOME/.WallPaper
fi
cp $BASE_DIR/InstallationCommon/Backgrounds/src/* $HOME/.WallPaper -v
sudo cp $BASE_DIR/InstallationCommon/Backgrounds/wallpaper.sh /usr/bin/wallpaper.sh -v

echo "Installing conky... .. ."
mkdir -p $HOME/.lua/scripts
cp $BASE_DIR/InstallationCommon/Conky/clock_rings.lua $HOME/.lua/scripts -v
if [ $SCREEN_XRES -ge 1600 ]; then
    cp $BASE_DIR/InstallationCommon/Conky/conkyrc_large $HOME/.conkyrc -v
else
    cp $BASE_DIR/InstallationCommon/Conky/conkyrc_small $HOME/.conkyrc -v
fi

echo "Installing mouse theme... .. ."
mkdir -p $HOME/.icons
rm $HOME/.icons/* -rf
sudo cp $BASE_DIR/InstallationCommon/CursorThemes/* /usr/share/icons/ -r
sudo rm /usr/share/icons/default -rf
sudo ln -s /usr/share/icons/Pulse-Glass /usr/share/icons/default
ln -s /usr/share/icons/Pulse-Glass $HOME/.icons/default

if [ ! -e $HOME/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh ... .. ."
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

if [ -e ~/.oh-my-zsh ]; then
    echo "Installing zsh theme ... .. ."
    cp $BASE_DIR/InstallationCommon/Zsh/fox.zsh-theme $HOME/.oh-my-zsh/themes/ -v
fi

echo "Installing Xdefaults and Xresources ... .. ."
cp $BASE_DIR/InstallationCommon/TerminalSettings/Xdefaults $TMP_DIR
cp $BASE_DIR/InstallationCommon/TerminalSettings/Xresources $TMP_DIR
if [ $SCREEN_XRES -ge 1600 ]; then
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 105/g' $TMP_DIR/Xdefaults
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 105/g' $TMP_DIR/Xresources
else
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 102/g' $TMP_DIR/Xdefaults
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 102/g' $TMP_DIR/Xresources
fi
cp $TMP_DIR/Xdefaults $HOME/.Xdefaults -v
cp $TMP_DIR/Xresources $HOME/.Xresources -v
if [ $OS_NAME = "ubuntu" ];then
    sudo cp $BASE_DIR/InstallationCommon/X11Settings/xmonad.start /usr/bin/ -v
else
    cp $BASE_DIR/InstallationCommon/X11Settings/xinitrc $HOME/.xinitrc
fi

sudo cp $BASE_DIR/InstallationCommon/TerminalSettings/clipboard /usr/lib/urxvt/perl/ -v

echo "Installing xmonad and xmobar configurations... .. ."
if [ ! -e $HOME/.xmonad/back ]; then
    mkdir -p $HOME/.xmonad/back
fi

cp $BASE_DIR/InstallationCommon/XMonadSettings/* $TMP_DIR

if ifconfig|grep eth0; then
    sed -i -e 's/wlan0/eth0/g' $TMP_DIR/xmobar_dual_screen.hs
    sed -i -e 's/wlan0/eth0/g' $TMP_DIR/xmobar.hs
fi

if [ $SCREEN_XRES -ge 1440 ]; then
    sed -i -e 's/size=.*:/size=9:/g' $TMP_DIR/xmobar_dual_screen.hs
    sed -i -e 's/size=.*:/size=9:/g' $TMP_DIR/xmobar.hs
    sed -i -e 's/height.*\&/height 21\&/g' $TMP_DIR/dual_screen.sh
    sed -i -e 's/height.*\&/height 21\&/g' $TMP_DIR/single_screen.sh
else
    sed -i -e 's/size=.*:/size=8:/g' $TMP_DIR/xmobar_dual_screen.hs
    sed -i -e 's/size=.*:/size=8:/g' $TMP_DIR/xmobar.hs
    sed -i -e 's/height.*\&/height 19\&/g' $TMP_DIR/dual_screen.sh
    sed -i -e 's/height.*\&/height 19\&/g' $TMP_DIR/single_screen.sh
fi

cp $TMP_DIR/xmobar.hs $HOME/.xmonad/xmobar.hs
cp $TMP_DIR/xmobar_dual_screen.hs $HOME/.xmonad/xmobar_dual_screen.hs

if [ $OS_NAME = "ubuntu" ]; then
    cp $TMP_DIR/ubuntu_xmonad.hs $HOME/.xmonad/xmonad.hs -v
    cp $TMP_DIR/ubuntu_xmonad.hs $HOME/.xmonad/back/xmonad.hs -v
    cp $TMP_DIR/ubuntu_xmonad_dual_screen.hs $HOME/.xmonad/back/xmonad_dual_screen.hs -v
else
    cp $TMP_DIR/arch_xmonad.hs $HOME/.xmonad/xmonad.hs -v
    cp $TMP_DIR/arch_xmonad.hs $HOME/.xmonad/back/xmonad.hs -v
    cp $TMP_DIR/arch_xmonad_dual_screen.hs $HOME/.xmonad/back/xmonad_dual_screen.hs -v
fi

sudo cp $TMP_DIR/single_screen.sh /usr/bin/ -v
sudo cp $TMP_DIR/dual_screen.sh /usr/bin/ -v

rm $TMP_DIR -rf

echo "Installing tmux... .. ."
if [ ! -e "/usr/bin/tmux" ] && [ ! -e "/usr/local/bin/tmux" ]; then
    $INSTALL_CMD tmux
fi
cp $BASE_DIR/InstallationCommon/Tmux/tmux.conf $HOME/.tmux.conf -v

if [ ! -e "/usr/bin/scrot" ] && [ ! -e "/usr/local/bin/scrot" ]; then
    $INSTALL_CMD scrot
fi

if [ -e "/usr/share/slim/themes" ]; then
    if [ -e "/usr/share/slim/themes/my-theme" ]; then
        sudo rm /usr/share/slim/themes/my-theme -rf
    fi
    sudo cp $BASE_DIR/InstallationCommon/SlimTheme /usr/share/slim/themes/my-theme -rv
fi
