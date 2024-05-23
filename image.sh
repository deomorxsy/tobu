#!/bin/sh
#
nasm -f bin ./btl.asm -o bootloader

# create sparse file for a floppy disk
dd if=/dev/zero of=./disk.img bs=512 count=2880

# burn the bootloader into the first sector
# by copying only N input blocks
dd conv=notrunc \
    if=bootloader \
    of=./disk.img \
    bs=512 \
    count=1 \
    seek=0




