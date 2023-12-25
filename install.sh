#! /bin/bash

#################################################################################
#MIT License									#
#										#
#Copyright (c) 2023 MikeHorn-git						#
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

GRUB=/etc/default
MODPROBE=/etc/modprobe.d
SYSCTL=/etc/sysctl.d

if [ "$EUID" -ne 0 ]
  then echo "[+] Please run as root"
  exit
fi


echo "[+] Backup sysctl files"
for file in /etc/sysctl.d/*; do
    if [ -f "$file" ]; then
        cp "$file" "$file".bk
    fi
done

echo "[+] Backup modprobe files"
for file in /etc/modprobe.d/*; do
    if [ -f "$file" ]; then
        cp "$file" "$file".bk
    fi
done

echo "[+] Copy sysctl.conf to $SYSCTL"
cp ./sysctl.conf "$SYSCTL"/sysctl.conf

echo "[+] Copy blacklist.conf to $MODPROBE"
cp ./blacklist.conf "$MODPROBE"/blacklist.conf

if [ -f "$GRUB"/grub ]; then
    echo "[+] Backup $GRUB/grub file"
    cp "$GRUB"/grub "$GRUB"/grub.bk
    echo "[+] Copy GRUB_CMDLINE_LINUX_DEFAULT value into $GRUB/grub"
    sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/d' "$GRUB"/grub
    cat ./grub.default >> "$GRUB"/grub
else
    echo "[-] Error, grub default file not found"
fi
