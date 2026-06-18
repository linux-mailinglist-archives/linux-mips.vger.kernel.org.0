Return-Path: <linux-mips+bounces-15137-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0941GgG6M2oYFgYAu9opvQ
	(envelope-from <linux-mips+bounces-15137-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:27:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC61769EDAF
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ajlEvkAH;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15137-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15137-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A338130D4CB8
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 09:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8053DA7E6;
	Thu, 18 Jun 2026 09:26:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB383C7E1D;
	Thu, 18 Jun 2026 09:26:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774774; cv=none; b=bF760KBNovzkwWBnYBJitDGvmU7YCSF8DkWVX+9UPo+hOhI9xl+exBdiGEWKOdrfyYydAbR2adYAaHC1bSQT7AzqJXIXc/VtyokTjZ0kcoZZHiI/l8G4X/y+5pCYu1CzPB5PRaqoGMu8K2/Qar6Yq7Nxrk5UQT6pCnjxPeF/Si0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774774; c=relaxed/simple;
	bh=TB2QZSA/D3dv3TAko5Aq5xk6m3pRwE/4EQJwD+FwXMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dY8biNucNz3C9/AHu2rAje8g+TVGNF2aYY57z/v4WIxVYwxfO/a0TtrPCI2b1JZQj8yqICFUF/Wc9eKd+BN2GhYHaCbliu+E2wS0VJYuR7C+ZEk57NvRWaBNZ6HtvkxoUf2ET4j4+frM2NmFZyx3c9LoWhnbNngoWlW8cwkMvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ajlEvkAH; arc=none smtp.client-ip=113.46.200.223
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7Xl9xYHC9lg9V/pmv90pnoUjI6yJDwuBsZCpKRShEqs=;
	b=ajlEvkAHLgSpEPEMpfBqVSr5UvWXU8wXW4IUKGpObpMBwjgXPPRnw+6/l4pERzX/5m+I37Uod
	VnouE1t2ATQu2qaa63uw3vyL5gowaCBzo9ZOmwc8rFOOgcssTOlVeHhdzdQtYPBWjqyh8tdCUes
	Rgw2FpMV0mHgD52ub97nbiI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4ggwB35ydrzmVXy;
	Thu, 18 Jun 2026 17:18:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 351F240539;
	Thu, 18 Jun 2026 17:26:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:26:01 +0800
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
Subject: [PATCH v2 3/4] arm64: smp: Defer RCU reporting until after local CPU capability checks
Date: Thu, 18 Jun 2026 17:24:43 +0800
Message-ID: <20260618092444.1316336-4-ruanjinjie@huawei.com>
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
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15137-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,gmail.com,linaro.org,google.com,arndb.de,vger.kernel.org,lists.infradead.org,ventanamicro.com,outlook.com];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:jpoimboe@kernel.org,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:apatel@ventanamicro.com,m:mhklinux@outlook.com,m:ruanjinjie
 @huawei.com,m:menglong8dong@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC61769EDAF

To support HOTPLUG_PARALLEL on arm64, and to prevent a potential deadlock
on the control CPU, check_local_cpu_capabilities() must be executed
before cpuhp_ap_sync_alive(). This ensures that if an early capability
mismatch occurs and the AP invokes cpu_die_early(), the control CPU
can detect the boot timeout and proceed, rather than hanging
indefinitely.

Furthermore, under parallel bringup, cpuhp_ap_sync_alive() must be called
before rcutree_report_cpu_starting(). This sequence prevents a false
RCU CPU Stall Warning caused by the prolonged spin-waiting/busy-waiting
required during the AP synchronization process.

	GICv3: CPU1: using allocated LPI pending table @0x0000000104160000
	CPU1: Booted secondary processor 0x0000000001 [0x410fd082]
	rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
	rcu:     2-O..!: (2 GPs behind) idle=0004/1/0x4000000000000000 softirq=0/0 fqs=2625
	rcu:     3-O..!: (2 GPs behind) idle=0004/1/0x4000000000000000 softirq=0/0 fqs=2625
	rcu:     (detected by 0, t=5252 jiffies, g=-1187, q=1 ncpus=16)
	rcu: Offline CPU 2 blocking current GP.
	rcu: Offline CPU 3 blocking current GP.

To avoid suspicious RCU usage, commit ce3d31ad3cac ("arm64/smp: Move
rcu_cpu_starting() earlier") move rcutree_report_cpu_starting() earlier
which is before check_local_cpu_capabilities().

But For parallel bringup, the order should be as following:

	secondary_start_kernel()
	    -> check_local_cpu_capabilities()
	       -> cpu_die_early()
	    -> cpuhp_ap_sync_alive()
	    -> rcutree_report_cpu_starting()

And this required order forces standard printk/pr_* statements inside
check_local_cpu_capabilities() to execute while the secondary CPU is still
marked as offline to RCU, triggering a lockdep "suspicious RCU usage" splat
due to console semaphore operations.

So converting early capability logging and failure paths to printk_deferred().
This pushes the logs into the lockless ringbuffer without triggering console
locks or RCU validation on the offline CPU, resolving the lockdep splat while
preserving critical error messages and the strictly required initialization
order.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/cpufeature.c | 20 ++++++++++----------
 arch/arm64/kernel/smp.c        |  4 ++--
 arch/arm64/mm/context.c        |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 0552202702bf..a5e0bc4d383b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3546,7 +3546,7 @@ static void update_cpu_capabilities(u16 scope_mask)
 		 * system capabilities are finalised.
 		 */
 		if (!match_all && caps->desc && !caps->cpus)
-			pr_info("detected: %s\n", caps->desc);
+			printk_deferred(KERN_INFO "detected: %s\n", caps->desc);
 
 		__set_bit(caps->capability, system_cpucaps);
 
@@ -3669,7 +3669,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 	}
 
 	if (i < ARM64_NCAPS) {
-		pr_crit("CPU%d: Detected conflict for capability %d (%s), System: %d, CPU: %d\n",
+		printk_deferred(KERN_CRIT "CPU%d: Detected conflict for capability %d (%s), System: %d, CPU: %d\n",
 			smp_processor_id(), caps->capability,
 			caps->desc, system_has_cap, cpu_has_cap);
 
@@ -3697,7 +3697,7 @@ __verify_local_elf_hwcaps(const struct arm64_cpu_capabilities *caps)
 
 	for (; caps->matches; caps++)
 		if (cpus_have_elf_hwcap(caps) && !caps->matches(caps, SCOPE_LOCAL_CPU)) {
-			pr_crit("CPU%d: missing HWCAP: %s\n",
+			printk_deferred(KERN_CRIT "CPU%d: missing HWCAP: %s\n",
 					smp_processor_id(), caps->desc);
 			cpu_die_early();
 		}
@@ -3716,7 +3716,7 @@ static void verify_sve_features(void)
 	unsigned long cpacr = cpacr_save_enable_kernel_sve();
 
 	if (vec_verify_vq_map(ARM64_VEC_SVE)) {
-		pr_crit("CPU%d: SVE: vector length support mismatch\n",
+		printk_deferred(KERN_CRIT "CPU%d: SVE: vector length support mismatch\n",
 			smp_processor_id());
 		cpu_die_early();
 	}
@@ -3729,7 +3729,7 @@ static void verify_sme_features(void)
 	unsigned long cpacr = cpacr_save_enable_kernel_sme();
 
 	if (vec_verify_vq_map(ARM64_VEC_SME)) {
-		pr_crit("CPU%d: SME: vector length support mismatch\n",
+		printk_deferred(KERN_CRIT "CPU%d: SME: vector length support mismatch\n",
 			smp_processor_id());
 		cpu_die_early();
 	}
@@ -3754,7 +3754,7 @@ static void verify_hyp_capabilities(void)
 	safe_vmid_bits = get_vmid_bits(safe_mmfr1);
 	vmid_bits = get_vmid_bits(mmfr1);
 	if (vmid_bits < safe_vmid_bits) {
-		pr_crit("CPU%d: VMID width mismatch\n", smp_processor_id());
+		printk_deferred(KERN_CRIT "CPU%d: VMID width mismatch\n", smp_processor_id());
 		cpu_die_early();
 	}
 
@@ -3763,7 +3763,7 @@ static void verify_hyp_capabilities(void)
 				ID_AA64MMFR0_EL1_PARANGE_SHIFT);
 	ipa_max = id_aa64mmfr0_parange_to_phys_shift(parange);
 	if (ipa_max < get_kvm_ipa_limit()) {
-		pr_crit("CPU%d: IPA range mismatch\n", smp_processor_id());
+		printk_deferred(KERN_CRIT "CPU%d: IPA range mismatch\n", smp_processor_id());
 		cpu_die_early();
 	}
 }
@@ -3776,7 +3776,7 @@ static void verify_mpam_capabilities(void)
 
 	if (FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, cpu_idr) !=
 	    FIELD_GET(ID_AA64PFR0_EL1_MPAM_MASK, sys_idr)) {
-		pr_crit("CPU%d: MPAM version mismatch\n", smp_processor_id());
+		printk_deferred(KERN_CRIT "CPU%d: MPAM version mismatch\n", smp_processor_id());
 		cpu_die_early();
 	}
 
@@ -3784,7 +3784,7 @@ static void verify_mpam_capabilities(void)
 	sys_idr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
 	if (FIELD_GET(MPAMIDR_EL1_HAS_HCR, cpu_idr) !=
 	    FIELD_GET(MPAMIDR_EL1_HAS_HCR, sys_idr)) {
-		pr_crit("CPU%d: Missing MPAM HCR\n", smp_processor_id());
+		printk_deferred(KERN_CRIT "CPU%d: Missing MPAM HCR\n", smp_processor_id());
 		cpu_die_early();
 	}
 
@@ -3793,7 +3793,7 @@ static void verify_mpam_capabilities(void)
 	sys_partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, sys_idr);
 	sys_pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, sys_idr);
 	if (cpu_partid_max < sys_partid_max || cpu_pmg_max < sys_pmg_max) {
-		pr_crit("CPU%d: MPAM PARTID/PMG max values are mismatched\n", smp_processor_id());
+		printk_deferred(KERN_CRIT "CPU%d: MPAM PARTID/PMG max values are mismatched\n", smp_processor_id());
 		cpu_die_early();
 	}
 }
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 6bc90ee4820a..52edabc13d51 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -215,7 +215,6 @@ asmlinkage notrace void secondary_start_kernel(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
-	rcutree_report_cpu_starting(cpu);
 	trace_hardirqs_off();
 
 	/*
@@ -224,6 +223,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * fail to come online.
 	 */
 	check_local_cpu_capabilities();
+	rcutree_report_cpu_starting(cpu);
 
 	ops = get_cpu_ops(cpu);
 	if (ops->cpu_postboot)
@@ -404,7 +404,7 @@ void __noreturn cpu_die_early(void)
 {
 	int cpu = smp_processor_id();
 
-	pr_crit("CPU%d: will not boot\n", cpu);
+	printk_deferred(KERN_CRIT "CPU%d: will not boot\n", cpu);
 
 	/* Mark this CPU absent */
 	set_cpu_present(cpu, 0);
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 6b8a3245f393..9b5ab56aad5a 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -70,7 +70,7 @@ void verify_cpu_asid_bits(void)
 		 * We cannot decrease the ASID size at runtime, so panic if we support
 		 * fewer ASID bits than the boot CPU.
 		 */
-		pr_crit("CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
+		printk_deferred(KERN_CRIT "CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
 				smp_processor_id(), asid, asid_bits);
 		cpu_panic_kernel(smp_processor_id());
 	}
-- 
2.34.1


