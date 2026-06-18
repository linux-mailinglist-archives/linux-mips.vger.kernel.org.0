Return-Path: <linux-mips+bounces-15134-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6hvlMLi5M2oNFgYAu9opvQ
	(envelope-from <linux-mips+bounces-15134-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:26:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B969ED8D
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:26:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=3pRLLMQX;
	dkim=pass header.d=huawei.com header.s=dkim header.b=3pRLLMQX;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15134-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15134-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A8F6302F4F1
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 09:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996E83C6A2B;
	Thu, 18 Jun 2026 09:26:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B52E7373;
	Thu, 18 Jun 2026 09:26:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774769; cv=none; b=q8/XqI9lHK5kmgRDHsq71UIDnIbHA8uEMbp/v5u0KzkeA3mOGUjKZudTzQrrvkhZ6GHX9mElKFx8DdQgzqNY+yN1QIXOjMkKLVf/dKvHCNKtp+WzlqGhmggBg4BKk4W3bYc/lYFw3WvzDhKC0+623EwMESoocXxbOoIfQDW11SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774769; c=relaxed/simple;
	bh=0gP4p0OW0nBKnpSggtrr5qKGAhEnw2p7kjXUyU3CDsM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I73//KNbfE06OPzBVfpe67P/b9eDtse43l7+1hhDd90noXN4IQ5c5iUVAHyrlIDYc478kgVdNxyBV3Lbslsw83sdnOTMwIeoelC66CKY05uhNT2VLe9uDb1H2Z/TNZtRnuxdZakbCiU40mwrEaIYE23PoDkT06VQZ87Pv4UNdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3pRLLMQX; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3pRLLMQX; arc=none smtp.client-ip=113.46.200.217
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c152yyawWOwtqOgmdJ351m5tfsJBbmik79lhDs9C+mM=;
	b=3pRLLMQXbk5Ji4A9Nr/somPIkUqHEODjvTuRHTO+MqQLE8vsaFxa49OIQx3vdq3I3YSzfKjwe
	TCdziiCYZWuQpsNpKj8Ief3gxPdRwEDLjg8av45OjqLzqGDIgOLQUayxMNTbqmapJ5IeDVn1evq
	t0JJEd2E1UK2l2+MLfufj7w=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4ggw9W69v5zcZyR;
	Thu, 18 Jun 2026 17:17:35 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c152yyawWOwtqOgmdJ351m5tfsJBbmik79lhDs9C+mM=;
	b=3pRLLMQXbk5Ji4A9Nr/somPIkUqHEODjvTuRHTO+MqQLE8vsaFxa49OIQx3vdq3I3YSzfKjwe
	TCdziiCYZWuQpsNpKj8Ief3gxPdRwEDLjg8av45OjqLzqGDIgOLQUayxMNTbqmapJ5IeDVn1evq
	t0JJEd2E1UK2l2+MLfufj7w=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4ggw9P563Bz1T4Kt;
	Thu, 18 Jun 2026 17:17:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 04E0B40561;
	Thu, 18 Jun 2026 17:26:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:25:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<jpoimboe@kernel.org>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<ojeda@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<apatel@ventanamicro.com>, <mhklinux@outlook.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 2/4] arm64: smp: Pass CPU ID to update_cpu_boot_status()
Date: Thu, 18 Jun 2026 17:24:42 +0800
Message-ID: <20260618092444.1316336-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618092444.1316336-1-ruanjinjie@huawei.com>
References: <20260618092444.1316336-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:jpoimboe@kernel.org,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:apatel@ventanamicro.com,m:mhklinux@outlook.com,m:ruanjinjie
 @huawei.com,m:menglong8dong@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,gmail.com,linaro.org,google.com,arndb.de,vger.kernel.org,lists.infradead.org,ventanamicro.com,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15134-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 366B969ED8D

To support CONFIG_HOTPLUG_PARALLEL, the CPU boot status tracking must
be refactored from a single global variable (secondary_data.status)
to a per-CPU tracking structure to prevent multi-core race conditions.

Add a 'cpu' parameter to update_cpu_boot_status() and update all its
callsites to pass the corresponding CPU ID. This allows updating the
boot status at a per-CPU granularity during parallel bringup.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/smp.h   | 6 +++---
 arch/arm64/kernel/cpufeature.c | 2 +-
 arch/arm64/kernel/smp.c        | 8 ++++----
 arch/arm64/mm/context.c        | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 10ea4f543069..e2151a01731f 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -122,7 +122,7 @@ static inline void __noreturn cpu_park_loop(void)
 	}
 }
 
-static inline void update_cpu_boot_status(int val)
+static inline void update_cpu_boot_status(unsigned int cpu, int val)
 {
 	WRITE_ONCE(secondary_data.status, val);
 	/* Ensure the visibility of the status update */
@@ -134,9 +134,9 @@ static inline void update_cpu_boot_status(int val)
  * which calls for a kernel panic. Update the boot status and park the calling
  * CPU.
  */
-static inline void __noreturn cpu_panic_kernel(void)
+static inline void __noreturn cpu_panic_kernel(unsigned int cpu)
 {
-	update_cpu_boot_status(CPU_PANIC_KERNEL);
+	update_cpu_boot_status(cpu, CPU_PANIC_KERNEL);
 	cpu_park_loop();
 }
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..0552202702bf 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3674,7 +3674,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			caps->desc, system_has_cap, cpu_has_cap);
 
 		if (cpucap_panic_on_conflict(caps))
-			cpu_panic_kernel();
+			cpu_panic_kernel(smp_processor_id());
 		else
 			cpu_die_early();
 	}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 24f8448e1fbb..6bc90ee4820a 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -118,7 +118,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	 * page tables.
 	 */
 	secondary_data.task = idle;
-	update_cpu_boot_status(CPU_MMU_OFF);
+	update_cpu_boot_status(cpu, CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
@@ -252,7 +252,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
 					 cpu, (unsigned long)mpidr,
 					 read_cpuid_id());
-	update_cpu_boot_status(CPU_BOOT_SUCCESS);
+	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
 	complete(&cpu_running);
 
@@ -411,11 +411,11 @@ void __noreturn cpu_die_early(void)
 	rcutree_report_cpu_dead();
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		update_cpu_boot_status(CPU_KILL_ME);
+		update_cpu_boot_status(cpu, CPU_KILL_ME);
 		__cpu_try_die(cpu);
 	}
 
-	update_cpu_boot_status(CPU_STUCK_IN_KERNEL);
+	update_cpu_boot_status(cpu, CPU_STUCK_IN_KERNEL);
 
 	cpu_park_loop();
 }
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..6b8a3245f393 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -72,7 +72,7 @@ void verify_cpu_asid_bits(void)
 		 */
 		pr_crit("CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
 				smp_processor_id(), asid, asid_bits);
-		cpu_panic_kernel();
+		cpu_panic_kernel(smp_processor_id());
 	}
 }
 
-- 
2.34.1


