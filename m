Return-Path: <linux-mips+bounces-12341-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363DC81697
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 16:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BDF5834265B
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCDA283FD4;
	Mon, 24 Nov 2025 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Je9RL/4o"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509F1459F6
	for <linux-mips@vger.kernel.org>; Mon, 24 Nov 2025 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763999213; cv=none; b=arww2u1vvlcxCWXlEGx3EWPNGBoUxiFrlpZbVsojZdTkFxGeElcqB2Zk9q9vXG31QhDwJM7QPG4bNqyh1SEBgUDDW2AtVcLYQLwqk0+qYHeUwvpn64lwrlCiUQQiu1EOISE8vmNsiOP8etMAYb6GM+FqB7U4pHWFOBpZAu5am+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763999213; c=relaxed/simple;
	bh=NM+/IJ3k2efwhCRL/mYIf5Q1RTRtXNvy6paCoAqLJnU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c3FhOukxgDWUcpDP8Fmxw1Jc72TWUavfw6nasVOrJbi2KEbBsLrfxRX8O1ijdv56ASAdaMeDntUB417MYqW7i0vT2Ug4ezO7Ya5YmQTH8f7h4ivNC2HLSiK3mqP7nYkCLe2EgSA82ghNytObr1sQJfqf3evHEgxxXaS+LlQ8Z+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Je9RL/4o; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3957D1A1D0A;
	Mon, 24 Nov 2025 15:46:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F002606FC;
	Mon, 24 Nov 2025 15:46:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C873110371D33;
	Mon, 24 Nov 2025 16:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763999206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6EiACZU1mBs645knlMFbn73G0SdeX/wH9rAyVZjZHE8=;
	b=Je9RL/4ofSZX+sph6azZzgW0KhiBVvQP150CvD5gOk9luAuntUT8N3JEbz//du/8mmEYX5
	00ch+y6bgWsUmqlyuysSxAEaqT2HGRnJV/KZd3ukQv626AoyWG+G54IMSGh6MIjEXclTbj
	bgbhbE5LG84L4SCjvGC5yF2fEBe0wvZ9VUpaQBZBw1JW/lf8GSFoKRiK3kI7dT+RbIgoDS
	qDPtGcO6Qj/HCpPpFAjE2m6GaKJndXNXyfiB7VeODwqmdy0e/ClqvSHbN5rxRQkvYsQJCT
	X4M6Hbrj5vq1fp675sHRSmo8GfjFGSFlRYdXjdpFL65V1WEiQgVHljUuwY4PfA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS fixes for v6.18
In-Reply-To: <aSIhefXIXrLpMaC5@alpha.franken.de>
References: <aSIhefXIXrLpMaC5@alpha.franken.de>
Date: Mon, 24 Nov 2025 16:46:44 +0100
Message-ID: <87wm3f8mcb.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Thomas,

> The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a=
7c:
>
>   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips=
-fixes_6.18_1
>
> for you to fetch changes up to 14b46ba92bf547508b4a49370c99aba76cb53b53:
>
>   MIPS: kernel: Fix random segmentation faults (2025-11-21 13:24:05 +0100)
>
> ----------------------------------------------------------------
> - Fix CPU type in DT for econet
> - Fix for Malta PCI MMIO breakage for SOC-it
> - Fix TLB shutdown caused by iniital uniquification
> - Fix random seg faults
>
> ----------------------------------------------------------------
> Aleksander Jan Bajkowski (1):
>       mips: dts: econet: fix EN751221 core type
>
> Maciej W. Rozycki (2):
>       MIPS: Malta: Fix !EVA SOC-it PCI MMIO
>       MIPS: mm: Prevent a TLB shutdown on initial uniquification

Today, the kernel v6.18-rc7 no longer boots on EyeQ5 and EyeQ6H (MIPS
I6500)-based boards. After a git bisect between v6.18-rc6 and v6.18-rc7,
we found that the culprit is the commit "MIPS: mm: Prevent a TLB
shutdown on initial uniquification".

Here is the log from a vanilla v6.18-rc7:

Linux version 6.18.0-rc7 (gclement@BLaptop) (mips-img-linux-gnu-gcc (Codesc=
ape GNU Tools 2021.09-01 for MIPS IMG Linux) 11.2.0, GNU ld (Codescape GNU =
Tools 2021.09-01 for MIPS IMG Linux) 2.31.1) #1015 SMP Mon Nov 24 14:48:06 =
CET 2025
CPU0 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
MIPS: machine is Mobile EyeQ6H MP6 Evaluation board
earlycon: pl11 at MMIO32 0x00000000d3331000 (options '921600n8')
printk: legacy bootconsole [pl11] enabled
Initrd not found or empty - disabling initrd
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
VP topology {4,4,4,4},{4,4,4,4} total 32
VP Local Reset Exception Base support 47 bits address
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
Zone ranges:
  Normal   [mem 0x0000000100000000-0x00000001ffffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000100000000-0x00000001ffffffff]
Initmem setup node 0 [mem 0x0000000100000000-0x00000001ffffffff]
percpu: Embedded 6 pages/cpu s46496 r8192 d43616 u98304
Kernel command line: earlycon
printk: log buffer data + meta data: 131072 + 458752 =3D 589824 bytes
Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)

and with the commit reverted:

Linux version 6.18.0-rc7-00001-g67a4ac15d5c5 (gclement@BLaptop) (mips-img-l=
inux-gnu-gcc (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 11.2.0, GN=
U ld (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 2.31.1) #1016 SMP =
Mon Nov 24 16:17:40 CET 2025
CPU0 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
MIPS: machine is Mobile EyeQ6H MP6 Evaluation board
earlycon: pl11 at MMIO32 0x00000000d3331000 (options '921600n8')
printk: legacy bootconsole [pl11] enabled
Initrd not found or empty - disabling initrd
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
VP topology {4,4,4,4},{4,4,4,4} total 32
VP Local Reset Exception Base support 47 bits address
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
Zone ranges:
  Normal   [mem 0x0000000100000000-0x00000001ffffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000100000000-0x00000001ffffffff]
Initmem setup node 0 [mem 0x0000000100000000-0x00000001ffffffff]
percpu: Embedded 6 pages/cpu s46496 r8192 d43616 u98304
Kernel command line: earlycon
printk: log buffer data + meta data: 131072 + 458752 =3D 589824 bytes
Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)
ebase(0x0000000100610000) should better be in KSeg0
Cache parity protection enabled
MAAR configuration:
  [0]: 0x0000000100000000-0x00000001ffffffff speculate
  [1]: disabled
  [2]: disabled
Built 1 zonelists, mobility grouping on.  Total pages: 262144
mem auto-init: stack:off, heap alloc:off, heap free:off
SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D16, Nodes=3D1
rcu: Hierarchical RCU implementation.
        Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=3D1 rcu=
_task_cpu_ids=3D16.
NR_IRQS: 256
rcu: srcu_init: Setting srcu_struct sizes based on contention.
clocksource: GIC: mask: 0xffffffffffffffff max_cycles: 0x19e832f0bf5, max_i=
dle_ns: 440795257573 ns
sched_clock: 64 bits at 1797MHz, resolution 0ns, wraps every 4398046511103ns
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 21=
26812937 ns
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
printk: legacy bootconsole [pl11] disabled
Linux version 6.18.0-rc7-00001-g67a4ac15d5c5 (gclement@BLaptop) (mips-img-l=
inux-gnu-gcc (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 11.2.0, GN=
U ld (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 2.31.1) #1016 SMP =
Mon Nov 24 16:17:40 CET 2025
CPU0 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
MIPS: machine is Mobile EyeQ6H MP6 Evaluation board
earlycon: pl11 at MMIO32 0x00000000d3331000 (options '921600n8')
printk: legacy bootconsole [pl11] enabled
Initrd not found or empty - disabling initrd
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
VP topology {4,4,4,4},{4,4,4,4} total 32
VP Local Reset Exception Base support 47 bits address
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
Zone ranges:
  Normal   [mem 0x0000000100000000-0x00000001ffffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000100000000-0x00000001ffffffff]
Initmem setup node 0 [mem 0x0000000100000000-0x00000001ffffffff]
percpu: Embedded 6 pages/cpu s46496 r8192 d43616 u98304
Kernel command line: earlycon
printk: log buffer data + meta data: 131072 + 458752 =3D 589824 bytes
Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)
ebase(0x0000000100610000) should better be in KSeg0
Cache parity protection enabled
MAAR configuration:
  [0]: 0x0000000100000000-0x00000001ffffffff speculate
  [1]: disabled
  [2]: disabled
Built 1 zonelists, mobility grouping on.  Total pages: 262144
mem auto-init: stack:off, heap alloc:off, heap free:off
SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D16, Nodes=3D1
rcu: Hierarchical RCU implementation.
        Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=3D1 rcu=
_task_cpu_ids=3D16.
NR_IRQS: 256
rcu: srcu_init: Setting srcu_struct sizes based on contention.
clocksource: GIC: mask: 0xffffffffffffffff max_cycles: 0x19e832f0bf5, max_i=
dle_ns: 440795257573 ns
sched_clock: 64 bits at 1797MHz, resolution 0ns, wraps every 4398046511103ns
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 21=
26812937 ns
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
printk: legacy bootconsole [pl11] disabled
Calibrating delay loop... 1795.07 BogoMIPS (lpj=3D3590144)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 8192 (order: 2, 65536 bytes, linear)
Mountpoint-cache hash table entries: 8192 (order: 2, 65536 bytes, linear)
HCI (Hardware Cache Init for the L2 cache) in GCR_L2_RAM_CONFIG from the CM=
3 is broken
MMID support disabled due to hardware support issue
rcu: Hierarchical SRCU implementation.
rcu:    Max phase no-delay instances is 1000.
Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
smp: Bringing up secondary CPUs ...
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU4 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU8 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU12 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#4]: passed
Counter synchronization [CPU#0 -> CPU#8]: passed
Counter synchronization [CPU#0 -> CPU#12]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU1 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU2 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU3 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU5 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU6 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU7 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU9 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU10 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU11 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU13 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU14 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU15 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#1]:
Measured 3 cycles counter warp between CPUs
Counter synchronization [CPU#0 -> CPU#2]:
Measured 19 cycles counter warp between CPUs
Counter synchronization [CPU#0 -> CPU#3]:
Measured 8 cycles counter warp between CPUs
Counter synchronization [CPU#0 -> CPU#5]: passed
Counter synchronization [CPU#0 -> CPU#6]: passed
Counter synchronization [CPU#0 -> CPU#7]: passed
Counter synchronization [CPU#0 -> CPU#9]: passed
Counter synchronization [CPU#0 -> CPU#10]: passed
Counter synchronization [CPU#0 -> CPU#11]:
Measured 6 cycles counter warp between CPUs
Counter synchronization [CPU#0 -> CPU#13]: passed
Counter synchronization [CPU#0 -> CPU#14]: passed
Counter synchronization [CPU#0 -> CPU#15]: passed
smp: Brought up 1 node, 16 CPUs
Memory: 4143504K/4194304K available (11084K kernel code, 918K rwdata, 1976K=
 rodata, 5776K init, 344K bss, 44288K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 7645041785100000 ns
posixtimers hash table entries: 8192 (order: 3, 131072 bytes, linear)
futex hash table entries: 4096 (524288 bytes on 1 NUMA nodes, total 512 KiB=
, linear).
pinctrl core: initialized pinctrl subsystem
NET: Registered PF_NETLINK/PF_ROUTE protocol family
Serial: AMBA PL011 UART driver
d3331000.serial: ttyAMA0 at MMIO 0xd3331000 (irq =3D 42, base_baud =3D 0) i=
s a PL011 rev3
printk: console [ttyAMA0] enabled
SCSI subsystem initialized
vgaarb: loaded
clocksource: Switched to clocksource GIC
NET: Registered PF_INET protocol family
IP idents hash table entries: 65536 (order: 5, 524288 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 2048 (order: 1, 32768 bytes, l=
inear)
Table-perturb hash table entries: 65536 (order: 4, 262144 bytes, linear)
TCP established hash table entries: 32768 (order: 4, 262144 bytes, linear)
TCP bind hash table entries: 32768 (order: 6, 1048576 bytes, linear)
TCP: Hash tables configured (established 32768 bind 32768)
UDP hash table entries: 2048 (order: 3, 131072 bytes, linear)
UDP-Lite hash table entries: 2048 (order: 3, 131072 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp-with-tls transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 64
workingset: timestamp_bits=3D46 max_order=3D18 bucket_order=3D0
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
nfs4filelayout_init: NFSv4 File Layout Driver Registering...
nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
fuse: init (API version 7.45)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
pinctrl-single d3337000.pinctrl: 44 pins, size 176
pinctrl-single d3357000.pinctrl: 44 pins, size 176
pinctrl-single d8014000.pinctrl: 62 pins, size 248
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
CAN device driver interface
i2c_dev: i2c /dev entries driver
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
NET: Registered PF_KEY protocol family
can: controller area network core
NET: Registered PF_CAN protocol family
can: raw protocol
can: broadcast manager protocol
can: netlink gateway - max_hops=3D1
Key type dns_resolver registered
registered taskstats version 1
Key type .fscrypt registered
Key type fscrypt-provisioning registered
clk: Disabling unused clocks
mmc0: SDHCI controller on d8010000.mmc [d8010000.mmc] using ADMA 64-bit
Freeing unused kernel image (initmem) memory: 5776K
This architecture does not have kernel memory protection.
Run /init as init process
mmc0: new HS400 Enhanced strobe MMC card at address 0001
mmcblk0: mmc0:0001 G1M15N 119 GiB
GPT:Primary header thinks Alt. header is not at the end of the disk.
GPT:31 !=3D 248643583
GPT:Alternate GPT header not at the end of the disk.
GPT:31 !=3D 248643583
GPT: Use GNU Parted to correct GPT errors.
 mmcblk0: p1 p2 p3
mmcblk0boot0: mmc0:0001 G1M15N 31.5 MiB
mmcblk0boot1: mmc0:0001 G1M15N 31.5 MiB
mmcblk0rpmb: mmc0:0001 G1M15N 4.00 MiB, chardev (252:0)
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving 256 bits of non-creditable seed for next boot
Starting network: OK

Welcome to Buildroot
buildroot login:=20

We are working on a fix for this issue. If no solution is identified by
version 6.18, the changes may need to be reverted.

Gregory


>
> Thomas Bogendoerfer (1):
>       MIPS: kernel: Fix random segmentation faults
>
>  arch/mips/boot/dts/econet/en751221.dtsi |   2 +-
>  arch/mips/kernel/process.c              |   2 +-
>  arch/mips/mm/tlb-r4k.c                  | 100 ++++++++++++++++++++------=
------
>  arch/mips/mti-malta/malta-init.c        |  20 ++++---
>  4 files changed, 78 insertions(+), 46 deletions(-)
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 ]
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

