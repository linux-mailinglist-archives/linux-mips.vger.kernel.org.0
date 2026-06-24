Return-Path: <linux-mips+bounces-15185-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gwC6Hd6iO2qpaggAu9opvQ
	(envelope-from <linux-mips+bounces-15185-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A396BCED2
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=kMtLT1t8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15185-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15185-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60463300AB3D
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064593B42D6;
	Wed, 24 Jun 2026 09:26:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741F93AC0D4;
	Wed, 24 Jun 2026 09:26:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293180; cv=none; b=RSI088BoEibwgPCk/OAoPao+2hSM1Ujr29UguYRBTKR5unN210yBxtNP/XjiIgPVCmngWgCXZBd9V0jHP5/02RRhr08n8mznJ2VtK7OUS4WE+7YQZGZXKX0qDaj5+FKw48zlHOItbWvKzJhW4RMGmwuclGHrq4Ujn46C5Mkmszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293180; c=relaxed/simple;
	bh=PC1GZAr3w/GYt5ooUBMvY+WMak4zAyAVp4u50LphvIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVC74VYTu5vS+s2lkU7VSwEhpIa2gN2teiI/BC5rgHVrf+TVB+aTPn40Hf4cIzIe0YDVWBJF08ZQPowW7W+jILYbBbvwslyMdzzDe7C0B22q8b0Z5gYPKftYC0diLC+LJiAhD3H4j51tdta71nTnrSda4bTmSxsrapo2kPksZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kMtLT1t8; arc=none smtp.client-ip=113.46.200.217
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9M7PkUPtYpY4RUQreVnYGCM+Ox9OBHbooKtSZnyfcNU=;
	b=kMtLT1t8pO41raYIMLG3oelygw6Wl2zIt490i/hIKZhryX1NRx+KVJzT98BZNzWdBYJlAPmni
	sFrBfNgDCFi0pwplLwAp6bFJjFXDclXIwKSZUCs7vaY+XDt+/k2wWm4xdU8RTdOz0AfsmYhYApM
	UpP+FYcd7qGnxmXjMaA6XtU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4glbtW6vNdzcb3r;
	Wed, 24 Jun 2026 17:17:23 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7809A40561;
	Wed, 24 Jun 2026 17:26:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 05/12] arm64: smp: Defer RCU registration during secondary CPU bringup
Date: Wed, 24 Jun 2026 17:25:30 +0800
Message-ID: <20260624092537.2916971-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15185-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13A396BCED2

From: Will Deacon <will@kernel.org>

Calling rcutree_report_cpu_starting() early during boot can lead to
livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
on an RCU grace period while the CPU being onlined is spinning in
cpuhp_ap_sync_alive(). So cpuhp_ap_sync_alive() must be called
before rcutree_report_cpu_starting().

And to prevent a potential deadlock on the boot CPU,
check_local_cpu_capabilities() must be executed before
cpuhp_ap_sync_alive(). This ensures that if an early capability mismatch
occurs and the AP invokes cpu_die_early(), the boot CPU can detect
the boot timeout and proceed, rather than hanging indefinitely.

In preparation for enabling the generic CPU hotplug code on arm64, split
up the trace_hardirqs_off() call during secondary CPU bringup so that we
update lockdep early but defer the tracing updates until after
RCU is ready.

Furthermore, to support parallel bringup without triggering false RCU CPU
stall Warnings or deadlocks, the initialization order must be:

    secondary_start_kernel()
        -> lockdep_hardirqs_off()
        -> check_local_cpu_capabilities()
           -> cpuhp_ap_sync_alive()
        -> cpuhp_ap_sync_alive()
        -> rcutree_report_cpu_starting()
        -> trace_hardirqs_off_finish()

Because check_local_cpu_capabilities() must execute while RCU is still
offline on the local CPU, it normally triggers a false-positive lockdep
"suspicious RCU usage" splat during early lock acquisitions as commit
ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") pointed out.

Resolve this lockdep splat by wrapping the early capability verification
path within lockdep_off() and lockdep_on(). This safely suppresses
false-positive RCU validation flags on the offline CPU while maintaining
the strictly mandated initialization order for race-free parallel bringup.

Signed-off-by: Will Deacon <will@kernel.org>
Co-developed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c14b179c595d..87f92cf9ffa8 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -35,6 +35,7 @@
 #include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 #include <linux/nmi.h>
+#include <linux/lockdep.h>
 
 #include <asm/alternative.h>
 #include <asm/atomic.h>
@@ -215,15 +216,23 @@ asmlinkage notrace void secondary_start_kernel(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
-	rcutree_report_cpu_starting(cpu);
-	trace_hardirqs_off();
+	lockdep_hardirqs_off(CALLER_ADDR0);
 
+	/*
+	 * Since RCU is still offline on this CPU, any nested native printk
+	 * or lock acquisition would normally trigger a false-positive
+	 * "suspicious RCU usage" lockdep splat.
+	 */
+	lockdep_off();
 	/*
 	 * If the system has established the capabilities, make sure
 	 * this CPU ticks all of those. If it doesn't, the CPU will
 	 * fail to come online.
 	 */
 	check_local_cpu_capabilities();
+	lockdep_on();
+	rcutree_report_cpu_starting(cpu);
+	trace_hardirqs_off_finish();
 
 	ops = get_cpu_ops(cpu);
 	if (ops->cpu_postboot)
-- 
2.34.1


