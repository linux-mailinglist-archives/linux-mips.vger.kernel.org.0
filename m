Return-Path: <linux-mips+bounces-13710-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJTuOgkZuWkBqgEAu9opvQ
	(envelope-from <linux-mips+bounces-13710-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:04:09 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A742A6375
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACD653042B46
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 09:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6309D31E851;
	Tue, 17 Mar 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0SwjPEj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DDC19CC0C;
	Tue, 17 Mar 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738119; cv=none; b=tk6VYX8GV1GsXO8bWjpSaedhuR5MPD/qlZ22pwoRESnHiaUfuYmLP4bemxNDcrMzG1X3uUF2hzetBlERjBTKpOyrk7Cxjs5IPwCtWcduUYZUEJS9ldmfKPnZU282s83cVU/VM7noCqr4aU34fUNK6sJ2EdIeeIV3qx+JiVjLD68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738119; c=relaxed/simple;
	bh=ElpiOn7NvAMAJWPOGysdu4aq6kDd5wlKUK7hKiFgtS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yce8byEMFfvgL6g05zYJa2shoVydmZnuj4T2HQbHr1cH4ftvcdhV2HJNguJxevKWpglLhvXOM597hdsqCjpyiNw/GRJ9Ki76xR8mORGTxFWxqCOzsIF8mZMSnyhWPU/6g0z8LsSP4mXUeSGratRuBnNc3BOB68MaQUzNOOn1RRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0SwjPEj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E10AC4CEF7;
	Tue, 17 Mar 2026 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773738119;
	bh=ElpiOn7NvAMAJWPOGysdu4aq6kDd5wlKUK7hKiFgtS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k0SwjPEjukXqIqG6nKyA4l03K257YlD9jL/yYYylswdt+BynZMUxocLFWfB6oJI49
	 PsbiHEZ4X3xUrKXaPEwfdLieh9yCE5gbXppbCRL5rgDD76YIVnEjUzOjqwkR3eEnZD
	 I3sMCYR+VSKeywL4Q6UORspCamClqGQLKJ11GjgHVDcGqhKIC3s9aiOdIElHWhQPP+
	 tMjuIpdPODf0MisDCS+DM3VIHfw/JEPE6cCOrtOaRpbAsa0s/Gy84VHFOCyOD7vsm4
	 oQNoyO/L8PqRNPH8NuR/hmVLL17EOUiaovRZZXbFSa0fv+c5ye5FcYY1eKU95C3N17
	 yBuiG5aY5c+6Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner
 <jwiesner@suse.de>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Scott Hamilton
 <scott.hamilton@bull.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
In-Reply-To: <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx>
 <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx>
 <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
Date: Tue, 17 Mar 2026 10:01:54 +0100
Message-ID: <87h5qeomm5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,gmx.de,alpha.franken.de,bull.com];
	TAGGED_FROM(0.00)[bounces-13710-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email,suse.de:email]
X-Rspamd-Queue-Id: E1A742A6375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15 2026 at 22:59, Daniel J. Blueman wrote:
> On Mon, 23 Feb 2026 at 21:53, Thomas Gleixner <tglx@kernel.org> wrote:
> With that said, on the 16 socket (1920 thread) setup, we see most
> remote calls end up timing out with WATCHDOG_READOUT_MAX_US at 50,
> leading to excessive logging. pr_info_once() would be a good approach
> to avoid the spam, however I still feel we should use a higher
> (250-500us?) timeout to keep the mechanism effective.
>
> I also feel if a remote hardware thread is seen to timeout, retrying
> has a high likelyhood of timing out also, so it may be cheaper in the
> bigger picture to not retry. Sensitivity could be increased by walking
> threads in socket order (S0T0 ... S15T0 S0T1 ... S15T1 ...). These two
> items are my only concerns.

Right. So I ditched the immediate retry and replaced the hard coded
timeout with a runtime calculated one when NUMA is enabled. It's a
reasonable assumption that insanely big systems have properly
initialized SLIT/SRAT tables. So we can just [ab]use the node distance
to determine the timeout for a remote CPU.

Thanks,

        tglx
---
From: Thomas Gleixner <tglx@kernel.org>
Subject: clocksource: Rewrite watchdog code completely
Date: Sat, 24 Jan 2026 00:18:01 +0100

From: Thomas Gleixner <tglx@kernel.org>

The clocksource watchdog code has over time reached the state of an
unpenetrable maze of duct tape and staples. The original design, which was
made in the context of systems far smaller than today, is based on the
assumption that the to be monitored clocksource (TSC) can be trivially
compared against a known to be stable clocksource (HPET/ACPI-PM timer).

Over the years it turned out that this approach has major flaws:

  - Long delays between watchdog invocations can result in wrap arounds
    of the reference clocksource

  - Scalability of the reference clocksource readout can degrade on large
    multi-socket systems due to interconnect congestion

This was addressed with various heuristics which degraded the accurracy of
the watchdog to the point that it fails to detect actual TSC problems on
older hardware which exposes slow inter CPU drifts due to firmware
manipulating the TSC to hide SMI time.

To address this and bring back sanity to the watchdog, rewrite the code
completely with a different approach:

  1) Restrict the validation against a reference clocksource to the boot
     CPU, which is usually the CPU/Socket closest to the legacy block which
     contains the reference source (HPET/ACPI-PM timer). Validate that the
     reference readout is within a bound latency so that the actual
     comparison against the TSC stays within 500ppm as long as the clocks
     are stable.
     
  2) Compare the TSCs of the other CPUs in a round robin fashion against
     the boot CPU in the same way the TSC synchronization on CPU hotplug
     works. This still can suffer from delayed reaction of the remote CPU
     to the SMP function call and the latency of the control variable cache
     line. But this latency is not affecting correctness. It only affects
     the accuracy. With low contention the readout latency is in the low
     nanoseconds range, which detects even slight skews between CPUs. Under
     high contention this becomes obviously less accurate, but still
     detects slow skews reliably as it solely relies on subsequent readouts
     being monotonically increasing. It just can take slightly longer to
     detect the issue.

  3) Rewrite the watchdog test so it tests the various mechanisms one by
     one and validating the result against the expectation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Jiri Wiesner <jwiesner@suse.de>
Link: https://patch.msgid.link/20260123231521.926490888@kernel.org
---
V2: Make it more cache line friendly and tweak it further for insane big
    machines - Daniel
---
 Documentation/admin-guide/kernel-parameters.txt |    7 
 arch/x86/include/asm/time.h                     |    1 
 arch/x86/kernel/hpet.c                          |    4 
 arch/x86/kernel/tsc.c                           |   49 -
 drivers/clocksource/acpi_pm.c                   |    4 
 include/linux/clocksource.h                     |   28 
 kernel/time/Kconfig                             |   12 
 kernel/time/clocksource-wdtest.c                |  274 ++++----
 kernel/time/clocksource.c                       |  788 ++++++++++++------------
 kernel/time/jiffies.c                           |    1 
 10 files changed, 583 insertions(+), 585 deletions(-)
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7950,12 +7950,7 @@ Kernel parameters
 			(HPET or PM timer) on systems whose TSC frequency was
 			obtained from HW or FW using either an MSR or CPUID(0x15).
 			Warn if the difference is more than 500 ppm.
-			[x86] watchdog: Use TSC as the watchdog clocksource with
-			which to check other HW timers (HPET or PM timer), but
-			only on systems where TSC has been deemed trustworthy.
-			This will be suppressed by an earlier tsc=nowatchdog and
-			can be overridden by a later tsc=nowatchdog.  A console
-			message will flag any such suppression or overriding.
+			[x86] watchdog: Enforce the clocksource watchdog on TSC
 
 	tsc_early_khz=  [X86,EARLY] Skip early TSC calibration and use the given
 			value instead. Useful when the early TSC frequency discovery
--- a/arch/x86/include/asm/time.h
+++ b/arch/x86/include/asm/time.h
@@ -7,7 +7,6 @@
 
 extern void hpet_time_init(void);
 extern bool pit_timer_init(void);
-extern bool tsc_clocksource_watchdog_disabled(void);
 
 extern struct clock_event_device *global_clock_event;
 
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -854,7 +854,7 @@ static struct clocksource clocksource_hp
 	.rating		= 250,
 	.read		= read_hpet,
 	.mask		= HPET_MASK,
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_CALIBRATED,
 	.resume		= hpet_resume_counter,
 };
 
@@ -1082,8 +1082,6 @@ int __init hpet_enable(void)
 	if (!hpet_counting())
 		goto out_nohpet;
 
-	if (tsc_clocksource_watchdog_disabled())
-		clocksource_hpet.flags |= CLOCK_SOURCE_MUST_VERIFY;
 	clocksource_register_hz(&clocksource_hpet, (u32)hpet_freq);
 
 	if (id & HPET_ID_LEGSUP) {
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -322,12 +322,16 @@ int __init notsc_setup(char *str)
 	return 1;
 }
 #endif
-
 __setup("notsc", notsc_setup);
 
+enum {
+	TSC_WATCHDOG_AUTO,
+	TSC_WATCHDOG_OFF,
+	TSC_WATCHDOG_ON,
+};
+
 static int no_sched_irq_time;
-static int no_tsc_watchdog;
-static int tsc_as_watchdog;
+static int tsc_watchdog;
 
 static int __init tsc_setup(char *str)
 {
@@ -337,25 +341,14 @@ static int __init tsc_setup(char *str)
 		no_sched_irq_time = 1;
 	if (!strcmp(str, "unstable"))
 		mark_tsc_unstable("boot parameter");
-	if (!strcmp(str, "nowatchdog")) {
-		no_tsc_watchdog = 1;
-		if (tsc_as_watchdog)
-			pr_alert("%s: Overriding earlier tsc=watchdog with tsc=nowatchdog\n",
-				 __func__);
-		tsc_as_watchdog = 0;
-	}
+	if (!strcmp(str, "nowatchdog"))
+		tsc_watchdog = TSC_WATCHDOG_OFF;
 	if (!strcmp(str, "recalibrate"))
 		tsc_force_recalibrate = 1;
-	if (!strcmp(str, "watchdog")) {
-		if (no_tsc_watchdog)
-			pr_alert("%s: tsc=watchdog overridden by earlier tsc=nowatchdog\n",
-				 __func__);
-		else
-			tsc_as_watchdog = 1;
-	}
+	if (!strcmp(str, "watchdog"))
+		tsc_watchdog = TSC_WATCHDOG_ON;
 	return 1;
 }
-
 __setup("tsc=", tsc_setup);
 
 #define MAX_RETRIES		5
@@ -1175,7 +1168,6 @@ static int tsc_cs_enable(struct clocksou
 static struct clocksource clocksource_tsc_early = {
 	.name			= "tsc-early",
 	.rating			= 299,
-	.uncertainty_margin	= 32 * NSEC_PER_MSEC,
 	.read			= read_tsc,
 	.mask			= CLOCKSOURCE_MASK(64),
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS |
@@ -1202,7 +1194,6 @@ static struct clocksource clocksource_ts
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS |
 				  CLOCK_SOURCE_CAN_INLINE_READ |
 				  CLOCK_SOURCE_MUST_VERIFY |
-				  CLOCK_SOURCE_VERIFY_PERCPU |
 				  CLOCK_SOURCE_HAS_COUPLED_CLOCK_EVENT,
 	.id			= CSID_X86_TSC,
 	.vdso_clock_mode	= VDSO_CLOCKMODE_TSC,
@@ -1231,16 +1222,12 @@ EXPORT_SYMBOL_GPL(mark_tsc_unstable);
 
 static void __init tsc_disable_clocksource_watchdog(void)
 {
+	if (tsc_watchdog == TSC_WATCHDOG_ON)
+		return;
 	clocksource_tsc_early.flags &= ~CLOCK_SOURCE_MUST_VERIFY;
 	clocksource_tsc.flags &= ~CLOCK_SOURCE_MUST_VERIFY;
 }
 
-bool tsc_clocksource_watchdog_disabled(void)
-{
-	return !(clocksource_tsc.flags & CLOCK_SOURCE_MUST_VERIFY) &&
-	       tsc_as_watchdog && !no_tsc_watchdog;
-}
-
 static void __init check_system_tsc_reliable(void)
 {
 #if defined(CONFIG_MGEODEGX1) || defined(CONFIG_MGEODE_LX) || defined(CONFIG_X86_GENERIC)
@@ -1395,6 +1382,8 @@ static void tsc_refine_calibration_work(
 		(unsigned long)tsc_khz / 1000,
 		(unsigned long)tsc_khz % 1000);
 
+	clocksource_tsc.flags |= CLOCK_SOURCE_CALIBRATED;
+
 	/* Inform the TSC deadline clockevent devices about the recalibration */
 	lapic_update_tsc_freq();
 
@@ -1470,12 +1459,10 @@ static bool __init determine_cpu_tsc_fre
 
 	if (early) {
 		cpu_khz = x86_platform.calibrate_cpu();
-		if (tsc_early_khz) {
+		if (tsc_early_khz)
 			tsc_khz = tsc_early_khz;
-		} else {
+		else
 			tsc_khz = x86_platform.calibrate_tsc();
-			clocksource_tsc.freq_khz = tsc_khz;
-		}
 	} else {
 		/* We should not be here with non-native cpu calibration */
 		WARN_ON(x86_platform.calibrate_cpu != native_calibrate_cpu);
@@ -1579,7 +1566,7 @@ void __init tsc_init(void)
 		return;
 	}
 
-	if (tsc_clocksource_reliable || no_tsc_watchdog)
+	if (tsc_clocksource_reliable || tsc_watchdog == TSC_WATCHDOG_OFF)
 		tsc_disable_clocksource_watchdog();
 
 	clocksource_register_khz(&clocksource_tsc_early, tsc_khz);
--- a/drivers/clocksource/acpi_pm.c
+++ b/drivers/clocksource/acpi_pm.c
@@ -98,7 +98,7 @@ static struct clocksource clocksource_ac
 	.rating		= 200,
 	.read		= acpi_pm_read,
 	.mask		= (u64)ACPI_PM_MASK,
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_CALIBRATED,
 	.suspend	= acpi_pm_suspend,
 	.resume		= acpi_pm_resume,
 };
@@ -243,8 +243,6 @@ static int __init init_acpi_pm_clocksour
 		return -ENODEV;
 	}
 
-	if (tsc_clocksource_watchdog_disabled())
-		clocksource_acpi_pm.flags |= CLOCK_SOURCE_MUST_VERIFY;
 	return clocksource_register_hz(&clocksource_acpi_pm, PMTMR_TICKS_PER_SEC);
 }
 
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -44,8 +44,6 @@ struct module;
  * @shift:		Cycle to nanosecond divisor (power of two)
  * @max_idle_ns:	Maximum idle time permitted by the clocksource (nsecs)
  * @maxadj:		Maximum adjustment value to mult (~11%)
- * @uncertainty_margin:	Maximum uncertainty in nanoseconds per half second.
- *			Zero says to use default WATCHDOG_THRESHOLD.
  * @archdata:		Optional arch-specific data
  * @max_cycles:		Maximum safe cycle value which won't overflow on
  *			multiplication
@@ -105,7 +103,6 @@ struct clocksource {
 	u32			shift;
 	u64			max_idle_ns;
 	u32			maxadj;
-	u32			uncertainty_margin;
 #ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
 	struct arch_clocksource_data archdata;
 #endif
@@ -133,6 +130,7 @@ struct clocksource {
 	struct list_head	wd_list;
 	u64			cs_last;
 	u64			wd_last;
+	unsigned int		wd_cpu;
 #endif
 	struct module		*owner;
 };
@@ -142,15 +140,18 @@ struct clocksource {
  */
 #define CLOCK_SOURCE_IS_CONTINUOUS		0x01
 #define CLOCK_SOURCE_MUST_VERIFY		0x02
+#define CLOCK_SOURCE_CALIBRATED			0x04
 
 #define CLOCK_SOURCE_WATCHDOG			0x10
 #define CLOCK_SOURCE_VALID_FOR_HRES		0x20
 #define CLOCK_SOURCE_UNSTABLE			0x40
 #define CLOCK_SOURCE_SUSPEND_NONSTOP		0x80
 #define CLOCK_SOURCE_RESELECT			0x100
-#define CLOCK_SOURCE_VERIFY_PERCPU		0x200
-#define CLOCK_SOURCE_CAN_INLINE_READ		0x400
-#define CLOCK_SOURCE_HAS_COUPLED_CLOCK_EVENT	0x800
+#define CLOCK_SOURCE_CAN_INLINE_READ		0x200
+#define CLOCK_SOURCE_HAS_COUPLED_CLOCK_EVENT	0x400
+
+#define CLOCK_SOURCE_WDTEST			0x800
+#define CLOCK_SOURCE_WDTEST_PERCPU		0x1000
 
 /* simplify initialization of mask field */
 #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
@@ -301,21 +302,6 @@ static inline void timer_probe(void) {}
 #define TIMER_ACPI_DECLARE(name, table_id, fn)		\
 	ACPI_DECLARE_PROBE_ENTRY(timer, name, table_id, 0, NULL, 0, fn)
 
-static inline unsigned int clocksource_get_max_watchdog_retry(void)
-{
-	/*
-	 * When system is in the boot phase or under heavy workload, there
-	 * can be random big latencies during the clocksource/watchdog
-	 * read, so allow retries to filter the noise latency. As the
-	 * latency's frequency and maximum value goes up with the number of
-	 * CPUs, scale the number of retries with the number of online
-	 * CPUs.
-	 */
-	return (ilog2(num_online_cpus()) / 2) + 1;
-}
-
-void clocksource_verify_percpu(struct clocksource *cs);
-
 /**
  * struct clocksource_base - hardware abstraction for clock on which a clocksource
  *			is based
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -212,18 +212,6 @@ config HIGH_RES_TIMERS
 	  hardware is not capable then this option only increases
 	  the size of the kernel image.
 
-config CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
-	int "Clocksource watchdog maximum allowable skew (in microseconds)"
-	depends on CLOCKSOURCE_WATCHDOG
-	range 50 1000
-	default 125
-	help
-	  Specify the maximum amount of allowable watchdog skew in
-	  microseconds before reporting the clocksource to be unstable.
-	  The default is based on a half-second clocksource watchdog
-	  interval and NTP's maximum frequency drift of 500 parts
-	  per million.	If the clocksource is good enough for NTP,
-	  it is good enough for the clocksource watchdog!
 endif
 
 config POSIX_AUX_CLOCKS
--- a/kernel/time/clocksource-wdtest.c
+++ b/kernel/time/clocksource-wdtest.c
@@ -3,202 +3,196 @@
  * Unit test for the clocksource watchdog.
  *
  * Copyright (C) 2021 Facebook, Inc.
+ * Copyright (C) 2026 Intel Corp.
  *
  * Author: Paul E. McKenney <paulmck@kernel.org>
+ * Author: Thomas Gleixner <tglx@kernel.org>
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/device.h>
 #include <linux/clocksource.h>
-#include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/module.h>
-#include <linux/sched.h> /* for spin_unlock_irq() using preempt_count() m68k */
-#include <linux/tick.h>
 #include <linux/kthread.h>
-#include <linux/delay.h>
-#include <linux/prandom.h>
-#include <linux/cpu.h>
 
 #include "tick-internal.h"
+#include "timekeeping_internal.h"
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Clocksource watchdog unit test");
 MODULE_AUTHOR("Paul E. McKenney <paulmck@kernel.org>");
+MODULE_AUTHOR("Thomas Gleixner <tglx@kernel.org>");
 
-static int holdoff = IS_BUILTIN(CONFIG_TEST_CLOCKSOURCE_WATCHDOG) ? 10 : 0;
-module_param(holdoff, int, 0444);
-MODULE_PARM_DESC(holdoff, "Time to wait to start test (s).");
-
-/* Watchdog kthread's task_struct pointer for debug purposes. */
-static struct task_struct *wdtest_task;
-
-static u64 wdtest_jiffies_read(struct clocksource *cs)
-{
-	return (u64)jiffies;
-}
-
-static struct clocksource clocksource_wdtest_jiffies = {
-	.name			= "wdtest-jiffies",
-	.rating			= 1, /* lowest valid rating*/
-	.uncertainty_margin	= TICK_NSEC,
-	.read			= wdtest_jiffies_read,
-	.mask			= CLOCKSOURCE_MASK(32),
-	.flags			= CLOCK_SOURCE_MUST_VERIFY,
-	.mult			= TICK_NSEC << JIFFIES_SHIFT, /* details above */
-	.shift			= JIFFIES_SHIFT,
-	.max_cycles		= 10,
+enum wdtest_states {
+	WDTEST_INJECT_NONE,
+	WDTEST_INJECT_DELAY,
+	WDTEST_INJECT_POSITIVE,
+	WDTEST_INJECT_NEGATIVE,
+	WDTEST_INJECT_PERCPU	= 0x100,
 };
 
-static int wdtest_ktime_read_ndelays;
-static bool wdtest_ktime_read_fuzz;
+static enum wdtest_states wdtest_state;
+static unsigned long wdtest_test_count;
+static ktime_t wdtest_last_ts, wdtest_offset;
 
-static u64 wdtest_ktime_read(struct clocksource *cs)
+#define SHIFT_4000PPM	8
+
+static ktime_t wdtest_get_offset(struct clocksource *cs)
 {
-	int wkrn = READ_ONCE(wdtest_ktime_read_ndelays);
-	static int sign = 1;
-	u64 ret;
-
-	if (wkrn) {
-		udelay(cs->uncertainty_margin / 250);
-		WRITE_ONCE(wdtest_ktime_read_ndelays, wkrn - 1);
-	}
-	ret = ktime_get_real_fast_ns();
-	if (READ_ONCE(wdtest_ktime_read_fuzz)) {
-		sign = -sign;
-		ret = ret + sign * 100 * NSEC_PER_MSEC;
-	}
-	return ret;
+	if (wdtest_state < WDTEST_INJECT_PERCPU)
+		return wdtest_test_count & 0x1 ? 0 : wdtest_offset >> SHIFT_4000PPM;
+
+	/* Only affect the readout of the "remote" CPU */
+	return cs->wd_cpu == smp_processor_id() ? 0 : NSEC_PER_MSEC;
 }
 
-static void wdtest_ktime_cs_mark_unstable(struct clocksource *cs)
+static u64 wdtest_ktime_read(struct clocksource *cs)
 {
-	pr_info("--- Marking %s unstable due to clocksource watchdog.\n", cs->name);
+	ktime_t now = ktime_get_raw_fast_ns();
+	ktime_t intv = now - wdtest_last_ts;
+
+	/*
+	 * Only increment the test counter once per watchdog interval and
+	 * store the interval for the offset calculation of this step. This
+	 * guarantees a consistent behaviour even if the other side needs
+	 * to repeat due to a watchdog read timeout.
+	 */
+	if (intv > (NSEC_PER_SEC / 4)) {
+		WRITE_ONCE(wdtest_test_count, wdtest_test_count + 1);
+		wdtest_last_ts = now;
+		wdtest_offset = intv;
+	}
+
+	switch (wdtest_state & ~WDTEST_INJECT_PERCPU) {
+	case WDTEST_INJECT_POSITIVE:
+		return now + wdtest_get_offset(cs);
+	case WDTEST_INJECT_NEGATIVE:
+		return now - wdtest_get_offset(cs);
+	case WDTEST_INJECT_DELAY:
+		udelay(500);
+		return now;
+	default:
+		return now;
+	}
 }
 
-#define KTIME_FLAGS (CLOCK_SOURCE_IS_CONTINUOUS | \
-		     CLOCK_SOURCE_VALID_FOR_HRES | \
-		     CLOCK_SOURCE_MUST_VERIFY | \
-		     CLOCK_SOURCE_VERIFY_PERCPU)
+#define KTIME_FLAGS (CLOCK_SOURCE_IS_CONTINUOUS |	\
+		     CLOCK_SOURCE_CALIBRATED |		\
+		     CLOCK_SOURCE_MUST_VERIFY |		\
+		     CLOCK_SOURCE_WDTEST)
 
 static struct clocksource clocksource_wdtest_ktime = {
 	.name			= "wdtest-ktime",
-	.rating			= 300,
+	.rating			= 10,
 	.read			= wdtest_ktime_read,
 	.mask			= CLOCKSOURCE_MASK(64),
 	.flags			= KTIME_FLAGS,
-	.mark_unstable		= wdtest_ktime_cs_mark_unstable,
 	.list			= LIST_HEAD_INIT(clocksource_wdtest_ktime.list),
 };
 
-/* Reset the clocksource if needed. */
-static void wdtest_ktime_clocksource_reset(void)
+static void wdtest_clocksource_reset(enum wdtest_states which, bool percpu)
 {
-	if (clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE) {
-		clocksource_unregister(&clocksource_wdtest_ktime);
-		clocksource_wdtest_ktime.flags = KTIME_FLAGS;
-		schedule_timeout_uninterruptible(HZ / 10);
-		clocksource_register_khz(&clocksource_wdtest_ktime, 1000 * 1000);
-	}
+	clocksource_unregister(&clocksource_wdtest_ktime);
+
+	pr_info("Test: State %d percpu %d\n", which, percpu);
+
+	wdtest_state = which;
+	if (percpu)
+		wdtest_state |= WDTEST_INJECT_PERCPU;
+	wdtest_test_count = 0;
+	wdtest_last_ts = 0;
+
+	clocksource_wdtest_ktime.rating = 10;
+	clocksource_wdtest_ktime.flags = KTIME_FLAGS;
+	if (percpu)
+		clocksource_wdtest_ktime.flags |= CLOCK_SOURCE_WDTEST_PERCPU;
+	clocksource_register_khz(&clocksource_wdtest_ktime, 1000 * 1000);
 }
 
-/* Run the specified series of watchdog tests. */
-static int wdtest_func(void *arg)
+static bool wdtest_execute(enum wdtest_states which, bool percpu, unsigned int expect,
+			   unsigned long calls)
 {
-	unsigned long j1, j2;
-	int i, max_retries;
-	char *s;
+	wdtest_clocksource_reset(which, percpu);
 
-	schedule_timeout_uninterruptible(holdoff * HZ);
+	for (; READ_ONCE(wdtest_test_count) < calls; msleep(100)) {
+		unsigned int flags = READ_ONCE(clocksource_wdtest_ktime.flags);
 
-	/*
-	 * Verify that jiffies-like clocksources get the manually
-	 * specified uncertainty margin.
-	 */
-	pr_info("--- Verify jiffies-like uncertainty margin.\n");
-	__clocksource_register(&clocksource_wdtest_jiffies);
-	WARN_ON_ONCE(clocksource_wdtest_jiffies.uncertainty_margin != TICK_NSEC);
-
-	j1 = clocksource_wdtest_jiffies.read(&clocksource_wdtest_jiffies);
-	schedule_timeout_uninterruptible(HZ);
-	j2 = clocksource_wdtest_jiffies.read(&clocksource_wdtest_jiffies);
-	WARN_ON_ONCE(j1 == j2);
+		if (kthread_should_stop())
+			return false;
+
+		if (flags & CLOCK_SOURCE_UNSTABLE) {
+			if (expect & CLOCK_SOURCE_UNSTABLE)
+				return true;
+			pr_warn("Fail: Unexpected unstable\n");
+			return false;
+		}
+		if (flags & CLOCK_SOURCE_VALID_FOR_HRES) {
+			if (expect & CLOCK_SOURCE_VALID_FOR_HRES)
+				return true;
+			pr_warn("Fail: Unexpected valid for highres\n");
+			return false;
+		}
+	}
 
-	clocksource_unregister(&clocksource_wdtest_jiffies);
+	if (!expect)
+		return true;
 
-	/*
-	 * Verify that tsc-like clocksources are assigned a reasonable
-	 * uncertainty margin.
-	 */
-	pr_info("--- Verify tsc-like uncertainty margin.\n");
-	clocksource_register_khz(&clocksource_wdtest_ktime, 1000 * 1000);
-	WARN_ON_ONCE(clocksource_wdtest_ktime.uncertainty_margin < NSEC_PER_USEC);
+	pr_warn("Fail: Timed out\n");
+	return false;
+}
 
-	j1 = clocksource_wdtest_ktime.read(&clocksource_wdtest_ktime);
-	udelay(1);
-	j2 = clocksource_wdtest_ktime.read(&clocksource_wdtest_ktime);
-	pr_info("--- tsc-like times: %lu - %lu = %lu.\n", j2, j1, j2 - j1);
-	WARN_ONCE(time_before(j2, j1 + NSEC_PER_USEC),
-		  "Expected at least 1000ns, got %lu.\n", j2 - j1);
-
-	/* Verify tsc-like stability with various numbers of errors injected. */
-	max_retries = clocksource_get_max_watchdog_retry();
-	for (i = 0; i <= max_retries + 1; i++) {
-		if (i <= 1 && i < max_retries)
-			s = "";
-		else if (i <= max_retries)
-			s = ", expect message";
-		else
-			s = ", expect clock skew";
-		pr_info("--- Watchdog with %dx error injection, %d retries%s.\n", i, max_retries, s);
-		WRITE_ONCE(wdtest_ktime_read_ndelays, i);
-		schedule_timeout_uninterruptible(2 * HZ);
-		WARN_ON_ONCE(READ_ONCE(wdtest_ktime_read_ndelays));
-		WARN_ON_ONCE((i <= max_retries) !=
-			     !(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE));
-		wdtest_ktime_clocksource_reset();
-	}
+static bool wdtest_run(bool percpu)
+{
+	if (!wdtest_execute(WDTEST_INJECT_NONE, percpu, CLOCK_SOURCE_VALID_FOR_HRES, 8))
+		return false;
 
-	/* Verify tsc-like stability with clock-value-fuzz error injection. */
-	pr_info("--- Watchdog clock-value-fuzz error injection, expect clock skew and per-CPU mismatches.\n");
-	WRITE_ONCE(wdtest_ktime_read_fuzz, true);
-	schedule_timeout_uninterruptible(2 * HZ);
-	WARN_ON_ONCE(!(clocksource_wdtest_ktime.flags & CLOCK_SOURCE_UNSTABLE));
-	clocksource_verify_percpu(&clocksource_wdtest_ktime);
-	WRITE_ONCE(wdtest_ktime_read_fuzz, false);
+	if (!wdtest_execute(WDTEST_INJECT_DELAY, percpu, 0, 4))
+		return false;
 
-	clocksource_unregister(&clocksource_wdtest_ktime);
+	if (!wdtest_execute(WDTEST_INJECT_POSITIVE, percpu, CLOCK_SOURCE_UNSTABLE, 8))
+		return false;
 
-	pr_info("--- Done with test.\n");
-	return 0;
-}
+	if (!wdtest_execute(WDTEST_INJECT_NEGATIVE, percpu, CLOCK_SOURCE_UNSTABLE, 8))
+		return false;
 
-static void wdtest_print_module_parms(void)
-{
-	pr_alert("--- holdoff=%d\n", holdoff);
+	return true;
 }
 
-/* Cleanup function. */
-static void clocksource_wdtest_cleanup(void)
+static int wdtest_func(void *arg)
 {
+	clocksource_register_khz(&clocksource_wdtest_ktime, 1000 * 1000);
+	if (wdtest_run(false)) {
+		if (wdtest_run(true))
+			pr_info("Success: All tests passed\n");
+	}
+	clocksource_unregister(&clocksource_wdtest_ktime);
+
+	if (!IS_MODULE(CONFIG_TEST_CLOCKSOURCE_WATCHDOG))
+		return 0;
+
+	while (!kthread_should_stop())
+		schedule_timeout_interruptible(3600 * HZ);
+	return 0;
 }
 
+static struct task_struct *wdtest_thread;
+
 static int __init clocksource_wdtest_init(void)
 {
-	int ret = 0;
-
-	wdtest_print_module_parms();
+	struct task_struct *t = kthread_run(wdtest_func, NULL, "wdtest");
 
-	/* Create watchdog-test task. */
-	wdtest_task = kthread_run(wdtest_func, NULL, "wdtest");
-	if (IS_ERR(wdtest_task)) {
-		ret = PTR_ERR(wdtest_task);
-		pr_warn("%s: Failed to create wdtest kthread.\n", __func__);
-		wdtest_task = NULL;
-		return ret;
+	if (IS_ERR(t)) {
+		pr_warn("Failed to create wdtest kthread.\n");
+		return PTR_ERR(t);
 	}
-
+	wdtest_thread = t;
 	return 0;
 }
-
 module_init(clocksource_wdtest_init);
+
+static void clocksource_wdtest_cleanup(void)
+{
+	if (wdtest_thread)
+		kthread_stop(wdtest_thread);
+}
 module_exit(clocksource_wdtest_cleanup);
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -7,15 +7,17 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/device.h>
 #include <linux/clocksource.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/sched.h> /* for spin_unlock_irq() using preempt_count() m68k */
-#include <linux/tick.h>
 #include <linux/kthread.h>
+#include <linux/module.h>
 #include <linux/prandom.h>
-#include <linux/cpu.h>
+#include <linux/sched.h>
+#include <linux/tick.h>
+#include <linux/topology.h>
 
 #include "tick-internal.h"
 #include "timekeeping_internal.h"
@@ -107,48 +109,6 @@ static char override_name[CS_NAME_LEN];
 static int finished_booting;
 static u64 suspend_start;
 
-/*
- * Interval: 0.5sec.
- */
-#define WATCHDOG_INTERVAL (HZ >> 1)
-#define WATCHDOG_INTERVAL_MAX_NS ((2 * WATCHDOG_INTERVAL) * (NSEC_PER_SEC / HZ))
-
-/*
- * Threshold: 0.0312s, when doubled: 0.0625s.
- */
-#define WATCHDOG_THRESHOLD (NSEC_PER_SEC >> 5)
-
-/*
- * Maximum permissible delay between two readouts of the watchdog
- * clocksource surrounding a read of the clocksource being validated.
- * This delay could be due to SMIs, NMIs, or to VCPU preemptions.  Used as
- * a lower bound for cs->uncertainty_margin values when registering clocks.
- *
- * The default of 500 parts per million is based on NTP's limits.
- * If a clocksource is good enough for NTP, it is good enough for us!
- *
- * In other words, by default, even if a clocksource is extremely
- * precise (for example, with a sub-nanosecond period), the maximum
- * permissible skew between the clocksource watchdog and the clocksource
- * under test is not permitted to go below the 500ppm minimum defined
- * by MAX_SKEW_USEC.  This 500ppm minimum may be overridden using the
- * CLOCKSOURCE_WATCHDOG_MAX_SKEW_US Kconfig option.
- */
-#ifdef CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
-#define MAX_SKEW_USEC	CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
-#else
-#define MAX_SKEW_USEC	(125 * WATCHDOG_INTERVAL / HZ)
-#endif
-
-/*
- * Default for maximum permissible skew when cs->uncertainty_margin is
- * not specified, and the lower bound even when cs->uncertainty_margin
- * is specified.  This is also the default that is used when registering
- * clocks with unspecified cs->uncertainty_margin, so this macro is used
- * even in CONFIG_CLOCKSOURCE_WATCHDOG=n kernels.
- */
-#define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
-
 #ifdef CONFIG_CLOCKSOURCE_WATCHDOG
 static void clocksource_watchdog_work(struct work_struct *work);
 static void clocksource_select(void);
@@ -160,7 +120,39 @@ static DECLARE_WORK(watchdog_work, clock
 static DEFINE_SPINLOCK(watchdog_lock);
 static int watchdog_running;
 static atomic_t watchdog_reset_pending;
-static int64_t watchdog_max_interval;
+
+/* Watchdog interval: 0.5sec. */
+#define WATCHDOG_INTERVAL		(HZ >> 1)
+#define WATCHDOG_INTERVAL_NS		(WATCHDOG_INTERVAL * (NSEC_PER_SEC / HZ))
+
+/*
+ * Maximum time between two watchdog readouts for NUMA=n. On NUMA enabled
+ * systems the timeout is calculated from the numa distance.
+ */
+#define WATCHDOG_DEFAULT_TIMEOUT_NS	(50U * NSEC_PER_USEC)
+
+/*
+ * Remote timeout NUMA distance multiplier. The local distance is 10. The
+ * default remote distance is 20. ACPI tables provide more accurate numbers
+ * which are guaranteed to be greater than the local distance.
+ *
+ * This results in a 5us base value, which is equivalent to the above !NUMA
+ * default.
+ */
+#define WATCHDOG_NUMA_MULTIPLIER_NS	((u64)(WATCHDOG_DEFAULT_TIMEOUT_NS / LOCAL_DISTANCE))
+
+/* Limit the NUMA timeout in case the distance values are insanely big */
+#define WATCHDOG_NUMA_MAX_TIMEOUT_NS	((u64)(500U * NSEC_PER_USEC))
+
+/* Shift values to calculate the approximate $N ppm of a given delta. */
+#define SHIFT_500PPM			11
+#define SHIFT_4000PPM			8
+
+/* Number of attempts to read the watchdog */
+#define WATCHDOG_FREQ_RETRIES		3
+
+/* Five reads local and remote for inter CPU skew detection */
+#define WATCHDOG_REMOTE_MAX_SEQ		10
 
 static inline void clocksource_watchdog_lock(unsigned long *flags)
 {
@@ -241,204 +233,422 @@ void clocksource_mark_unstable(struct cl
 	spin_unlock_irqrestore(&watchdog_lock, flags);
 }
 
-static int verify_n_cpus = 8;
-module_param(verify_n_cpus, int, 0644);
+static inline void clocksource_reset_watchdog(void)
+{
+	struct clocksource *cs;
+
+	list_for_each_entry(cs, &watchdog_list, wd_list)
+		cs->flags &= ~CLOCK_SOURCE_WATCHDOG;
+}
+
+enum wd_result {
+	WD_SUCCESS,
+	WD_FREQ_NO_WATCHDOG,
+	WD_FREQ_TIMEOUT,
+	WD_FREQ_RESET,
+	WD_FREQ_SKEWED,
+	WD_CPU_TIMEOUT,
+	WD_CPU_SKEWED,
+};
 
-enum wd_read_status {
-	WD_READ_SUCCESS,
-	WD_READ_UNSTABLE,
-	WD_READ_SKIP
+struct watchdog_cpu_data {
+	/* Keep first as it is 32 byte aligned */
+	call_single_data_t	csd;
+	atomic_t		remote_inprogress;
+	enum wd_result		result;
+	u64			cpu_ts[2];
+	struct clocksource	*cs;
+	/* Ensure that the sequence is in a separate cache line */
+	atomic_t		seq ____cacheline_aligned;
+	/* Set by the control CPU according to NUMA distance */
+	u64			timeout_ns;
 };
 
-static enum wd_read_status cs_watchdog_read(struct clocksource *cs, u64 *csnow, u64 *wdnow)
+struct watchdog_data {
+	raw_spinlock_t	lock;
+	enum wd_result	result;
+
+	u64		wd_seq;
+	u64		wd_delta;
+	u64		cs_delta;
+	u64		cpu_ts[2];
+
+	unsigned int	curr_cpu;
+} ____cacheline_aligned_in_smp;
+
+static void watchdog_check_skew_remote(void *unused);
+
+static DEFINE_PER_CPU_ALIGNED(struct watchdog_cpu_data, watchdog_cpu_data) = {
+	.csd	= CSD_INIT(watchdog_check_skew_remote, NULL),
+};
+
+static struct watchdog_data watchdog_data = {
+	.lock	= __RAW_SPIN_LOCK_UNLOCKED(watchdog_data.lock),
+};
+
+static inline void watchdog_set_result(struct watchdog_cpu_data *wd, enum wd_result result)
 {
-	int64_t md = watchdog->uncertainty_margin;
-	unsigned int nretries, max_retries;
-	int64_t wd_delay, wd_seq_delay;
-	u64 wd_end, wd_end2;
-
-	max_retries = clocksource_get_max_watchdog_retry();
-	for (nretries = 0; nretries <= max_retries; nretries++) {
-		local_irq_disable();
-		*wdnow = watchdog->read(watchdog);
-		*csnow = cs->read(cs);
-		wd_end = watchdog->read(watchdog);
-		wd_end2 = watchdog->read(watchdog);
-		local_irq_enable();
-
-		wd_delay = cycles_to_nsec_safe(watchdog, *wdnow, wd_end);
-		if (wd_delay <= md + cs->uncertainty_margin) {
-			if (nretries > 1 && nretries >= max_retries) {
-				pr_warn("timekeeping watchdog on CPU%d: %s retried %d times before success\n",
-					smp_processor_id(), watchdog->name, nretries);
+	guard(raw_spinlock)(&watchdog_data.lock);
+	if (!wd->result) {
+		atomic_set(&wd->seq, WATCHDOG_REMOTE_MAX_SEQ);
+		WRITE_ONCE(wd->result, result);
+	}
+}
+
+/* Wait for the sequence number to hand over control. */
+static bool watchdog_wait_seq(struct watchdog_cpu_data *wd, u64 start, int seq)
+{
+	for(int cnt = 0; atomic_read(&wd->seq) < seq; cnt++) {
+		/* Bail if the other side set an error result */
+		if (READ_ONCE(wd->result) != WD_SUCCESS)
+			return false;
+
+		/* Prevent endless loops if the other CPU does not react. */
+		if (cnt == 5000) {
+			u64 nsecs = ktime_get_raw_fast_ns();
+
+			if (nsecs - start >=wd->timeout_ns) {
+				watchdog_set_result(wd, WD_CPU_TIMEOUT);
+				return false;
 			}
-			return WD_READ_SUCCESS;
+			cnt = 0;
 		}
+		cpu_relax();
+	}
+	return seq < WATCHDOG_REMOTE_MAX_SEQ;
+}
 
-		/*
-		 * Now compute delay in consecutive watchdog read to see if
-		 * there is too much external interferences that cause
-		 * significant delay in reading both clocksource and watchdog.
-		 *
-		 * If consecutive WD read-back delay > md, report
-		 * system busy, reinit the watchdog and skip the current
-		 * watchdog test.
-		 */
-		wd_seq_delay = cycles_to_nsec_safe(watchdog, wd_end, wd_end2);
-		if (wd_seq_delay > md)
-			goto skip_test;
+static void watchdog_check_skew(struct watchdog_cpu_data *wd, int index)
+{
+	u64 prev, now, delta, start = ktime_get_raw_fast_ns();
+	int local = index, remote = (index + 1) & 0x1;
+	struct clocksource *cs = wd->cs;
+
+	/* Set the local timestamp so that the first iteration works correctly */
+	wd->cpu_ts[local] = cs->read(cs);
+
+	/* Signal arrival */
+	atomic_inc(&wd->seq);
+
+	for (int seq = local + 2; seq < WATCHDOG_REMOTE_MAX_SEQ; seq += 2) {
+		if (!watchdog_wait_seq(wd, start, seq))
+			return;
+
+		/* Capture local timestamp before possible non-local coherency overhead */
+		now = cs->read(cs);
+
+		/* Store local timestamp before reading remote to limit coherency stalls */
+		wd->cpu_ts[local] = now;
+
+		prev = wd->cpu_ts[remote];
+		delta = (now - prev) & cs->mask;
+
+		if (delta > cs->max_raw_delta) {
+			watchdog_set_result(wd, WD_CPU_SKEWED);
+			return;
+		}
+
+		/* Hand over to the remote CPU */
+		atomic_inc(&wd->seq);
 	}
+}
 
-	pr_warn("timekeeping watchdog on CPU%d: wd-%s-wd excessive read-back delay of %lldns vs. limit of %ldns, wd-wd read-back delay only %lldns, attempt %d, marking %s unstable\n",
-		smp_processor_id(), cs->name, wd_delay, WATCHDOG_MAX_SKEW, wd_seq_delay, nretries, cs->name);
-	return WD_READ_UNSTABLE;
+static void watchdog_check_skew_remote(void *unused)
+{
+	struct watchdog_cpu_data *wd = this_cpu_ptr(&watchdog_cpu_data);
 
-skip_test:
-	pr_info("timekeeping watchdog on CPU%d: %s wd-wd read-back delay of %lldns\n",
-		smp_processor_id(), watchdog->name, wd_seq_delay);
-	pr_info("wd-%s-wd read-back delay of %lldns, clock-skew test skipped!\n",
-		cs->name, wd_delay);
-	return WD_READ_SKIP;
+	atomic_inc(&wd->remote_inprogress);
+	watchdog_check_skew(wd, 1);
+	atomic_dec(&wd->remote_inprogress);
 }
 
-static u64 csnow_mid;
-static cpumask_t cpus_ahead;
-static cpumask_t cpus_behind;
-static cpumask_t cpus_chosen;
+static inline bool wd_csd_locked(struct watchdog_cpu_data *wd)
+{
+	return READ_ONCE(wd->csd.node.u_flags) & CSD_FLAG_LOCK;
+}
 
-static void clocksource_verify_choose_cpus(void)
+/*
+ * This is only invoked for remote CPUs. See watchdog_check_cpu_skew().
+ */
+static inline u64 wd_get_remote_timeout(unsigned int remote_cpu)
 {
-	int cpu, i, n = verify_n_cpus;
+	unsigned int n1, n2;
+	u64 ns;
+
+	if (nr_node_ids == 1)
+		return WATCHDOG_DEFAULT_TIMEOUT_NS;
 
-	if (n < 0 || n >= num_online_cpus()) {
-		/* Check all of the CPUs. */
-		cpumask_copy(&cpus_chosen, cpu_online_mask);
-		cpumask_clear_cpu(smp_processor_id(), &cpus_chosen);
+	n1 = cpu_to_node(smp_processor_id());
+	n2 = cpu_to_node(remote_cpu);
+	ns = WATCHDOG_NUMA_MULTIPLIER_NS * node_distance(n1, n2);
+	return min(ns, WATCHDOG_NUMA_MAX_TIMEOUT_NS);
+}
+
+static void __watchdog_check_cpu_skew(struct clocksource *cs, unsigned int cpu)
+{
+	struct watchdog_cpu_data *wd;
+
+	wd = per_cpu_ptr(&watchdog_cpu_data, cpu);
+	if (atomic_read(&wd->remote_inprogress) || wd_csd_locked(wd)) {
+		watchdog_data.result = WD_CPU_TIMEOUT;
 		return;
 	}
 
-	/* If no checking desired, or no other CPU to check, leave. */
-	cpumask_clear(&cpus_chosen);
-	if (n == 0 || num_online_cpus() <= 1)
+	atomic_set(&wd->seq, 0);
+	wd->result = WD_SUCCESS;
+	wd->cs = cs;
+	/* Store the current CPU ID for the watchdog test unit */
+	cs->wd_cpu = smp_processor_id();
+
+	wd->timeout_ns = wd_get_remote_timeout(cpu);
+
+	/* Kick the remote CPU into the watchdog function */
+	if (WARN_ON_ONCE(smp_call_function_single_async(cpu, &wd->csd))) {
+		watchdog_data.result = WD_CPU_TIMEOUT;
 		return;
+	}
 
-	/* Make sure to select at least one CPU other than the current CPU. */
-	cpu = cpumask_any_but(cpu_online_mask, smp_processor_id());
-	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+	scoped_guard(irq)
+		watchdog_check_skew(wd, 0);
+
+	scoped_guard(raw_spinlock_irq, &watchdog_data.lock) {
+		watchdog_data.result = wd->result;
+		memcpy(watchdog_data.cpu_ts, wd->cpu_ts, sizeof(wd->cpu_ts));
+	}
+}
+
+static void watchdog_check_cpu_skew(struct clocksource *cs)
+{
+	unsigned int cpu = watchdog_data.curr_cpu;
+
+	cpu = cpumask_next_wrap(cpu, cpu_online_mask);
+	watchdog_data.curr_cpu = cpu;
+
+	/* Skip the current CPU. Handles num_online_cpus() == 1 as well */
+	if (cpu == smp_processor_id())
 		return;
-	cpumask_set_cpu(cpu, &cpus_chosen);
 
-	/* Force a sane value for the boot parameter. */
-	if (n > nr_cpu_ids)
-		n = nr_cpu_ids;
+	/* Don't interfere with the test mechanics */
+	if ((cs->flags & CLOCK_SOURCE_WDTEST) && !(cs->flags & CLOCK_SOURCE_WDTEST_PERCPU))
+		return;
+
+	__watchdog_check_cpu_skew(cs, cpu);
+}
+
+static bool watchdog_check_freq(struct clocksource *cs, bool reset_pending)
+{
+	unsigned int ppm_shift = SHIFT_4000PPM;
+	u64 wd_ts0, wd_ts1, cs_ts;
+
+	watchdog_data.result = WD_SUCCESS;
+	if (!watchdog) {
+		watchdog_data.result = WD_FREQ_NO_WATCHDOG;
+		return false;
+	}
+
+	if (cs->flags & CLOCK_SOURCE_WDTEST_PERCPU)
+		return true;
 
 	/*
-	 * Randomly select the specified number of CPUs.  If the same
-	 * CPU is selected multiple times, that CPU is checked only once,
-	 * and no replacement CPU is selected.  This gracefully handles
-	 * situations where verify_n_cpus is greater than the number of
-	 * CPUs that are currently online.
+	 * If both the clocksource and the watchdog claim they are
+	 * calibrated use 500ppm limit. Uncalibrated clocksources need a
+	 * larger allowance because thefirmware supplied frequencies can be
+	 * way off.
 	 */
-	for (i = 1; i < n; i++) {
-		cpu = cpumask_random(cpu_online_mask);
-		if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
-			cpumask_set_cpu(cpu, &cpus_chosen);
+	if (watchdog->flags & CLOCK_SOURCE_CALIBRATED && cs->flags & CLOCK_SOURCE_CALIBRATED)
+		ppm_shift = SHIFT_500PPM;
+
+	for (int retries = 0; retries < WATCHDOG_FREQ_RETRIES; retries++) {
+		s64 wd_last, cs_last, wd_seq, wd_delta, cs_delta, max_delta;
+
+		scoped_guard(irq) {
+			wd_ts0 = watchdog->read(watchdog);
+			cs_ts = cs->read(cs);
+			wd_ts1 = watchdog->read(watchdog);
+		}
+
+		wd_last = cs->wd_last;
+		cs_last = cs->cs_last;
+
+		/* Validate the watchdog readout window */
+		wd_seq = cycles_to_nsec_safe(watchdog, wd_ts0, wd_ts1);
+		if (wd_seq > WATCHDOG_READOUT_MAX_NS) {
+			/* Store for printout in case all retries fail */
+			watchdog_data.wd_seq = wd_seq;
+			continue;
+		}
+
+		/* Store for subsequent processing */
+		cs->wd_last = wd_ts0;
+		cs->cs_last = cs_ts;
+
+		/* First round or reset pending? */
+		if (!(cs->flags & CLOCK_SOURCE_WATCHDOG) || reset_pending)
+			goto reset;
+
+		/* Calculate the nanosecond deltas from the last invocation */
+		wd_delta = cycles_to_nsec_safe(watchdog, wd_last, wd_ts0);
+		cs_delta = cycles_to_nsec_safe(cs, cs_last, cs_ts);
+
+		watchdog_data.wd_delta = wd_delta;
+		watchdog_data.cs_delta = cs_delta;
+
+		/*
+		 * Ensure that the deltas are within the readout limits of
+		 * the clocksource and the watchdog. Long delays can cause
+		 * clocksources to overflow.
+		 */
+		max_delta = max(wd_delta, cs_delta);
+		if (max_delta > cs->max_idle_ns || max_delta > watchdog->max_idle_ns)
+			goto reset;
+
+		/*
+		 * Calculate and validate the skew against the allowed PPM
+		 * value of the maximum delta plus the watchdog readout
+		 * time.
+		 */
+		if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq)
+			return true;
+
+		watchdog_data.result = WD_FREQ_SKEWED;
+		return false;
 	}
 
-	/* Don't verify ourselves. */
-	cpumask_clear_cpu(smp_processor_id(), &cpus_chosen);
+	watchdog_data.result = WD_FREQ_TIMEOUT;
+	return false;
+
+reset:
+	cs->flags |= CLOCK_SOURCE_WATCHDOG;
+	watchdog_data.result = WD_FREQ_RESET;
+	return false;
 }
 
-static void clocksource_verify_one_cpu(void *csin)
+/* Synchronization for sched clock */
+static void clocksource_tick_stable(struct clocksource *cs)
 {
-	struct clocksource *cs = (struct clocksource *)csin;
-
-	csnow_mid = cs->read(cs);
+	if (cs == curr_clocksource && cs->tick_stable)
+		cs->tick_stable(cs);
 }
 
-void clocksource_verify_percpu(struct clocksource *cs)
+/* Conditionaly enable high resolution mode */
+static void clocksource_enable_highres(struct clocksource *cs)
 {
-	int64_t cs_nsec, cs_nsec_max = 0, cs_nsec_min = LLONG_MAX;
-	u64 csnow_begin, csnow_end;
-	int cpu, testcpu;
-	s64 delta;
+	if ((cs->flags & CLOCK_SOURCE_VALID_FOR_HRES) ||
+	    !(cs->flags & CLOCK_SOURCE_IS_CONTINUOUS) ||
+	    !watchdog || !(watchdog->flags & CLOCK_SOURCE_IS_CONTINUOUS))
+		return;
 
-	if (verify_n_cpus == 0)
+	/* Mark it valid for high-res. */
+	cs->flags |= CLOCK_SOURCE_VALID_FOR_HRES;
+
+	/*
+	 * Can't schedule work before finished_booting is
+	 * true. clocksource_done_booting will take care of it.
+	 */
+	if (!finished_booting)
 		return;
-	cpumask_clear(&cpus_ahead);
-	cpumask_clear(&cpus_behind);
-	cpus_read_lock();
-	migrate_disable();
-	clocksource_verify_choose_cpus();
-	if (cpumask_empty(&cpus_chosen)) {
-		migrate_enable();
-		cpus_read_unlock();
-		pr_warn("Not enough CPUs to check clocksource '%s'.\n", cs->name);
+
+	if (cs->flags & CLOCK_SOURCE_WDTEST)
 		return;
+
+	/*
+	 * If this is not the current clocksource let the watchdog thread
+	 * reselect it. Due to the change to high res this clocksource
+	 * might be preferred now. If it is the current clocksource let the
+	 * tick code know about that change.
+	 */
+	if (cs != curr_clocksource) {
+		cs->flags |= CLOCK_SOURCE_RESELECT;
+		schedule_work(&watchdog_work);
+	} else {
+		tick_clock_notify();
 	}
-	testcpu = smp_processor_id();
-	pr_info("Checking clocksource %s synchronization from CPU %d to CPUs %*pbl.\n",
-		cs->name, testcpu, cpumask_pr_args(&cpus_chosen));
-	preempt_disable();
-	for_each_cpu(cpu, &cpus_chosen) {
-		if (cpu == testcpu)
-			continue;
-		csnow_begin = cs->read(cs);
-		smp_call_function_single(cpu, clocksource_verify_one_cpu, cs, 1);
-		csnow_end = cs->read(cs);
-		delta = (s64)((csnow_mid - csnow_begin) & cs->mask);
-		if (delta < 0)
-			cpumask_set_cpu(cpu, &cpus_behind);
-		delta = (csnow_end - csnow_mid) & cs->mask;
-		if (delta < 0)
-			cpumask_set_cpu(cpu, &cpus_ahead);
-		cs_nsec = cycles_to_nsec_safe(cs, csnow_begin, csnow_end);
-		if (cs_nsec > cs_nsec_max)
-			cs_nsec_max = cs_nsec;
-		if (cs_nsec < cs_nsec_min)
-			cs_nsec_min = cs_nsec;
-	}
-	preempt_enable();
-	migrate_enable();
-	cpus_read_unlock();
-	if (!cpumask_empty(&cpus_ahead))
-		pr_warn("        CPUs %*pbl ahead of CPU %d for clocksource %s.\n",
-			cpumask_pr_args(&cpus_ahead), testcpu, cs->name);
-	if (!cpumask_empty(&cpus_behind))
-		pr_warn("        CPUs %*pbl behind CPU %d for clocksource %s.\n",
-			cpumask_pr_args(&cpus_behind), testcpu, cs->name);
-	pr_info("        CPU %d check durations %lldns - %lldns for clocksource %s.\n",
-		testcpu, cs_nsec_min, cs_nsec_max, cs->name);
 }
-EXPORT_SYMBOL_GPL(clocksource_verify_percpu);
 
-static inline void clocksource_reset_watchdog(void)
+static DEFINE_RATELIMIT_STATE(ratelimit_state, 5 * HZ, 2);
+
+static void watchdog_print_freq_timeout(struct clocksource *cs)
 {
-	struct clocksource *cs;
+	if (!__ratelimit(&ratelimit_state))
+		return;
+	pr_info("Watchdog %s read timed out. Readout sequence took: %lluns\n",
+		watchdog->name, watchdog_data.wd_seq);
+}
 
-	list_for_each_entry(cs, &watchdog_list, wd_list)
-		cs->flags &= ~CLOCK_SOURCE_WATCHDOG;
+static void watchdog_print_freq_skew(struct clocksource *cs)
+{
+	pr_warn("Marking clocksource %s unstable due to frequency skew\n", cs->name);
+	pr_warn("Watchdog    %20s interval: %16lluns\n", watchdog->name, watchdog_data.wd_delta);
+	pr_warn("Clocksource %20s interval: %16lluns\n", cs->name, watchdog_data.cs_delta);
+}
+
+static void watchdog_handle_remote_timeout(struct clocksource *cs)
+{
+	pr_info_once("Watchdog remote CPU %u read timed out\n", watchdog_data.curr_cpu);
+}
+
+static void watchdog_print_remote_skew(struct clocksource *cs)
+{
+	pr_warn("Marking clocksource %s unstable due to inter CPU skew\n", cs->name);
+	if (watchdog_data.cpu_ts[0] < watchdog_data.cpu_ts[1]) {
+		pr_warn("CPU%u %16llu < CPU%u %16llu (cycles)\n", smp_processor_id(),
+			watchdog_data.cpu_ts[0], watchdog_data.curr_cpu, watchdog_data.cpu_ts[1]);
+	} else {
+		pr_warn("CPU%u %16llu < CPU%u %16llu (cycles)\n", watchdog_data.curr_cpu,
+			watchdog_data.cpu_ts[1], smp_processor_id(), watchdog_data.cpu_ts[0]);
+	}
 }
 
+static void watchdog_check_result(struct clocksource *cs)
+{
+	switch (watchdog_data.result) {
+	case WD_SUCCESS:
+		clocksource_tick_stable(cs);
+		clocksource_enable_highres(cs);
+		return;
+
+	case WD_FREQ_TIMEOUT:
+		watchdog_print_freq_timeout(cs);
+		/* Try again later and invalidate the reference timestamps. */
+		cs->flags &= ~CLOCK_SOURCE_WATCHDOG;
+		return;
+
+	case WD_FREQ_NO_WATCHDOG:
+	case WD_FREQ_RESET:
+		/*
+		 * Nothing to do when the reference timestamps were reset
+		 * or no watchdog clocksource registered.
+		 */
+		return;
+
+	case WD_FREQ_SKEWED:
+		watchdog_print_freq_skew(cs);
+		break;
+
+	case WD_CPU_TIMEOUT:
+		/* Remote check timed out. Try again next cycle. */
+		watchdog_handle_remote_timeout(cs);
+		return;
+
+	case WD_CPU_SKEWED:
+		watchdog_print_remote_skew(cs);
+		break;
+	}
+	__clocksource_unstable(cs);
+}
 
 static void clocksource_watchdog(struct timer_list *unused)
 {
-	int64_t wd_nsec, cs_nsec, interval;
-	u64 csnow, wdnow, cslast, wdlast;
-	int next_cpu, reset_pending;
 	struct clocksource *cs;
-	enum wd_read_status read_ret;
-	unsigned long extra_wait = 0;
-	u32 md;
+	bool reset_pending;
 
-	spin_lock(&watchdog_lock);
+	guard(spinlock)(&watchdog_lock);
 	if (!watchdog_running)
-		goto out;
+		return;
 
 	reset_pending = atomic_read(&watchdog_reset_pending);
 
 	list_for_each_entry(cs, &watchdog_list, wd_list) {
-
 		/* Clocksource already marked unstable? */
 		if (cs->flags & CLOCK_SOURCE_UNSTABLE) {
 			if (finished_booting)
@@ -446,170 +656,40 @@ static void clocksource_watchdog(struct
 			continue;
 		}
 
-		read_ret = cs_watchdog_read(cs, &csnow, &wdnow);
-
-		if (read_ret == WD_READ_UNSTABLE) {
-			/* Clock readout unreliable, so give it up. */
-			__clocksource_unstable(cs);
-			continue;
-		}
-
-		/*
-		 * When WD_READ_SKIP is returned, it means the system is likely
-		 * under very heavy load, where the latency of reading
-		 * watchdog/clocksource is very big, and affect the accuracy of
-		 * watchdog check. So give system some space and suspend the
-		 * watchdog check for 5 minutes.
-		 */
-		if (read_ret == WD_READ_SKIP) {
-			/*
-			 * As the watchdog timer will be suspended, and
-			 * cs->last could keep unchanged for 5 minutes, reset
-			 * the counters.
-			 */
-			clocksource_reset_watchdog();
-			extra_wait = HZ * 300;
-			break;
-		}
-
-		/* Clocksource initialized ? */
-		if (!(cs->flags & CLOCK_SOURCE_WATCHDOG) ||
-		    atomic_read(&watchdog_reset_pending)) {
-			cs->flags |= CLOCK_SOURCE_WATCHDOG;
-			cs->wd_last = wdnow;
-			cs->cs_last = csnow;
-			continue;
-		}
-
-		wd_nsec = cycles_to_nsec_safe(watchdog, cs->wd_last, wdnow);
-		cs_nsec = cycles_to_nsec_safe(cs, cs->cs_last, csnow);
-		wdlast = cs->wd_last; /* save these in case we print them */
-		cslast = cs->cs_last;
-		cs->cs_last = csnow;
-		cs->wd_last = wdnow;
-
-		if (atomic_read(&watchdog_reset_pending))
-			continue;
-
-		/*
-		 * The processing of timer softirqs can get delayed (usually
-		 * on account of ksoftirqd not getting to run in a timely
-		 * manner), which causes the watchdog interval to stretch.
-		 * Skew detection may fail for longer watchdog intervals
-		 * on account of fixed margins being used.
-		 * Some clocksources, e.g. acpi_pm, cannot tolerate
-		 * watchdog intervals longer than a few seconds.
-		 */
-		interval = max(cs_nsec, wd_nsec);
-		if (unlikely(interval > WATCHDOG_INTERVAL_MAX_NS)) {
-			if (system_state > SYSTEM_SCHEDULING &&
-			    interval > 2 * watchdog_max_interval) {
-				watchdog_max_interval = interval;
-				pr_warn("Long readout interval, skipping watchdog check: cs_nsec: %lld wd_nsec: %lld\n",
-					cs_nsec, wd_nsec);
-			}
-			watchdog_timer.expires = jiffies;
-			continue;
+		/* Compare against watchdog clocksource if available */
+		if (watchdog_check_freq(cs, reset_pending)) {
+			/* Check for inter CPU skew */
+			watchdog_check_cpu_skew(cs);
 		}
 
-		/* Check the deviation from the watchdog clocksource. */
-		md = cs->uncertainty_margin + watchdog->uncertainty_margin;
-		if (abs(cs_nsec - wd_nsec) > md) {
-			s64 cs_wd_msec;
-			s64 wd_msec;
-			u32 wd_rem;
-
-			pr_warn("timekeeping watchdog on CPU%d: Marking clocksource '%s' as unstable because the skew is too large:\n",
-				smp_processor_id(), cs->name);
-			pr_warn("                      '%s' wd_nsec: %lld wd_now: %llx wd_last: %llx mask: %llx\n",
-				watchdog->name, wd_nsec, wdnow, wdlast, watchdog->mask);
-			pr_warn("                      '%s' cs_nsec: %lld cs_now: %llx cs_last: %llx mask: %llx\n",
-				cs->name, cs_nsec, csnow, cslast, cs->mask);
-			cs_wd_msec = div_s64_rem(cs_nsec - wd_nsec, 1000 * 1000, &wd_rem);
-			wd_msec = div_s64_rem(wd_nsec, 1000 * 1000, &wd_rem);
-			pr_warn("                      Clocksource '%s' skewed %lld ns (%lld ms) over watchdog '%s' interval of %lld ns (%lld ms)\n",
-				cs->name, cs_nsec - wd_nsec, cs_wd_msec, watchdog->name, wd_nsec, wd_msec);
-			if (curr_clocksource == cs)
-				pr_warn("                      '%s' is current clocksource.\n", cs->name);
-			else if (curr_clocksource)
-				pr_warn("                      '%s' (not '%s') is current clocksource.\n", curr_clocksource->name, cs->name);
-			else
-				pr_warn("                      No current clocksource.\n");
-			__clocksource_unstable(cs);
-			continue;
-		}
-
-		if (cs == curr_clocksource && cs->tick_stable)
-			cs->tick_stable(cs);
-
-		if (!(cs->flags & CLOCK_SOURCE_VALID_FOR_HRES) &&
-		    (cs->flags & CLOCK_SOURCE_IS_CONTINUOUS) &&
-		    (watchdog->flags & CLOCK_SOURCE_IS_CONTINUOUS)) {
-			/* Mark it valid for high-res. */
-			cs->flags |= CLOCK_SOURCE_VALID_FOR_HRES;
-
-			/*
-			 * clocksource_done_booting() will sort it if
-			 * finished_booting is not set yet.
-			 */
-			if (!finished_booting)
-				continue;
-
-			/*
-			 * If this is not the current clocksource let
-			 * the watchdog thread reselect it. Due to the
-			 * change to high res this clocksource might
-			 * be preferred now. If it is the current
-			 * clocksource let the tick code know about
-			 * that change.
-			 */
-			if (cs != curr_clocksource) {
-				cs->flags |= CLOCK_SOURCE_RESELECT;
-				schedule_work(&watchdog_work);
-			} else {
-				tick_clock_notify();
-			}
-		}
+		watchdog_check_result(cs);
 	}
 
-	/*
-	 * We only clear the watchdog_reset_pending, when we did a
-	 * full cycle through all clocksources.
-	 */
+	/* Clear after the full clocksource walk */
 	if (reset_pending)
 		atomic_dec(&watchdog_reset_pending);
 
-	/*
-	 * Cycle through CPUs to check if the CPUs stay synchronized
-	 * to each other.
-	 */
-	next_cpu = cpumask_next_wrap(raw_smp_processor_id(), cpu_online_mask);
-
-	/*
-	 * Arm timer if not already pending: could race with concurrent
-	 * pair clocksource_stop_watchdog() clocksource_start_watchdog().
-	 */
+	/* Could have been rearmed by a stop/start cycle */
 	if (!timer_pending(&watchdog_timer)) {
-		watchdog_timer.expires += WATCHDOG_INTERVAL + extra_wait;
-		add_timer_on(&watchdog_timer, next_cpu);
+		watchdog_timer.expires += WATCHDOG_INTERVAL;
+		add_timer_local(&watchdog_timer);
 	}
-out:
-	spin_unlock(&watchdog_lock);
 }
 
 static inline void clocksource_start_watchdog(void)
 {
-	if (watchdog_running || !watchdog || list_empty(&watchdog_list))
+	if (watchdog_running || list_empty(&watchdog_list))
 		return;
-	timer_setup(&watchdog_timer, clocksource_watchdog, 0);
+	timer_setup(&watchdog_timer, clocksource_watchdog, TIMER_PINNED);
 	watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
-	add_timer_on(&watchdog_timer, cpumask_first(cpu_online_mask));
+
+	add_timer_on(&watchdog_timer, get_boot_cpu_id());
 	watchdog_running = 1;
 }
 
 static inline void clocksource_stop_watchdog(void)
 {
-	if (!watchdog_running || (watchdog && !list_empty(&watchdog_list)))
+	if (!watchdog_running || !list_empty(&watchdog_list))
 		return;
 	timer_delete(&watchdog_timer);
 	watchdog_running = 0;
@@ -697,12 +777,6 @@ static int __clocksource_watchdog_kthrea
 	unsigned long flags;
 	int select = 0;
 
-	/* Do any required per-CPU skew verification. */
-	if (curr_clocksource &&
-	    curr_clocksource->flags & CLOCK_SOURCE_UNSTABLE &&
-	    curr_clocksource->flags & CLOCK_SOURCE_VERIFY_PERCPU)
-		clocksource_verify_percpu(curr_clocksource);
-
 	spin_lock_irqsave(&watchdog_lock, flags);
 	list_for_each_entry_safe(cs, tmp, &watchdog_list, wd_list) {
 		if (cs->flags & CLOCK_SOURCE_UNSTABLE) {
@@ -1023,6 +1097,8 @@ static struct clocksource *clocksource_f
 			continue;
 		if (oneshot && !(cs->flags & CLOCK_SOURCE_VALID_FOR_HRES))
 			continue;
+		if (cs->flags & CLOCK_SOURCE_WDTEST)
+			continue;
 		return cs;
 	}
 	return NULL;
@@ -1047,6 +1123,8 @@ static void __clocksource_select(bool sk
 			continue;
 		if (strcmp(cs->name, override_name) != 0)
 			continue;
+		if (cs->flags & CLOCK_SOURCE_WDTEST)
+			continue;
 		/*
 		 * Check to make sure we don't switch to a non-highres
 		 * capable clocksource if the tick code is in oneshot
@@ -1182,30 +1260,6 @@ void __clocksource_update_freq_scale(str
 	}
 
 	/*
-	 * If the uncertainty margin is not specified, calculate it.  If
-	 * both scale and freq are non-zero, calculate the clock period, but
-	 * bound below at 2*WATCHDOG_MAX_SKEW, that is, 500ppm by default.
-	 * However, if either of scale or freq is zero, be very conservative
-	 * and take the tens-of-milliseconds WATCHDOG_THRESHOLD value
-	 * for the uncertainty margin.  Allow stupidly small uncertainty
-	 * margins to be specified by the caller for testing purposes,
-	 * but warn to discourage production use of this capability.
-	 *
-	 * Bottom line:  The sum of the uncertainty margins of the
-	 * watchdog clocksource and the clocksource under test will be at
-	 * least 500ppm by default.  For more information, please see the
-	 * comment preceding CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US above.
-	 */
-	if (scale && freq && !cs->uncertainty_margin) {
-		cs->uncertainty_margin = NSEC_PER_SEC / (scale * freq);
-		if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
-			cs->uncertainty_margin = 2 * WATCHDOG_MAX_SKEW;
-	} else if (!cs->uncertainty_margin) {
-		cs->uncertainty_margin = WATCHDOG_THRESHOLD;
-	}
-	WARN_ON_ONCE(cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW);
-
-	/*
 	 * Ensure clocksources that have large 'mult' values don't overflow
 	 * when adjusted.
 	 */
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -32,7 +32,6 @@ static u64 jiffies_read(struct clocksour
 static struct clocksource clocksource_jiffies = {
 	.name			= "jiffies",
 	.rating			= 1, /* lowest valid rating*/
-	.uncertainty_margin	= 32 * NSEC_PER_MSEC,
 	.read			= jiffies_read,
 	.mask			= CLOCKSOURCE_MASK(32),
 	.mult			= TICK_NSEC << JIFFIES_SHIFT, /* details above */


