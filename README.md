# Warning
Backup sensitive data. Check the content of the files before proceeding. Use at your own risk, manipulating kernel parameters can "break it".

# Installation
```bash
git clone https://github.com/MikeHorn-git/Kernel-Hardening.git
cd Kernel-Hardening
chmod +x ./install.sh
sudo ./install.sh
```
# Grub startup kernel parameters
* l1tf=full,force                               - L1 Terminal Fault (l1tf) vulnerability patch. Disable Symmetric MultiThreading (SMT).*
* page_poison=on                                - Activate buddy allocator page poisoning.
* pti=on                                        - Force Page Table Isolation (PTI) on.
* slab_nomerge=yes                              - Disables the merging of slabs of similar sizes.
* slub_debug=FZP                                - Activate certain slub verification options (cache metadata consistency tests, red zoning, poisoning of objects and padding).
* spec_store_bypass_disable=seccomp             - Spectrev4 (Speculative Store Bypass) countermeasures.
* spectre_v2=on                                 - Spectrev2 (Branch Target Injection) countermeasures.
* mds=full,nosmt                                - Use Microarchitectural Data Sampling (MDS) with SMT disabled.
* mce=0                                         - Force Kernel panic if uncorrected errors are reported by the support Machine Check.
* page_alloc.shuffle=1                          - Activate Page allocator randomization.
* rng_core.default_quality=500                  - Credit entropy to hwrng of TPM security chip.
* init_on_alloc=1                               - Enables the zeroing of memory during allocation.
* init_on_free=1                                - Enables the zeroing of memory during free time.
* randomize_kstack_offset=on                    - Randomizes the kernel stack offset on each syscall.
* vsyscall=none                                 - Disable vsyscall.
* debugfs=off                                   - Disable debugfs.
* oops=panic                                    - Kernel Panic if unexpected kernel behavior occured (oops).
* module.sig_enforce=1                          - Allows kernel modules that have been signed with a valid key.**
* lockdown=confidentiality                      - Implement a clear security boundary between user space and the kernel.
* quiet loglevel=0                              - Prevent information leaks during boot.
* spec_store_bypass_disable=on                  - Speculative Store Bypass (SSB) countermeasures.
* tsx=off                                       - Disable Intel Transactional Synchronization Extensions (TSX). 
* tsx_async_abort=full,nosmt                    - Mitigate TSX Asynchronous Abort (TAA) with SMT disabled.
* nosmt=force                                   - Force disable symmetric multithreading (SMT).
* kvm.nx_huge_pages=force                       - Mitigate instruction Translation Lookaside Buffer (iTLB) multihit.
  
*Reduce system performance. Enable this option on a bare metal OS. For VMS, this can be disabled with l1tf=off for better performance, if the host OS is trusted and protected against lf1t vulnerability.
**Can cause conflict with certain modules like Virtualbox or Nvidia.

# Sysctl.conf
## Kernel
* dev.tty.ldisc_autoload=0                      -  Restricts loading TTY line disciplines.
* kernel.dmesg_restrict=1                       -  Restrict access to the kernel log (dmesg).
* kernel.kexec_load_disabled=1                  -  Disable kexec syscall.
* kernel.kptr_restrict=2                        -  Mitigate kernel pointer leaks.
* kernel.panic_on_oops=1                        -  Kernel Panic if unexpected kernel behavior occurs (oops).
* kernel.perf_cpu_time_max_percent=1            -  Restrict subsystem perf use.
* kernel.perf_event_max_sample_rate=1           -  Restrict subsystem perf use.
* kernel.perf_event_paranoid=2                  -  Restricts usage of performance events.
* kernel.pid_max=65536                          -  Set max pid.
* kernel.printk=3                               -  Restrict kernel log informations during boot.
* kernel.randomize_va_space=2                   -  Activate Address space layout randomization (ASLR).
* kernel.sysrq=0                                -  Disable SysRq key.
* kernel.unprivileged_bpf_disabled=1            -  Restrict the extented Berkeley Packet Filter (eBPF).
* kernel.unprivileged_userns_clone=0            -  Restricts the usage of user namespaces.
* kernel.yama.ptrace_scope=2                    -  Restrict usage of ptrace.
* vm.mmap_rnd_bits=32                           -  Increase the bits of entropy used for mmap ASLR.
* vm.mmap_rnd_compat_bits=16                    -  Increase the bits of entropy used for mmap ASLR.
* vm.unprivileged_userfaultfd=0                 -  Restrict the userfaultfd() syscall.

## Network
* net.core.bpf_jit_harden=2                     -  Restrict the extented Berkeley Packet Filter (eBPF).
* net.ipv4.conf.all.accept_local=0              -  Drop packets from the 127/8 external network.
* net.ipv4.conf.all.accept_redirects=0          -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.all.accept_source_route=0       -  Disable the source route.
* net.ipv4.conf.all.arp_filter=1                -  Restrict ARP tables.
* net.ipv4.conf.all.arp_ignore=2                -  Restrict ARP tables.
* net.ipv4.conf.all.drop_gratuitous_arp=1       -  Restrict ARP gratuitous.
* net.ipv4.conf.all.route_localnet=0            -  Block routing packets that have a localhost address in source or destination.
* net.ipv4.conf.all.rp_filter=1                 -  Enable source validation of packets received from all interfaces.
* net.ipv4.conf.all.secure_redirects=0          -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.all.send_redirects=0            -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.all.shared_media=0              -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.default.accept_redirects=0      -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.default.accept_source_route=0   -  Disable source route.
* net.ipv4.conf.default.rp_filter=1             -  Enable source validation of packets received from all interfaces.
* net.ipv4.conf.default.secure_redirects=0      -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.default.send_redirects=0        -  Disable ICMP redirect acceptance and sending.
* net.ipv4.conf.default.shared_media=0          -  Disable ICMP redirect acceptance and sending.
* net.ipv4.icmp_echo_ignore_all=1               -  Ignore all ICMP requests.
* net.ipv4.icmp_ignore_bogus_error_responses=1  -  Block response if does not conforme to RFC 1122.
* net.ipv4.ip_forward=0                         -  Disable IP forwarding.
* net.ipv4.ip_local_port_range=32768 65535      -  Increase range for ephemeral ports.
* net.ipv4.tcp_dsack=0                          -  Disable TCP SACK.
* net.ipv4.tcp_fack=0                           -  Disable TCP SACK.
* net.ipv4.tcp_rfc1337=1                        -  Drop RST packets for sockets in the time-wait state.
* net.ipv4.tcp_sack=0                           -  Disable TCP SACK.
* net.ipv4.tcp_syncookies=1                     -  Mitigate SYN flood attacks.
* net.ipv6.conf.default.disable_ipv6=1          -  Disable Ipv6.

## File System
* fs.protected_fifos=2                          -  Restrict FIFOS files.
* fs.protected_hardinks=1                       -  Restric hardlinks.
* fs.protected_regular=2                        -  Restrict regular files.
* fs.protected_symlinks=1                       -  Restrict symplinks.
* fs.suid_dumpable=0                            -  Disable core dump for setuid executables.

# Blacklist.conf
*  Disable unused networking protocols.
*  Disable rare filesystems.
*  Disable network filesystems.

For detailed and more in-depth explanations, check the Resources sections.


# Tested on
* Arch
* Debian
* Fedora

# Resources
* [Anssi](https://cyber.gouv.fr/publications/recommandations-de-securite-relatives-un-systeme-gnulinux)
* [Kernel.org](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html)
* [Madaidans](https://madaidans-insecurities.github.io/guides/linux-hardening.html#kernel)
