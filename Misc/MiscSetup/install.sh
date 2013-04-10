#!/bin/sh

# Time-stamp: <2013-04-10 22:18:45 Wednesday by lzy>

BASE_DIR=$(cd $(dirname $0); pwd)

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

# Common Installation
echo "Installing mouse theme... .. ."
mkdir -p $HOME/.icons
rm $HOME/.icons/* -rf
sudo cp $BASE_DIR/CursorThemes/* /usr/share/icons/ -r
sudo rm /usr/share/icons/default -rf
sudo ln -s /usr/share/icons/Pulse-Glass /usr/share/icons/default
ln -s /usr/share/icons/Pulse-Glass $HOME/.icons/default

# Install wallpaper
echo "installing wallpaper"
if [ ! -e $HOME/.WallPaper ]; then
    mkdir -p $HOME/.WallPaper
fi
cp $BASE_DIR/Backgrounds/src/* $HOME/.WallPaper -rv
sudo cp $BASE_DIR/Backgrounds/wallpaper.sh /usr/bin/ -v

# X11 and Xmonad installation
echo "Installing Xdefaults and Xresources ... .. ."
cp $BASE_DIR/TerminalSettings/Xdefaults $HOME/.Xdefaults -v
cp $BASE_DIR/TerminalSettings/Xdefaults $HOME/.Xresources -v

# urxvt perl extension
if [ ! -e /usr/bin/xsel ] && [ ! -e /usr/local/bin/xsel ]; then
    $INSTALL_CMD xsel
fi
sudo cp $BASE_DIR/TerminalSettings/urxvt-perls/* /usr/lib/urxvt/perl/ -v

echo "Installing xmonad and xmobar configurations... .. ."
if [ ! -e /usr/bin/xmonad ] && [ ! -e /usr/local/bin/xmonad ]; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "ignore xmonad installation here, please intall it manually."
    else
        $INSTALL_CMD xmonad
        $INSTALL_CMD xmonad-contrib
        $INSTALL_CMD dmenu
        $INSTALL_CMD trayer
        $INSTALL_CMD feh
        $INSTALL_CMD xmobar
    fi
fi

if [ ! -e $HOME/.xmonad/backup ]; then
    mkdir -p $HOME/.xmonad/backup
fi

if [ -e /usr/bin/gnome-session ] || [ -e /usr/local/bin/gnome-session ]; then
    sudo cp $BASE_DIR/X11Settings/xmonad.start /usr/bin/ -v
else
    cp $BASE_DIR/X11Settings/xinitrc $HOME/.xinitrc -v
fi

cp $BASE_DIR/XMonadSettings/xmobar.hs $HOME/.xmonad/xmobar.hs -v
cp $BASE_DIR/XMonadSettings/xmobar_dual_screen.hs $HOME/.xmonad/xmobar_dual_screen.hs -v
cp $BASE_DIR/XMonadSettings/xmonad.hs $HOME/.xmonad/xmonad.hs -v
cp $BASE_DIR/XMonadSettings/xmonad.hs $HOME/.xmonad/backup/xmonad.hs -v
cp $BASE_DIR/XMonadSettings/xmonad_dual_screen.hs $HOME/.xmonad/backup/xmonad_dual_screen.hs -v

sudo cp $BASE_DIR/XMonadSettings/single_screen.sh /usr/bin/ -v
sudo cp $BASE_DIR/XMonadSettings/dual_screen.sh /usr/bin/ -v

rm $TMP_DIR -rf
