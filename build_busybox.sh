#!/bin/bash

set -e
set -o pipefail

# Placeholder scripting to just remember how this worked, not really intended for reuse at this time
busybox_pkgname="busybox-1.37.0"
debian_src="busybox_1.37.0-6.debian.tar.xz"

if [ "$(dirname "$(realpath "$0")")" != "$(pwd)" ]; then
	echo "Script intended only to be executed from $0 's directory"
	exit 1
fi

if ! docker image inspect korg-clang-builder &>/dev/null; then
	docker build . -t korg-clang-builder
fi

if [ ! -d "$busybox_pkgname" ]; then
	tar -xjf "$busybox_pkgname".tar.bz2
fi

if [ ! -d "$busybox_pkgname"/debian ]; then
	tar -xzf "$debian_src"
	mv debian "$busybox_pkgname"
fi


cd "$busybox_pkgname"
quilt push -a
mkdir build

echo "WARN: DOES NOT SET BUSYBOX TO STATICALLY LINKED"

../linux/scripts/container -i korg-clang-qemu --verbose -r docker -- make O=/src/build LLVM=1 defconfig
../linux/scripts/container -i korg-clang-qemu --verbose -r docker -- make -O=/src/build LLVM=1 busybox j$(nproc)
