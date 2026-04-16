obj-m += hello-world.o

PWD := $(CURDIR)

all:
	$(MAKE) LLVM=1 -C ../linux/ M=$(PWD)
