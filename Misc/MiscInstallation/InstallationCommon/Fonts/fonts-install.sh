#!/bin/bash

# Save old dir
old_dir=$(pwd)
src_dir=$(cd $(dirname $0); pwd)
dest_dir=/usr/share/fonts/myfonts

if [ ! -e "$dest_dir" ]; then
    sudo mkdir $dest_dir

    echo "install monospaced english font :Monaco"
    sudo cp $src_dir/monaco-linux.ttf $dest_dir

    echo "install micro black font"
    sudo cp $src_dir/msyh.ttf $dest_dir
    sudo cp $src_dir/msyhbd.ttf $dest_dir
    echo "waiting, flushing font cache..."
    sudo fc-cache -f -v
    echo "done, logout and see effect!"
fi

# Restore old dir
cd $old_dir