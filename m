Return-Path: <linux-mips+bounces-15183-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6tON86iO2qmaggAu9opvQ
	(envelope-from <linux-mips+bounces-15183-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3F6BCEC3
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=jy8EJqo4;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15183-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15183-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 621C9301BEC7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11693A1690;
	Wed, 24 Jun 2026 09:26:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24DD3A1A3B;
	Wed, 24 Jun 2026 09:26:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293177; cv=none; b=SKqPG91Xdlo9NsC3egpK+4y+mZBuBdK/cnKPSoRyQYIB7lpm+qes+gxbcgyq1gsPGKUYafleABYSe/3bXEg5aUsjq0PfNBh2tFgL+N8L13nA2y3tywtUie1UFvuHGgc42EIbZIiwyt+SHodyUDLQfbii+1JBzHnellDwOlVGjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293177; c=relaxed/simple;
	bh=0tfppAPvOZIshQaVjHhB2yhaf6MPDRKaPO1sKiVCz4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NClLWWKCGgLZG2tL4e9bATUtBRjh3q++PLttqQTln5OFzNVmLZRLUqgeJu66GSQr8XMOk8MyOan0B8pmtb7nNZxQCYFI7F6dIR5WvPdAdNF3D6DIEukXakkdlzpqLx9niD2m18qAijmInLEGiCPoAYalBY6lAORfhbNXBV6cIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jy8EJqo4; arc=none smtp.client-ip=113.46.200.227
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VECIg4ov/FIyiC/SKOsbRM/La5dxB9QDanoGGZCeD2g=;
	b=jy8EJqo4anXrwcBUdjDQlQ/2fIQgMwafJN3ExhltFZXA4QUdsCUNedBiSg+g07TDlOHfetcAy
	nQYPSA9gE20aDubY11V2l40Pxy4aRp7HAV9fGpF28JxKIoJ3nAZKcBb9Xwze19XWTWcIoj6vJ7g
	90Jef6ANiCcAAEGKZY3+4HQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4glbtG3TGyznTVR;
	Wed, 24 Jun 2026 17:17:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 66E474048B;
	Wed, 24 Jun 2026 17:25:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:52 +0800
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
Subject: [PATCH v3 02/12] cpu/hotplug: Propagate bring-up status to arch_cpuhp_cleanup_kick_cpu()
Date: Wed, 24 Jun 2026 17:25:27 +0800
Message-ID: <20260624092537.2916971-3-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15183-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D3F6BCEC3

From: Will Deacon <will@kernel.org>

In preparation for enabling the generic CPU hotplug machinery on arm64,
which has architecture-specific handling of early bringup failures,
extend arch_cpuhp_cleanup_kick_cpu() to take an additional argument
indicating whether or not the target AP reached the alive state.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/smpboot.c  | 4 ++--
 include/linux/cpuhotplug.h | 2 +-
 kernel/cpu.c               | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 294a8ea60298..637660b15aee 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1057,7 +1057,7 @@ static int do_boot_cpu(u32 apicid, unsigned int cpu, struct task_struct *idle)
 
 	/* If the wakeup mechanism failed, cleanup the warm reset vector */
 	if (ret)
-		arch_cpuhp_cleanup_kick_cpu(cpu);
+		arch_cpuhp_cleanup_kick_cpu(cpu, false);
 	return ret;
 }
 
@@ -1105,7 +1105,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 	return smp_ops.kick_ap_alive(cpu, tidle);
 }
 
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 {
 	/* Cleanup possible dangling ends... */
 	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 22ba327ec227..5c3b3e0bce47 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -511,7 +511,7 @@ struct task_struct;
 
 void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 bool arch_cpuhp_init_parallel_bringup(void);
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 5a90f60ff60e..b0e31e624623 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -427,7 +427,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	return true;
 }
 
-void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
+void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive) { }
 
 /*
  * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
@@ -446,7 +446,7 @@ static int cpuhp_bp_sync_alive(unsigned int cpu)
 	}
 
 	/* Let the architecture cleanup the kick alive mechanics. */
-	arch_cpuhp_cleanup_kick_cpu(cpu);
+	arch_cpuhp_cleanup_kick_cpu(cpu, !ret);
 	return ret;
 }
 #else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */
-- 
2.34.1


