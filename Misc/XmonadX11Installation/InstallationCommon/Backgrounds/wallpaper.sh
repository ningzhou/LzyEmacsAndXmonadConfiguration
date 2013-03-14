#!/bin/bash

# Time-stamp: <2013-03-01 14:45:29 Friday by lzy>

shopt -s nullglob

cd $HOME/.WallPaper

while true; do
	files=()
	for i in *.jpg *.png *.jpeg; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}
    ((range))
    
    file="${files[RANDOM % range]}"
    if [ "mars.jpg" = $file ]; then
        feh --bg-max "${files[RANDOM % range]}"
    else
        feh --bg-scale "${files[RANDOM % range]}"
    fi

	sleep 10m
done
