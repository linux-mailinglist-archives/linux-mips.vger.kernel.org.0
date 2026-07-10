Return-Path: <linux-mips+bounces-15763-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7h1nER14UWpQFQMAu9opvQ
	(envelope-from <linux-mips+bounces-15763-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 00:54:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA573FA4D
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 00:54:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AcMiigQW;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15763-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15763-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B8C304BE66
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 22:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D422240863A;
	Fri, 10 Jul 2026 22:52:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5A409272
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 22:51:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723920; cv=none; b=ta1Ywtazl6BlyL8MEznU/icbUIMsgp8ebLR5Y+kT0DmXSR78vbmKkUeEDRQ4u+Gnpa5gdJp8ORzKjH/a6tLA+apVcMUAyxaJemEdQmPteMdVUdvDK/6FeSmeGy7ZwHERXEffe2KdegWyZqqFw3kzjQmX3N4ZLcR09CoXrSONQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723920; c=relaxed/simple;
	bh=msfYOx+Zqjv92lm+ZFQuv8Qn/QSRo9O+2R4oJIc9aJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cxj0kTqcNfGj3X3XOxbDp9BN95xlYwmWpDmyAv0O0o94EkTkVx3ATHGOcd0/2ReEfbHfZwPgbcaM4jxRBG8eDFj4CXlbXdbTlHag7okJnXFsXLnPX60IxuLL4LK8wdaVEfpLyieDgWvgEd6oBxDs2XQao3mUmGg1XHUZV7OUfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcMiigQW; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso12141225e9.3
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783723915; x=1784328715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIt4xJM7May3OoqONNDUUrvaC6hGrOtKAK/QmIsJm8E=;
        b=AcMiigQW4qWmYbvKwNDxoEQKmT+C7u2BCFkYeZ2QwvVAlP9aG/qQbpYHdCg+6HiGLu
         sE5J4wdIbzk8LCPok/7w+EMya8r2MlX31isXcplZnqpUTdGFC//tU/F3VVwWRjObU9aH
         rEfObKwCFN62u4qBR/Cmj5Ddu3k11Z8n6TdpEXbwvwDWGBOpk5ykNC+q/f29ISTT/lbc
         JU/3EnwuTv4hW/F1+UxveKsZoG8HaI1Y1rS7YbfitppA8/3uErXrG9y0JH0IFmSUSp2A
         /qygPUn9sVPFMqhpa+jk2NdjSAr3sDFlgptkbkuyB9OTg45kFl0q7R7Dd5PHmdoOsEVz
         +zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783723915; x=1784328715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIt4xJM7May3OoqONNDUUrvaC6hGrOtKAK/QmIsJm8E=;
        b=J/RLyMhu47VPxS6utsPEqVBdrR9CEXfjA7NgsUfhYMkhCEthekclM63Bamvf3/gXln
         BKhcDXLb7WErzo1szmdvqZrik2xF/sHQ5qtNJhoFoqaEAAFPcXmMP/HS7XXl03fKPHwV
         I69nvr6kqeVzGmCi8mSCW/9+1lb6OXPk8pMSKgg1UlBD5+WVhamxFYPJ6QnRXfTDZYcX
         aw0eMf0CSfZ1Nnjp45u3wDfBJ9yevlOihVzdBo+fyWJk4ydgDrbgL6Sj3OwZmZszvaQe
         Rt88DqOYL0GDkZGkI82HoFk7FeDp6cxV5JhDzOQ5VSzvueHLoh29FopfvNcRf0hMhkbo
         JHjg==
X-Forwarded-Encrypted: i=1; AHgh+RoN0jyPUrG2lAzZ7Y0hp8yKetRfv4RiV/brNhk7eVJ4Znqjf05whI67/0UvqTxmoqC12NXU6Fl9UE6U@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbkvoP1TS0Ub6u5CtTrv6ppryt7AK7NXvt0GgzGBbHYwuCT+q
	HmKq5e7CTY/PzcqWW9//7+25mBmKBER0ymnnyLOsJtZyqPugXBuif+z4ZDH5sA==
X-Gm-Gg: AfdE7cmQskQ37ER7eJqkPhDqWXuaIA5D2PHDgxTMEtttjBRZ63NZydRv+VKtr3W7wvw
	w9e3gD4yGd4GbFTzvorwAFywtUE16Y2dOEedgyUVDKsKXkYuq+80w66n1hSfo9cKyAFvklJXV73
	k2/ykROp6uaD2kmH7KxNOBc8d/zAq4LSFLQNd1jF9lGs2CEHJqyZz8qFyhW/Vz2XKxFpSd2xHAA
	smPbJ83Q8RQ3IB/SgqHJn8s95xW+9D/qSyJeflobqt7vKB1F8vTIVxPB8I+ilTJyUIJhdSaa0jy
	UlveQvrrsj0n5utRKyqfx3fPuxqWplQA8iL8rXO7mBIXjXaRUiSKe39fm/lmfBOmeDfU2LGBotV
	PchyH/5U5oNNiJO7QucFhkPzrnqaXMu1Dh6i0BwZv2OQZ+FXyD8OlMWBj8Dd8sMujmtvdPvC3B2
	aWFZz1APzl4IrUDlY=
X-Received: by 2002:a05:600c:4f8a:b0:493:9cb3:53fc with SMTP id 5b1f17b1804b1-493f87e72cdmr5820095e9.11.1783723914816;
        Fri, 10 Jul 2026 15:51:54 -0700 (PDT)
Received: from builder ([2001:9e8:f113:9116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a38b19sm68297225e9.0.2026.07.10.15.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:51:54 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: stable@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH 6.1.y] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Date: Fri, 10 Jul 2026 22:51:47 +0000
Message-ID: <20260710225147.24574-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,linutronix.de,kernel.org,linux.dev,vger.kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15763-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:tsbogend@alpha.franken.de,m:bigeasy@linutronix.de,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:jelonek.jonas@gmail.com,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EBA573FA4D

commit 9f3f3bdc6d9dac1a5a8262ee7ad0f2ff1527a7e7 upstream.

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

This issue was noticed on several Realtek MIPS switch SoCs (MIPS
interAptiv) and came up during kernel bump downstream in OpenWrt from
6.18.33 to 6.18.34, after the backport of the patch to the 6.18 stable
branch. The patch also has been backported all the way back to 6.1.

Call rcu_report_dead() once interrupts are disabled, mirroring the
generic CPU-hotplug offline path, so RCU stops waiting on the parked CPUs
and grace periods can still complete. MIPS shuts down all CPUs here
without going through the CPU-hotplug mechanism, so this report is not
otherwise issued. Reporting a dying CPU to RCU outside the regular hotplug
offline path is not unprecedented: arm64 does the same in cpu_die_early().
There it is an exception for a CPU that was coming online and is aborting
bringup, rather than the default shutdown action as on MIPS.

Note: this differs from the upstream commit in that it calls
rcu_report_dead(smp_processor_id()) instead of rcutree_report_cpu_dead().
The latter, along with the rcutree_report_cpu_dead() name, was introduced
by commit 448e9f34d91d ("rcu: Standardize explicit CPU-hotplug calls")
in v6.7; on this kernel the equivalent function is still named
rcu_report_dead() and takes an explicit CPU argument.

Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 arch/mips/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 002c91fcb842..06030533bcfa 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -19,6 +19,7 @@
 #include <linux/sched/mm.h>
 #include <linux/cpumask.h>
 #include <linux/cpu.h>
+#include <linux/rcupdate.h>
 #include <linux/err.h>
 #include <linux/ftrace.h>
 #include <linux/irqdomain.h>
@@ -392,6 +393,7 @@ static void stop_this_cpu(void *dummy)
 	set_cpu_online(smp_processor_id(), false);
 	calculate_cpu_foreign_map();
 	local_irq_disable();
+	rcu_report_dead(smp_processor_id());
 	while (1);
 }
 

base-commit: 090666d3cc906176fc47363520eb746b94c7d578
-- 
2.53.0


