Return-Path: <linux-mips+bounces-15762-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0lmyIlp0UWqdFAMAu9opvQ
	(envelope-from <linux-mips+bounces-15762-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 00:38:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D643473F962
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 00:38:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nQAMCVcv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15762-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15762-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B7A300A61A
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 22:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C553CF021;
	Fri, 10 Jul 2026 22:36:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1EE38B14C
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 22:36:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723007; cv=none; b=qRb/YZ5Y5BgjBOcrhajR3/aU42vrYgw19/iJ1sNvg/QK4LUz547cEyAhGJjApeB47Faa7nvU5UwoED2/3CM7Br5iWsXFSc/ZPa4RnU1urv+w5I87MBO/5K5WF0CPCIyF9Tmc1G3M8ag4aONcYRiazCoRyFDEXSgFOeT6Psw3YaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723007; c=relaxed/simple;
	bh=d5m5+qwZ1g7FSuIF5EIQ39lSOUY3CG0XddPOToipTfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3MIMvHNmPXWS6oI4jUKxdJpphNghmAPsg6EtbYtYpvpNwSbNYhnk+Ghf8/GClEeHMQ/MEB3XhdkNNl1z/kMK5KQ7cUL2TvGDOXMlGqk+E9z/rJKwDZGVf4PJOQmoGGERC7Mz7iCT6+NPwshJF82C6bRNGpxNUXH7/HzeRrSOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQAMCVcv; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b27c7451so30993035e9.0
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783723004; x=1784327804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkegYOMbOm6pINe4Tn2pWBNt+Yl9vdfulmpELD+V/ao=;
        b=nQAMCVcvoTONHoVHexx8OxCMPON/Lek4c84m/Y3Y0mlG3Guh6TIleRPuLUr3nmNLJB
         tc2Jdf5wIrijTYnVJhha0ajRoqrLqD2xLz0cmE8Ng7VNR8fqzf6IWJ4qdPlCiUI4MdB7
         S0Th9oIxxT5M3GJQtq4Kgf35OkU2fhDyTEq9B2AUQKwNeZ94jR0kZgp3y0+UYumPByF8
         dpmO85nStaIJtmcDuY4JyHK5Vde3JzuYmCORhKy7Rzym1Yh8MarUyVFYvgZg8hWOzpVT
         gEK7XBonY2JL7+ZPE4Xg5/sLhXnPjfk/faT5eWnlMY7ilFtUbR7rBXZIPKhN1DgY+HGd
         6ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783723004; x=1784327804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkegYOMbOm6pINe4Tn2pWBNt+Yl9vdfulmpELD+V/ao=;
        b=U1+66wfawKM0/bZBpTFglnkDHkysHmu8s5Lvc2KRnfH6XUxQ1yWnj8KMGFcnubcUGv
         JiHiLdVHMID3RhFSf5IQv6TPL+hIMzvR0XOvZwfdvPXEiJwTan7AS2a/n+3vFRdsDXpz
         U9KZfWKxFvl9WrNNY0rQLq13ie5FSkKYAAt3wDq68lqlCPbaAnLYUAr+RiSkB8pm/1f1
         qK95XhFdQxg6C3V9wbm/jLmsRbkcqYMDmyA3EvBQHqRIMn3warGrM/UmJa6xc7C6Fvyy
         fW7Cr8zKmOl4n8o67hNzmXNE3lqQXN9Mu99ohHU/BHaHFZ6ZXQxwuXUnUJif/UYJI2qX
         J2qw==
X-Forwarded-Encrypted: i=1; AHgh+RoIOhrgnGkVnnmtVyNrNQxKcLgSIkLk7FO88yVF97x87YZcS5XNNUTLo2f0W/5ysgA+V4Jwfa0iK7dS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxju+lqr5MKWi2x11sddf6lWRczofW89SriK10UyA2xNRlgGfec
	+YCUfX+Nkpb5y19YnDVSbdu/YjFtVBoIvNqnUB902d67acKk+gvzurpS
X-Gm-Gg: AfdE7cmPvh5F3S1IFS3+PvrZlqV5KVC4a1jt4UvjjMFxOFG7NipJH5UOs7FAfcYaSY2
	Vs6k7cwrWC3/1kZgQ6HJ7i3pu2NeRGZHj6u10b9JkicXrDTTxSKh06uRZgPMcPL7b1N8BRDUX3E
	KOTdFcxdQCmIkESfw9BnxVMus8AStRwT0+y4MLz+ggOK2piSGeR9Ijle5jPupsDmD2DMoHQNQ8z
	I0QT6M6YcW2O/je9hWcmMcW5kQCRG3zaAAe9aTtwOjhYKhUvnSSdyr3Sg/NrSZoykUhf4HPbzci
	gmIk1LMBLfAHB+5wgr+emUGxM5lbd3bk1pef3GEt+8IpUzi/zlX5ik7YSwfKDtvRydwkDXmyP1G
	uRR3u6UbzZWwjN7k5SayDzqj5h27MN8Rk/STuXd1lMIH/D8Kd9sziym6pM4+fvz8Nr+kGCEujPx
	8d0bM4tJQXs6dd1Q86E9DU0CpClQ==
X-Received: by 2002:a05:600d:6401:10b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493f88c71fcmr3346825e9.14.1783723004325;
        Fri, 10 Jul 2026 15:36:44 -0700 (PDT)
Received: from builder ([2001:9e8:f113:9116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f4f09f89sm110612765e9.10.2026.07.10.15.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:36:43 -0700 (PDT)
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
Subject: [PATCH 6.6.y] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Date: Fri, 10 Jul 2026 22:36:27 +0000
Message-ID: <20260710223627.5860-1-jelonek.jonas@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,linutronix.de,kernel.org,linux.dev,vger.kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15762-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:tsbogend@alpha.franken.de,m:bigeasy@linutronix.de,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:jelonek.jonas@gmail.com,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D643473F962

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
index 81f6c4f8fbc1..1a3eb4820eb7 100644
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
@@ -410,6 +411,7 @@ static void stop_this_cpu(void *dummy)
 	set_cpu_online(smp_processor_id(), false);
 	calculate_cpu_foreign_map();
 	local_irq_disable();
+	rcu_report_dead(smp_processor_id());
 	while (1);
 }
 

base-commit: da47cbc254661aa66d61ef061485a7080305c4be
-- 
2.53.0


