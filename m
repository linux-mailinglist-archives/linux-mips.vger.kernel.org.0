Return-Path: <linux-mips+bounces-6437-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E39B0767
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 17:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A93B2284EAA
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 15:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2541D1865FC;
	Fri, 25 Oct 2024 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F4sVTX+g"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8F15821A;
	Fri, 25 Oct 2024 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868875; cv=none; b=mgAKNTRwUJLCrwlPJslr+/ACkOi7DesJVG/iGMQInuVmfqzpl6QP4LO4zD0LkluYuaT+lYPDPVJQD0Vl3LllJCkqQWfcfjKKvm9NCWmJbe6Wy9jgLPwBLGwv07TQqh2U7HVABvK4iALqwdE3km/Ek2pMTYiKsSXHYA1VWDnSZx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868875; c=relaxed/simple;
	bh=q4IzujJ2ZNVnnT9xildhXpfuJNjvYnIthSZJN2FfdEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MqYW8A/5dFkNgyGwoNTPDlsdD9yg2Bc9v0vVxUu79OLabJkjeukMgI/JMtPWWBCbImrfvohTuLj9uTNZa1+x81+zUr5+GKLK9PLE2UfLif6OCHndWf2OMGB4qqeTanXwZBDh0XHmpa997L5mhHEiUzzsMmSt41HXYoPiyZq2HnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F4sVTX+g; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D14FC0006;
	Fri, 25 Oct 2024 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729868863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MFzGp0g0siO+YvUBdFIgEK/z17HEq+Lk4h/EmRreQk=;
	b=F4sVTX+gA7Rn6QuXlnUvNTiYuBI6DsTrFxr4Cnq5sfQM3UFUxWPy65gofkT8HrXgqO/x0s
	bSJcmUhcz9moe9u8frWBsyqa27msQt1c3WGWF9wtRiP4wDv09AYtWKSa2Dh/2gC0pgmuSQ
	/MoOmZjr2b8LINHMF8XDl26sqbeWkO/0zz2zMgWDQZlXWy8hhPajKBj1b7/UjC6keirBsU
	0Xvt78lVWjkOQvI4eJN6z/TbuyktB6ulLANomfkKKkPx+XMVhjL2Lp+D/0hdMwrUyT1EbW
	Cvg79vbJXdMct7JYV8z8QoxHRGXrd7mVZkTzBeOn9Kw0E9GSNzX1MHMiqzp8KQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v7 00/12] MIPS: Support I6500 multi-cluster configuration
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
Date: Fri, 25 Oct 2024 17:07:41 +0200
Message-ID: <87plnob4qq.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Aleksandar,

> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> 1 cluster/4 VPU configurations.
>
> v7:
>  - Add fixes for specific CM3.5 which is used in EyeQ6H SoCs, suggested by
>    Gregory Clement.
>  - Re-base onto the master branch, with no functionality impact.
>
> v6:
>  - Re-base onto the master branch, with no functionality impact.
>  - Correct the issue reported by the kernel test robot.
>
> v5:
>  - Drop FDC related changes (patches 12, 13, and 14).
>  - Apply changes suggested by Thomas Gleixner (patches 3 and 4).
>  - Add #include <linux/cpumask.h> to patch 1, suggested by Thomas Bogendo=
erfer.
>  - Add Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> for t=
he patch 08/11.
>  - Add Tested-by: Serge Semin <fancer.lancer@gmail.com> for the entire se=
ries.
>  - Correct some commit messages.
>
> v4:
>  - Re-base onto the master branch, with no functionality impact.
>  - Refactor MIPS FDC driver in the context of multicluster support.
>
> v3:
>  - Add Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com> for the patch 0=
2/12.
>  - Add the changes requested by Marc Zyngier for the 3/12 patch.
>  - Remove the patch 11/12 (a consequence of a discussion between Jiaxun Y=
ang
>    and Marc Zyngier.
>  - Re-base onto the master branch, with no functionality impact.
>
> v2:
>  - Apply correct Signed-off-by to avoid confusion.
>

Thanks for this new series.

I successfully tested it on an EyeQ6H SoC. On top of v6.12-rc4 I also
added only one patch needed for EyeQ6H:
https://lore.kernel.org/lkml/20241011-eyeq6h-smp-v2-1-8381edf8a5c6@bootlin.=
com/#t

For the record, the VP topology is {4,4,4,4},{4,4,4,4} and I am adding
the full boot log at the end of this email.

So for EyeQ6H, you can then add my
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Then I also tested it on an EyeQ5, where the VP topology is
{2,2,2,2},{}. In this case there is no CPU core in the second
cluster. While some part of your series seems to support this case, it
was not complete. I am about to send a new patch for it

Thanks,

Gregory

> Chao-ying Fu (1):
>   irqchip/mips-gic: Setup defaults in each cluster
>
> Gregory CLEMENT (3):
>   dt-bindings: mips: cpu: Add property for broken HCI information
>   MIPS: CPS: Support broken HCI for multicluster
>   MIPS: mobileye: dts: eyeq6h: Enable cluster support
>
> Paul Burton (8):
>   irqchip/mips-gic: Introduce for_each_online_cpu_gic()
>   irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
>   irqchip/mips-gic: Multi-cluster support
>   clocksource: mips-gic-timer: Always use cluster 0 counter as
>     clocksource
>   clocksource: mips-gic-timer: Enable counter when CPUs start
>   MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
>   MIPS: CPS: Introduce struct cluster_boot_config
>   MIPS: CPS: Boot CPUs in secondary clusters
>
>  .../devicetree/bindings/mips/cpus.yaml        |   6 +
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi       |   1 +
>  arch/mips/include/asm/mips-cm.h               |  18 ++
>  arch/mips/include/asm/smp-cps.h               |   7 +-
>  arch/mips/kernel/asm-offsets.c                |   3 +
>  arch/mips/kernel/cps-vec.S                    |  19 +-
>  arch/mips/kernel/mips-cm.c                    |   4 +-
>  arch/mips/kernel/pm-cps.c                     |  35 +-
>  arch/mips/kernel/smp-cps.c                    | 305 +++++++++++++++---
>  drivers/clocksource/mips-gic-timer.c          |  45 ++-
>  drivers/irqchip/Kconfig                       |   1 +
>  drivers/irqchip/irq-mips-gic.c                | 257 ++++++++++++---
>  12 files changed, 587 insertions(+), 114 deletions(-)
>
> --=20
> 2.25.1
Linux version 6.12.0-rc4-00013-gb34bb9fc3ec3 (gclement@BLaptop) (mips-img-l=
inux-gnu-gcc (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 11.2.0, GN=
U ld (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 2.31.1) #386 SMP F=
ri Oct 25 16:52:48 CEST 2024
CPU0 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
MIPS: machine is Mobile EyeQ6H MP6 Evaluation board
earlycon: pl11 at MMIO32 0x00000000d3331000 (options '921600n8')
printk: legacy bootconsole [pl11] enabled
Initrd not found or empty - disabling initrd
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
percpu: Embedded 6 pages/cpu s45344 r8192 d44768 u98304
pcpu-alloc: s45344 r8192 d44768 u98304 alloc=3D6*16384
pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07=20
pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15=20
pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23=20
pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0] 30 [0] 31=20
Kernel command line: earlycon
printk: log_buf_len individual max cpu contribution: 4096 bytes
printk: log_buf_len total cpu_extra contributions: 126976 bytes
printk: log_buf_len min size: 131072 bytes
printk: log_buf_len: 262144 bytes
printk: early log buf free: 129120(98%)
Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)
ebase(0x0000000100008000) should better be in KSeg0
Cache parity protection enabled
Built 1 zonelists, mobility grouping on.  Total pages: 262144
mem auto-init: stack:off, heap alloc:off, heap free:off
MAAR configuration:
  [0]: 0x0000000100000000-0x00000001ffffffff speculate
  [1]: disabled
  [2]: disabled
SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D32, Nodes=3D1
rcu: Hierarchical RCU implementation.
        Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=3D1 rcu=
_task_cpu_ids=3D32.
NR_IRQS: 256
rcu: srcu_init: Setting srcu_struct sizes based on contention.
clocksource: GIC: mask: 0xffffffffffffffff max_cycles: 0x39a85c9bff6, max_i=
dle_ns: 881590591483 ns
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19=
11260446 ns
sched_clock: 32 bits at 1000MHz, resolution 1ns, wraps every 2147483647ns
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
printk: legacy bootconsole [pl11] disabled
Calibrating delay loop... 1988.60 BogoMIPS (lpj=3D3977216)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 8192 (order: 2, 65536 bytes, linear)
Mountpoint-cache hash table entries: 8192 (order: 2, 65536 bytes, linear)
HCI (Hardware Cache Init for the L2 cache) in GCR_L2_RAM_CONFIG from the CM=
3 is broken
MMID allocator initialised with 65536 entries
rcu: Hierarchical SRCU implementation.
rcu:    Max phase no-delay instances is 1000.
Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
smp: Bringing up secondary CPUs ...
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU1 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#1]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU2 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#2]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU3 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#3]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU4 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#4]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU5 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#5]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU6 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#6]:
Measured 4 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU7 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#7]:
Measured 12 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU8 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#8]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU9 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#9]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU10 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#10]:
Measured 1 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU11 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#11]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU12 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#12]:
Measured 10 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU13 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#13]:
Measured 3 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU14 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#14]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU15 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#15]:
Measured 5 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU16 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#16]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU17 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#17]:
Measured 7 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU18 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#18]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU19 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#19]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU20 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#20]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU21 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#21]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU22 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#22]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU23 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#23]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU24 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#24]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU25 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#25]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU26 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#26]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU27 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#27]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU28 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#28]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU29 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#29]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU30 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#30]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU31 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#31]: passed
smp: Brought up 1 node, 32 CPUs
Memory: 4136672K/4194304K available (10450K kernel code, 910K rwdata, 1824K=
 rodata, 5104K init, 437K bss, 45600K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 7645041785100000 ns
futex hash table entries: 8192 (order: 6, 1048576 bytes, linear)
pinctrl core: initialized pinctrl subsystem
NET: Registered PF_NETLINK/PF_ROUTE protocol family
Serial: AMBA PL011 UART driver
d3331000.serial: ttyAMA0 at MMIO 0xd3331000 (irq =3D 74, base_baud =3D 0) i=
s a PL011 rev3
printk: legacy console [ttyAMA0] enabled
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
UDP hash table entries: 2048 (order: 2, 65536 bytes, linear)
UDP-Lite hash table entries: 2048 (order: 2, 65536 bytes, linear)
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
fuse: init (API version 7.41)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
pinctrl-single d3337000.pinctrl: 44 pins, size 176
pinctrl-single d3357000.pinctrl: 44 pins, size 176
pinctrl-single d8014000.pinctrl: 62 pins, size 248
CAN device driver interface
i2c_dev: i2c /dev entries driver
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
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
sched_clock: Marking stable (1064020667, 2151408)->(2459226048, -1393053973)
registered taskstats version 1
Key type .fscrypt registered
Key type fscrypt-provisioning registered
clk: Disabling unused clocks
Freeing unused kernel image (initmem) memory: 5104K
This architecture does not have kernel memory protection.
Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=3D/
    TERM=3Dlinux
random: crng init done

