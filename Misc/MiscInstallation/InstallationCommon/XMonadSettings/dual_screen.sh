#!/bin/bash

rm ~/.xmonad/xmonad.hs
cp ~/.xmonad/back/xmonad_dual_screen.hs ~/.xmonad/xmonad.hs

xrandr --output LVDS1 --auto --left-of VGA1

pkill -9 trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 50 --transparent true --tint 0x000000 --alpha 0 --height 19&

sleep 1

xmonad --recompile
xmonad --restart
