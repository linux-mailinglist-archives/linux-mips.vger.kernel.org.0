Return-Path: <linux-mips+bounces-4030-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EA91C542
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 19:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81CD32820A8
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 17:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F66B645;
	Fri, 28 Jun 2024 17:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DEHfX0YZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865115253B
	for <linux-mips@vger.kernel.org>; Fri, 28 Jun 2024 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597479; cv=none; b=RzPfRSTcMyCuPzvT+KHF2vFtz0VwaSVYxvYW7+yI1OBoaUEZtRv7biWyBiNruNzICnaYG10RBWdBZodjdluXv3Llh7mvXy/zO29vzGEHMXONrvUcl7mb8sipTcr4F1wl+h1mdnXpAEp5gaT4Szn+S4Q48pHduNNwRCx1GF8xZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597479; c=relaxed/simple;
	bh=I4DjO67o0dcEy85q8hPoQlFWmNReqTzxyj1+Si1GQ4k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KxuDTA0PEkdT707PXEBlgU8rHX0V9Qb4bUFQ+2Mber+i1yIrXQkr6GJ/pDHvXYsFA1JCLddpausG0B7U4ikcoRZsHVrLnj5beZkUxt4L+lLur03RkmFATNyfnGscA+uW8LNtZKlra5tZ+NQGw5/SsYhSOIvWicX9kIDcCHLN5p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DEHfX0YZ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d00a51b71so1380a12.0
        for <linux-mips@vger.kernel.org>; Fri, 28 Jun 2024 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719597476; x=1720202276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jRH3Kn0xKi1iaX+I+biGznTdpUhlGPhYKhFw+lrnDTw=;
        b=DEHfX0YZXtbtpTvLsKdv65818bS9qUwNUlwTBAauUvms04afDKWYxbLuuZTsvYG5Ih
         YadYZ7D6pWxdRXkXlYDmzL3vTQLNGfPKfgh1l+em2yL/XM6571NIW4ZGWl5FJM4NczHZ
         VQ07Edr9nSbvXu7BGyzc8RkY0tt17Xz6CFw1agQkB6SuyDB0pdLrSbMHRdtz4/ktNY4q
         R/ceTDTcFmK14uH2X+gqoRqU1Fzg3Kcm8SlKN0u5a0M+2mbKqLsMvgYezTxXHYtFoOnQ
         zOMkzOWKnnzCGVCPRxA5oK+5niUxv7UwTThOmMWqLELayMmcWHYILcPZVLy34c6JYLmS
         M0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597476; x=1720202276;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRH3Kn0xKi1iaX+I+biGznTdpUhlGPhYKhFw+lrnDTw=;
        b=sAP2DTShJozue4l/oy9DoAOHErWmr0WMCFahiA+eriSj2Z7hd1emOMdQ0Bf/FWAzmb
         F1DYYnixWfz0OCMwDTcrR5HAa7ICZz5H0HrmOqEor8I6p0G85HHl75Cx9HHkFYHdT1UM
         z5sjYC2QQ9c8XT+QuKEprgTcl17qvcW9YS6jIcKcWRpKM6I7cSGQTB3oPba51Yz/5vOy
         JMNJQr8t3hkUznfp6ZtQPsUqclQjCJPOXEdGDXsEkcp0NdGOSV7akVxmTJhAk685RhqR
         DTs5l1G5MqbHkrezGBhe1lhiPv7G+E8j5Xd8MwH07zVUglygGc4VrZGzzozexeaak2dw
         QX0w==
X-Gm-Message-State: AOJu0YzsFBSLnuX90tYBCQ40jN1dSvJffhVEguP7EKRoxP6ux6YdXHVH
	8FjGHKegGJJG9gk0cUt9kfkQNqqYXiPMY0Ia7KDcN8LVucU9wV+GUV8NPUO0i9pn0TCWiONfisw
	ieRCyPK0TLjn+0Vg8+ml4gXwQTXdunGjbbTvlfC4Wxk5NA2ilnG0M
X-Google-Smtp-Source: AGHT+IHAr9oauJQ0KdKvmlqABqwfn2zKrLORVKfeCFMa2HSgr7XWfTQDgwB+haVwY8PVQbl33QhWkL6GqD5U7D96I4c=
X-Received: by 2002:a50:8ad0:0:b0:57d:44ab:ecff with SMTP id
 4fb4d7f45d1cf-5872f6702a3mr6614a12.2.1719597475686; Fri, 28 Jun 2024 10:57:55
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 28 Jun 2024 11:57:18 -0600
Message-ID: <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
Subject: MCEs on MIPS: multiple matching TLB entries
To: linux-mips@vger.kernel.org
Cc: Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

OpenWrt folks ran into MCEs caused by multiple matching TLB entries
[1], after they updated their kernel from v6.1 to v6.6.

I reported similar crashes previously [2], on v6.4. So they asked me
whether I'm aware of a fix from the mainline, which I am not.

I took a quick look from the MM's POV and found nothing obviously
wrong. I'm hoping they have better luck with the MIPS experts.

Thanks!

[1] https://github.com/openwrt/openwrt/pull/15635
[2] https://lore.kernel.org/linux-mm/CAOUHufbAjZd4Mxkio9OGct-TZ=L0QRG+_6Xa7atQVFN_4ez86w@mail.gmail.com/

Copying and pasting one of the crashes from OpenWrt:

CFE for WNR3500L version: v1.0.36
Build Date: Tue Aug 11 15:09:14 CST 2009
Init Arena
Init Devs.
Boot partition size = 262144(0x40000)
Found a 8MB ST compatible serial flash
et0: Broadcom BCM47XX 10/100/1000 Mbps Ethernet Controller 5.10.56.28
CPU type 0x19740: 453MHz
Tot mem: 65536 KBytes

Device eth0:  hwaddr 00-FF-FF-FF-FF-FF, ipaddr 192.168.1.1, mask 255.255.255.0
        gateway not set, nameserver not set
too long file.
LZMA boot failed
Loader:raw Filesys:raw Dev:flash0.os File: Options:(null)
Loading: .. 3808 bytes read
Entry at 0x80001000
Closing network.
Starting program at 0x80001000
[    0.000000] Linux version 6.6.35 (user@connors)
(mipsel-openwrt-linux-musl-gcc (OpenWrt GCC 13.3.0
r25518+987-f7a68458b4) 13.3.0, GNU ld (GNU Binutils) 2.42) #0 Sun Jun
23 09:14:12 2024
[    0.000000] CPU0 revision is: 00019740 (MIPS 74Kc)
[    0.000000] bcm47xx: Using bcma bus
[    0.000000] (NULL device *): bus0: Found chip with id 0x4716, rev
0x01 and package 0x0A
[    0.000000] Initrd not found or empty - disabling initrd
[    0.000000] Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases,
linesize 32 bytes
[    0.000000] This processor doesn't support highmem. -65536k highmem ignored
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000003ffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000003ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000003ffffff]
[    0.000000] Kernel command line: noinitrd console=ttyS0,115200
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768
bytes, linear)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384
bytes, linear)
[    0.000000] Writing ErrCtl register=00000000
[    0.000000] Readback ErrCtl register=00000000
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16240
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 56672K/65536K available (5819K kernel code,
596K rwdata, 1244K rodata, 204K init, 297K bss, 8864K reserved, 0K
cma-reserved, 0K highmem)
[    0.000000] NR_IRQS: 256
[    0.000000]  bcm47xx_soc: bus0: Core 0 found: ChipCommon (manuf
0x4BF, id 0x800, rev 0x1F, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 1 found: IEEE 802.11 (manuf
0x4BF, id 0x812, rev 0x11, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 2 found: GBit MAC (manuf
0x4BF, id 0x82D, rev 0x00, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 3 found: MIPS 74K (manuf
0x4A7, id 0x82C, rev 0x01, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 4 found: USB 2.0 Host (manuf
0x4BF, id 0x819, rev 0x04, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 5 found: PCIe (manuf 0x4BF, id
0x820, rev 0x0E, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 6 found: DDR1/DDR2 Memory
Controller (manuf 0x4BF, id 0x82E, rev 0x01, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 7 found: Internal Memory
(manuf 0x4BF, id 0x80E, rev 0x07, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Core 8 found: I2S (manuf 0x4BF, id
0x834, rev 0x00, class 0x0)
[    0.000000]  bcm47xx_soc: bus0: Found M25P64 serial flash (size:
8192KiB, blocksize: 0x10000, blocks: 128)
[    0.000000]  bcm47xx_soc: bus0: Early bus registered
[    0.000000] MIPS: machine is Netgear WNR3500L
[    0.000000] bcm47xx: Setting up vectored interrupts
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 8438235966 ns
[    0.000003] sched_clock: 32 bits at 227MHz, resolution 4ns, wraps
every 9481163773ns
[    0.009630] Calibrating delay loop... 226.09 BogoMIPS (lpj=1130496)
[    0.080067] pid_max: default: 32768 minimum: 301
[    0.098070] Mount-cache hash table entries: 1024 (order: 0, 4096
bytes, linear)
[    0.098182] Mountpoint-cache hash table entries: 1024 (order: 0,
4096 bytes, linear)
[    0.115630] RCU Tasks Trace: Setting shift to 0 and lim to 1
rcu_task_cb_adjust=1.
[    0.119327] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.119449] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.127277] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.147294] clocksource: Switched to clocksource MIPS
[    0.162062] NET: Registered PF_INET protocol family
[    0.162678] IP idents hash table entries: 2048 (order: 2, 16384
bytes, linear)
[    0.164718] tcp_listen_portaddr_hash hash table entries: 1024
(order: 0, 4096 bytes, linear)
[    0.167040] Table-perturb hash table entries: 65536 (order: 6,
262144 bytes, linear)
[    0.167138] TCP established hash table entries: 1024 (order: 0,
4096 bytes, linear)
[    0.167258] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.167386] TCP: Hash tables configured (established 1024 bind 1024)
[    0.168124] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.168379] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.169663] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.169984] PCI: CLS 0 bytes, default 32
[    0.201695]  bcm47xx_soc: bus0: PCIEcore in host mode found
[    0.201712]  bcm47xx_soc: bus0: This PCIE core is disabled and not working
[    0.203394] gpio gpiochip0: Static allocation of GPIO base is
deprecated, use dynamic allocation.
[    0.204527]  bcm47xx_soc: bus0: Bus registered
[    0.230753] workingset: timestamp_bits=14 max_order=14 bucket_order=0
[    0.233286] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.233331] jffs2: version 2.2 (NAND) (SUMMARY) (LZMA) (RTIME)
(CMODE_PRIORITY) (c) 2001-2006 Red Hat, Inc.
[    0.244147] Serial: 8250/16550 driver, 2 ports, IRQ sharing enabled
[    0.246592] printk: console [ttyS0] disabled
[    0.267632] serial8250.0: ttyS0 at MMIO 0xb8000300 (irq = 2,
base_baud = 1250000) is a U6_16550A
[    0.267762] printk: console [ttyS0] enabled
[    0.793749] 3 bcm47xxpart partitions found on MTD device bcm47xxsflash
[    0.800497] Creating 3 MTD partitions on "bcm47xxsflash":
[    0.806143] 0x000000000000-0x000000040000 : "boot"
[    0.844873] 0x000000040000-0x0000007f0000 : "firmware"
[    0.853949] failed to parse "brcm,trx-magic" DT attribute, using default: -89
[    0.861402] 3 trx partitions found on MTD device firmware
[    0.866918] Creating 3 MTD partitions on "firmware":
[    0.872045] 0x00000000001c-0x000000000928 : "loader"
[    0.877127] mtd: partition "loader" doesn't start on an erase/write
block boundary -- force read-only
[    0.892292] 0x000000000928-0x00000024f800 : "linux"
[    0.897409] mtd: partition "linux" doesn't start on an erase/write
block boundary -- force read-only
[    0.911927] 0x00000024f800-0x0000007b0000 : "rootfs"
[    0.917042] mtd: partition "rootfs" doesn't start on an erase/write
block boundary -- force read-only
[    0.930529] mtd: setting mtd4 (rootfs) as root device
[    0.935780] 1 squashfs-split partitions found on MTD device rootfs
[    0.942210] 0x000000560000-0x0000007b0000 : "rootfs_data"
[    0.953347] 0x0000007f0000-0x000000800000 : "nvram"
[    0.976291] bgmac_bcma bcma0:2: Found PHY addr: 30 (NOREGS)
[    1.089641] b53_common: found switch: BCM53115, rev 8
[    1.095225] bgmac_bcma bcma0:2: Support for Roboswitch not implemented
[    1.104192] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
[    1.110909] bcm47xx-wdt bcm47xx-wdt.0: BCM47xx Watchdog Timer
enabled (30 seconds)
[    1.121569] NET: Registered PF_INET6 protocol family
[    1.146114] Segment Routing with IPv6
[    1.150302] In-situ OAM (IOAM) with IPv6
[    1.154877] NET: Registered PF_PACKET protocol family
[    1.160253] 8021q: 802.1Q VLAN Support v1.8
[    1.273304] VFS: Mounted root (squashfs filesystem) readonly on device 31:4.
[    1.282239] Freeing unused kernel image (initmem) memory: 204K
[    1.288306] This architecture does not have kernel memory protection.
[    1.294893] Run /sbin/init as init process
[    2.348011] init: Console is alive
[    2.352416] init: - watchdog -
[    3.465026] kmodloader: loading kernel modules from /etc/modules-boot.d/*
[    3.645823] usbcore: registered new interface driver usbfs
[    3.651824] usbcore: registered new interface driver hub
[    3.657587] usbcore: registered new device driver usb
[    3.678605] gpio_button_hotplug: loading out-of-tree module taints kernel.
[    3.722626] ehci-platform ehci-platform.0: EHCI Host Controller
[    3.728888] ehci-platform ehci-platform.0: new USB bus registered,
assigned bus number 1
[    3.737524] ehci-platform ehci-platform.0: irq 5, io mem 0x18004000
[    3.767369] ehci-platform ehci-platform.0: USB 2.0 started, EHCI 1.00
[    3.776631] hub 1-0:1.0: USB hub found
[    3.782776] hub 1-0:1.0: 2 ports detected
[    3.813642] ohci-platform ohci-platform.0: Generic Platform OHCI controller
[    3.820986] ohci-platform ohci-platform.0: new USB bus registered,
assigned bus number 2
[    3.829703] ohci-platform ohci-platform.0: irq 5, io mem 0x18009000
[    3.903777] hub 2-0:1.0: USB hub found
[    3.909946] hub 2-0:1.0: 2 ports detected
[    3.940493] kmodloader: done loading kernel modules from
/etc/modules-boot.d/*
[    3.959102] init: - preinit -
[    3.965715] Got mcheck at 800104ec
[    3.969240] CPU: 0 PID: 245 Comm: init Tainted: G           O       6.6.35 #0
[    3.976522] $ 0   : 00000000 00000001 fffd5000 00000001
[    3.981900] $ 4   : 00000004 00000003 00026edf 7fc8c008
[    3.987273] $ 8   : 00000000 00000001 0000001b 00000068
[    3.992635] $12   : 7fc8d600 81c2376c 81c2370c ffffff00
[    3.998007] $16   : 7fc8d000 8192dad0 00000000 806ed280
[    4.003379] $20   : 8192dad0 00000001 807b1000 7fc8d7c0
[    4.008751] $24   : 77d75000 ffffffff
[    4.014122] $28   : 81ad6000 81ad7dc8 00000000 80017678
[    4.019486] Hi    : 00000071
[    4.022428] Lo    : 0ceb0000
[    4.025369] epc   : 800104ec __kmap_pgprot+0xdc/0x108
[    4.030547] ra    : 80017678 r4k_flush_cache_page+0x24c/0x29c
[    4.036430] Status: 1120a402 KERNEL EXL
[    4.040455] Cause : 00800060 (ExcCode 18)
[    4.044541] PrId  : 00019740 (MIPS 74Kc)
[    4.048543] CPU: 0 PID: 245 Comm: init Tainted: G           O       6.6.35 #0
[    4.055816] Stack : 00000000 00000001 807b1000 800625ac 00000000
00000004 00000000 00000000
[    4.064399]         81ad7c8c 807b0000 80780000 8064d57c 81ac1528
00000001 81ad7c30 860f9307
[    4.072985]         00000000 00000000 8064d57c 81ad7b70 ffffefff
00000000 00000000 ffffffea
[    4.081562]         00000000 81ad7b7c 000000a9 806f5a88 00000000
8064d57c 00000000 806ed280
[    4.090140]         8192dad0 00000001 807b1000 7fc8d7c0 00000018
80324b6c 89052010 00000060
[    4.098718]         ...
[    4.101229] Call Trace:
[    4.103730] [<80006fd0>] show_stack+0x28/0xf0
[    4.108219] [<8057ec8c>] dump_stack_lvl+0x38/0x60
[    4.113077] [<80008108>] do_mcheck+0x2c/0xa0
[    4.117462] [<80003d34>] handle_mcheck_int+0x3c/0x48
[    4.122547]
[    4.124072] Index    : 3
[    4.126661] PageMask : 0
[    4.129241] EntryHi  : fffd4000
[    4.132447] EntryLo0 : 00026edf
[    4.135652] EntryLo1 : 00026edf
[    4.138848] Wired    : 4
[    4.141430]
[    4.142954] Index:  0 pgmask=4kb va=fffd4000 asid=00
[    4.142954] [pa=007af000 c=3 d=1 v=1 g=1] [pa=007af000 c=3 d=1 v=1 g=1]
[    4.154868] Index:  1 pgmask=4kb va=fffd2000 asid=00
[    4.154868] [pa=0105b000 c=3 d=1 v=1 g=1] [pa=0105b000 c=3 d=1 v=1 g=1]
[    4.166775] Index:  2 pgmask=4kb va=fffd0000 asid=00
[    4.166775] [pa=01018000 c=3 d=1 v=1 g=1] [pa=01018000 c=3 d=1 v=1 g=1]
[    4.178682] Index:  3 pgmask=4kb va=fffd4000 asid=00
[    4.178682] [pa=009bb000 c=3 d=1 v=1 g=1] [pa=009bb000 c=3 d=1 v=1 g=1]
[    4.190590] Index: 19 pgmask=4kb va=80026000 asid=00
[    4.190590] [pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[    4.202496] Index: 28 pgmask=4kb va=80038000 asid=00
[    4.202496] [pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[    4.214400] Index: 29 pgmask=4kb va=8003a000 asid=00
[    4.214400] [pa=00000000 c=0 d=0 v=0 g=0] [pa=00000000 c=0 d=0 v=0 g=0]
[    4.226312]
[    4.227840] Code: 40843000  40850000  000000c0 <42000002> 000000c0
40875000  10600002  41606000  41606020
[    4.237866] Kernel panic - not syncing: Caught Machine Check
exception - caused by multiple matching entries in the TLB.
[    4.248920] Rebooting in 1 seconds..
[    5.250906] bcm47xx: Please stand by while rebooting the system...
Decompressing..........done

