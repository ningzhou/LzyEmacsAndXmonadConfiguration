#!/bin/bash

# Time-stamp: <2013-04-14 13:00:11 Sunday by lzy>

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
    feh --bg-scale "${files[RANDOM % range]}"

    sleep 10m
done
