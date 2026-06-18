Return-Path: <linux-mips+bounces-15136-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ShnLF865M2oQFgYAu9opvQ
	(envelope-from <linux-mips+bounces-15136-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:26:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CC69ED98
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:26:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=Q8B29D0z;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15136-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15136-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6D203041307
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 09:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571933D7D61;
	Thu, 18 Jun 2026 09:26:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8363C4575;
	Thu, 18 Jun 2026 09:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774774; cv=none; b=kkyaGmnYq3QZv4CuMqQT67rhpabH0BR6E2xCVMDchb62rt70EnTjvvE1KfTNfQu1kSlaNgPKAgRr7yC5+VPXtM1dNNWK4VdWG9V6ddixGXO43SCqVMRqZfsQMn48Y2zBdqaGZZcg5NjizNSey+zMEwgycw25uC7z8fz3m+84jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774774; c=relaxed/simple;
	bh=+kLKeN9As0vdHAmdyhHNMU1eWIrlwrxzYYBy+T/YcdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mR0LApyCY9yBlipz/fbg7EDH7C/9zXJnbPBuzcTLG7ttC2VFfy0F4KJXFjf80HN3tNPDPqM4ZokilcWTM7mJQP1eCsZAZK+g/9xUn9BYLuwECa55yWqJRfdWPBQ49KStlRuK5frQdA9kH3WQ5VOqXXC4K1rFS92vAT32GpizgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Q8B29D0z; arc=none smtp.client-ip=113.46.200.224
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=M2DVm3kV6Ggi8rv8O5YqfCiXLk7nZR1mnvOZP3H/9bQ=;
	b=Q8B29D0zg2x24QYMY56En+H9ByPxLoagoKjJ4PBlPDI+UPKSz/G8+sSVEf9RKfYV6Kb5kTzQ0
	vu10qTrjjuUFHGbCJ2o4pry5inI42gZ4gwjqp5TQUH8gWGGYgiTRHZT28nj3yzcGNUja0Kz0Hcy
	aA1mw4xEqQ9sveRqX92PZrQ=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ggwB83cyFz1cyVP;
	Thu, 18 Jun 2026 17:18:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E41D4056E;
	Thu, 18 Jun 2026 17:26:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:26:04 +0800
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
Subject: [PATCH v2 4/4] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 18 Jun 2026 17:24:44 +0800
Message-ID: <20260618092444.1316336-5-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15136-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,gmail.com,linaro.org,google.com,arndb.de,vger.kernel.org,lists.infradead.org,ventanamicro.com,outlook.com];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:jpoimboe@kernel.org,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:apatel@ventanamicro.com,m:mhklinux@outlook.com,m:ruanjinjie
 @huawei.com,m:menglong8dong@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,b.ne:url,vger.kernel.org:from_smtp,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE0CC69ED98

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array `cpu_boot_data` to allow secondary CPUs to boot
in parallel.

And reuse `__cpu_logical_map` array in the early boot code in head.S
to resolve each secondary CPU's logical ID concurrently.

To fully enable HOTPLUG_PARALLEL, this patch implements:
1) An arm64-specific arch_cpuhp_init_parallel_bringup() handler.
2) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
3) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().

Tested natively with ATF on QEMU arm64 virt machine with 64 cores
and also tested with KVM arm64 guest with 128 vCPUs.

Bringup Time Comparison (ms, lower is better):

|     Platform			   | Baseline|   P=0   |   P=1  | Delta(%)|
| -------------------------------- | ------- | ------- | ------ | ------- |
| 128 vCPUs KVM (256-core HIP09)   | 1921.5  | 1895.9  | 2776.9 | -44.52% |
| 48 vCPUs KVM (64-core Cortex-A72)| 3644.7  | 3883.6  | 4406.3 | -20.9%  |
| 64-core ATF QEMU		   | 2075.8  | 2080.7  | 1653.4 | 20.34%  |
| 192-core server(HIP12)	   | 14619.2 | 14619.1 | 8589.4 | 41.21%  |
| 32-core board			   | 2776.5  | 2881.0  | 1045.0 | 62.36%  |

Tested-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/smp.h    | 11 ++++++++++
 arch/arm64/kernel/asm-offsets.c |  4 ++++
 arch/arm64/kernel/head.S        | 36 +++++++++++++++++++++++++++++++++
 arch/arm64/kernel/smp.c         | 33 ++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9091c67e1cc2..8735e9d8ed13 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -113,6 +113,7 @@ config ARM64
 	select CPUMASK_OFFSTACK if NR_CPUS > 256
 	select DCACHE_WORD_ACCESS
 	select HAVE_EXTRA_IPI_TRACEPOINTS
+	select HOTPLUG_PARALLEL if SMP && HOTPLUG_CPU
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select DMA_BOUNCE_UNALIGNED_KMALLOC
 	select DMA_DIRECT_REMAP
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index e2151a01731f..30025030489c 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -92,7 +92,14 @@ struct secondary_data {
 	long status;
 };
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+static_assert((sizeof(struct secondary_data) & (sizeof(struct secondary_data) - 1)) == 0,
+	      "secondary_data size must be a power of 2 for assembly lsl assembly!");
+
+extern struct secondary_data cpu_boot_data[NR_CPUS];
+#else
 extern struct secondary_data secondary_data;
+#endif
 extern long __early_cpu_boot_status;
 extern void secondary_entry(void);
 
@@ -124,7 +131,11 @@ static inline void __noreturn cpu_park_loop(void)
 
 static inline void update_cpu_boot_status(unsigned int cpu, int val)
 {
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	WRITE_ONCE(cpu_boot_data[cpu].status, val);
+#else
 	WRITE_ONCE(secondary_data.status, val);
+#endif
 	/* Ensure the visibility of the status update */
 	dsb(ishst);
 }
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index b6367ff3a49c..0a0aa965dbb4 100644
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
@@ -97,6 +98,9 @@ int main(void)
   BLANK();
 #endif
   DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
+#ifdef CONFIG_HOTPLUG_PARALLEL
+  DEFINE(SECONDARY_DATA_SHIFT,	ilog2(sizeof(struct secondary_data)));
+#endif
   BLANK();
   DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
   DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..000ab1acf7c5 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -12,6 +12,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/threads.h>
 
 #include <asm/asm_pointer_auth.h>
 #include <asm/assembler.h>
@@ -378,6 +379,33 @@ alternative_else_nop_endif
 	br	x8
 SYM_FUNC_END(secondary_startup)
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
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
+#endif
+
 	.text
 SYM_FUNC_START_LOCAL(__secondary_switched)
 	mov	x0, x20
@@ -391,7 +419,15 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	msr	vbar_el1, x5
 	isb
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	mrs	x0, mpidr_el1
+	mpidr_to_cpuid mpidr=x0, cpuid=x2, tmp1=x1, tmp2=x3
+
+	adr_l	x0, cpu_boot_data
+	add	x0, x0, x2, lsl #SECONDARY_DATA_SHIFT
+#else
 	adr_l	x0, secondary_data
+#endif
 	ldr	x2, [x0, #CPU_BOOT_TASK]
 	cbz	x2, __secondary_too_slow
 
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 52edabc13d51..f7562c38d724 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -61,6 +61,11 @@
  * where to place its SVC stack
  */
 struct secondary_data secondary_data;
+
+#ifdef CONFIG_HOTPLUG_PARALLEL
+struct secondary_data cpu_boot_data[NR_CPUS] ____cacheline_aligned;
+#endif
+
 /* Number of CPUs which aren't online, but looping in kernel text. */
 static int cpus_stuck_in_kernel;
 
@@ -106,8 +111,30 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return -EOPNOTSUPP;
 }
 
+#ifndef CONFIG_HOTPLUG_PARALLEL
 static DECLARE_COMPLETION(cpu_running);
+#endif
+
+#ifdef CONFIG_HOTPLUG_PARALLEL
+extern const struct cpu_operations smp_spin_table_ops;
+
+/* Establish whether parallel bringup can be supported. */
+bool __init arch_cpuhp_init_parallel_bringup(void)
+{
+	int cpu = smp_processor_id();
+	const struct cpu_operations *ops = get_cpu_ops(cpu);
 
+	return ops && ops != &smp_spin_table_ops;
+}
+
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
+{
+	cpu_boot_data[cpu].task = tidle;
+	update_cpu_boot_status(cpu, CPU_MMU_OFF);
+
+	return boot_secondary(cpu, tidle);
+}
+#else
 int __cpu_up(unsigned int cpu, struct task_struct *idle)
 {
 	int ret;
@@ -172,6 +199,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	return -EIO;
 }
+#endif /* CONFIG_HOTPLUG_PARALLEL */
 
 static void init_gic_priority_masking(void)
 {
@@ -223,6 +251,9 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * fail to come online.
 	 */
 	check_local_cpu_capabilities();
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	cpuhp_ap_sync_alive();
+#endif
 	rcutree_report_cpu_starting(cpu);
 
 	ops = get_cpu_ops(cpu);
@@ -254,7 +285,9 @@ asmlinkage notrace void secondary_start_kernel(void)
 					 read_cpuid_id());
 	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
+#ifndef CONFIG_HOTPLUG_PARALLEL
 	complete(&cpu_running);
+#endif
 
 	/*
 	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.
-- 
2.34.1


