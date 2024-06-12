Return-Path: <linux-mips+bounces-3599-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3DB904EAE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB1D28A633
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23DA16EBE7;
	Wed, 12 Jun 2024 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="0oj3Dxpg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OZhXSxDO"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAAA16E87A;
	Wed, 12 Jun 2024 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182482; cv=none; b=dgD1MhqCZSS6rBcr4W2Fpo+IO3P78111tUO/LTADIJmeWXUYgKWoxpicmD+q2/IVmwu+r7R5hE0Mxv6MirscEOA8BzTKUbHHUm9PtF6ufAQNDOtOd77cUmYEcwXLwYfC8HsAiow134Looy21dmHMcJFr9cC7nk8RIDd6qJMH7Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182482; c=relaxed/simple;
	bh=xwM8tZQLa2dHgBxiqH/Qjcx2XSrzcAWUBGhUvTuKohc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQz99gJqd4oGatXjYiFDaCDv0zu2RJufJ5i8TBynIBP5+RUTGHDSpqdoIp5HxpD/mf3fqIDccS0jGG01pJRnjL8hoHvpE2q/EM6B1PpHtwb2sZAw5AigHgSldnwEIbUg4wIOsxzO1r8j8gTnTIyTFfiHZo+Ri/FklnhbgCXANPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=0oj3Dxpg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OZhXSxDO; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1D20311401C8;
	Wed, 12 Jun 2024 04:54:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 12 Jun 2024 04:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182480;
	 x=1718268880; bh=CQ03bMXgYtgmd0LHWAx5G10lIkyFziUSkjxcZqxin1k=; b=
	0oj3DxpgAbsCHCXihA6wejZnWeTgEDg/sSUyo+RgIZYiY3dve/pQ7YGoYKEsoH2w
	sol+mHNMZYDz+koIs9YrCN76A6wR3QYqpES6hVRezW86YpoTc+zLWxoY1dbXfk89
	kjXuyosLFQCwlFwB3GcTlXPo6UzyXYIlS9OHe45sfeBrvN25w5jI24ge4ssEKPdL
	mOD5zEiTTg2tpXaK1AMTwuZVNGZGAHqT62YYhqPmuv5V4lO9zrfMUjKGyAc45wZH
	EHVLLlVmU8GzPFRA4tdja9w7r/3ViTn9ST1yA/7TBKyhdSgI7ZUDGa7McANtQIFA
	CYyY2ywZMTszPW+j8Peodw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182480; x=
	1718268880; bh=CQ03bMXgYtgmd0LHWAx5G10lIkyFziUSkjxcZqxin1k=; b=O
	ZhXSxDOI2AjqNBs+VAnEAddLxlgyNMdy2boLKmoDTYB4RolPYnOixMabLK2CreNG
	4qIk7AOzpMPFtIsj7lSEKwmnbFBI0xIjoCtVSV/3bMMHstiXVEr4hXh+O9p2inXC
	Yr3+I/Vc5n/HsEI9jsqmlv156zkfUA6hFWZ5iLnJx9n8DsXOiKkQHg0v9PI5Mntt
	MDcuPFZ9aG/XZuz6bYkYIgymR4w3Vv5uaDZxrsSCFn6HCXEeSGgQJgBMAOZJF4Kb
	C+nMJm4g5BJtkwIHZsnNSbtFA8GWN0jjX8x8d74oMQ8VkSmS9Ak+BJ66sA79Bv/E
	4pCrABkR6A7lMeBxBYUdg==
X-ME-Sender: <xms:T2JpZowI7o1bgXWsf-ds9wMqflQ4ya2wKgRPMyeZVcwB5UZZxdyEmg>
    <xme:T2JpZsSHDdu9wLm7adbHBmCEFQdnYSY_EgVEejsyLDMoAkBtp9P0fuZkFtMesXeGS
    YFcREN-R-hdrO3ccNw>
X-ME-Received: <xmr:T2JpZqU-zYS3bp1tiRwUI8iMbo3cKFGQmCUWvIZriIn4gUB28TrWzvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:T2JpZmhWqwyXthAKOxMUzJsWlWNEtsyVyIyth_5HTieklYspqLD62w>
    <xmx:T2JpZqD-uGh_1s4gabnz6eUyPjX8QZ6c1ZzErrzczyCqm1tZ-mLqlw>
    <xmx:T2JpZnLG7scqDJm8vTCH5dNcW0E802kVn8zDWEjqNLVW09dJUvVWzw>
    <xmx:T2JpZhB8quYcnbUdPw87OOZIbflSOQRIr_swkZTlzndOcAuvp965_A>
    <xmx:UGJpZm0aDc0ZGQHPfakcmSey7fXfKrkYcd3EpgJHxn90sN8Edd_tICvZ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:38 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:32 +0100
Subject: [PATCH v2 5/7] MIPS: sync-r4k: Rework based on x86 tsc_sync
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-clks-v2-5-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11164;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=xwM8tZQLa2dHgBxiqH/Qjcx2XSrzcAWUBGhUvTuKohc=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMJPe8w66HfnIzPv9f5Pgy/5zC4XrrKqufV4wLY7Ju/
 hLfvfp+RykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzE4TvDf9+NLn9t0uNvPc0/
 oJpypudO492anfclWhMOV8z911Zh+Ynhf9HrFQ+m7Kw+xm08c0/CvHd3QuZNavRO0f1W9vBaR/W
 sj4wA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

The original sync-r4k did a good job on reducing jitter by determine
the "next time value", but it has a limitation that when synchronization
being performed too many times due to high core count or CPU hotplug,
the timewrap on CPU0 will become unaccpetable.

Rework the mechanism based on latest x86 tsc_sync. (It seems like
the original implementation is based on tsc_sync at that time,
so it's just a refresh.) To improve overall performance.

Tesed on Loongson64, Boston, QEMU.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/r4k-timer.h |   5 -
 arch/mips/kernel/smp.c            |   2 -
 arch/mips/kernel/sync-r4k.c       | 281 +++++++++++++++++++++++++++-----------
 3 files changed, 202 insertions(+), 86 deletions(-)

diff --git a/arch/mips/include/asm/r4k-timer.h b/arch/mips/include/asm/r4k-timer.h
index 6e7361629348..432e61dd5204 100644
--- a/arch/mips/include/asm/r4k-timer.h
+++ b/arch/mips/include/asm/r4k-timer.h
@@ -12,15 +12,10 @@
 
 #ifdef CONFIG_SYNC_R4K
 
-extern void synchronise_count_master(int cpu);
 extern void synchronise_count_slave(int cpu);
 
 #else
 
-static inline void synchronise_count_master(int cpu)
-{
-}
-
 static inline void synchronise_count_slave(int cpu)
 {
 }
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0b53d35a116e..0362fc5df7b0 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -462,8 +462,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 		return -EIO;
 	}
 
-	synchronise_count_master(cpu);
-
 	/* Wait for CPU to finish startup & mark itself online before return */
 	wait_for_completion(&cpu_running);
 	return 0;
diff --git a/arch/mips/kernel/sync-r4k.c b/arch/mips/kernel/sync-r4k.c
index abdd7aaa3311..39156592582e 100644
--- a/arch/mips/kernel/sync-r4k.c
+++ b/arch/mips/kernel/sync-r4k.c
@@ -2,121 +2,244 @@
 /*
  * Count register synchronisation.
  *
- * All CPUs will have their count registers synchronised to the CPU0 next time
- * value. This can cause a small timewarp for CPU0. All other CPU's should
- * not have done anything significant (but they may have had interrupts
- * enabled briefly - prom_smp_finish() should not be responsible for enabling
- * interrupts...)
+ * Derived from arch/x86/kernel/tsc_sync.c
+ * Copyright (C) 2006, Red Hat, Inc., Ingo Molnar
  */
 
 #include <linux/kernel.h>
 #include <linux/irqflags.h>
 #include <linux/cpumask.h>
+#include <linux/atomic.h>
+#include <linux/nmi.h>
+#include <linux/smp.h>
+#include <linux/spinlock.h>
 
 #include <asm/r4k-timer.h>
-#include <linux/atomic.h>
-#include <asm/barrier.h>
 #include <asm/mipsregs.h>
+#include <asm/time.h>
 
-static unsigned int initcount = 0;
-static atomic_t count_count_start = ATOMIC_INIT(0);
-static atomic_t count_count_stop = ATOMIC_INIT(0);
-
-#define COUNTON 100
-#define NR_LOOPS 3
-
-void synchronise_count_master(int cpu)
-{
-	int i;
-	unsigned long flags;
-
-	pr_info("Synchronize counters for CPU %u: ", cpu);
+#define COUNTON		100
+#define NR_LOOPS	3
+#define LOOP_TIMEOUT	20
 
-	local_irq_save(flags);
+/*
+ * Entry/exit counters that make sure that both CPUs
+ * run the measurement code at once:
+ */
+static atomic_t start_count;
+static atomic_t stop_count;
+static atomic_t test_runs;
 
-	/*
-	 * We loop a few times to get a primed instruction cache,
-	 * then the last pass is more or less synchronised and
-	 * the master and slaves each set their cycle counters to a known
-	 * value all at once. This reduces the chance of having random offsets
-	 * between the processors, and guarantees that the maximum
-	 * delay between the cycle counters is never bigger than
-	 * the latency of information-passing (cachelines) between
-	 * two CPUs.
-	 */
+/*
+ * We use a raw spinlock in this exceptional case, because
+ * we want to have the fastest, inlined, non-debug version
+ * of a critical section, to be able to prove counter time-warps:
+ */
+static arch_spinlock_t sync_lock = __ARCH_SPIN_LOCK_UNLOCKED;
 
-	for (i = 0; i < NR_LOOPS; i++) {
-		/* slaves loop on '!= 2' */
-		while (atomic_read(&count_count_start) != 1)
-			mb();
-		atomic_set(&count_count_stop, 0);
-		smp_wmb();
+static uint32_t last_counter;
+static uint32_t max_warp;
+static int nr_warps;
+static int random_warps;
 
-		/* Let the slave writes its count register */
-		atomic_inc(&count_count_start);
+/*
+ * Counter warp measurement loop running on both CPUs.
+ */
+static uint32_t check_counter_warp(void)
+{
+	uint32_t start, now, prev, end, cur_max_warp = 0;
+	int i, cur_warps = 0;
 
-		/* Count will be initialised to current timer */
-		if (i == 1)
-			initcount = read_c0_count();
+	start = read_c0_count();
+	end = start + (uint32_t) mips_hpt_frequency / 1000 * LOOP_TIMEOUT;
 
+	for (i = 0; ; i++) {
 		/*
-		 * Everyone initialises count in the last loop:
+		 * We take the global lock, measure counter, save the
+		 * previous counter that was measured (possibly on
+		 * another CPU) and update the previous counter timestamp.
 		 */
-		if (i == NR_LOOPS-1)
-			write_c0_count(initcount);
+		arch_spin_lock(&sync_lock);
+		prev = last_counter;
+		now = read_c0_count();
+		last_counter = now;
+		arch_spin_unlock(&sync_lock);
 
 		/*
-		 * Wait for slave to leave the synchronization point:
+		 * Be nice every now and then (and also check whether
+		 * measurement is done [we also insert a 10 million
+		 * loops safety exit, so we dont lock up in case the
+		 * counter is totally broken]):
 		 */
-		while (atomic_read(&count_count_stop) != 1)
-			mb();
-		atomic_set(&count_count_start, 0);
-		smp_wmb();
-		atomic_inc(&count_count_stop);
+		if (unlikely(!(i & 7))) {
+			if (now > end || i > 10000000)
+				break;
+			cpu_relax();
+			touch_nmi_watchdog();
+		}
+		/*
+		 * Outside the critical section we can now see whether
+		 * we saw a time-warp of the counter going backwards:
+		 */
+		if (unlikely(prev > now)) {
+			arch_spin_lock(&sync_lock);
+			max_warp = max(max_warp, prev - now);
+			cur_max_warp = max_warp;
+			/*
+			 * Check whether this bounces back and forth. Only
+			 * one CPU should observe time going backwards.
+			 */
+			if (cur_warps != nr_warps)
+				random_warps++;
+			nr_warps++;
+			cur_warps = nr_warps;
+			arch_spin_unlock(&sync_lock);
+		}
+	}
+	WARN(!(now-start),
+		"Warning: zero counter calibration delta: %d [max: %d]\n",
+			now-start, end-start);
+	return cur_max_warp;
+}
+
+/*
+ * The freshly booted CPU initiates this via an async SMP function call.
+ */
+static void check_counter_sync_source(void *__cpu)
+{
+	unsigned int cpu = (unsigned long)__cpu;
+	int cpus = 2;
+
+	atomic_set(&test_runs, NR_LOOPS);
+retry:
+	/* Wait for the target to start. */
+	while (atomic_read(&start_count) != cpus - 1)
+		cpu_relax();
+
+	/*
+	 * Trigger the target to continue into the measurement too:
+	 */
+	atomic_inc(&start_count);
+
+	check_counter_warp();
+
+	while (atomic_read(&stop_count) != cpus-1)
+		cpu_relax();
+
+	/*
+	 * If the test was successful set the number of runs to zero and
+	 * stop. If not, decrement the number of runs an check if we can
+	 * retry. In case of random warps no retry is attempted.
+	 */
+	if (!nr_warps) {
+		atomic_set(&test_runs, 0);
+
+		pr_info("Counter synchronization [CPU#%d -> CPU#%u]: passed\n",
+			smp_processor_id(), cpu);
+	} else if (atomic_dec_and_test(&test_runs) || random_warps) {
+		/* Force it to 0 if random warps brought us here */
+		atomic_set(&test_runs, 0);
+
+		pr_info("Counter synchronization [CPU#%d -> CPU#%u]:\n",
+			smp_processor_id(), cpu);
+		pr_info("Measured %d cycles counter warp between CPUs", max_warp);
+		if (random_warps)
+			pr_warn("Counter warped randomly between CPUs\n");
 	}
-	/* Arrange for an interrupt in a short while */
-	write_c0_compare(read_c0_count() + COUNTON);
 
-	local_irq_restore(flags);
+	/*
+	 * Reset it - just in case we boot another CPU later:
+	 */
+	atomic_set(&start_count, 0);
+	random_warps = 0;
+	nr_warps = 0;
+	max_warp = 0;
+	last_counter = 0;
+
+	/*
+	 * Let the target continue with the bootup:
+	 */
+	atomic_inc(&stop_count);
 
 	/*
-	 * i386 code reported the skew here, but the
-	 * count registers were almost certainly out of sync
-	 * so no point in alarming people
+	 * Retry, if there is a chance to do so.
 	 */
-	pr_cont("done.\n");
+	if (atomic_read(&test_runs) > 0)
+		goto retry;
 }
 
+/*
+ * Freshly booted CPUs call into this:
+ */
 void synchronise_count_slave(int cpu)
 {
-	int i;
-	unsigned long flags;
+	uint32_t cur_max_warp, gbl_max_warp, count;
+	int cpus = 2;
 
-	local_irq_save(flags);
+	if (!cpu_has_counter || !mips_hpt_frequency)
+		return;
 
+	/* Kick the control CPU into the counter synchronization function */
+	smp_call_function_single(cpumask_first(cpu_online_mask),
+				 check_counter_sync_source,
+				 (unsigned long *)(unsigned long)cpu, 0);
+retry:
 	/*
-	 * Not every cpu is online at the time this gets called,
-	 * so we first wait for the master to say everyone is ready
+	 * Register this CPU's participation and wait for the
+	 * source CPU to start the measurement:
 	 */
+	atomic_inc(&start_count);
+	while (atomic_read(&start_count) != cpus)
+		cpu_relax();
 
-	for (i = 0; i < NR_LOOPS; i++) {
-		atomic_inc(&count_count_start);
-		while (atomic_read(&count_count_start) != 2)
-			mb();
+	cur_max_warp = check_counter_warp();
 
-		/*
-		 * Everyone initialises count in the last loop:
-		 */
-		if (i == NR_LOOPS-1)
-			write_c0_count(initcount);
+	/*
+	 * Store the maximum observed warp value for a potential retry:
+	 */
+	gbl_max_warp = max_warp;
+
+	/*
+	 * Ok, we are done:
+	 */
+	atomic_inc(&stop_count);
+
+	/*
+	 * Wait for the source CPU to print stuff:
+	 */
+	while (atomic_read(&stop_count) != cpus)
+		cpu_relax();
 
-		atomic_inc(&count_count_stop);
-		while (atomic_read(&count_count_stop) != 2)
-			mb();
+	/*
+	 * Reset it for the next sync test:
+	 */
+	atomic_set(&stop_count, 0);
+
+	/*
+	 * Check the number of remaining test runs. If not zero, the test
+	 * failed and a retry with adjusted counter is possible. If zero the
+	 * test was either successful or failed terminally.
+	 */
+	if (!atomic_read(&test_runs)) {
+		/* Arrange for an interrupt in a short while */
+		write_c0_compare(read_c0_count() + COUNTON);
+		return;
 	}
-	/* Arrange for an interrupt in a short while */
-	write_c0_compare(read_c0_count() + COUNTON);
 
-	local_irq_restore(flags);
+	/*
+	 * If the warp value of this CPU is 0, then the other CPU
+	 * observed time going backwards so this counter was ahead and
+	 * needs to move backwards.
+	 */
+	if (!cur_max_warp)
+		cur_max_warp = -gbl_max_warp;
+
+	count = read_c0_count();
+	count += cur_max_warp;
+	write_c0_count(count);
+
+	pr_debug("Counter compensate: CPU%u observed %d warp\n", cpu, cur_max_warp);
+
+	goto retry;
+
 }
-#undef NR_LOOPS

-- 
2.43.0


