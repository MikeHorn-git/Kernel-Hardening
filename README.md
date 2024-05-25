![logo](https://github.com/MikeHorn-git/Kernel-Hardening/assets/123373126/e4fca8a7-782a-42a7-863e-431a94660313)

# Warning
Use it at your own risk for your own needs. Read content of files before proceeding, certains features are disabled.

# Compile Kernel
The custom Kconfig file is stored in configs folder.

# Blacklist Modules (+100)
* Driver (ath94, b43, eth1394 ...)
* Filesystem (exfat, ntfs, squashfs ...)
* Graphics (amdgpu, nvidia, radeon ...)
* Input devices (garmin_gps, lp, uinput ...)
* Network (Bluetooth, gps, iwlwifi ...)
* Storage (cdrom, floppy, usb storage,  ...)

These kernel modules blacklisted are present in blacklist.conf.


# Kernel Parameters (+50)
* FileSystem
* Kernel
* Network

These kernel parameters are present in sysctl.conf


# Installation Script
Backup your files before running.
* Add GRUB entries
* Copy blacklist.conf
* Copy sysctl.conf

# Credits
* [Anssi](https://cyber.gouv.fr/publications/recommandations-de-securite-relatives-un-systeme-gnulinux) [Guide]
* [ClipOS](https://docs.clip-os.org/clipos/kernel.html#configuration) [Guide]
* [Kernel.org](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html) [Guide]
* [Kernel-Hardening-Checker](https://github.com/a13xp0p0v/kernel-hardening-checker) [Tool]
* [Kernel_Self_Protection_Project](https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project/Recommended_Settings) [Guide]
* [Kicksecure](https://github.com/Kicksecure) [Guide]
* [lwn.net](https://lwn.net/) [Logo]
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel) [Guide]
* [spectre-meltdown-checker](https://github.com/speed47/spectre-meltdown-checker) [Tool]
