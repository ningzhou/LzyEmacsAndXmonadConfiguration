#!/bin/sh

# Time-stamp: <2013-04-10 22:08:43 Wednesday by lzy>

rm ~/.xmonad/xmonad.hs
cp ~/.xmonad/backup/xmonad_dual_screen.hs ~/.xmonad/xmonad.hs

xrandr --output LVDS1 --auto --left-of VGA1

pkill -9 trayer
trayer --edge top --align right --SetDockType true --expand true --width 50 --transparent true --tint 0x000000 --alpha 0 --height 21&

xmonad --restart
