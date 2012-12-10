#!/bin/bash

rm ~/.xmonad/xmonad.hs
cp ~/.xmonad/back/xmonad.hs ~/.xmonad/xmonad.hs

xrandr --output LVDS1 --auto --same-as VGA1

pkill -9 trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 8 --transparent true --tint 0x000000 --alpha 0 --height 19&

xmonad --recompile
xmonad --restart
