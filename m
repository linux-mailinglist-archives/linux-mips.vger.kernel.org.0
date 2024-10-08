Return-Path: <linux-mips+bounces-5807-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD51995190
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 16:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C501B1F25A55
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 14:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AE11DFE32;
	Tue,  8 Oct 2024 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VFTtFize"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBE1E04BF;
	Tue,  8 Oct 2024 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397464; cv=none; b=GM1SSscn0ooYNJ6UpqsUqrYjnwTlNRR7qRvQgYQHN3wdnD6Mrw/9oEEso7Iub6nlRsn8W9ekruuJw06medSpgClEQN7X88Hed61TcOEWyYf+Xu7rC1iDN6ZcK3Rp33Qd/+yKAHyYztVIoasi3dim7ogmydoWLf3TXzlTRTGND98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397464; c=relaxed/simple;
	bh=4I0uCsdsjJSvMLURgpNOjEHijZR/JKLSDeYDj1EVG6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eYjR/XnjPINIs03TWrgWWF1kYsNml3K3VaxSSsDQx2tTxNEs2cuUxQ9GASvtPZ3KkzRc5hm1ZZkNtbKa9GkMcpP+H26nIHE79ZlWSPMhhtD1bH1O8G+59uE+MQedMKrHkJUKR5I0g1uI44RL5rsWfhO+spjjdNLjB7iy3SPx8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VFTtFize; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C463C0002;
	Tue,  8 Oct 2024 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728397459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9hMrSYUEPSDXlX7OPAcEi6rWCF2Xsw76vS3c2nJLyUg=;
	b=VFTtFizer8vwQAg2VflcMoeFeNz92VAteURHy2HbsDgRdm76uFY+N1P5bz29laI9n55l3u
	dLCXmm3Pm/k3qpnF796ZExLmDKpHrRk8Fxwn4WTYOycEoJCgBj/Z5gaOOJb0cAixeOuswn
	223Wtac5qUNxKq5o77LyA2llPaMl6SuVmxlnHnf7tfGIPIo1giM35RAEC/10Kl6miXFDM6
	zgaL60eOVJEVO7WTaQSauDNMTTqpAICrKTA6u6P58gxLe4qxTF4vdBjqt0Si3MLwXHQhs9
	HdAQBWCp8hiz+QepXDRzOTKspt3mPu3ZBdQf29D7/r1WdkDdZgbgRPe1zixG1w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Ilya
 Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v6 0/9] MIPS: Support I6500 multi-cluster configuration
In-Reply-To: <CAGQJe6rH7JKg8bYTJL=D2f-wqqxiwFLJGOVck_dmbVyhrsepJw@mail.gmail.com>
References: <20240912092601.451692-1-arikalo@gmail.com>
 <CAGQJe6rH7JKg8bYTJL=D2f-wqqxiwFLJGOVck_dmbVyhrsepJw@mail.gmail.com>
Date: Tue, 08 Oct 2024 16:24:18 +0200
Message-ID: <87y12yd65p.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hello Aleksandar,

> Would anyone be able to take a look at this?
> Thank you.

I have tested your series on EyeQ6H, with the following topology:

VP topology {4,4,4,4},{4,4,4,4} total 32

And the core of the second cluster failed to boot:

CPU16: failed to start
No online CPU in core 0 to start CPU17
CPU17: failed to start
No online CPU in core 0 to start CPU18
CPU18: failed to start
No online CPU in core 0 to start CPU19
CPU19: failed to start
CPU20: failed to start
No online CPU in core 1 to start CPU21
CPU21: failed to start
No online CPU in core 1 to start CPU22
CPU22: failed to start
No online CPU in core 1 to start CPU23
CPU23: failed to start
CPU24: failed to start
No online CPU in core 2 to start CPU25
CPU25: failed to start
No online CPU in core 2 to start CPU26
CPU26: failed to start
No online CPU in core 2 to start CPU27
CPU27: failed to start
CPU28: failed to start
No online CPU in core 3 to start CPU29
CPU29: failed to start
No online CPU in core 3 to start CPU30
CPU30: failed to start
No online CPU in core 3 to start CPU31
CPU31: failed to start

I'm really interested in making it work and getting it merged. So if you
have any advice on how to debug this issue, please let me know.

For completeness, let me add the full boot log:

[    0.000000] Linux version 6.12.0-rc2-00012-g6a27d531a1b3 (gclement@BLaptop) (mips-img-linux-gnu-gcc (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 11.2.0, GNU ld (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 2.31.1) #311 SMP Tue Oct  8 15:52:31 CEST 2024
[    0.000000] CPU0 revision is: 0001b031 (MIPS I6500)
[    0.000000] FPU revision is: 20f30320
[    0.000000] MSA revision is: 00000320
[    0.000000] MIPS: machine is Mobile EyeQ6H MP6 Evaluation board
[    0.000000] earlycon: pl11 at MMIO32 0x00000000d3331000 (options '921600n8')
[    0.000000] printk: legacy bootconsole [pl11] enabled
[    0.000000] Initrd not found or empty - disabling initrd
[    0.000000] VP topology {4,4,4,4},{4,4,4,4} total 32
[    0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.000000] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.000000] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000001ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000001ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000100000000-0x00000001ffffffff]
[    0.000000] percpu: Embedded 14 pages/cpu s177952 r8192 d43232 u229376
[    0.000000] Kernel command line: earlycon
[    0.000000] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 126976 bytes
[    0.000000] printk: log_buf_len min size: 131072 bytes
[    0.000000] printk: log_buf_len: 262144 bytes
[    0.000000] printk: early log buf free: 129008(98%)
[    0.000000] Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)
[    0.000000] ebase(0x0000000100008000) should better be in KSeg0
[    0.000000] Cache parity protection enabled
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] MAAR configuration:
[    0.000000]   [0]: 0x0000000100000000-0x00000001ffffffff speculate
[    0.000000]   [1]: disabled
[    0.000000]   [2]: disabled
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
[    0.000000] ftrace: allocating 31777 entries in 32 pages
[    0.000000] ftrace: allocated 32 pages with 1 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=32.
[    0.000000] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=32.
[    0.000000] NR_IRQS: 256
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] clocksource: GIC: mask: 0xffffffffffffffff max_cycles: 0x39a85c9bff6, max_idle_ns: 881590591483 ns
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446 ns
[    0.000001] sched_clock: 32 bits at 1000MHz, resolution 1ns, wraps every 2147483647ns
[    0.001025] Console: colour dummy device 80x25
[    0.001564] printk: legacy console [tty0] enabled
[    0.002130] printk: legacy bootconsole [pl11] disabled
[    0.002789] Calibrating delay loop... 1988.60 BogoMIPS (lpj=3977216)
[    0.018803] pid_max: default: 32768 minimum: 301
[    0.018976] Mount-cache hash table entries: 8192 (order: 2, 65536 bytes, linear)
[    0.019013] Mountpoint-cache hash table entries: 8192 (order: 2, 65536 bytes, linear)
[    0.035650] MMID allocator initialised with 65536 entries
[    0.035798] rcu: Hierarchical SRCU implementation.
[    0.035810] rcu:     Max phase no-delay instances is 1000.
[    0.035992] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.037059] smp: Bringing up secondary CPUs ...
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU1 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.058779] Counter synchronization [CPU#0 -> CPU#1]:
[    0.058779] Measured 12 cycles counter warp between CPUs
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU2 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.082779] Counter synchronization [CPU#0 -> CPU#2]:
[    0.082779] Measured 5 cycles counter warp between CPUs
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU3 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.110779] Counter synchronization [CPU#0 -> CPU#3]:
[    0.110779] Measured 10 cycles counter warp between CPUs
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU4 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.130779] Counter synchronization [CPU#0 -> CPU#4]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU5 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.158779] Counter synchronization [CPU#0 -> CPU#5]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU6 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.186779] Counter synchronization [CPU#0 -> CPU#6]:
[    0.186779] Measured 7 cycles counter warp between CPUs
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU7 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.214779] Counter synchronization [CPU#0 -> CPU#7]:
[    0.214779] Measured 1 cycles counter warp between CPUs
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU8 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.242779] Counter synchronization [CPU#0 -> CPU#8]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU9 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.266779] Counter synchronization [CPU#0 -> CPU#9]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU10 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.294779] Counter synchronization [CPU#0 -> CPU#10]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU11 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.322779] Counter synchronization [CPU#0 -> CPU#11]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU12 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.350779] Counter synchronization [CPU#0 -> CPU#12]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU13 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.370779] Counter synchronization [CPU#0 -> CPU#13]:
[    0.370779] Measured 1 cycles counter warp between CPUs
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU14 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.394779] Counter synchronization [CPU#0 -> CPU#14]: passed
[    0.006779] Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
[    0.006779] Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
[    0.006779] MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
[    0.006779] CPU15 revision is: 0001b031 (MIPS I6500)
[    0.006779] FPU revision is: 20f30320
[    0.006779] MSA revision is: 00000320
[    0.414779] Counter synchronization [CPU#0 -> CPU#15]:
[    0.414779] Measured 9 cycles counter warp between CPUs
[    1.442790] CPU16: failed to start
[    1.446881] No online CPU in core 0 to start CPU17
[    2.466789] CPU17: failed to start
[    2.471011] No online CPU in core 0 to start CPU18
[    3.490787] CPU18: failed to start
[    3.491263] No online CPU in core 0 to start CPU19
[    4.514787] CPU19: failed to start
[    5.538789] CPU20: failed to start
[    5.542939] No online CPU in core 1 to start CPU21
[    6.562787] CPU21: failed to start
[    6.567002] No online CPU in core 1 to start CPU22
[    7.586787] CPU22: failed to start
[    7.587290] No online CPU in core 1 to start CPU23
[    8.610788] CPU23: failed to start
[    9.634788] CPU24: failed to start
[    9.635298] No online CPU in core 2 to start CPU25
[   10.658787] CPU25: failed to start
[   10.662945] No online CPU in core 2 to start CPU26
[   11.682788] CPU26: failed to start
[   11.683291] No online CPU in core 2 to start CPU27
[   12.706788] CPU27: failed to start
[   13.730790] CPU28: failed to start
[   13.734869] No online CPU in core 3 to start CPU29
[   14.754788] CPU29: failed to start
[   14.758958] No online CPU in core 3 to start CPU30
[   15.778788] CPU30: failed to start
[   15.782954] No online CPU in core 3 to start CPU31
[   16.802788] CPU31: failed to start
[   16.802862] smp: Brought up 1 node, 16 CPUs
[   16.803221] Memory: 4126256K/4194304K available (11685K kernel code, 1724K rwdata, 2728K rodata, 5536K init, 474K bss, 53120K reserved, 0K cma-reserved)
[   16.803222] devtmpfs: initialized
[   16.804034] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[   16.804034] futex hash table entries: 8192 (order: 6, 1048576 bytes, linear)
[   16.804034] pinctrl core: initialized pinctrl subsystem
[   16.807011] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[   16.807553] Serial: AMBA PL011 UART driver
[   16.807966] d3331000.serial: ttyAMA0 at MMIO 0xd3331000 (irq = 74, base_baud = 0) is a PL011 rev3
[   16.808039] printk: legacy console [ttyAMA0] enabled
[   16.935278] SCSI subsystem initialized
[   16.936329] vgaarb: loaded
[   16.936329] clocksource: Switched to clocksource GIC
[   16.941569] NET: Registered PF_INET protocol family
[   16.942513] IP idents hash table entries: 65536 (order: 5, 524288 bytes, linear)
[   16.946756] tcp_listen_portaddr_hash hash table entries: 2048 (order: 1, 32768 bytes, linear)
[   16.947838] Table-perturb hash table entries: 65536 (order: 4, 262144 bytes, linear)
[   16.948761] TCP established hash table entries: 32768 (order: 4, 262144 bytes, linear)
[   16.949897] TCP bind hash table entries: 32768 (order: 6, 1048576 bytes, linear)
[   16.951403] TCP: Hash tables configured (established 32768 bind 32768)
[   16.952424] UDP hash table entries: 2048 (order: 2, 65536 bytes, linear)
[   16.953276] UDP-Lite hash table entries: 2048 (order: 2, 65536 bytes, linear)
[   16.954387] NET: Registered PF_UNIX/PF_LOCAL protocol family
[   16.956053] RPC: Registered named UNIX socket transport module.
[   16.956783] RPC: Registered udp transport module.
[   16.957338] RPC: Registered tcp transport module.
[   16.957893] RPC: Registered tcp-with-tls transport module.
[   16.958536] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   16.959328] PCI: CLS 0 bytes, default 64
[   16.961807] workingset: timestamp_bits=46 max_order=18 bucket_order=0
[   16.963666] NFS: Registering the id_resolver key type
[   16.964329] Key type id_resolver registered
[   16.964843] Key type id_legacy registered
[   16.965371] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[   16.966173] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[   16.967127] fuse: init (API version 7.41)
[   16.968175] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
[   16.969091] io scheduler mq-deadline registered
[   16.969646] io scheduler kyber registered
[   16.970208] io scheduler bfq registered
[   17.042855] CAN device driver interface
[   17.043539] sdhci: Secure Digital Host Controller Interface driver
[   17.044259] sdhci: Copyright(c) Pierre Ossman
[   17.045205] NET: Registered PF_INET6 protocol family
[   17.047131] Segment Routing with IPv6
[   17.047637] In-situ OAM (IOAM) with IPv6
[   17.048151] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[   17.049323] NET: Registered PF_PACKET protocol family
[   17.049938] NET: Registered PF_KEY protocol family
[   17.050500] can: controller area network core
[   17.051113] NET: Registered PF_CAN protocol family
[   17.051687] can: raw protocol
[   17.052049] can: broadcast manager protocol
[   17.052545] can: netlink gateway - max_hops=1
[   17.053202] Key type dns_resolver registered
[   17.056915] sched_clock: Marking stable (17052019968, 2779751)->(661362667, 16393437052)
[   17.057977] registered taskstats version 1
[   17.063277] Key type .fscrypt registered
[   17.063776] Key type fscrypt-provisioning registered
[   17.618713] clk: Disabling unused clocks
[   17.639990] Freeing unused kernel image (initmem) memory: 5536K
[   17.640719] This architecture does not have kernel memory protection.
[   17.641473] Run /init as init process

Gregory

