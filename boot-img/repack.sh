#!/bin/bash

# NexusOne #########
DEVICE=htc-passion
BASE=0x20000000 
####################

if [ -f "../${DEVICE}/.zImage-path" ]
then
    ZIMAGE=`cat ../${DEVICE}/.zImage-path`
else
    echo "zImage Path not found"
    exit 0
fi

if [ -f "../${DEVICE}/boot.img" ]
then
    cp ../${DEVICE}/boot.img .
    tools/extract-kernel.pl boot.img
    tools/extract-ramdisk.pl boot.img
else
    echo "Orig. boot.img not found"
    exit 0
fi

if [ -f "../${DEVICE}/${ZIMAGE}" ]
then
    cp ../${DEVICE}/${ZIMAGE} .
else
    echo "New zImage not found"
    exit 0
fi

tools/mkbootfs boot.img-ramdisk | gzip > ramdisk.gz
tools/mkbootimg --kernel zImage --ramdisk ramdisk.gz -o newBoot.img --base ${BASE}

rm -rf boot.img-ramdisk
rm zImage
rm ramdisk.gz
mv newBoot.img boot.img