#!/bin/bash

# Time-stamp: <2013-04-14 13:00:39 Sunday by lzy>

rm ~/.xmonad/xmonad.hs
cp ~/.xmonad/backup/xmonad.hs ~/.xmonad/xmonad.hs

xrandr --output LVDS1 --auto --same-as VGA1

pkill -9 trayer
trayer --edge top --align right --SetDockType true --expand true --width 7 --transparent true --tint 0x000000 --alpha 0 --height 21&

xmonad --restart
