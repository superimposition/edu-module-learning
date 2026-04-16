#!/bin/bash

# Earlyprintk is important to enable output to the terminal during boot processes - this is not always necessary,
# but can help in debug builds or when the print buffer is being run out before full initialization

qemu-system-x86_64 -kernel runtime/bzImage --initrd runtime/initramfs.cpio.gz -nographic -append "earlyprintk=serial,ttyS0 console=ttyS0 debug"
