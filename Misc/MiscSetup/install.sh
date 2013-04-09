#!/bin/sh

# Time-stamp: <2013-04-09 13:09:48 Tuesday by lzy>

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
mkdir -p $TMP_DIR
cp $BASE_DIR/TerminalSettings/Xdefaults $TMP_DIR
cp $BASE_DIR/TerminalSettings/Xresources $TMP_DIR

if [ $SCREEN_XRES -ge 1600 ]; then
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 105/g' $TMP_DIR/Xdefaults
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 105/g' $TMP_DIR/Xresources
else
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 101/g' $TMP_DIR/Xdefaults
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 101/g' $TMP_DIR/Xresources
fi

cp $TMP_DIR/Xdefaults $HOME/.Xdefaults -v
cp $TMP_DIR/Xresources $HOME/.Xresources -v

sudo cp $BASE_DIR/TerminalSettings/clipboard /usr/lib/urxvt/perl/ -v

echo "Installing xmonad and xmobar configurations... .. ."
if [ ! -e /usr/bin/xmonad ] && [ ! -e /usr/local/bin/xmonad ]; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "ignore xmonad installation here, please intall it manually."
    else
        $INSTALL_CMD xmonad
    fi
fi    

if [ ! -e $HOME/.xmonad/backup ]; then
    mkdir -p $HOME/.xmonad/backup
fi

cp $BASE_DIR/XMonadSettings/* $TMP_DIR
cp $BASE_DIR/X11Settings/* $TMP_DIR

if [ $SCREEN_XRES -ge 1600 ]; then
    sed -i -e 's/size=.*:/size=9:/g' $TMP_DIR/xmobar_dual_screen.hs
    sed -i -e 's/size=.*:/size=9:/g' $TMP_DIR/xmobar.hs
    sed -i -e 's/height.*\&/height 21\&/g' $TMP_DIR/dual_screen.sh
    sed -i -e 's/height.*\&/height 21\&/g' $TMP_DIR/single_screen.sh
    sed -i -e 's/height.*\&/height 21\&/g' $TMP_DIR/xmonad.start
    sed -i -e 's/height.*\&/height 21\&/g' $TMP_DIR/xinitrc
else
    sed -i -e 's/size=.*:/size=8:/g' $TMP_DIR/xmobar_dual_screen.hs
    sed -i -e 's/size=.*:/size=8:/g' $TMP_DIR/xmobar.hs
    sed -i -e 's/height.*\&/height 18\&/g' $TMP_DIR/dual_screen.sh
    sed -i -e 's/height.*\&/height 18\&/g' $TMP_DIR/single_screen.sh
    sed -i -e 's/height.*\&/height 18\&/g' $TMP_DIR/xmonad.start
    sed -i -e 's/height.*\&/height 18\&/g' $TMP_DIR/xinitrc
fi

if [ -e /usr/bin/gnome-session ] || [ -e /usr/local/bin/gnome-session ]; then
    sudo cp $TMP_DIR/xmonad.start /usr/bin/ -v
else
    cp $TMP_DIR/xinitrc $HOME/.xinitrc -v
fi

cp $TMP_DIR/xmobar.hs $HOME/.xmonad/xmobar.hs
cp $TMP_DIR/xmobar_dual_screen.hs $HOME/.xmonad/xmobar_dual_screen.hs
cp $TMP_DIR/xmonad.hs $HOME/.xmonad/xmonad.hs -v
cp $TMP_DIR/xmonad.hs $HOME/.xmonad/backup/xmonad.hs -v
cp $TMP_DIR/xmonad_dual_screen.hs $HOME/.xmonad/backup/xmonad_dual_screen.hs -v

sudo cp $TMP_DIR/single_screen.sh /usr/bin/ -v
sudo cp $TMP_DIR/dual_screen.sh /usr/bin/ -v

rm $TMP_DIR -rf
