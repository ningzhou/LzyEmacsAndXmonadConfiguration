#!/bin/bash
# Time-stamp: <2013-04-09 12:54:00 Tuesday by lzy>

BASE_DIR=$(cd $(dirname $0); pwd)
DOT_EMACS=$HOME/.emacs

function cmd_noexist()
{
    if [ ! -e /usr/bin/$1 ] && [ ! -e /usr/local/bin/$1 ]; then
        return 0
    else
        return 1
    fi
}

if [ -z $1 ]; then
    echo "Please input your system name: (e.g. centos, arch, ubuntu, fedora)"
    echo -n "OS Name: "
    read OS_NAME
    if [ -z $OS_NAME ]; then
        echo "System name can't be null!"
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
            echo "Unknown system: $OS_NAME"
            exit 1
        fi
    fi
fi

# Template replace
cp $BASE_DIR/emacs.config $BASE_DIR/.emacs.local
sed -i -e s:_EMACS_DIR_:$BASE_DIR/:g $BASE_DIR/.emacs.local

# Font installation
$BASE_DIR/Misc/MiscSetup/Fonts/fonts-install.sh

# Emacs root configurations file installation
if [ -e $DOT_EMACS ]; then
    rm $DOT_EMACS
fi
ln -sf "${BASE_DIR}"/.emacs.local $DOT_EMACS

if [ ! -e ~/OrgDir ]; then
    echo "Create ~/OrgDir directory!"
    mkdir ~/OrgDir
    touch ~/OrgDir/Agenda.org
    touch ~/OrgDir/Routines.org
    touch ~/OrgDir/Notes.org
    touch ~/OrgDir/Diary.org
fi

if cmd_noexist cscope; then
    $INSTALL_CMD cscope 
fi

if cmd_noexist w3m; then
    $INSTALL_CMD w3m 
fi

if cmd_noexist scrot; then
    $INSTALL_CMD scrot
fi

if cmd_noexist zsh; then
    $INSTALL_CMD zsh
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

if cmd_noexist feh; then
    $INSTALL_CMD feh
fi

if cmd_noexist mpg123; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore mpg123"
    else
        $INSTALL_CMD mpg123
    fi
fi

if cmd_noexist aspell; then
    $INSTALL_CMD aspell
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore aspell-en"
    else
        $INSTALL_CMD aspell-en
    fi
fi

if cmd_noexist ogginfo; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore ogginfo"
    else
        $INSTALL_CMD vorbis-tools 
    fi
fi

if cmd_noexist stardict; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore stardict"
    else
        $INSTALL_CMD stardict 
        $INSTALL_CMD sdcv 
    fi
fi

if cmd_noexist clang; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore clang, but you should intall it manually"
    else
        $INSTALL_CMD clang
    fi
fi

if cmd_noexist convert; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore imagemagick"
    else
        $INSTALL_CMD imagemagick
    fi
fi

if cmd_noexist emms-print-metadata; then
    if [ $OS_NAME = "centos" ] || [ $OS_NAME = "fedora" ]; then
        echo "Ignore taglib"
    else
        if [ $OS_NAME = "arch" ]; then
            $INSTALL_CMD taglib
        else
            $INSTALL_CMD libtagc0-dev
        fi
        sudo cp ${BASE_DIR}/MySiteLisps/Emms/emms-print-metadata /usr/bin/
    fi
fi
