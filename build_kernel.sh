#!/usr/bin/env bash

set -e
set -o pipefail

if [ "$(dirname "$(realpath "$0")")" != "$(pwd)" ]; then
	echo "Script intended only to be executed from $0 's directory"
	exit 1
fi

kernel_conf="$1"
if [ ! -f "$kernel_conf" ]; then
	echo "Usage: $(basename "$0") <kernel config file>"
	exit 1
fi

cp "$kernel_conf" linux/.config
cd linux && scripts/container -i docker.io/tuxmake/korg-clang --verbose -r docker -- make LLVM=1 -j16
