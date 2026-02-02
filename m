Return-Path: <linux-mips+bounces-13092-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QChwNiCKgGnO9wIAu9opvQ
	(envelope-from <linux-mips+bounces-13092-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 12:27:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B86ECCB9CD
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 12:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A995300616C
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 11:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CDC34E754;
	Mon,  2 Feb 2026 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVDSVaG5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8A1B808;
	Mon,  2 Feb 2026 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031643; cv=none; b=ZvJluXCCBp92Ck91xl8LjMYTgLXEnDQIFj2o06FpWZKhLXPwnFY0t7ecKEU8Gp6NS3bX/4StKy1dh+TnsuRpH6LPFt0JWi6/umFoH9h4c/pLqIdHj5/Pm34X9HDGNLdaLv6+srOGwknrh4JkQXvaLRrmEwrtSefOeEcoqeXQ8aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031643; c=relaxed/simple;
	bh=3R5QQnBBB0vB5QimWQ0M/25ELK2ClHBBPXh5VdpSOb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rqv3/SbJAUb6mU6g+siobWUljrLGxEhvI8Bbyc9+Mme+Be3r0e7da4clXG1pwCr9TpcBQKc8yW7z0gBjym6PNdgdCpg4/VNF38C/cbXZmUvEQw/MmmnYGTmwmUSHeqxhgFjorTSw2LUakc3R1+aovvaf8oStG7grVqwaG67BYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVDSVaG5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAD0C116C6;
	Mon,  2 Feb 2026 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770031643;
	bh=3R5QQnBBB0vB5QimWQ0M/25ELK2ClHBBPXh5VdpSOb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GVDSVaG5RWFRi3HGHn0mDxdcsOYrjoAIxDI17rLYPLM38jm603qboZOU/iELe0hCh
	 F1cOnqoBTb/WRrisYsMr2IEgs1VAWZfcoXuNTN3cDkTqdOcmyhecyy+ymrgiwfOMUx
	 V9+E6luPLp6uMAEfcf++6OneKsZQOfiMEsRa/9rxjhILADvznKAQ26F4Y2Y/SUW24N
	 iNR+JR9Wk7ibBTuEiqVM+EmHmusX6a5d8B5PZrOlgbHFyIA0KoyILTFpNWi67S0Al9
	 QdYLHy2xDfWc6h0rwkMLhrelKXN13f+i5kaApQyvp3M18M8QS9JPdsoVIwTPonTD7V
	 S+ZICPvQYcnfQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner
 <jwiesner@suse.de>, Scott Hamilton <scott.hamilton@eviden.com>, Helge
 Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
In-Reply-To: <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
Date: Mon, 02 Feb 2026 12:27:19 +0100
Message-ID: <87jywvfkrs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13092-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,eviden.com,gmx.de,alpha.franken.de];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B86ECCB9CD
X-Rspamd-Action: no action

On Mon, Feb 02 2026 at 14:45, Daniel J. Blueman wrote:
> Great work Thomas!

Thank you!

> On Sat, 24 Jan 2026 at 07:18, Thomas Gleixner <tglx@kernel.org> wrote:
>>   2) Compare the TSCs of the other CPUs in a round robin fashion against
>>      the boot CPU in the same way the TSC synchronization on CPU hotplug
>>      works. This still can suffer from delayed reaction of the remote CPU
>>      to the SMP function call and the latency of the control variable cache
>>      line. But this latency is not affecting correctness. It only affects
>>      the accuracy. With low contention the readout latency is in the low
>>      nanoseconds range, which detects even slight skews between CPUs. Under
>>      high contention this becomes obviously less accurate, but still
>>      detects slow skews reliably as it solely relies on subsequent readouts
>>      being monotonically increasing. It just can take slightly longer to
>>      detect the issue.
>
> On x86, I agree iterating at a per-thread level is needed rather than
> one thread per NUMA node, since the TSC_ADJUST architectural MSR is
> per-core and we want detection completeness.

It's per thread not per core.

But that aside the TSC_ADJUST integrity is already self monitored
independent of the watchdog. See tsc_verify_tsc_adjust(). So we might
get away with a per socket check as all threads of a socket are fed by
the same ART (Always Running Timer) and the main concern is that the
ARTs of sockets drift apart especially on systems with more than four
sockets.

> On other architectures, completeness could be traded off for lower
> overhead if it is guaranteed each processor thread uses the same clock
> value, though this is actually is what the clocksource watchdog seeks
> to validate, so agreed on the current approach there too.

x86 is the only one which actually utilizes the watchdog.

>> +/* Maximum time between two watchdog readouts */
>> +#define WATCHDOG_READOUT_MAX_NS                (50 * NSEC_PER_USEC)

> At 1920 threads, the default timeout threshold of 20us triggers
> continuous warnings at idle, however 1000us causes none under an 8
> hour adverse workload [1]; no HPET fallback was seen. A 500us
> threshold causes a low rate of timeouts [2] (overhead amplified due to
> retries), thus 1000us adds margin and should prevent retries.

Right. Idle is definitely an issue when the remote CPU is in a deep
C-state.

My concern is that the control CPU might spin there for a millisecond
with interrupts disabled, which is not really desired especially not on
RT systems.

Something like the untested below delta patch should work.

Thanks,

        tglx
---
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
@@ -124,7 +125,8 @@ static atomic_t watchdog_reset_pending;
 #define WATCHDOG_INTERVAL_NS		(WATCHDOG_INTERVAL * (NSEC_PER_SEC / HZ))
 
 /* Maximum time between two watchdog readouts */
-#define WATCHDOG_READOUT_MAX_NS		(50 * NSEC_PER_USEC)
+#define WATCHDOG_READOUT_MAX_US		50
+#define WATCHDOG_READOUT_MAX_NS		(WATCHDOG_READOUT_MAX_US * NSEC_PER_USEC)
 
 /* Shift values to calculate the approximate $N ppm of a given delta. */
 #define SHIFT_500PPM			11
@@ -136,6 +138,9 @@ static atomic_t watchdog_reset_pending;
 /* Five reads local and remote for inter CPU skew detection */
 #define WATCHDOG_REMOTE_MAX_SEQ		10
 
+/* Number of attempts to synchronize with a remote CPU */
+#define WATCHDOG_REMOTE_RETRIES		10
+
 static inline void clocksource_watchdog_lock(unsigned long *flags)
 {
 	spin_lock_irqsave(&watchdog_lock, *flags);
@@ -336,22 +341,17 @@ static void watchdog_check_skew_remote(v
 	atomic_dec(&wd->remote_inprogress);
 }
 
-static void watchdog_check_cpu_skew(struct clocksource *cs)
+static inline bool wd_csd_locked(struct watchdog_cpu_data *wd)
 {
-	unsigned int cpu = cpumask_next_wrap(watchdog_data.curr_cpu, cpu_online_mask);
-	struct watchdog_cpu_data *wd;
-
-	watchdog_data.curr_cpu = cpu;
-	/* Skip the current CPU. Handles num_online_cpus() == 1 as well */
-	if (cpu == smp_processor_id())
-		return;
+	return READ_ONCE(wd->csd.node.u_flags) & CSD_FLAG_LOCK;
+}
 
-	/* Don't interfere with the test mechanics */
-	if ((cs->flags & CLOCK_SOURCE_WDTEST) && !(cs->flags & CLOCK_SOURCE_WDTEST_PERCPU))
-		return;
+static void __watchdog_check_cpu_skew(struct clocksource *cs, unsigned int cpu)
+{
+	struct watchdog_cpu_data *wd;
 
 	wd = per_cpu_ptr(&watchdog_cpu_data, cpu);
-	if (atomic_read(&wd->remote_inprogress)) {
+	if (atomic_read(&wd->remote_inprogress) || wd_csd_locked(wd)) {
 		watchdog_data.result = WD_CPU_TIMEOUT;
 		return;
 	}
@@ -377,6 +377,29 @@ static void watchdog_check_cpu_skew(stru
 	}
 }
 
+static void watchdog_check_cpu_skew(struct clocksource *cs)
+{
+	unsigned int cpu = cpumask_next_wrap(watchdog_data.curr_cpu, cpu_online_mask);
+
+	watchdog_data.curr_cpu = cpu;
+	/* Skip the current CPU. Handles num_online_cpus() == 1 as well */
+	if (cpu == smp_processor_id())
+		return;
+
+	/* Don't interfere with the test mechanics */
+	if ((cs->flags & CLOCK_SOURCE_WDTEST) && !(cs->flags & CLOCK_SOURCE_WDTEST_PERCPU))
+		return;
+
+	for (int i = 0; i < WATCHDOG_REMOTE_RETRIES; i++) {
+		__watchdog_check_cpu_skew(cs, cpu);
+
+		if (watchdog_data.result != WD_CPU_TIMEOUT)
+			return;
+
+		udelay(WATCHDOG_READOUT_MAX_US);
+	}
+}
+
 static bool watchdog_check_freq(struct clocksource *cs, bool reset_pending)
 {
 	unsigned int ppm_shift = SHIFT_4000PPM;

