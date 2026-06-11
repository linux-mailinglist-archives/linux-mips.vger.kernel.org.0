Return-Path: <linux-mips+bounces-15056-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LsCfJrC6KmpmvwMAu9opvQ
	(envelope-from <linux-mips+bounces-15056-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 15:40:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2083672622
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 15:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=iklZi2sn;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15056-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15056-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CA773196A9D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 13:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE983F788A;
	Thu, 11 Jun 2026 13:38:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F05407CEE;
	Thu, 11 Jun 2026 13:38:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185122; cv=none; b=pGxAQ/iIixxvJiy0kxnobEE2HrJW2zQWtvet6OuzDqLPkrQRIbJWzuDu6Ssg8MtlBGEOcime7bdGoBl1IE+4Ci6liU4cQz6T71taREn7Gjzd0PAnaqBe78gHIxpHr0Ake0OK5qksHLQR0PbpSVVowIK1oJ93JDUXgVp+JpgOPCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185122; c=relaxed/simple;
	bh=34OQojqI5/SFWPFwqnjX7aoX9qTYeV3trRJDz3TJPmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvbWRAcEc/MRZZTiLgHBo/m/mG9Ys+CByCsrrIb1Kcv2hK2C4+RW6lJG+lmJr2Bwh+YHljiKLbrtTqWeRHzIYZhY9QBCXVQIRpsGOQqY+DoQxwB1nhG9lTTBoPcNuE0w/1ayUbyQq/LZMm5/86LlPU+Wp0ZdKBtLlLApFrK+NAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=iklZi2sn; arc=none smtp.client-ip=113.46.200.222
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=G1fmYR7Bw48yeIaqSnYNhWjdDWiabR6zZde3Hlfn/5k=;
	b=iklZi2sn8UCwgbkC4ASYVWIbolWj7O22qO43+Gm/ir9CNoD3G05AAqzZS/GlgroWTloOILTbC
	DsZSs3LcCfqRT+soo7oWNIEBqcMjbT429CZ4MHaWH/AM/wkq3hticvYcshk29YMTQDjyDNGxHN9
	GGT2qdBpBmdqIS/iDK9swMM=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gbk6c6CKjzLlVV;
	Thu, 11 Jun 2026 21:30:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D09740562;
	Thu, 11 Jun 2026 21:38:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Jun
 2026 21:38:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <ruanjinjie@huawei.com>, <david.kaplan@amd.com>,
	<lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>, <maz@kernel.org>,
	<timothy.hayes@arm.com>, <lpieralisi@kernel.org>, <thuth@redhat.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH RFC 1/3] cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
Date: Thu, 11 Jun 2026 21:38:07 +0800
Message-ID: <20260611133809.3854977-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611133809.3854977-1-ruanjinjie@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15056-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,huawei.com,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:ruanjinjie@huawei.com,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2083672622

During parallel CPU bringup, x86 requires primary SMT threads to boot
first to avoid siblings stopping during microcode updates. This constraint
is architecture-specific and unnecessary for other platforms
like arm64.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to decouple this constraint.
Platforms requiring this temporal order (e.g., x86) can select it
in Kconfig. Other architectures (e.g., arm64) can leave it unselected
to entirely bypass the SMT branch via the preprocessor.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/Kconfig       | 4 ++++
 arch/mips/Kconfig  | 1 +
 arch/riscv/Kconfig | 1 +
 arch/x86/Kconfig   | 1 +
 kernel/cpu.c       | 6 +++++-
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..0365d2df2659 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config PARALLEL_SMT_PRIMARY_FIRST
+	bool
+	depends on HOTPLUG_PARALLEL
+
 config GENERIC_IRQ_ENTRY
 	bool
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..84e11ac0cf71 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -642,6 +642,7 @@ config EYEQ
 	select MIPS_CPU_SCACHE
 	select MIPS_GIC
 	select MIPS_L1_CACHE_SHIFT_7
+	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
 	select PCI_DRIVERS_GENERIC
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d235396c4514..0cc49aecc841 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -210,6 +210,7 @@ config RISCV
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
+	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..3ad4115ad051 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -314,6 +314,7 @@ config X86
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
 	select NUMA_MEMBLKS			if NUMA
+	select PARALLEL_SMT_PRIMARY_FIRST	if HOTPLUG_PARALLEL
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
 	select PERF_EVENTS
diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e..7ef8cdf4d239 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1792,6 +1792,7 @@ static int __init parallel_bringup_parse_param(char *arg)
 }
 early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
+#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
 #ifdef CONFIG_HOTPLUG_SMT
 static inline bool cpuhp_smt_aware(void)
 {
@@ -1811,7 +1812,8 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
 {
 	return cpu_none_mask;
 }
-#endif
+#endif /* CONFIG_HOTPLUG_SMT */
+#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
 
 bool __weak arch_cpuhp_init_parallel_bringup(void)
 {
@@ -1837,6 +1839,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
 	if (!__cpuhp_parallel_bringup)
 		return false;
 
+#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
 	if (cpuhp_smt_aware()) {
 		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
 		static struct cpumask tmp_mask __initdata;
@@ -1857,6 +1860,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
 		cpumask_andnot(&tmp_mask, mask, pmask);
 		mask = &tmp_mask;
 	}
+#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
 
 	/* Bring the not-yet started CPUs up */
 	cpuhp_bringup_mask(mask, ncpus, CPUHP_BP_KICK_AP);
-- 
2.34.1


