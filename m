Return-Path: <linux-mips+bounces-15191-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SVr1BnOjO2rJaggAu9opvQ
	(envelope-from <linux-mips+bounces-15191-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:29:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 790196BCF20
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=AN4lTXdi;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15191-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15191-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63D3730B5639
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56205212F89;
	Wed, 24 Jun 2026 09:26:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D33B42D1;
	Wed, 24 Jun 2026 09:26:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293202; cv=none; b=BYvVAWKaAVTKZk6E/brrh6XtGGmhO8m8rz9KZBlz95MARGycWA5AMIgY2PeYkh3oLUrMCbuqG7tDCWSMJ2xyxZpAcD+q9zgFiQOi7aVZmaWjKwdrtQ5/1oOf5SfID08RnsZMhd5rLxYsxiuPvVenpdh7F57++U/Q4aHdi5rBT8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293202; c=relaxed/simple;
	bh=QVRpdse8SYPFTSaJgZX9Vks+V9+jj4UNkYZskW7I7A4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YT2irAgEOCQniApZIB1ykU9m381pd6G6kyUt7xM0BG3CucmyQ+BcfzmbnInMb2CBSh7bYQinYzUQSMecqSoThzzoLKaKSojR+PcZIsVNEVQKCIUnPCxwj0GDE3YPIpcfh1SpmbkPKUkrZEMd9xMSHunNTA9vp8aewLDjQp9Jsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AN4lTXdi; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7XKXc2p5ag8Wa8/6XrQXWDs59HMGtBvpBa1OVw7Td60=;
	b=AN4lTXdinG4wA7//CyLXFAYU6HQl3xbEaPap7wN2hGfyaKBwvIekN0zqGDQUCgghcwh6Y6akR
	kFWSpVHBh3Grt/Nk6w+EtFG94o7/HFC2GeW7IPUnDbSVdLtmiVuLHfIMPd6mnSQQx1/QhMCubE1
	l9ooLMxXb2UBPG4EFTKCGec=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4glbtD1cLFz1prQ6;
	Wed, 24 Jun 2026 17:17:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E4D640561;
	Wed, 24 Jun 2026 17:26:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:13 +0800
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
Subject: [PATCH v3 11/12] arm64: smp: Rework early boot data into per-CPU arrays
Date: Wed, 24 Jun 2026 17:25:36 +0800
Message-ID: <20260624092537.2916971-12-ruanjinjie@huawei.com>
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
	TAGGED_FROM(0.00)[bounces-15191-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,b.ne:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 790196BCF20

Rework the global `secondary_data` and `__early_cpu_boot_status`
accessed during early boot into per-CPU arrays to allow secondary
CPUs to boot in parallel.

And reuse `__cpu_logical_map` array in the early boot code in head.S
to resolve each secondary CPU's logical ID concurrently.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/smp.h    | 16 ++++++------
 arch/arm64/kernel/asm-offsets.c |  2 ++
 arch/arm64/kernel/head.S        | 44 +++++++++++++++++++++++++++------
 arch/arm64/kernel/setup.c       |  9 +++++++
 arch/arm64/kernel/smp.c         | 11 +++++----
 arch/arm64/mm/mmu.c             |  2 +-
 6 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index e2151a01731f..7e69219e6e33 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -34,14 +34,9 @@
 /*
  * Logical CPU mapping.
  */
-extern u64 __cpu_logical_map[NR_CPUS];
+extern void set_cpu_logical_map(unsigned int cpu, u64 hwid);
 extern u64 cpu_logical_map(unsigned int cpu);
 
-static inline void set_cpu_logical_map(unsigned int cpu, u64 hwid)
-{
-	__cpu_logical_map[cpu] = hwid;
-}
-
 struct seq_file;
 
 /*
@@ -92,8 +87,11 @@ struct secondary_data {
 	long status;
 };
 
-extern struct secondary_data secondary_data;
-extern long __early_cpu_boot_status;
+static_assert((sizeof(struct secondary_data) & (sizeof(struct secondary_data) - 1)) == 0,
+	      "secondary_data size must be a power of 2 for assembly lsl assembly!");
+
+extern struct secondary_data cpu_boot_data[NR_CPUS];
+extern long __early_cpu_boot_status[NR_CPUS];
 extern void secondary_entry(void);
 
 extern void arch_send_call_function_single_ipi(int cpu);
@@ -124,7 +122,7 @@ static inline void __noreturn cpu_park_loop(void)
 
 static inline void update_cpu_boot_status(unsigned int cpu, int val)
 {
-	WRITE_ONCE(secondary_data.status, val);
+	WRITE_ONCE(cpu_boot_data[cpu].status, val);
 	/* Ensure the visibility of the status update */
 	dsb(ishst);
 }
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index b6367ff3a49c..566e2222af5b 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -11,6 +11,7 @@
 #include <linux/arm_sdei.h>
 #include <linux/sched.h>
 #include <linux/ftrace.h>
+#include <linux/log2.h>
 #include <linux/kexec.h>
 #include <linux/mm.h>
 #include <linux/kvm_host.h>
@@ -97,6 +98,7 @@ int main(void)
   BLANK();
 #endif
   DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
+  DEFINE(SECONDARY_DATA_SHIFT,	ilog2(sizeof(struct secondary_data)));
   BLANK();
   DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
   DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..f58de58c4edc 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -12,6 +12,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/threads.h>
 
 #include <asm/asm_pointer_auth.h>
 #include <asm/assembler.h>
@@ -348,6 +349,31 @@ pen:	ldr	x4, [x3]
 	b	pen
 SYM_FUNC_END(secondary_holding_pen)
 
+	/*
+	 * Convert the physical MPIDR of the current secondary CPU
+	 * to its logical CPUID by traversing __cpu_logical_map
+	 * in parallel.
+	 */
+	.macro	mpidr_to_cpuid, mpidr, cpuid, tmp1, tmp2
+	mov_q	\tmp1, MPIDR_HWID_BITMASK
+	and	\mpidr, \mpidr, \tmp1
+
+	adr_l	\tmp1, __cpu_logical_map
+	mov	\cpuid, #0
+.Lfind_cpuid\@:
+	ldr	\tmp2, [\tmp1, \cpuid, lsl #3]
+	cmp	\tmp2, #-1
+	b.eq	.Lnext_cpu\@
+	cmp	\tmp2, \mpidr
+	b.eq	.Lfound_cpuid\@
+.Lnext_cpu\@:
+	add	\cpuid, \cpuid, #1
+	cmp	\cpuid, #NR_CPUS
+	b.ne	.Lfind_cpuid\@
+	b	__secondary_too_slow
+.Lfound_cpuid\@:
+	.endm
+
 	/*
 	 * Secondary entry point that jumps straight into the kernel. Only to
 	 * be used where CPUs are brought online dynamically by the kernel.
@@ -363,6 +389,8 @@ SYM_FUNC_START_LOCAL(secondary_startup)
 	 * Common entry point for secondary CPUs.
 	 */
 	mov	x20, x0				// preserve boot mode
+	mrs	x0, mpidr_el1
+	mpidr_to_cpuid mpidr=x0, cpuid=x19, tmp1=x1, tmp2=x3
 
 #ifdef CONFIG_ARM64_VA_BITS_52
 alternative_if ARM64_HAS_VA52
@@ -386,12 +414,12 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	mov	x0, x20
 	bl	finalise_el2
 
-	str_l	xzr, __early_cpu_boot_status, x3
 	adr_l	x5, vectors
 	msr	vbar_el1, x5
 	isb
 
-	adr_l	x0, secondary_data
+	adr_l	x0, cpu_boot_data
+	add	x0, x0, x19, lsl #SECONDARY_DATA_SHIFT
 	ldr	x2, [x0, #CPU_BOOT_TASK]
 	cbz	x2, __secondary_too_slow
 
@@ -430,13 +458,14 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
  *
  * update_early_cpu_boot_status tmp, status
  *  - Corrupts tmp1, tmp2
- *  - Writes 'status' to __early_cpu_boot_status and makes sure
+ *  - Writes 'status' to __early_cpu_boot_status[cpu] and makes sure
  *    it is committed to memory.
  */
 
-	.macro	update_early_cpu_boot_status status, tmp1, tmp2
-	mov	\tmp2, #\status
+	.macro	update_early_cpu_boot_status status, cpu_reg, tmp1, tmp2
 	adr_l	\tmp1, __early_cpu_boot_status
+	mov	\tmp2, #\status
+	add	\tmp1, \tmp1, \cpu_reg, lsl #3
 	str	\tmp2, [\tmp1]
 	dmb	sy
 	dc	ivac, \tmp1			// Invalidate potentially stale cache line
@@ -486,7 +515,7 @@ SYM_FUNC_START(__cpu_secondary_check52bitva)
 #endif
 
 	update_early_cpu_boot_status \
-		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_52_BIT_VA, x0, x1
+		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_52_BIT_VA, x19, x0, x1
 1:	wfe
 	wfi
 	b	1b
@@ -498,7 +527,7 @@ SYM_FUNC_END(__cpu_secondary_check52bitva)
 SYM_FUNC_START_LOCAL(__no_granule_support)
 	/* Indicate that this CPU can't boot and is stuck in the kernel */
 	update_early_cpu_boot_status \
-		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_NO_GRAN, x1, x2
+		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_NO_GRAN, x19, x1, x2
 1:
 	wfe
 	wfi
@@ -508,6 +537,7 @@ SYM_FUNC_END(__no_granule_support)
 SYM_FUNC_START_LOCAL(__primary_switch)
 	adrp	x1, reserved_pg_dir
 	adrp	x2, __pi_init_idmap_pg_dir
+	mov	x19, #0
 	bl	__enable_mmu
 
 	adrp	x1, early_init_stack
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..856c00ab6f19 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -273,6 +273,15 @@ arch_initcall(reserve_memblock_reserved_regions);
 
 u64 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HWID };
 
+void set_cpu_logical_map(unsigned int cpu, u64 hwid)
+{
+	unsigned long start = (unsigned long)&__cpu_logical_map[cpu];
+	unsigned long end = start + sizeof(__cpu_logical_map[cpu]);
+
+	__cpu_logical_map[cpu] = hwid;
+	dcache_clean_inval_poc(start, end);
+}
+
 u64 cpu_logical_map(unsigned int cpu)
 {
 	return __cpu_logical_map[cpu];
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 14b94df26b44..98ddbe50081d 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -61,7 +61,8 @@
  * so we need some other way of telling a new secondary core
  * where to place its SVC stack
  */
-struct secondary_data secondary_data;
+struct secondary_data cpu_boot_data[NR_CPUS] ____cacheline_aligned;
+
 /* Number of CPUs which aren't online, but looping in kernel text. */
 static int cpus_stuck_in_kernel;
 
@@ -115,7 +116,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	secondary_data.task = idle;
+	cpu_boot_data[cpu].task = idle;
 	update_cpu_boot_status(cpu, CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
@@ -136,10 +137,10 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 	 * We failed to synchronise with the CPU, so check if it left us
 	 * any breadcrumbs.
 	 */
-	secondary_data.task = NULL;
-	status = READ_ONCE(secondary_data.status);
+	cpu_boot_data[cpu].task = NULL;
+	status = READ_ONCE(cpu_boot_data[cpu].status);
 	if (status == CPU_MMU_OFF)
-		status = READ_ONCE(__early_cpu_boot_status);
+		status = READ_ONCE(__early_cpu_boot_status[cpu]);
 
 	switch (status & CPU_BOOT_STATUS_MASK) {
 	default:
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..71c160c6c383 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -62,7 +62,7 @@ static bool rodata_is_rw __ro_after_init = true;
  * The booting CPU updates the failed status @__early_cpu_boot_status,
  * with MMU turned off.
  */
-long __section(".mmuoff.data.write") __early_cpu_boot_status;
+long __section(".mmuoff.data.write") __early_cpu_boot_status[NR_CPUS];
 
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
-- 
2.34.1


