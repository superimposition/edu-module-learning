#!/usr/bin/env bash

cd initramfs
find . -print0 | cpio --null --create --verbose --format=newc | gzip --best > ./initramfs.cpio.gz
cd ..

mkdir -p runtime
mv initramfs/initramfs.cpio.gz runtime/
cp linux/arch/x86_64/boot/bzImage runtime/
