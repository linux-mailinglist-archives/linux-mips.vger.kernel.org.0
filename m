Return-Path: <linux-mips+bounces-1717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F00288667C2
	for <lists+linux-mips@lfdr.de>; Mon, 26 Feb 2024 03:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7C71F21DD4
	for <lists+linux-mips@lfdr.de>; Mon, 26 Feb 2024 02:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D0514A98;
	Mon, 26 Feb 2024 02:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e7C+sckm"
X-Original-To: linux-mips@vger.kernel.org
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126092594;
	Mon, 26 Feb 2024 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913394; cv=none; b=sQBEAA7aHxzpETMVj7cGHmZNxYAZ7wic2oVKeE7GvYkPcHHspNMZZnyH3GnNiUBgeiMNTxLUb0IhPsEe1gcFdj/AOjQ+mBvurbOqVyT7iDPNBlU3sXIrBfDD3f7ipJz12ZcNdWz2MMmEdv35T85dElYbitQ+JNw/vxoPo41gYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913394; c=relaxed/simple;
	bh=YyGVL3DTq1NGBUlNTsaZWPygzXSkQqFhl2iQhk+tfEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c553JtUG4dRlYuh0R37nrqz1BoGijG/VX7lf5Nts466/M6zI/Y7rIjZ83cgJ3debh5gJpJjyQ1cVnKDXPBux1L6VHv6IyoI7+wMt6jKMyQi4kl/FQUwtvaN38JWIYcbOtkHWm9vF/hZ/746W8CfA+cMPz+cK0Fty81jcXHZif6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e7C+sckm; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1708913389; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=nB7HiCRDXz45RwbXKMqlhFZOk/rJjNAZ2WqhNw3OoCA=;
	b=e7C+sckmKLf+f0jICPzR7oVe64iEcXVFcs6Bx2R/L8oHCWuEX7UqMdeACQt3fzcvxHPPw1LP71bB3gSsL3pJkIPOGvIQgDSntTQ7X03QX7JXXuIQCbWZJpXhNTXJtbVYg93b0IpEba1l7PHaj5RJSoTbgQqO/kQtHcKbEdlQXtM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W1A1Ha7_1708913385;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1A1Ha7_1708913385)
          by smtp.aliyun-inc.com;
          Mon, 26 Feb 2024 10:09:47 +0800
From: Bitao Hu <yaoma@linux.alibaba.com>
To: dianders@chromium.org,
	tglx@linutronix.de,
	liusong@linux.alibaba.com,
	akpm@linux-foundation.org,
	pmladek@suse.com,
	kernelfans@gmail.com,
	deller@gmx.de,
	npiggin@gmail.com,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	jan.kiszka@siemens.com
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	yaoma@linux.alibaba.com
Subject: [PATCHv10 1/4] watchdog/softlockup: low-overhead detection of interrupt storm
Date: Mon, 26 Feb 2024 10:09:36 +0800
Message-Id: <20240226020939.45264-2-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20240226020939.45264-1-yaoma@linux.alibaba.com>
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following softlockup is caused by interrupt storm, but it cannot be
identified from the call tree. Because the call tree is just a snapshot
and doesn't fully capture the behavior of the CPU during the soft lockup.
  watchdog: BUG: soft lockup - CPU#28 stuck for 23s! [fio:83921]
  ...
  Call trace:
    __do_softirq+0xa0/0x37c
    __irq_exit_rcu+0x108/0x140
    irq_exit+0x14/0x20
    __handle_domain_irq+0x84/0xe0
    gic_handle_irq+0x80/0x108
    el0_irq_naked+0x50/0x58

Therefore，I think it is necessary to report CPU utilization during the
softlockup_thresh period (report once every sample_period, for a total
of 5 reportings), like this:
  watchdog: BUG: soft lockup - CPU#28 stuck for 23s! [fio:83921]
  CPU#28 Utilization every 4s during lockup:
    #1: 0% system, 0% softirq, 100% hardirq, 0% idle
    #2: 0% system, 0% softirq, 100% hardirq, 0% idle
    #3: 0% system, 0% softirq, 100% hardirq, 0% idle
    #4: 0% system, 0% softirq, 100% hardirq, 0% idle
    #5: 0% system, 0% softirq, 100% hardirq, 0% idle
  ...

This would be helpful in determining whether an interrupt storm has
occurred or in identifying the cause of the softlockup. The criteria for
determination are as follows:
  a. If the hardirq utilization is high, then interrupt storm should be
  considered and the root cause cannot be determined from the call tree.
  b. If the softirq utilization is high, then we could analyze the call
  tree but it may cannot reflect the root cause.
  c. If the system utilization is high, then we could analyze the root
  cause from the call tree.

The mechanism requires a considerable amount of global storage space
when configured for the maximum number of CPUs. Therefore, adding a
SOFTLOCKUP_DETECTOR_INTR_STORM Kconfig knob that defaults to "yes"
if the max number of CPUs is <= 128.

Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Liu Song <liusong@linux.alibaba.com>
---
 kernel/watchdog.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++-
 lib/Kconfig.debug | 13 +++++++
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 81a8862295d6..69e72d7e461d 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -16,6 +16,8 @@
 #include <linux/cpu.h>
 #include <linux/nmi.h>
 #include <linux/init.h>
+#include <linux/kernel_stat.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/sysctl.h>
 #include <linux/tick.h>
@@ -35,6 +37,8 @@ static DEFINE_MUTEX(watchdog_mutex);
 # define WATCHDOG_HARDLOCKUP_DEFAULT	0
 #endif
 
+#define NUM_SAMPLE_PERIODS	5
+
 unsigned long __read_mostly watchdog_enabled;
 int __read_mostly watchdog_user_enabled = 1;
 static int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
@@ -333,6 +337,95 @@ __setup("watchdog_thresh=", watchdog_thresh_setup);
 
 static void __lockup_detector_cleanup(void);
 
+#ifdef CONFIG_SOFTLOCKUP_DETECTOR_INTR_STORM
+enum stats_per_group {
+	STATS_SYSTEM,
+	STATS_SOFTIRQ,
+	STATS_HARDIRQ,
+	STATS_IDLE,
+	NUM_STATS_PER_GROUP,
+};
+
+static const enum cpu_usage_stat tracked_stats[NUM_STATS_PER_GROUP] = {
+	CPUTIME_SYSTEM,
+	CPUTIME_SOFTIRQ,
+	CPUTIME_IRQ,
+	CPUTIME_IDLE,
+};
+
+static DEFINE_PER_CPU(u16, cpustat_old[NUM_STATS_PER_GROUP]);
+static DEFINE_PER_CPU(u8, cpustat_util[NUM_SAMPLE_PERIODS][NUM_STATS_PER_GROUP]);
+static DEFINE_PER_CPU(u8, cpustat_tail);
+
+/*
+ * We don't need nanosecond resolution. A granularity of 16ms is
+ * sufficient for our precision, allowing us to use u16 to store
+ * cpustats, which will roll over roughly every ~1000 seconds.
+ * 2^24 ~= 16 * 10^6
+ */
+static u16 get_16bit_precision(u64 data_ns)
+{
+	return data_ns >> 24LL; /* 2^24ns ~= 16.8ms */
+}
+
+static void update_cpustat(void)
+{
+	int i;
+	u8 util;
+	u16 old_stat, new_stat;
+	struct kernel_cpustat kcpustat;
+	u64 *cpustat = kcpustat.cpustat;
+	u8 tail = __this_cpu_read(cpustat_tail);
+	u16 sample_period_16 = get_16bit_precision(sample_period);
+
+	kcpustat_cpu_fetch(&kcpustat, smp_processor_id());
+
+	for (i = 0; i < NUM_STATS_PER_GROUP; i++) {
+		old_stat = __this_cpu_read(cpustat_old[i]);
+		new_stat = get_16bit_precision(cpustat[tracked_stats[i]]);
+		util = DIV_ROUND_UP(100 * (new_stat - old_stat), sample_period_16);
+		__this_cpu_write(cpustat_util[tail][i], util);
+		__this_cpu_write(cpustat_old[i], new_stat);
+	}
+
+	__this_cpu_write(cpustat_tail, (tail + 1) % NUM_SAMPLE_PERIODS);
+}
+
+static void print_cpustat(void)
+{
+	int i, group;
+	u8 tail = __this_cpu_read(cpustat_tail);
+	u64 sample_period_second = sample_period;
+
+	do_div(sample_period_second, NSEC_PER_SEC);
+
+	/*
+	 * We do not want the "watchdog: " prefix on every line,
+	 * hence we use "printk" instead of "pr_crit".
+	 */
+	printk(KERN_CRIT "CPU#%d Utilization every %llus during lockup:\n",
+	       smp_processor_id(), sample_period_second);
+
+	for (i = 0; i < NUM_SAMPLE_PERIODS; i++) {
+		group = (tail + i) % NUM_SAMPLE_PERIODS;
+		printk(KERN_CRIT "\t#%d: %3u%% system,\t%3u%% softirq,\t"
+			"%3u%% hardirq,\t%3u%% idle\n", i + 1,
+			__this_cpu_read(cpustat_util[group][STATS_SYSTEM]),
+			__this_cpu_read(cpustat_util[group][STATS_SOFTIRQ]),
+			__this_cpu_read(cpustat_util[group][STATS_HARDIRQ]),
+			__this_cpu_read(cpustat_util[group][STATS_IDLE]));
+	}
+}
+
+static void report_cpu_status(void)
+{
+	print_cpustat();
+}
+#else
+static inline void update_cpustat(void) { }
+static inline void report_cpu_status(void) { }
+#endif
+
 /*
  * Hard-lockup warnings should be triggered after just a few seconds. Soft-
  * lockups can have false positives under extreme conditions. So we generally
@@ -364,7 +457,7 @@ static void set_sample_period(void)
 	 * and hard thresholds) to increment before the
 	 * hardlockup detector generates a warning
 	 */
-	sample_period = get_softlockup_thresh() * ((u64)NSEC_PER_SEC / 5);
+	sample_period = get_softlockup_thresh() * ((u64)NSEC_PER_SEC / NUM_SAMPLE_PERIODS);
 	watchdog_update_hrtimer_threshold(sample_period);
 }
 
@@ -504,6 +597,8 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	 */
 	period_ts = READ_ONCE(*this_cpu_ptr(&watchdog_report_ts));
 
+	update_cpustat();
+
 	/* Reset the interval when touched by known problematic code. */
 	if (period_ts == SOFTLOCKUP_DELAY_REPORT) {
 		if (unlikely(__this_cpu_read(softlockup_touch_sync))) {
@@ -539,6 +634,7 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 		pr_emerg("BUG: soft lockup - CPU#%d stuck for %us! [%s:%d]\n",
 			smp_processor_id(), duration,
 			current->comm, task_pid_nr(current));
+		report_cpu_status();
 		print_modules();
 		print_irqtrace_events(current);
 		if (regs)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 975a07f9f1cc..49f652674bd8 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1029,6 +1029,19 @@ config SOFTLOCKUP_DETECTOR
 	  chance to run.  The current stack trace is displayed upon
 	  detection and the system will stay locked up.
 
+config SOFTLOCKUP_DETECTOR_INTR_STORM
+	bool "Detect Interrupt Storm in Soft Lockups"
+	depends on SOFTLOCKUP_DETECTOR && IRQ_TIME_ACCOUNTING
+	default y if NR_CPUS <= 128
+	help
+	  Say Y here to enable the kernel to detect interrupt storm
+	  during "soft lockups".
+
+	  "soft lockups" can be caused by a variety of reasons. If one is
+	  caused by an interrupt storm, then the storming interrupts will not
+	  be on the callstack. To detect this case, it is necessary to report
+	  the CPU stats and the interrupt counts during the "soft lockups".
+
 config BOOTPARAM_SOFTLOCKUP_PANIC
 	bool "Panic (Reboot) On Soft Lockups"
 	depends on SOFTLOCKUP_DETECTOR
-- 
2.37.1 (Apple Git-137.1)


