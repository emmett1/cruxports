#!/bin/sh -e

cd ${0%/*}

[ -f /etc/pkgmk.conf ] && . /etc/pkgmk.conf

KVER=${KERN_VER:-$(uname -r)}

make $MAKEFLAGS KERN_VER=$KVER
make $MAKEFLAGS KERN_VER=$KVER install
make clean

depmod $KVER

modprobe vboxdrv
modprobe vboxnetadp
modprobe vboxnetflt
