#!/bin/sh -x
if [ -f /etc/fedora-release ]; then
OS="Fedora"
VER=$(rpm -E %fedora)
elif [ -f /etc/centos-release ]; then
OS=$(source /etc/os-release; echo ${NAME})
VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/centos-release)
VER=${VERFULL:0:1} # return 8
elif [ -f /etc/almalinux-release ]; then
OS=$(source /etc/os-release; echo ${NAME})
VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/almalinux-release)
VER=${VERFULL:0:1} # return 8
elif [ -f /etc/rocky-release ]; then
OS=$(source /etc/os-release; echo ${NAME})
VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/rocky-release)
VER=${VERFULL:0:1} # return 8
else
OS=$(source /etc/os-release; echo ${NAME})
VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/redhat-release)
VER=${VERFULL:0:1} # return 8
fi
if [ "$OS" = "Fedora" ] ; then
wget https://github.com/andykimpe/rpmfusion-dhewm3/raw/f$VER/dhewm3.spec -O dhewm3.spec
else
wget https://github.com/andykimpe/rpmfusion-dhewm3/raw/el$VER/dhewm3.spec -O dhewm3.spec
fi
