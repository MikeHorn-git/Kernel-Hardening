#!/bin/bash

read -rp "Enter the path to the kernel source directory: " KERNEL_SRC

clean() {
    echo "Running make mrproper"
    make -C "$KERNEL_SRC" mrproper
    echo "Running make clean"
    make -C "$KERNEL_SRC" clean
}

config() {
    echo "Running make x86_64_defconfig"
    make -C "$KERNEL_SRC" x86_64_defconfig
}

oldconfig() {
    echo "Running make oldconfig"
    make -C "$KERNEL_SRC" oldconfig
}

build() {
    echo "Building the kernel with -j$(nproc)"
    make -C "$KERNEL_SRC" -j"$(nproc)"
}

all() {
    clean
    oldconfig
    build
}

rebuild() {
    clean
    build
}

configbuild() {
    config
    build
}

oldconfigbuild() {
    oldconfig
    build
}

usage() {
    echo "Usage: $0 {clean|config|oldconfig|build|all|rebuild|configbuild|oldconfigbuild}"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

case "$1" in
    clean)
        clean
        ;;
    config)
        config
        ;;
    oldconfig)
        oldconfig
        ;;
    build)
        build
        ;;
    all)
        all
        ;;
    rebuild)
        rebuild
        ;;
    configbuild)
        configbuild
        ;;
    oldconfigbuild)
        configbuild
        ;;
    *)
        usage
        ;;
esac
