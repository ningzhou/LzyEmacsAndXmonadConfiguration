#!/bin/bash

src_dir=$(cd $(dirname $0); pwd)
dest_dir=/usr/share/fonts/myfonts

if [ ! -e "$dest_dir" ]; then
    sudo mkdir $dest_dir

    echo "install fonts... .. ."
    find ./ -name "*.ttf"|xargs -i sudo cp {} /usr/share/fonts/myfonts/ -v

    echo "waiting, flushing font cache..."
    sudo fc-cache -f -v
    echo "done, logout and see effect!"
fi
