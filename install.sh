#!/bin/bash

# Time-stamp: <2012-12-11 05:35:20 Tuesday by lzy>

BASE_DIR=$(dirname $0|pwd)
INSTALL_CMD="sudo pacman -S"
DOT_EMACS=$HOME/.emacs

if [ -e /etc/lsb-release ]; then
    OS=$(grep "DISTRIB_ID" /etc/lsb-release|cut -d "=" -f 2)
else
    OS="Arch"
fi
    
cp $BASE_DIR/emacs.config $BASE_DIR/.emacs.local
sed -i -e s:_EMACS_DIR_:$BASE_DIR/:g $BASE_DIR/.emacs.local

if [ $OS = "Ubuntu" ]; then
    INSTALL_CMD="sudo apt-get install"
else
    INSTALL_CMD="sudo pacman -S"
fi

#install font
$BASE_DIR/Fonts/fonts-install.sh;
cd ${BASE_DIR}

rm $DOT_EMACS
ln -sf "${BASE_DIR}"/.emacs.local $DOT_EMACS

if [[ ! -e ~/OrgDir ]]; then
    echo "Create ~/OrgDir directory!"
    mkdir ~/OrgDir
    touch ~/OrgDir/Agenda.org
    touch ~/OrgDir/Routines.org
    touch ~/OrgDir/Notes.org
    touch ~/OrgDir/Diary.org
fi

if [[ ! -e "/usr/local/bin/cscope" && ! -e "/usr/bin/cscope" ]]; then
    $INSTALL_CMD cscope 
fi

if [[ ! -e "/usr/local/bin/w3m" && ! -e "/usr/bin/w3m" ]]; then
    $INSTALL_CMD w3m 
fi

if [[ ! -e "/usr/local/bin/mpg123" && ! -e "/usr/bin/mpg123" ]]; then
    $INSTALL_CMD mpg123 
fi

if [[ ! -e "/usr/local/bin/aspell" && ! -e "/usr/bin/aspell" ]]; then
    $INSTALL_CMD aspell
    $INSTALL_CMD aspell-en
fi

if [[ ! -e "/usr/local/bin/ogginfo" && ! -e "/usr/bin/ogginfo" ]]; then
    $INSTALL_CMD vorbis-tools 
fi

if [[ ! -e "/usr/local/bin/stardict" && ! -e "/usr/bin/stardict" ]]; then
    $INSTALL_CMD stardict 
    $INSTALL_CMD sdcv 
fi

if [[ ! -e "/usr/local/bin/emms-print-metadata" && ! -e "/usr/bin/emms-print-metadata" ]]; then
    $INSTALL_CMD taglib
    sudo cp ${bin}/Site-Lisps/Emms/emms-print-metadata /usr/bin/ -v
fi

if [[ ! -e "/usr/bin/clang" && ! -e "/usr/local/bin/clang" ]]; then
    $INSTALL_CMD clang
fi

