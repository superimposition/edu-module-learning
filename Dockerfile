FROM docker.io/tuxmake/korg-clang AS korg-clang-qemu
RUN sed -ie 's/Types: deb/Types: deb deb-src/' /etc/apt/sources.list.d/* &&\
	apt update &&\
	DEBIAN_FRONTEND=noninteractive apt build-dep -y qemu &&\
	apt clean
