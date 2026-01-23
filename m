Return-Path: <linux-mips+bounces-12992-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PaKDaMBdGkb1QAAu9opvQ
	(envelope-from <linux-mips+bounces-12992-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 00:17:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB17B6AC
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 00:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 308BA300D625
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 23:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA34015ECCC;
	Fri, 23 Jan 2026 23:17:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D62286323;
	Fri, 23 Jan 2026 23:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210270; cv=none; b=bg7W8wB7Tg1VvwFBeiP3asVxznLSAF5W+5pW6aoupcqdWGN+/vcYd/H7fADuLaHl7Rfs1UJ/ny68Gjc2079R/0gsBIzFb0NSlXczpu+EuhOObiH4Yd6NkbFZfjm6HVNiTYJegD4AtvKJS7KLm9NVbpzuuV42hK/ng/x6Ptyf96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210270; c=relaxed/simple;
	bh=TT6viFLewVpeNE7l5kw1sgQsdq6YVngbak/2JVfDQ6k=;
	h=Date:Message-ID:From:To:Cc:Subject; b=hxaIf09LlPb/rb1Q1QOzlGKOViGnnOoN7Tbzuj/8NxzY2JbhBEELOXgc8u8Mtc2Ak5oaYZdrBIHwZ2UnsH956eZ7wK4vzxYYpGvjOGEfuRcUI1XghWtLrW2xq6GzhFIGqK+sXKrYBYbHHs/8aqoj8D2mNVueeGkSFdyJ2U3OXxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linutronix.de; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 24 Jan 2026 00:17:46 +0100
Message-ID: <20260123230651.688818373@kernel.org>
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 John Stultz <jstultz@google.com>,
 Waiman Long <longman@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jiri Wiesner <jwiesner@suse.de>,
 Daniel J Blueman <daniel@quora.org>,
 Scott Hamilton <scott.hamilton@eviden.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org
Subject: [patch 0/5] clocksource: Rewrite clocksource watchdog and related
 cleanups
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-12992-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,quora.org,eviden.com,gmx.de,vger.kernel.org,alpha.franken.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.938];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CDB17B6AC
X-Rspamd-Action: no action

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

  - Fixed margins based on magic assumptions, which do not work when the
    watchdog interval diverges too much.

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
     one and validates the result against the expectation.

The series also cleans up random places which set the watchdog bits without
actually ever using them. Right now the only architecture which uses the
clocksource watchdog is x86.

The series is based on

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core

and also available from git:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/clocksource

Thanks,

	tglx
---
 Documentation/admin-guide/kernel-parameters.txt |    7 
 arch/mips/Kconfig                               |    1 
 arch/parisc/kernel/time.c                       |    5 
 arch/x86/include/asm/time.h                     |    1 
 arch/x86/kernel/hpet.c                          |    4 
 arch/x86/kernel/tsc.c                           |   61 --
 drivers/clocksource/Kconfig                     |    1 
 drivers/clocksource/acpi_pm.c                   |    4 
 include/linux/clocksource.h                     |   24 
 kernel/time/Kconfig                             |   12 
 kernel/time/clocksource-wdtest.c                |  268 ++++----
 kernel/time/clocksource.c                       |  731 ++++++++++++------------
 kernel/time/jiffies.c                           |    1 
 13 files changed, 536 insertions(+), 584 deletions(-)

