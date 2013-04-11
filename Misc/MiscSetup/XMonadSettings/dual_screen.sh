#!/bin/sh

# Time-stamp: <2013-04-11 22:51:12 Thursday by lzy>

rm ~/.xmonad/xmonad.hs
cp ~/.xmonad/backup/xmonad_dual_screen.hs ~/.xmonad/xmonad.hs

xrandr --output LVDS1 --auto --left-of VGA1

pkill -9 trayer
trayer --edge top --align right --SetDockType true --expand true --width 7 --transparent true --tint 0x000000 --alpha 0 --height 21&

xmonad --restart
