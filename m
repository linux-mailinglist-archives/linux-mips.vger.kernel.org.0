Return-Path: <linux-mips+bounces-14904-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sa8HE+bCIWqhNAEAu9opvQ
	(envelope-from <linux-mips+bounces-14904-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 20:24:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AE642929
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 20:24:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cOew3Jia;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14904-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-14904-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71EE23035098
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 18:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB863542CF;
	Thu,  4 Jun 2026 18:24:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACF537F8BA
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 18:24:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780597470; cv=none; b=Ap5f/ZttfYcCLnskUqaS2K/bZC2khBgJdRlBQh4Q645LU+gobLYOTqxfQb8AsrclXx38ZDgjxOve21nI5v2JLPSRxClS2kXnb8SWX3WqyWwdIDrfGRx3m7vI/eoIZo5HNL6UsfSeOw7pwD9mPHcR6e1SRbWz4Vh5X45GC3uZjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780597470; c=relaxed/simple;
	bh=90O4xwaiOrLK9AQmOIsYex+cu6SToyEyb6ORubBfVgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cowy8+47PgzMOGm5cVjZ7E3CT0a/S3c+GLeVGooQQiFWEXnJ0vTaCXZx0PiRslmbpNhlQKP1+n6Oa0SOgMg/Ok6veewn+QIGi7gypC4Hc/SC7vZIgEmbzNMElMe105Vj/h60Jvu+2rajF2+c6NVspVTuNey1cmedtF1h+Is/KMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOew3Jia; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so9127735e9.0
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780597468; x=1781202268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KY7xVSejKqSeN27Js6FROD/NEXBGbGSvmQ/6Y7FcvD0=;
        b=cOew3Jiali9TKED0UdpwQVTABHiMihZLrieGauZRMSt5KnnHLAVAavl3+jXduKUhdp
         pK58SbF1YvVy2fNa1DNUOQ/Or5ANVKSF1QgME8tBf9e8EXQ+xBfqSdpcCQLrNp4RRQLf
         NlH12Pn1WX9Z84OhAsL0CTViSoZLubxvm++rJc42z91UGz7/TqpTQW/Q0Rj08k8p2VrB
         tX73NaPAFAB68yW5mj98PuysdyYkg0Lepj1A6oF4IXANGnDrUM0VHrCevA29CVFqN5Ut
         ES2YJMvJnbtnYF7iMuKkdCF7Fb1gqcpbyjWy6yD5sfLfkJIYi07JMHQ5Rq1bf/UCDuTW
         q7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780597468; x=1781202268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY7xVSejKqSeN27Js6FROD/NEXBGbGSvmQ/6Y7FcvD0=;
        b=LUXysbxWiEzmYeF+IDny1Rw5U/0E22kyBZ5gUbnvA5Ol03+i2WEtSdU0seBiZeK20c
         2D1wdNUDIelkJSIi+TAKKcaFL+6+H0wtZgeQncl4xKvwWl6zPnOqHV+vgrIfbP2/3eEj
         TR3oD3eOojlqywlJR7WYe3/75XH7rogWb7tel5Uhafnpn+bAGhPtxmG+8M0z9DaA2qYt
         tcnqwUrozrQkRmFuAVwSdtG8FqxHm7IbC8vffXbY3SByVyER1jpQCZCCd8nRcoY2STta
         NO+uiMWXbitq2Lpo0gyg7Ob2iDZzW0aECj40re1VOwKVu9V3tV4oOZzGO+dsMLPYcHYv
         u8JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+R8TBZbLfAee8n8Ve3bEqwwocO36purRWACJFVrp3Osek40QFLPJruEVVYmY2iGuFg8/9QKYe8p68a@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQ6W9W7ZR42O5tsSgA6WBw1Es6Z/QiSRb9C5J66bmZwWpfR8g
	p+arMEcGDLAzHdB1acNdlL3hOSgGplSkvuNLPuGM6clT+4+8c+8vOsTZ
X-Gm-Gg: Acq92OFIkCaZ/VSGTq1hBWa4SyGJdz5LjjIOPT2pG+KeFtZSARqqIC3EbUIqVWycDQ8
	ApwoEIYS7PhodkVpfCdUjvHgXGRtmPciC8KnVQa7jz6X20G2RmNiSyoNOFJL2GGlAeEvTVAigQ9
	GMxoqdLx59Z7DNmRhiFxKZuNHeNWOs7436uq3Xkx0WUuxLAfYaY5QzXKE9skENzyRi/ofz/7KJO
	25HFKE31nAiU3ZynPELvz548IFN+yOs8Q0BDbjRIobgRoShOOY2KjZGFxDDgfV/hAVGtIT8PcUd
	ghl0Ad3ofyVjDYcwWTZZjpmMvQB4Y4C72uhHVKStF4AXQZGvHJZeTP864VtOi1K5+1HSBNGR42P
	tnhWXHWXPaQk0rfnJ3fgXGlU4MeGM5UwDIPv3+3yht89b60ZVHiEVf8GKnxfgHxNOo2JimT19N0
	a5dLFXNqZ3gEVEM5/kpdb5OOgVQaq8J8q4mXlB8fhEDQCkGOw=
X-Received: by 2002:a05:600c:1f96:b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-490b5e7962dmr143876325e9.3.1780597467554;
        Thu, 04 Jun 2026 11:24:27 -0700 (PDT)
Received: from builder ([2001:9e8:f12d:8916:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd663sm100702395e9.10.2026.06.04.11.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:24:27 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Date: Thu,  4 Jun 2026 18:24:07 +0000
Message-ID: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,goodmis.org,linux.dev,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14904-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jelonek.jonas@gmail.com,m:stable@vger.kernel.org,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA2AE642929

smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
marks the CPU offline for the scheduler via set_cpu_online(false) but
never informs RCU, so RCU keeps expecting a quiescent state from CPUs
that are now spinning forever with interrupts disabled.

As long as nothing waits for an RCU grace period after smp_send_stop()
this is harmless, which is why it went unnoticed. Since commit
91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
however, irq_work_sync() calls synchronize_rcu() on architectures without
an irq_work self-IPI, i.e. where arch_irq_work_has_interrupt() returns
false. That is the asm-generic default used by MIPS. Any irq_work_sync()
issued in the reboot/shutdown path after smp_send_stop() then blocks on
a grace period that can never complete, hanging the reboot:

  WARNING: CPU: 0 PID: 15 at kernel/irq_work.c:144 irq_work_queue_on
  ...
  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
  rcu: Offline CPU 1 blocking current GP.
  rcu: Offline CPU 2 blocking current GP.
  rcu: Offline CPU 3 blocking current GP.

This issue popped up during kernel bump downstream in OpenWrt from
6.18.33 to 6.18.34, since the suspected change has been backported to
6.18 stable branch [1].

Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
generic CPU-hotplug offline path (and arm64's stop handling), so RCU stops
waiting on the parked CPUs and grace periods can still complete.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.18.y&id=18c0456ea2615b1a743a6db739c74411c3b42bc6

Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
CC: stable@vger.kernel.org
Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 4868e79f3b30..0f28b4a62e72 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -20,6 +20,7 @@
 #include <linux/sched/mm.h>
 #include <linux/cpumask.h>
 #include <linux/cpu.h>
+#include <linux/rcupdate.h>
 #include <linux/err.h>
 #include <linux/ftrace.h>
 #include <linux/irqdomain.h>
@@ -422,6 +423,7 @@ static void stop_this_cpu(void *dummy)
 	set_cpu_online(smp_processor_id(), false);
 	calculate_cpu_foreign_map();
 	local_irq_disable();
+	rcutree_report_cpu_dead();
 	while (1);
 }
 
-- 
2.51.0


