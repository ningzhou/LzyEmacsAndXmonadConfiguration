#!/bin/bash

# Time-stamp: <2013-02-05 16:12:37 Tuesday by lzy>

BASE_DIR=$(dirname $0|pwd)
DOT_EMACS=$HOME/.emacs

if [ -z $1 ]; then
    echo "Please input OS: (e.g. centos, arch, ubuntu, fedora)"
    read OS
    if [ -z $OS ]; then
        echo "Invalide OS type!"
        exit 1
    fi
else
    OS=$1
fi
    
OS="$(echo $OS | tr '[A-Z]' '[a-z]')"
if [ $OS = "ubuntu" ]; then
    INSTALL_CMD="sudo apt-get install"
else
    if [ $OS = "arch" ]; then
        INSTALL_CMD="sudo pacman -S"
    else
        if [ $OS = "centos" ] || [ $OS = "fedora" ]; then
            INSTALL_CMD="sudo yum install"
        fi
    fi
fi

cp $BASE_DIR/emacs.config $BASE_DIR/.emacs.local
sed -i -e s:_EMACS_DIR_:$BASE_DIR/:g $BASE_DIR/.emacs.local

#install font
$BASE_DIR/Fonts/fonts-install.sh;
cd ${BASE_DIR}

#install emacs root configurations file
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

if [ ! -e "/usr/local/bin/cscope" ] && [ ! -e "/usr/bin/cscope" ]; then
    $INSTALL_CMD cscope 
fi

if [ ! -e "/usr/local/bin/w3m" ] && [ ! -e "/usr/bin/w3m" ]; then
    $INSTALL_CMD w3m 
fi

if [ ! -e "/usr/local/bin/mpg123" ] && [ ! -e "/usr/bin/mpg123" ]; then
    $INSTALL_CMD mpg123 
fi

if [ ! -e "/usr/local/bin/aspell" ] && [ ! -e "/usr/bin/aspell" ]; then
    $INSTALL_CMD aspell
    $INSTALL_CMD aspell-en
fi

if [ ! -e "/usr/local/bin/ogginfo" ] && [ ! -e "/usr/bin/ogginfo" ]; then
    $INSTALL_CMD vorbis-tools 
fi

if [ ! -e "/usr/local/bin/stardict" ] && [ ! -e "/usr/bin/stardict" ]; then
    $INSTALL_CMD stardict 
    $INSTALL_CMD sdcv 
fi

if [ ! -e "/usr/local/bin/emms-print-metadata" ] && [ ! -e "/usr/bin/emms-print-metadata" ]; then
    $INSTALL_CMD taglib
    sudo cp ${bin}/Site-Lisps/Emms/emms-print-metadata /usr/bin/ -v
fi

if [ ! -e "/usr/bin/clang" ] && [ ! -e "/usr/local/bin/clang" ]; then
    $INSTALL_CMD clang
fi

