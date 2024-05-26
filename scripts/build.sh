#!/bin/bash

#################################################################################
#MIT License									#
#										#
#Copyright (c) 2023-2024 MikeHorn-git						#
#										#
#Permission is hereby granted, free of charge, to any person obtaining a copy	#
#of this software and associated documentation files (the "Software"), to deal	#
#in the Software without restriction, including without limitation the rights	#
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell	#
#copies of the Software, and to permit persons to whom the Software is		#
#furnished to do so, subject to the following conditions:			#
#										#
#The above copyright notice and this permission notice shall be included in all	#
#copies or substantial portions of the Software.				#
#										#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR	#
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,	#
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE	#
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER		#
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,	#
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE	#
#SOFTWARE.									#
#################################################################################

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
