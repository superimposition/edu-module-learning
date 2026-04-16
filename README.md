## Purpose

The purpose of this repository is to try my hand at some from-scratch kernel programming.

I'll be leveraging the `edu` device in QEMU and building a linux kernel driver for the device.

I'm planning on doing this in C first, and then Rust. God willing and the creek don't rise I can
also use this as an opportunity to understand kernel module testing infrastructure better as well!

All the code in here should be by yours truly, unless otherwise noted :)


## A bad to do list

- [x] Compile kernel
- [x] Compile QEMU
- [x] Get working busybox image - Thanks debian!
- [x] Boot kernel into busybox 
- [x] Compile module out-of-tree
- [x] Insert module at run-time with insmod
- [ ] Compile module in-tree
- [ ] Mess around in GDB (likely currently doing this)
- [ ] Verify functional driver for EDU device

## Stretch goals

- [ ] Write driver in Rust
- [ ] Integrate kernel unit tests into module
- [ ] Expand device in QEMU to allow for external instrumentation
