#!/bin/bash
#program:
# misc installation for ubuntu and arch linux

BASE_DIR=$(dirname $0)
SCREEN_XRES=$(xrandr|grep "current"|cut -d " " -f 8)
TMP_DIR=$HOME/misc_tmp_dir
INSTALL_CMD="sudo pacman -S"

if [ -e /etc/lsb-release ]; then
    OS=$(grep "DISTRIB_ID" /etc/lsb-release|cut -d "=" -f 2)
else
    OS="Arch"
fi

if [ $OS = "Ubuntu" ]; then
    INSTALL_CMD="sudo apt-get install"
else
    INSTALL_CMD="sudo pacman -S"
fi

# create temporary directory
mkdir -p $TMP_DIR

# common Installation
echo "installing backgrounds... .. ."
if [ ! -e $HOME/.WallPaper ]; then
    mkdir -p $HOME/.WallPaper
fi
cp $BASE_DIR/InstallationCommon/Backgrounds/src/* $HOME/.WallPaper -v
sudo cp $BASE_DIR/InstallationCommon/Backgrounds/wallpaper.sh /usr/bin/wallpaper.sh -v

echo "installing conky... .. ."
mkdir -p $HOME/.lua/scripts
ocp $BASE_DIR/InstallationCommon/Conky/clock_rings.lua $HOME/.lua/scripts -v
if [ $SCREEN_XRES -ge 1600 ]; then
    cp $BASE_DIR/InstallationCommon/Conky/conkyrc_large $HOME/.conkyrc -v
else
    cp $BASE_DIR/InstallationCommon/Conky/conkyrc_small $HOME/.conkyrc -v
fi

echo "installing mouse theme... .. ."
mkdir -p $HOME/.icons
rm $HOME/.icons/* -rf
sudo cp $BASE_DIR/InstallationCommon/CursorThemes/* /usr/share/icons/ -r
ln -s /usr/share/icons/Pulse-Glass $HOME/.icons/default
sudo rm /usr/share/icons/default -rf
sudo ln -s /usr/share/icons/Pulse-Glass /usr/share/icons/default

if [ ! -e $HOME/.oh-my-zsh ]; then
    echo "installing oh-my-zsh ... .. ."
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

if [ -e ~/.oh-my-zsh ]; then
    echo "installing zsh theme ... .. ."
    cp $BASE_DIR/InstallationCommon/Zsh/fox.zsh-theme $HOME/.oh-my-zsh/themes/ -v
fi

echo "installing Xdefaults and Xresources ... .. ."
cp $BASE_DIR/InstallationCommon/TerminalAndShellSettings/Xdefaults $TMP_DIR
cp $BASE_DIR/InstallationCommon/TerminalAndShellSettings/Xresources $TMP_DIR
if [ $SCREEN_XRES -ge 1600 ]; then
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 105/g' $TMP_DIR/Xdefaults
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 105/g' $TMP_DIR/Xresources
else
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 102/g' $TMP_DIR/Xdefaults
    sed -i -e 's/Xft.dpi:.*/Xft.dpi: 102/g' $TMP_DIR/Xresources
fi
cp $TMP_DIR/Xdefaults $HOME/.Xdefaults -v
cp $TMP_DIR/Xresources $HOME/.Xresources -v
if [ $OS = "Ubuntu" ];then
    sudo cp $BASE_DIR/InstallationCommon/X11Settings/xmonad.start /usr/bin/ -v
else
    cp $BASE_DIR/InstallationCommon/X11Settings/xinitrc $HOME/.xinitrc
fi

sudo cp $BASE_DIR/InstallationCommon/TerminalAndShellSettings/clipboard /usr/lib/urxvt/perl/ -v

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

if [ $OS = "Ubuntu" ]; then
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

if [ ! -e "/usr/bin/scrot" ] && [ ! -e "/usr/local/bin/scrot" ]; then
    $INSTALL_CMD scrot
fi

if [ -e "/usr/share/slim/themes" ]; then
    if [ -e "/usr/share/slim/themes/my-theme" ]; then
        sudo rm /usr/share/slim/themes/my-theme -rf
    fi
    sudo cp $BASE_DIR/InstallationCommon/SlimTheme /usr/share/slim/themes/my-theme -rv
fi
