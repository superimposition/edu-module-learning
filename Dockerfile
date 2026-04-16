# A compact image that is sufficient to compile Linux, QEMU, and busybox via LLVM
FROM docker.io/tuxmake/korg-clang AS korg-clang-builder
RUN sed -ie 's/Types: deb/Types: deb deb-src/' /etc/apt/sources.list.d/* &&\
	apt update &&\
	DEBIAN_FRONTEND=noninteractive apt build-dep -y qemu &&\
	DEBIAN_FRONTEND=noninteractive apt build-dep -y busybox &&\
	apt clean
