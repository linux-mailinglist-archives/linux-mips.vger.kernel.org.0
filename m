Return-Path: <linux-mips+bounces-15182-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BPd1BsyiO2qjaggAu9opvQ
	(envelope-from <linux-mips+bounces-15182-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A3E6BCEB7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=HhYAa1UH;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15182-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15182-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F37D3013EDF
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106743A6B81;
	Wed, 24 Jun 2026 09:26:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C943AEF3F;
	Wed, 24 Jun 2026 09:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293176; cv=none; b=L137vp3f/dAAptjAXeW0WNXNigKJSPuaTI2HUO1MXKB0UTkI0aHd3KD1HXqaRDw6Man6e3g58hg23I/qD/CVduH0L4kanOLc1/lsc5Y3j3SKASQw5XTgupU3nLB8ws7DatK1kTFtAk1IsRuLVx2ePPCr6rh/CdYH+wcbDVSAXcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293176; c=relaxed/simple;
	bh=AoRzzG1s1ztLnVaflJiDV4twGRzVZYscicKGMMNmkj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAc/gaq9K+pe3AcOl09fOT6ty1DcJwP0SGyViWutTw4FEIGvMBFvQRPf8N4Hnk3+QGkS1X44XpgrEitDzhi3cwxse204fqqP6Px+oVKSJapAfpC5t7PAt3mMMHWkqqPKx05IGkzlzz74EehZmxF4a2vcUP1hzsDqyJY3MNRa7y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HhYAa1UH; arc=none smtp.client-ip=113.46.200.224
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=269hNQ1p4cIjqbezzaw6v9wgPOTXlh6wi8NjKdw9eVE=;
	b=HhYAa1UHUa2N4hO0mw7zi85r3AOnTx0QeurzyAHb71kYHyk+6PCIN6MjNl4xxNYqWXlj9yxUe
	kdCCdn2xSDatK5efwclBtWcOhA6ZpsPN8K6OiuLnivcUnqq2HF8ApghSflEFRo/fV1PvlYLk7a1
	LZ41DqPFbXXH0r/XZ5C2sN4=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4glbsz1p0fz1cyTM;
	Wed, 24 Jun 2026 17:16:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 290E640539;
	Wed, 24 Jun 2026 17:25:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:56 +0800
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
Subject: [PATCH v3 04/12] arm64: smp: Tidy up cpuinfo init and cpufeature updates
Date: Wed, 24 Jun 2026 17:25:29 +0800
Message-ID: <20260624092537.2916971-5-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15182-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 79A3E6BCEB7

From: Will Deacon <will@kernel.org>

Populating the 'cpuinfo_arm64' structure during CPU bringup and
subsequently checking/updating cpufeature structures is slightly
convoluted and differs unnecessarily between the boot CPU and secondary
CPUs.

Rework the code so that cpuinfo_store_cpu() is used to populate the
'cpuinfo_arm64' structure for each CPU, with secondary CPUs then calling
update_cpu_features() to update the global view of the available
features. This allows us to internalise the 'boot_cpu_data' in
cpufeature.c and paves the way for parallelising the ID register probing
during bring-up of secondary CPUs.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpu.h   |  6 ++----
 arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c    | 11 -----------
 arch/arm64/kernel/smp.c        |  3 ++-
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 71493b760b83..b77af3b1bde6 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -73,10 +73,8 @@ struct cpuinfo_arm64 {
 DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
 
 void cpuinfo_store_cpu(void);
-void __init cpuinfo_store_boot_cpu(void);
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info);
-void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
-				 struct cpuinfo_arm64 *boot);
+void __init init_cpu_features(void);
+void update_cpu_features(int cpu);
 
 #endif /* __ASM_CPU_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..be75e60d56ca 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -117,6 +117,7 @@ EXPORT_SYMBOL(system_cpucaps);
 static struct arm64_cpu_capabilities const __ro_after_init *cpucap_ptrs[ARM64_NCAPS];
 
 DECLARE_BITMAP(boot_cpucaps, ARM64_NCAPS);
+static struct cpuinfo_arm64 boot_cpu_data;
 
 /*
  * arm64_use_ng_mappings must be placed in the .data section, otherwise it
@@ -1164,11 +1165,19 @@ static __init void detect_system_supports_pseudo_nmi(void)
 static inline void detect_system_supports_pseudo_nmi(void) { }
 #endif
 
-void __init init_cpu_features(struct cpuinfo_arm64 *info)
+void __init init_cpu_features(void)
 {
+	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
+
 	/* Before we start using the tables, make sure it is sorted */
 	sort_ftr_regs();
 
+	/*
+	 * We keep a copy of the boot CPU registers so that physical hotplug
+	 * of CPU 0 can still be properly checked.
+	 */
+	boot_cpu_data = *info;
+
 	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
 	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
 	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
@@ -1363,12 +1372,14 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
  * non-boot CPU. Also performs SANITY checks to make sure that there
  * aren't any insane variations from that of the boot CPU.
  */
-void update_cpu_features(int cpu,
-			 struct cpuinfo_arm64 *info,
-			 struct cpuinfo_arm64 *boot)
+void update_cpu_features(int cpu)
 {
+	struct cpuinfo_arm64 *boot, *info;
 	int taint = 0;
 
+	boot = &boot_cpu_data;
+	info = per_cpu_ptr(&cpu_data, cpu);
+
 	/*
 	 * The kernel can handle differing I-cache policies, but otherwise
 	 * caches should look identical. Userspace JITs will make use of
@@ -3924,6 +3935,8 @@ static void __init setup_boot_cpu_capabilities(void)
 
 void __init setup_boot_cpu_features(void)
 {
+	init_cpu_features();
+
 	/*
 	 * Initialize the indirect array of CPU capabilities pointers before we
 	 * handle the boot CPU.
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 6149bc91251d..df740dc478b2 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -31,7 +31,6 @@
  * values depending on configuration at or after reset.
  */
 DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
-static struct cpuinfo_arm64 boot_cpu_data;
 
 static inline const char *icache_policy_str(int l1ip)
 {
@@ -523,14 +522,4 @@ void cpuinfo_store_cpu(void)
 {
 	struct cpuinfo_arm64 *info = this_cpu_ptr(&cpu_data);
 	__cpuinfo_store_cpu(info);
-	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
-}
-
-void __init cpuinfo_store_boot_cpu(void)
-{
-	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
-	__cpuinfo_store_cpu(info);
-
-	boot_cpu_data = *info;
-	init_cpu_features(&boot_cpu_data);
 }
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index e858d7d64d1f..c14b179c595d 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -233,6 +233,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
 
 	/*
@@ -453,7 +454,7 @@ void __init smp_prepare_boot_cpu(void)
 	 */
 	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 
-	cpuinfo_store_boot_cpu();
+	cpuinfo_store_cpu();
 	setup_boot_cpu_features();
 
 	/* Conditionally switch to GIC PMR for interrupt masking */
-- 
2.34.1


