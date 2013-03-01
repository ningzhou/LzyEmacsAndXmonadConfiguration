#!/bin/bash

# Time-stamp: <2013-03-01 14:48:07 Friday by lzy>

sudo wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant.conf
sudo dhcpcd wlan0
