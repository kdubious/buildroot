KERNELRELEASE ?= `uname -r`
KERNEL_DIR ?= /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

snd-soc-mp-codec-objs := mp.o
obj-m += snd-soc-mp-codec.o

.PHONY: snd-soc-mp-codec.ko

all: snd-soc-mp-codec.ko
snd-soc-mp-codec: snd-soc-mp-codec.ko
snd-soc-mp-codec.ko:
	@echo "Building snd-soc-mp-codec driver..."
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules_install