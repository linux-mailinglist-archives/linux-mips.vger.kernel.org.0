Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB82E11E4
	for <lists+linux-mips@lfdr.de>; Wed, 23 Oct 2019 08:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfJWGDV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Oct 2019 02:03:21 -0400
Received: from mail-yb1-f172.google.com ([209.85.219.172]:37291 "EHLO
        mail-yb1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfJWGDV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Oct 2019 02:03:21 -0400
Received: by mail-yb1-f172.google.com with SMTP id z125so5962716ybc.4
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 23:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=RPk7mT7bGh07f3cKgLebQ2ehwiTs5qu6zUyQrJuc95Q=;
        b=eeNagu19JkirSj3flEq5V+Ir7vOs6ILr4kdBLu4mYCZDR6UPHDFb8OTvheFs5RGlhc
         d8fwso0N80y3+qGWmODcCyhM6E5rVRnOxZ2/f1HtPrqBtrL7oXpdujKMigVSzIfG7crK
         LfzGnIpw22+HQSF6LpKa2fMNe0a9FPu25acTEIyUm3fMHuYkE/5OosaKIzScOYStc9k9
         Trm4Z6CGRkUiaeaJ+zmU49gjuoiaDIaW4Epv23ABdFv/VnsX3ylkwdZmR/FLMvxKKwRA
         JoaoqC0bVa+/K+SWrczRU2PSdHFOrUZ31gNFDmmL+lHmJyJ4lpzrdhcGUvXZqx5L3XKc
         HKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RPk7mT7bGh07f3cKgLebQ2ehwiTs5qu6zUyQrJuc95Q=;
        b=A76RZ1AnKWUABEbXUBSSy7d8gDj/4Di/t6iayOrYXvytgZdOaXRnCnL5rUD1xGg8x8
         o4iiuRsK2mX2K6ChhFhwCECwcQ769PUQ3Cr7zR5ZhOCa6lBdDgQlnSEN8mIDWOH8sj8+
         c39v4C+kVdihtbkoAByqTpZQ9V2wSOF9AjuuXiRffZIOnEuTLfO77a+oT6bHr70LHk5M
         XeyMCoMcPZtVKYXpeXUcyvE8G59+0M+Mi4XjZVI3MP44XvGfFm34Fe0dNg7urVinMNGP
         y27WiZDUq423REertDSBm+79kNs2Z26T3oS5/yv8bJLVEk5gnSvsu6JPNa6cClW5k0Ce
         N8Ng==
X-Gm-Message-State: APjAAAWCogk65BZKnGm/yIktLuGDb5Ousl/uexqj/bFdr2hZFNdgqK2U
        yk/0F0TGX/WsQ7J1qar4xwCXYbEgMuRS9LZnH6tFuaKD
X-Google-Smtp-Source: APXvYqx6E2HLb1/PTroL13UdnF4az8HrE1uNy3TwHniNOD4GxeflrMpkDBaGSinNZlWQu+SxkyQhiBpsrhgYfo7QuVU=
X-Received: by 2002:a5b:702:: with SMTP id g2mr5099794ybq.49.1571810598470;
 Tue, 22 Oct 2019 23:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com> <20191022192547.480095-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20191022192547.480095-1-rikard.falkeborn@gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Wed, 23 Oct 2019 08:03:13 +0200
Message-ID: <CA+QBN9BL4nhAQ2x1fCD+9ZVv3C_3zd8WDBOcat80xsTA3Ha0kQ@mail.gmail.com>
Subject: rb532, Kernel panic - not syncing: Fatal exception in interrupt
To:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

hi
we have a rb532A router, running kernel 4.4.197.
The miniPCI quad uart modules are installed

During the test
1) /dev/ttyS5 was attached to Minicom, with a lot of traffic at 115200bps
2) a tftpboot server continuously received requests from clients

and, we got this
uc-rb532 ~ # CPU 0 Unable to handle kernel paging request at virtual
address 425c2100, epc == 8041ecd8, ra == 8041ece0
Oops[#1]:
CPU: 0 PID: 1398 Comm: minicom Not tainted 4.4.197-BlurryFishButt-rb532 #2
task: 835bda38 ti: 83768000 task.ti: 83768000
$ 0   : 00000000 1810e800 00000000 00000000
$ 4   : 425c2100 83cbd4f0 837aa9b4 0000b2cd
$ 8   : 00000000 00000000 00000000 00000000
$12   : 0000b2cd 00000000 00175c88 00000000
$16   : 83cbd4f0 83cbd4f0 837aafa0 83cbd4f0
$20   : 00040000 836cf020 836cf020 80696cf0
$24   : 00000000 00000000
$28   : 83768000 83c079b0 00000000 8041ece0
Hi    : 00000000
Lo    : 0000001e
epc   : 8041ecd8 0x8041ecd8
ra    : 8041ece0 0x8041ece0
Status: 1810e803        KERNEL EXL IE
Cause : 80800008 (ExcCode 02)
BadVA : 425c2100
PrId  : 0001800a (MIPS 4Kc)
Modules linked in:
Process minicom (pid: 1398, threadinfo=83768000, task=835bda38, tls=77726470)
Stack : 836cf020 836cf020 80696cf0 80180184 83cbd4f0 8041eb9c 00000000 00000000
          83cbd4f0 8041ec00 837c88c4 83cbd4f0 83cbd4f0 837aa9b4
837aa9a0 8041ec3c
          0000045a 00000000 00000002 00003833 836cf020 804a93b8
0082e818 00000000
          806a0000 80648718 00000000 00000001 00000001 00000000
836cf020 83cbd4f0
          837aa9b4 837aa9a0 00040000 836cf020 836cf020 80696cf0
00000000 804aca3c
          ...
Call Trace:[<80180184>] 0x80180184
[<8041eb9c>] 0x8041eb9c
[<8041ec00>] 0x8041ec00
[<8041ec3c>] 0x8041ec3c
[<804a93b8>] 0x804a93b8
[<804aca3c>] 0x804aca3c
[<8014e4dc>] 0x8014e4dc
[<804b70c0>] 0x804b70c0
[<804b8c1c>] 0x804b8c1c
[<80461c08>] 0x80461c08
[<8049039c>] 0x8049039c
[<80490ac8>] 0x80490ac8
[<804902a0>] 0x804902a0
[<80490e70>] 0x80490e70
[<80423bc8>] 0x80423bc8
[<804904dc>] 0x804904dc
[<8042c4b0>] 0x8042c4b0
[<805030cc>] 0x805030cc
[<80461c08>] 0x80461c08
[<804e4e3c>] 0x804e4e3c
[<805030cc>] 0x805030cc
[<8042e9a0>] 0x8042e9a0
[<80502dec>] 0x80502dec
[<80502bd8>] 0x80502bd8
[<804e34ac>] 0x804e34ac
[<805030cc>] 0x805030cc
[<805096d0>] 0x805096d0
[<8013cd24>] 0x8013cd24
[<80502c38>] 0x80502c38
[<80509d7c>] 0x80509d7c
[<8050b098>] 0x8050b098
[<801686f0>] 0x801686f0
[<80509554>] 0x80509554
[<80461c08>] 0x80461c08
[<80461cac>] 0x80461cac
[<8050328c>] 0x8050328c
[<80141b8c>] 0x80141b8c
[<8013cd24>] 0x8013cd24
[<80502c38>] 0x80502c38
[<8042c2d8>] 0x8042c2d8
[<80421ff0>] 0x80421ff0
[<8042e9a0>] 0x8042e9a0
[<803a16cc>] 0x803a16cc
[<80334638>] 0x80334638
[<8042bbb4>] 0x8042bbb4
[<8042edc0>] 0x8042edc0
[<80120670>] 0x80120670
[<8016a868>] 0x8016a868
[<80151728>] 0x80151728
[<80120b08>] 0x80120b08
[<80105b44>] 0x80105b44


Code: 27bdffe8  afbf0014  afb00010 <0c107b14> 8c900000  1600fffd
02002025  8fbf0014  8fb00010
---[ end trace 4f05eb314ec51065 ]---
Kernel panic - not syncing: Fatal exception in interrupt
Rebooting in 2 seconds..

the same problem happened with kernel 4.9.91.running Minicom-v2.3-r2

----
uc-rb532 ~ # dmesg
Kernel command line: console=ttyS0,9600 gpio=16383 mem=64M
kmac=00:0C:42:0E:8F:01 board=500r5 boot=1  root=/dev/sda3 initd
korina mac = 00:0C:42:0E:8F:01
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 57840K/65536K available (4762K kernel code, 175K rwdata, 816K
rodata, 188K init, 111K bss, 7696K reserved, 0K cma)
NR_IRQS:256
Initializing IRQ's: 168 out of 256
calculating r4koff... 000c34f8(799992)
CPU frequency 400.00 MHz
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 9556397797 ns
sched_clock: 32 bits at 199MHz, resolution 5ns, wraps every 10737525757ns
Calibrating delay loop... 397.82 BogoMIPS (lpj=795648)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: -1, 3072 bytes)
NET: Registered protocol family 16
PCI: Initializing PCI
SCSI subsystem initialized
libata version 3.00 loaded.
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci 0000:00:00.0: [111d:0000] type 00 class 0x000000
pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x07ffffff pref]
pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
pci 0000:00:02.0: [1106:3106] type 00 class 0x020000
pci 0000:00:02.0: reg 0x10: [io  0x0000-0x00ff]
pci 0000:00:02.0: reg 0x14: [mem 0x00000000-0x000000ff]
pci 0000:00:02.0: supports D1 D2
pci 0000:00:02.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:00:03.0: [1106:3106] type 00 class 0x020000
pci 0000:00:03.0: reg 0x10: [io  0x0000-0x00ff]
pci 0000:00:03.0: reg 0x14: [mem 0x00000000-0x000000ff]
pci 0000:00:03.0: supports D1 D2
pci 0000:00:03.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:00:04.0: [168c:0029] type 00 class 0x028000
pci 0000:00:04.0: reg 0x10: [mem 0x00000000-0x0000ffff]
pci 0000:00:04.0: PME# supported from D0 D3hot
pci 0000:00:05.0: [1415:9501] type 00 class 0x070006
pci 0000:00:05.0: reg 0x10: [io  0x0000-0x001f]
pci 0000:00:05.0: reg 0x14: [mem 0x00000000-0x00000fff]
pci 0000:00:05.0: reg 0x18: [io  0x0000-0x001f]
pci 0000:00:05.0: reg 0x1c: [mem 0x00000000-0x00000fff]
pci 0000:00:05.0: supports D2
pci 0000:00:05.0: PME# supported from D0 D2 D3hot
pci 0000:00:05.1: [1415:9500] type 00 class 0x000000
pci 0000:00:05.1: reg 0x10: [io  0x0000-0x0007]
pci 0000:00:05.1: reg 0x14: [io  0x0000-0x0007]
pci 0000:00:05.1: reg 0x18: [io  0x0000-0x001f]
pci 0000:00:05.1: reg 0x1c: [mem 0x00000000-0x00000fff]
pci 0000:00:05.1: supports D2
pci 0000:00:05.1: PME# supported from D0 D2 D3hot
pci 0000:00:0a.0: [1415:9501] type 00 class 0x070006
pci 0000:00:0a.0: reg 0x10: [io  0x0000-0x001f]
pci 0000:00:0a.0: reg 0x14: [mem 0x00000000-0x00000fff]
pci 0000:00:0a.0: reg 0x18: [io  0x0000-0x001f]
pci 0000:00:0a.0: reg 0x1c: [mem 0x00000000-0x00000fff]
pci 0000:00:0a.0: supports D2
pci 0000:00:0a.0: PME# supported from D0 D2 D3hot
pci 0000:00:0a.1: [1415:9500] type 00 class 0x000000
pci 0000:00:0a.1: reg 0x10: [io  0x0000-0x0007]
pci 0000:00:0a.1: reg 0x14: [io  0x0000-0x0007]
pci 0000:00:0a.1: reg 0x18: [io  0x0000-0x001f]
pci 0000:00:0a.1: reg 0x1c: [mem 0x00000000-0x00000fff]
pci 0000:00:0a.1: supports D2
pci 0000:00:0a.1: PME# supported from D0 D2 D3hot
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:04.0: BAR 0: assigned [mem 0x50000000-0x5000ffff]
pci 0000:00:05.0: BAR 1: assigned [mem 0x50010000-0x50010fff]
pci 0000:00:05.0: BAR 3: assigned [mem 0x50011000-0x50011fff]
pci 0000:00:0a.0: BAR 1: assigned [mem 0x50012000-0x50012fff]
pci 0000:00:0a.0: BAR 3: assigned [mem 0x50013000-0x50013fff]
pci 0000:00:02.0: BAR 0: assigned [io  0x18800000-0x188000ff]
pci 0000:00:02.0: BAR 1: assigned [mem 0x50014000-0x500140ff]
pci 0000:00:03.0: BAR 0: assigned [io  0x18800400-0x188004ff]
pci 0000:00:03.0: BAR 1: assigned [mem 0x50014100-0x500141ff]
pci 0000:00:05.0: BAR 0: assigned [io  0x18800800-0x1880081f]
pci 0000:00:05.0: BAR 2: assigned [io  0x18800820-0x1880083f]
pci 0000:00:0a.0: BAR 0: assigned [io  0x18800840-0x1880085f]
pci 0000:00:0a.0: BAR 2: assigned [io  0x18800860-0x1880087f]
clocksource: Switched to clocksource MIPS
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
PCI: CLS 16 bytes, default 16
io scheduler noop registered
io scheduler deadline registered (default)
Serial: 8250/16550 driver, 9 ports, IRQ sharing disabled
serial8250: ttyS0 at MMIO 0x0 (irq = 104, base_baud = 12499875) is a 16550A
console [ttyS0] enabled
console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0x0 (irq = 104, base_baud = 12499875) is a 16550A
console [ttyS0] enabled
PCI: Enabling device 0000:00:05.0 (0000 -> 0003)
ttyS1: detected caps 00000700 should be 00000500
0000:00:05.0: ttyS1 at I/O 0x18800800 (irq = 143, base_baud = 115200)
is a 16C950/954
ttyS2: detected caps 00000700 should be 00000500
0000:00:05.0: ttyS2 at I/O 0x18800808 (irq = 143, base_baud = 115200)
is a 16C950/954
ttyS3: detected caps 00000700 should be 00000500
0000:00:05.0: ttyS3 at I/O 0x18800810 (irq = 143, base_baud = 115200)
is a 16C950/954
ttyS4: detected caps 00000700 should be 00000500
0000:00:05.0: ttyS4 at I/O 0x18800818 (irq = 143, base_baud = 115200)
is a 16C950/954
PCI: Enabling device 0000:00:0a.0 (0000 -> 0003)
ttyS5: detected caps 00000700 should be 00000500
0000:00:0a.0: ttyS5 at I/O 0x18800840 (irq = 140, base_baud = 115200)
is a 16C950/954
ttyS6: detected caps 00000700 should be 00000500
0000:00:0a.0: ttyS6 at I/O 0x18800848 (irq = 140, base_baud = 115200)
is a 16C950/954
ttyS7: detected caps 00000700 should be 00000500
0000:00:0a.0: ttyS7 at I/O 0x18800850 (irq = 140, base_baud = 115200)
is a 16C950/954
ttyS8: detected caps 00000700 should be 00000500
0000:00:0a.0: ttyS8 at I/O 0x18800858 (irq = 140, base_baud = 115200)
is a 16C950/954
loop: module loaded
nbd: registered device at major 43
null: module loaded
scsi host0: pata-rb532-cf
ata1: PATA max PIO4 irq 149
Ethernet Channel Bonding Driver: v3.7.1 (April 27, 2011)
tun: Universal TUN/TAP device driver, 1.6
tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
ata1.00: CFA: HMS360404D5CF00, DN4OCA2A, max PIO4
ata1.00: 7999488 sectors, multi 0: LBA
eth0: korina-0.10 04Mar2008
via_rhine: v1.10-LK1.5.1 2010-10-09 Written by Donald Becker
PCI: Enabling device 0000:00:02.0 (0080 -> 0083)
via-rhine 0000:00:02.0 eth1: VIA Rhine III at 0xc0012000,
00:0c:42:0e:8f:02, IRQ 142
via-rhine 0000:00:02.0 eth1: MII PHY found at address 1, status 0x786d
advertising 05e1 Link 45e1
PCI: Enabling device 0000:00:03.0 (0080 -> 0083)
via-rhine 0000:00:03.0 eth2: VIA Rhine III at 0xc0014100,
00:0c:42:0e:8f:03, IRQ 143
via-rhine 0000:00:03.0 eth2: MII PHY found at address 1, status 0x7869
advertising 05e1 Link 41e1
PCI: Enabling device 0000:00:04.0 (0000 -> 0002)
ata1.00: configured for PIO4
scsi 0:0:0:0: Direct-Access     ATA      HMS360404D5CF00  CA2A PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] 7999488 512-byte logical blocks: (4.10 GB/3.81 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't
support DPO or FUA
ath: EEPROM regdomain: 0x809c
ath: EEPROM indicates we should expect a country code
ath: doing EEPROM country->regdmn map search
ath: country maps to regdmn code: 0x52
ath: Country alpha2 being used: CN
ath: Regpair used: 0x52
ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
 sda: sda1 sda2 sda3
ieee80211 phy0: Atheros AR9280 Rev:2 mem=0xc0020000, irq=142
sd 0:0:0:0: [sda] Attached SCSI removable disk
aoe: AoE v85 initialised.
rc32434_wdt: Stopped watchdog timer
rc32434_wdt: Watchdog Timer version 1.0, timer margin: 20 sec
NET: Registered protocol family 26
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (903 buckets, 3612 max)
nf_tables: (c) 2007-2009 Patrick McHardy <kaber@trash.net>
nf_tables_compat: (c) 2012 Pablo Neira Ayuso <pablo@netfilter.org>
xt_time: kernel timezone is -0000
ip_tables: (C) 2000-2006 Netfilter Core Team
arp_tables: (C) 2002 David S. Miller
NET: Registered protocol family 17
Bridge firewalling registered
Ebtables v2.0 registered
EXT4-fs (sda3): couldn't mount as ext3 due to feature incompatibilities
EXT4-fs (sda3): INFO: recovery required on readonly filesystem
EXT4-fs (sda3): write access will be enabled during recovery
random: nonblocking pool is initialized
EXT4-fs (sda3): recovery complete
EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 8:3.
Freeing unused kernel memory: 188K
EXT4-fs (sda3): re-mounted. Opts: (null)
EXT4-fs (sda3): re-mounted. Opts:
----
00:00.0 Non-VGA unclassified device: Integrated Device Technology,
Inc. Device 0000
        Subsystem: Device 0214:011d
        Flags: bus master, 66MHz, medium devsel, latency 60, IRQ 140
        Memory at <unassigned> (32-bit, prefetchable)
        I/O ports at <ignored>
        I/O ports at <ignored>

00:02.0 Ethernet controller: VIA Technologies, Inc. VT6105/VT6106S
[Rhine-III] (rev 86)
        Subsystem: AST Research Inc Device 086c
        Flags: bus master, stepping, medium devsel, latency 64, IRQ 142
        I/O ports at 18800000 [size=256]
        Memory at 50014000 (32-bit, non-prefetchable) [size=256]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: via-rhine

00:03.0 Ethernet controller: VIA Technologies, Inc. VT6105/VT6106S
[Rhine-III] (rev 86)
        Subsystem: AST Research Inc Device 086c
        Flags: bus master, stepping, medium devsel, latency 64, IRQ 143
        I/O ports at 18800400 [size=256]
        Memory at 50014100 (32-bit, non-prefetchable) [size=256]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: via-rhine

00:04.0 Network controller: Atheros Communications Inc. Device 0029 (rev 01)
        Subsystem: Atheros Communications Inc. Device 2091
        Flags: bus master, 66MHz, medium devsel, latency 168, IRQ 142
        Memory at 50000000 (32-bit, non-prefetchable) [size=64K]
        Capabilities: [44] Power Management version 2
        Kernel driver in use: ath9k

00:05.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad
16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 143
        I/O ports at 18800800 [size=32]
        Memory at 50010000 (32-bit, non-prefetchable) [size=4K]
        I/O ports at 18800820 [size=32]
        Memory at 50011000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: serial

00:05.1 Non-VGA unclassified device: Oxford Semiconductor Ltd
OX16PCI954 (Quad 16950 UART) function 0 (Disabled) (rev 01)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 143
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        Capabilities: [40] Power Management version 2

00:0a.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad
16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 140
        I/O ports at 18800840 [size=32]
        Memory at 50012000 (32-bit, non-prefetchable) [size=4K]
        I/O ports at 18800860 [size=32]
        Memory at 50013000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: serial

00:0a.1 Non-VGA unclassified device: Oxford Semiconductor Ltd
OX16PCI954 (Quad 16950 UART) function 0 (Disabled) (rev 01)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 140
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        Capabilities: [40] Power Management version 2
----

what do you think?

besides, kernels > 4.
