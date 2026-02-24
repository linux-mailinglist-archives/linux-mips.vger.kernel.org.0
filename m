Return-Path: <linux-mips+bounces-13196-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNziLPzNnWn4SAQAu9opvQ
	(envelope-from <linux-mips+bounces-13196-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 17:12:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D61899E5
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 17:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7FD23129DFE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 16:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639AB3A782C;
	Tue, 24 Feb 2026 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="pDdFFW9p"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8DF3A782D
	for <linux-mips@vger.kernel.org>; Tue, 24 Feb 2026 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949407; cv=none; b=C9fIDPOapjYgkuVla/q7ruHGkVDhnwjuhJUTt2zQqROKiuYmVPb9X6nIiEVAfsORYmE5hb0TRdFRbm4Y6lgEq8EL4wWaCCPdnX+npmoiWthzkRyMoMgKbmLCDSKPyPW1U5Ox3lPir3FwlUjJklyEhp6+K8JzPXFsCdVNUT6OFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949407; c=relaxed/simple;
	bh=M6VZlGNJCho/hXUapFglq2/yFmnYpxdrIpmQ/v92lCw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNZBL2CXJMs8Hj2rxqKxMhhSvTvpJADzfnw4dvn6rUyvoza33KM0ItJYBwdpxivrSyik2BDyEFraG1OXned6wlGrdwWbAaz/A/S7GzJwYVl4NHz4dOGVO40o6zHVv9yUfAcMb5Jj1yMiek4+/LY9sHW1FQRQIhxK3L4yq2QK/2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=pDdFFW9p reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1771949398; bh=M6VZlGNJCho/hXUapFglq2/yFmnYpxdrIpmQ/v92lCw=;
	h=Date:From:To:Subject:From;
	b=pDdFFW9pNhs2WfksIJML4SHR/37IQUB4uLSYBB+I7Hrg7Tl0HvCL8RRiyHaX7PT12
	 JL6WJ3rJKbAfG8u0L8gpOD+UlxmHjRncC7UcdJuoPahhmTK5VrdEVk9ONw3gPHAOG7
	 7OPsiSKNFPWWBwXX4xiAI5x9sbPnccWi1ZUrUH2J4Xa1zN2gyE1DV4C5M6uQtMGjUJ
	 LB3YPdJpdJk/mt6Qy1bkw5S1Piu0AX6y8buJEkyPWaMqBL3Z4sS8OrIelE+pGJ4xbD
	 WPWxFqhSPs8NUdilXJcJJIMwEX9dc50Yra8BnxmlM3bCq0kZJp8k4QDmgf7lQnDDdQ
	 YFDl4US8HcYiw==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 4E44131E0C6E; Tue, 24 Feb 2026 17:09:58 +0100 (CET)
Date: Tue, 24 Feb 2026 17:09:58 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: linux-mips@vger.kernel.org
Subject: Asus WL500g Premium (BCM47XX) problem
Message-ID: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="XpsVztfF7AKx09gN"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ATTACHMENT(0.00)[];
	TAGGED_FROM(0.00)[bounces-13196-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[openadk.org:~];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fluor:email]
X-Rspamd-Queue-Id: 135D61899E5
X-Rspamd-Action: no action


--XpsVztfF7AKx09gN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi MIPS hackers,

attached is the bootup log of Linux 6.18.13 (vanilla) on a Asus WL500g Premium
WLAN router. See here for details:
https://openwrt.org/toh/asus/wl-500gp

It is v1 version of the hardware. The CPU BCM3300 is correctly
recognized, but it seems some of the cpu features might be
misconfigured? What could be the problem?

Could this be the problem:
https://dev.archive.openwrt.org/ticket/1485

The userland works fine with a Linksys WRT54GS v1.0 and it
has the same CPU (BCM3300).
Is it because the kernel recognizes the WLAN router:
MIPS: machine is Linksys WRT54G/GS/GL
root@freewrt:~# cat /proc/cpuinfo 
system type             : Broadcom BCM4712
machine                 : Linksys WRT54G/GS/GL
processor               : 0
cpu model               : Broadcom BMIPS3300 V0.7
BogoMIPS                : 198.65
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : no
isa                     : mips1 mips2 mips32r1
ASEs implemented        :
Options implemented     : tlb 4kex 4k_cache prefetch mcheck ejtag llsc nan_legacy nan_2008
shadow register sets    : 1
kscratch registers      : 0
package                 : 0
core                    : 0
VCED exceptions         : not available
VCEI exceptions         : not available

And the Asus WL500g Premium is unknown? Or is it non-critical?

Any hints are welcome.

best regards
 Waldemar



--XpsVztfF7AKx09gN
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: 8bit

CFE version 1.0.37 for BCM947XX (32bit,SP,LE)
Build Date: �T 12�� 14 15:54:18 CST 2005 (root@localhost.localdomain)
Copyright (C) 2000,2001,2002,2003 Broadcom Corporation.

Initializing Arena
Initializing Devices.
et0: Broadcom BCM47xx 10/100 Mbps Ethernet Controller 3.90.23.0
rndis0: Broadcom USB RNDIS Network Adapter (P-t-P)
CPU type 0x29006: 264MHz
Total memory: 33554432 KBytes

Total memory used by CFE:  0x80800000 - 0x8089B590 (636304)
Initialized Data:          0x80831700 - 0x80833DE0 (9952)
BSS Area:                  0x80833DE0 - 0x80835590 (6064)
Local Heap:                0x80835590 - 0x80899590 (409600)
Stack Area:                0x80899590 - 0x8089B590 (8192)
Text (code) segment:       0x80800000 - 0x80831700 (202496)
Boot area (physical):      0x0089C000 - 0x008DC000
Relocation Factor:         I:00000000 - D:00000000

Device eth0:  hwaddr 00-17-31-D6-90-96, ipaddr 192.168.1.1, mask 255.255.255.0
        gateway not set, nameserver not set
Null Rescue Flag.
Loader:raw Filesys:raw Dev:flash0.os File: Options:(null)
Loading: .. 3728 bytes read
Entry at 0x80001000
Closing network.
Starting program at 0x80001000
Linux version 6.18.13 (wbx@fluor) (mipsel-freewrt-linux-uclibc-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.46.0.20260210) #1 Tue Feb 24 16:38:24 CET 2026
printk: legacy bootconsole [early0] enabled
CPU0 revision is: 00029006 (Broadcom BMIPS3300)
bcm47xx: Using ssb bus
ssb: Found chip with id 0x4704, rev 0x09 and package 0x00
ssb: Sonics Silicon Backplane found at address 0x18000000
Primary instruction cache 16kB, VIPT, 2-way, linesize 16 bytes.
Primary data cache 16kB, 2-way, VIPT, cache aliases, linesize 16 bytes
Zone ranges:
  Normal   [mem 0x0000000000000000-0x0000000001ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000001ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000001ffffff]
Kernel command line: root=/dev/mtdblock4 rootfstype=squashfs init=/etc/preinit noinitrd console=ttyS0,115200
Unknown kernel command line parameters "noinitrd", will be passed to user space.
printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 8192
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 256
MIPS: machine is Unknown Board
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 14479245804 ns
sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every 16268815356ns
Console: colour dummy device 80x25
Calibrating delay loop... 263.42 BogoMIPS (lpj=526848)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Memory: 26316K/32768K available (3838K kernel code, 568K rwdata, 916K rodata, 172K init, 268K bss, 6092K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
futex hash table entries: 256 (4096 bytes on 1 NUMA nodes, total 4 KiB, linear).
NET: Registered PF_NETLINK/PF_ROUTE protocol family
clocksource: Switched to clocksource MIPS
gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
NET: Registered PF_INET protocol family
IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=13 bucket_order=0
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Key type asymmetric registered
Asymmetric key parser 'x509' registered
io scheduler mq-deadline registered
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
printk: legacy console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xb8000300 (irq = 3, base_baud = 4125000) is a 16550A
printk: legacy console [ttyS0] enabled
printk: legacy console [ttyS0] enabled
printk: legacy bootconsole [early0] disabled
printk: legacy bootconsole [early0] disabled
serial8250.0: ttyS1 at MMIO 0xb8000400 (irq = 3, base_baud = 4125000) is a 16550A
physmap-flash physmap-flash.0: physmap platform flash device: [mem 0x1c000000-0x1e000000]
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x001301
Amd/Fujitsu Extended Query Table at 0x0040
  Amd/Fujitsu Extended Query version 1.3.
number of CFI chips: 1
3 bcm47xxpart partitions found on MTD device physmap-flash.0
Creating 3 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000040000 : "boot"
0x000000040000-0x0000007f0000 : "firmware"
3 trx partitions found on MTD device firmware
Creating 3 MTD partitions on "firmware":
0x00000000001c-0x00000000095c : "loader"
mtd: partition "loader" doesn't start on an erase/write block boundary -- force read-only
0x00000000095c-0x0000001af400 : "linux"
mtd: partition "linux" doesn't start on an erase/write block boundary -- force read-only
0x0000001af400-0x0000007b0000 : "rootfs"
mtd: partition "rootfs" doesn't start on an erase/write block boundary -- force read-only
0x0000007f0000-0x000000800000 : "nvram"
Generic PHY 1:1e: attached PHY driver (mii_bus:phy_addr=1:1e, irq=POLL)
b44 ssb0:0 eth0: Broadcom 44xx/47xx 10/100 PCI ethernet driver 00:17:31:d6:90:96
b44 ssb0:1: No PHY present on this MAC, aborting
NET: Registered PF_PACKET protocol family
Loading compiled-in X.509 certificates
check access for rdinit=/init failed: -2, ignoring
VFS: Mounted root (squashfs filesystem) readonly on device 31:4.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 172K
This architecture does not have kernel memory protection.
Run /etc/preinit as init process
Data bus error, epc == 80015750, ra == 80013de8
Oops[#1]:
CPU: 0 UID: 0 PID: 1 Comm: preinit Not tainted 6.18.13 #1 NONE
Hardware name: Unknown Board
$ 0   : 00000000 10008800 fffd1000 00000000
$ 4   : 8102e000 fffd1000 8102ef00 805af1e0
$ 8   : 00000034 803b9808 77e3afff 77e39000
$12   : 80534164 00000001 00000801 00001533
$16   : 8102e000 805af1e0 00000001 00000255
$20   : 80bb6700 77e39000 80bb6700 80bb5000
$24   : 00000000 00000003
$28   : 8082e000 8082fe38 00000000 80013de8
Hi    : 00000000
Lo    : 00000000
epc   : 80015750 copy_page+0x48/0x548
ra    : 80013de8 copy_user_highpage+0x94/0xf8
Status: 10008803        KERNEL EXL IE
Cause : 0080001c (ExcCode 07)
PrId  : 00029006 (Broadcom BMIPS3300)
Modules linked in:
Process preinit (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : 77e39000 00000249 80561000 00000000 805c39e0 800c2404 77e39000 77e3afff
        809a150c 00000000 8082feb4 00000000 00000000 00000000 00000a55 804b0000
        00000000 e09c7372 80bbc000 80bb6700 00100cca 0000000f 77e39000 77e39ff8
        00000a55 80ae977c 80ae977c 005ee689 00000000 805af1e0 80bbc8e4 80bb502c
        00000000 e09c7372 8082ff28 77e39ff8 80830000 00000001 00000255 00000001
        ...
Call Trace:
[<80015750>] copy_page+0x48/0x548
[<80013de8>] copy_user_highpage+0x94/0xf8
[<800c2404>] handle_mm_fault+0xbac/0xfec
[<80013528>] do_page_fault+0x118/0x470
[<80017098>] tlb_do_page_fault_1+0x118/0x120

Code: cc9e0060  cc9e0070  cca40100 <8ca80000> 8ca90004  8caa0008  8cab000c  cc9e0080  ac880000

---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---




--XpsVztfF7AKx09gN--

