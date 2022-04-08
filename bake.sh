#!/usr/bin/env bash

# https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem

# make dirclean
make clean

./scripts/feeds update -a
./scripts/feeds install -a

cp .config.5.15.yaml .config
make defconfig
# make menuconfig
read -rsp $'Press \'c\' key to continue:' -n1 key
if [ "$key" = 'c' ]; then
    make download -j $(($(nproc)+1))
    # Build toolchain
    start_time=`date +%s` && make tools/install -j $(($(nproc)+1)) || make tools/install && echo " ->  Compiling time about $((($(date +%s)-$start_time)/60)) min."
    # Build toolchain
    start_time=`date +%s` && make toolchain/install -j $(($(nproc)+1)) || make toolchain/install && echo " ->  Compiling time about $((($(date +%s)-$start_time)/60)) min."
    # Build target images
    start_time=`date +%s` && make -j $(($(nproc)+1)) || make -j1 V=s && echo " ->  Compiling time about $((($(date +%s)-$start_time)/60)) min."
else
    exit
fi