Return-Path: <linux-mips+bounces-14930-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ukYJN3CNJmqGYgIAu9opvQ
	(envelope-from <linux-mips+bounces-14930-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 11:37:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECA4654A60
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 11:37:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QtABq5Q7;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14930-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-14930-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E374D30071F0
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 09:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899113B3BF3;
	Mon,  8 Jun 2026 09:37:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE5A2EEE61
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 09:37:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911469; cv=none; b=lLKgZ71RR16sRb8s+wflb9qcuh8K2OyA8JGys5gAcvIBJq1CAE6gP9NYhUaSgjfkrlrpie534YnJ9x19vIKZZfr+WqeUaJc/a5fLAkl7Dsdbl5Xl0fSvtYBY2wSyimw5j0qrysm7r/CxraHx8Iwv5manD5B6VLyrFlUGW3aHfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911469; c=relaxed/simple;
	bh=Q5pjoXPRXrR4YAOjANnD4MJe+Rq6borHbdwBTCRM/XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rya/XCvuXKxpF91Ce/ycoDQjZThIMB1mBRSmFriYHKX8Ot+zklnKdUUI+d90BlvuCNWrqjfHO0exsBm73D8KWN4vUCo7mPld66MlF4SvakLhifhcUz0kfVik7oIOhsFnMsZ5XeAv/yex0djTsuZLzQcVaQWStgkjNwPcB2oUWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtABq5Q7; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ac10e337so37497685e9.3
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911466; x=1781516266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbY26Xurtu23jBtBt7MOtdovk/2bF+TdV8T/2baMK9w=;
        b=QtABq5Q7NycJrVYJfKEFN+O42Q6Cj57GwnNLx5vxbcF7kTcjv9PVbFd2QiYicxzrgX
         64tcVriZTTsFM4ynSpX4KsqM+Ou0Em/uMe/pBqaAjEDGiUCkUHasMbqnUaMORNmm0UM6
         34sq6tPyZvteft4csPQCe6UCvvLl6eH9kuKRwpF38CwRydqpzbMYdFAzH1yYEECeM2vj
         3USAwGF+4/Gye/FmgqcWqkKYxsmQg+ONUiVFfKf1Ch6jLHLPqb86/VMTWoYWt0+z/3Im
         /iG7KoE7LEnux9E564af/CKUDB5T2EmBU6K5T6c0kwOAGqjsuI+ENxiIRW2EQ8yZP7H9
         piVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911466; x=1781516266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbY26Xurtu23jBtBt7MOtdovk/2bF+TdV8T/2baMK9w=;
        b=FalJPmiWkw2l/Zfma7KR9gf4zhsTt2ofBaiMmM+h4Ehec9D2vR8zI9llmAsqAgyHPh
         wj6zeQxYHfyicHUxWm/PxfQpPU9o9bmErMZcpIOxrGzWuwFEF40dHiulGFDUlYD9mCqn
         NrqSiWhz8bl2W8H+svGZyud1LD2LF7ifPVkfbcwm2MwF3kOc6WLz/qLUa0BejhowzeWp
         P7dUpJJM6CVczV5OZAWShhiU6FdEJKz0QhDJPsBf2cgmiQ8Ve+Op416LlLrZNRxv0XSp
         FBcx3acZNSmVw7G/fYqKcWPGe1IesmFe6WlHW5/bJINK7yi9x59xgXYsEzfyJKjgnhDC
         i6eg==
X-Forwarded-Encrypted: i=1; AFNElJ9PzHVajKnaC2WKvK4UhCLeBCYgycjzjh8LDjoWMtOPAkOZqliXxl6u0xhdnKthuTe95lRiB/72CN4f@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VGfEheS39+EukkusXoW/ArjlW7B+bJXTTUCX8787F0UMtDIr
	2FXelHpJwovWZuBdLEzTCHs4LEVxXHvN7ygTe7QL4M9HHGEdRhKZJgeM
X-Gm-Gg: Acq92OFNPcHlKr3ke9Pe3TTkt4jeJFrfFQYa9pQUCGZRF8FzEa4TnZ1UcTHaWqqpi5I
	cJXmgMe7O2SMLlTbut2Ki6bgFEyZgCCyH+MUMA+jDuVMkBekEpIS756TMR8wHwfye7IzUb0aP41
	HyC+b4bArTXstGrf2CFiR6mthOgYKTD1B2QUC044D1TZIbPEbp10mF1WAntWvBOOmT+0AaKyaJO
	PJOlrdxOtR0BCReo+psYiK8OcQ4D0Rr2nUd2XUxOhIcEbYVHSUWxRhv7eKj5/gLerx/KE68Hi6D
	/m+BSOS/+09XtvA+QHjh7Pkm41BAx1PnMbWIxvFuY9HZcqm/06p6/Igoqqk4dLwLpWy70s8IIZY
	FB6ZAJ9PdPGuoE7i5U1wedKLgtSEd7qrWfmaaqEnsp4JRq/gIfNcg4aqgCE5U2nM4X5IgaEoF/P
	ONYf0iQnSVUwguijxyscYGi7MHG8TUyIKFd345
X-Received: by 2002:a05:600c:3f1b:b0:490:c0d8:d517 with SMTP id 5b1f17b1804b1-490c2598543mr239183895e9.3.1780911466302;
        Mon, 08 Jun 2026 02:37:46 -0700 (PDT)
Received: from builder ([2001:9e8:f105:6a16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm55829791f8f.5.2026.06.08.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:37:45 -0700 (PDT)
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
Subject: [PATCH v2] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Date: Mon,  8 Jun 2026 09:37:29 +0000
Message-ID: <20260608093729.12111-1-jelonek.jonas@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,goodmis.org,linux.dev,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14930-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ECA4654A60

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

Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
generic CPU-hotplug offline path, so RCU stops waiting on the parked CPUs
and grace periods can still complete. MIPS shuts down all CPUs here
without going through the CPU-hotplug mechanism, so this report is not
otherwise issued. Reporting a dying CPU to RCU outside the regular hotplug
offline path is not unprecedented: arm64 does the same in cpu_die_early().
There it is an exception for a CPU that was coming online and is aborting
bringup, rather than the default shutdown action as on MIPS.

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


