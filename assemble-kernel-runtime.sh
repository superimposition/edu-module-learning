#!/usr/bin/env bash

# Assemble initramfs directory tree, load in busybox and make cpio archive

mkdir -p initramfs
cp init initramfs/

mkdir -p initramfs/bin
cp busybox-1.37.0/build/busybox initramfs/bin/

cd initramfs
mkdir -p {dev,etc,proc,root,sys,sbin,usr,usr/bin,usr/sbin,usr/lib}

find . -print0 | cpio --null --create --verbose --format=newc | gzip --best > ./initramfs.cpio.gz
cd ..

mkdir -p runtime
mv initramfs/initramfs.cpio.gz runtime/
cp linux/arch/x86_64/boot/bzImage runtime/
