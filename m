Return-Path: <linux-mips+bounces-6134-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2349A3F14
	for <lists+linux-mips@lfdr.de>; Fri, 18 Oct 2024 15:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 038E81F25D5F
	for <lists+linux-mips@lfdr.de>; Fri, 18 Oct 2024 13:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102954084C;
	Fri, 18 Oct 2024 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iQifu4nY"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EABE1CD2B;
	Fri, 18 Oct 2024 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729256604; cv=none; b=nudLUxsVDbEbPBbmOWRXsxxgKKlQUv06SsxYNFdVvQO/2zQCKKxOHMw0LTqkWKEfUP5MqHkY0ckoO74jw88ZTRZbhtxg+6nzxEI6jiEPkb40MyUehL9IjFlsYY13jU0GwROA8q+rVuw1adpLHIvIKrQT/7/xfdrx0T/F7kaDf+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729256604; c=relaxed/simple;
	bh=VNIT3E60qMCiLOegzXUZx7LYqckqZodySyoP+in9tq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ds0E1fRcgi5jdholnbKapRCVErRIqtmpXkqLWMt3TJwbll1bqQlK7a6pRqMehrjm4kfg5Eg+6fo/2i4M1yqvIdh/m5Y+pMIrqTP5H6Z8m8BKcabHXiSInO8sa6O286xWrf+9AazBKQWwoOIZoyeR3FMm6ldaExNaMq0sWzLhRfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iQifu4nY; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3DA660006;
	Fri, 18 Oct 2024 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729256598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kg8GwCub1OwXhbdh9eVNWU4KaAHjbF96oOjqo3arhyw=;
	b=iQifu4nYR7mzngG243GA1ycyUG2le9rLiSm59vx43xHAfmETl6MbMxU4o+CR4zvosE2rl7
	4OLhQNbX8SYuXWUhEa8qnJN5qafFxez5X3LGgcWcaKeH633OpSDXpoew/1UKLgoDiE7WCr
	b/QrB9Xs/UQICdGxOPICls1SQMZT8nVxSr35Ba1PqgsdvNRqxYB8/7ZMeLBru3jMnL45f/
	Z91cPVlm04GgnXUA2Lg+tJi11oua/O358VcQ3dCtdePo6DbWoJ0fCEfwYdzOew8CNGho7D
	2plMKNLKvvufDapekI5GKuM+XTbLle2EGuLasN5hx5pG5eStcFRKeCkRaNbFqg==
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
Subject: Re: [PATCH v6 0/9] MIPS: Support I6500 multi-cluster configuration
In-Reply-To: <20240912093051.452172-1-arikalo@gmail.com>
References: <20240912093051.452172-1-arikalo@gmail.com>
Date: Fri, 18 Oct 2024 15:03:14 +0200
Message-ID: <87v7xpbm25.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-GND-Sasl: gregory.clement@bootlin.com

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Aleksandar,

> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> 1 cluster/4 VPU configurations.

With all three patches applied, I was able to get my second CPU cluster
working.

If you re-send the series with these three patches included, I'd be
happy to add my Tested-by tag.

Here are some relevant extracts from the boot log:

Linux version 6.12.0-rc2-00015-g44e960e85e4b (gclement@BLaptop)
(mips-img-linux-gnu-gcc (Codescape GNU Tools 2021.09-01 for MIPS IMG
Linux) 11.2.0, GNU ld (Codescape GNU Tools 2021.09-01 for MIPS IMG
Linux) 2.31.1) #368 SMP Fri Oct 18 14:53:35 CEST 2024
[...]
VP topology {4,4,4,4},{4,4,4,4} total 32
[...]
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
Counter synchronization [CPU#0 -> CPU#1]:
Measured 24 cycles counter warp between CPUs
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
Counter synchronization [CPU#0 -> CPU#3]:
Measured 2 cycles counter warp between CPUs
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
Measured 2 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU7 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#7]:
Measured 16 cycles counter warp between CPUs
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU8 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#8]:
Measured 4 cycles counter warp between CPUs
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
Counter synchronization [CPU#0 -> CPU#10]: passed
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
Counter synchronization [CPU#0 -> CPU#12]: passed
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
CPU13 revision is: 0001b031 (MIPS I6500)
FPU revision is: 20f30320
MSA revision is: 00000320
Counter synchronization [CPU#0 -> CPU#13]: passed
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
Measured 2 cycles counter warp between CPUs
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
Counter synchronization [CPU#0 -> CPU#17]: passed
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

Regards,

Gregory


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
> Chao-ying Fu (1):
>   irqchip/mips-gic: Setup defaults in each cluster
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
>  arch/mips/include/asm/mips-cm.h      |  18 ++
>  arch/mips/include/asm/smp-cps.h      |   7 +-
>  arch/mips/kernel/asm-offsets.c       |   3 +
>  arch/mips/kernel/cps-vec.S           |  19 +-
>  arch/mips/kernel/mips-cm.c           |   4 +-
>  arch/mips/kernel/pm-cps.c            |  35 ++--
>  arch/mips/kernel/smp-cps.c           | 285 ++++++++++++++++++++++-----
>  drivers/clocksource/mips-gic-timer.c |  45 ++++-
>  drivers/irqchip/Kconfig              |   1 +
>  drivers/irqchip/irq-mips-gic.c       | 257 ++++++++++++++++++++----
>  10 files changed, 560 insertions(+), 114 deletions(-)
>
> --=20
> 2.25.1


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0001-dt-bindings-mips-cpu-Add-property-for-broken-HCI-inf.patch

From 5fcfc8fc29c3c16be3bed4d8502e0b9fabbdac5c Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 17 Oct 2024 16:47:25 +0200
Subject: [PATCH 1/3] dt-bindings: mips: cpu: Add property for broken HCI
 information

Some CM3.5 reports show that Hardware Cache Initialization is
complete, but in reality it's not the case. They also incorrectly
indicate that Hardware Cache Initialization is supported. This
optional property allows warning about this broken feature that cannot
be detected at runtime.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index a85137add6689..57e93c07ab1be 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -47,6 +47,12 @@ properties:
   clocks:
     maxItems: 1
 
+  cm3-l2-config-hci-broken:
+    type: boolean
+    description:
+      If present, indicates that the HCI (Hardware Cache Initialization)
+      information for the L2 cache in multi-cluster configuration is broken.
+
   device_type: true
 
 allOf:
-- 
2.45.2


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0002-MIPS-CPS-Support-broken-HCI-for-multicluster.patch

From ea0744030f1ec47116f0a28f2d5c1bf6f9e3597e Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 17 Oct 2024 16:57:09 +0200
Subject: [PATCH 2/3] MIPS: CPS: Support broken HCI for multicluster

Some CM3.5 devices incorrectly report that hardware cache
initialization has completed, and also claim to support hardware cache
initialization when they don't actually do so. This commit fixes this
issue by retrieving the correct information from the device tree and
allowing the system to bypass the hardware cache initialization
step. Instead, it relies on manual operation. As a result, multi-user
support is now possible for these CPUs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/smp-cps.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 34e977ea8a69c..75b26865a17f7 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -39,6 +39,7 @@ UASM_L_LA(_not_nmi)
 static uint64_t core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
+static bool l2_hci_broken;
 struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
 static void power_up_other_cluster(unsigned int cluster)
@@ -262,6 +263,22 @@ static void __init cps_smp_setup(void)
 #endif /* CONFIG_MIPS_MT_FPAFF */
 }
 
+static void __init check_hci_quirk(void)
+{
+	struct device_node *np;
+
+	np = of_cpu_device_node_get(0);
+	if (!np) {
+		pr_debug("%s: No cpu node in the device tree\n", __func__);
+		return;
+	}
+
+	if (of_property_read_bool(np, "cm3-l2-config-hci-broken")) {
+		pr_info("HCI (Hardware Cache Init for the L2 cache) in GCR_L2_RAM_CONFIG from the CM3 is broken");
+		l2_hci_broken = true;
+	}
+}
+
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
 	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
@@ -315,6 +332,9 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 					   sizeof(*mips_cps_cluster_bootcfg),
 					   GFP_KERNEL);
 
+	if (nclusters > 1)
+		check_hci_quirk();
+
 	for (cl = 0; cl < nclusters; cl++) {
 		/* Allocate core boot configuration structs */
 		ncores = mips_cps_numcores(cl);
@@ -376,7 +396,7 @@ static void init_cluster_l2(void)
 {
 	u32 l2_cfg, l2sm_cop, result;
 
-	while (1) {
+	while (!l2_hci_broken) {
 		l2_cfg = read_gcr_redir_l2_ram_config();
 
 		/* If HCI is not supported, use the state machine below */
-- 
2.45.2


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0003-MIPS-mobileye-dts-eyeq6h-Enable-cluster-support.patch

From 44e960e85e4b24dae6a9c28e898338366ea16c72 Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 18 Oct 2024 14:42:29 +0200
Subject: [PATCH 3/3] MIPS: mobileye: dts: eyeq6h: Enable cluster support

The CM3.5 device used in EyeQ6H SoCs incorrectly reports the status
for Hardware Cache Initialization (HCI). This commit adds a property
to acknowledge this issue, which enables the use of the second CPU
cluster.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 1db3c3cda2e39..4ea85dfd4eed9 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -18,6 +18,7 @@ cpu@0 {
 			compatible = "img,i6500";
 			reg = <0>;
 			clocks = <&occ_cpu>;
+			cm3-l2-config-hci-broken;
 		};
 	};
 
-- 
2.45.2


--=-=-=--

