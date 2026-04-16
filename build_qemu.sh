#!/bin/bash


set -e
set -o pipefail

if [ "$(dirname "$(realpath "$0")")" != "$(pwd)" ]; then
	echo "Script intended only to be executed from $0 's directory"
	exit 1
fi

if ! docker image inspect korg-clang-qemu &>/dev/null; then
	docker build . -t korg-clang-qemu
fi
cd qemu
../linux/scripts/container -i korg-clang-qemu --verbose -r docker -- ./configure 
../linux/scripts/container -i korg-clang-qemu --verbose -r docker -- make -j$(nproc)
