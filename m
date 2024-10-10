Return-Path: <linux-mips+bounces-5867-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C0997F0C
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7832288A1B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A863E1C9DFA;
	Thu, 10 Oct 2024 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ik1XdEaE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hCd3Bhj5"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0A1C8FD7;
	Thu, 10 Oct 2024 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543744; cv=none; b=ASBQh//hxu1yIGdwhr6vFm3cQUXJ/S+SdRdvfVlRo4fQMOuu1M/+h7bcfv41Xi+vvQH3fC59Q/aqM92L4H4vPG5lrqAHpA6tRNmf1MHf1ANawIBFXLEUlu7rA3NIUNoArULeCU7Cc5WDrp4Y2YGU60AJJ2oCivNazMozK7ogdrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543744; c=relaxed/simple;
	bh=ZZQboHnvnM/bbbcRKZGn1rcNop+vkySTie1MKJiNcgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bkswejTdnvO9gfqBd69HyzH7rzwxv1sPstUIMUDr+ZjrSO07UuHM9SUtbHrLGw369udsbj0GP34fLmbhuVDBBUsUefELlQffWAmZwlHE1ZwGFAzLVIlzVvEO8F1Y+nck/m8ibmF7alAFS6lII7Q5PJhEnBMozHEBk/cNWWnjrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ik1XdEaE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hCd3Bhj5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggRaDaX6ovjaR/pgmAGOq81HkwzXwku56vCBX7V7EuU=;
	b=Ik1XdEaEs4H9sp4p5A8otWVE0rp2agkzUOfCOtDOMM2R1mnMowfHXVevZpm2i1mNCyOfDY
	7FCEsHIhtCJlx4tT6vDTbfWtQyGDYJPqKX7LM12+5boNVT9/E+5PQLC1Fy+3Y7w72rzI9i
	tdJBtEs2+6LGCLQGULLhc43obQenaRRNKckpS838mb79mmkzb9/T50FXAoCV06M1xUU9/3
	u6x9wSj784mwHahOs0+ZDz9gIJ2kgY+XRbi++9WoUxO4s0vqQi+QJE2Rx4xWWL7/ao0nGv
	X5mYo/sUyAfgXV7u3AlAEwWPhfHrDOD3U+Ib0v7j6zWgMp648uJcGJ3hp2csGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggRaDaX6ovjaR/pgmAGOq81HkwzXwku56vCBX7V7EuU=;
	b=hCd3Bhj5uIQctZS0Z5iZSxNs9zFYXt9f6SMaLc73TXRx/J2cC4J+nnXuqu2WjTjc2DIliG
	+qmHBFAXv/FVh6Cg==
Date: Thu, 10 Oct 2024 09:01:28 +0200
Subject: [PATCH 26/28] powerpc: Split systemcfg data out of vdso data page
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-26-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=9933;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZZQboHnvnM/bbbcRKZGn1rcNop+vkySTie1MKJiNcgA=;
 b=SFHp9Xid9TmBG1Yr5k86mnVbeTrQdZPHTL8n5V1Lqq+h7fZb5/X/Jza64YOf3xUnqKnp7NljO
 /HlIxt8QEIiDlxxAddTRxO/f21tO3heN26Zeb8mlAniD/hWk65+d/DE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The systemcfg data only has minimal overlap with the vdso data.
Splitting the two avoids mapping the implementation-defined vdso data
into /proc/ppc64/systemcfg.
It is also a preparation for the standardization of vdso data storage.

The only field actually used by both systemcfg and vdso is
tb_ticks_per_sec and it is only changed once during time_init().
Initialize it in both structures there.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso_datapage.h     | 32 ++++++----------------------
 arch/powerpc/kernel/proc_powerpc.c           | 25 +++++++++++++++++++++-
 arch/powerpc/kernel/setup-common.c           |  4 +++-
 arch/powerpc/kernel/smp.c                    | 10 +++++----
 arch/powerpc/kernel/time.c                   |  3 +++
 arch/powerpc/kernel/vdso.c                   | 20 -----------------
 arch/powerpc/platforms/powernv/smp.c         |  4 +++-
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  4 +++-
 8 files changed, 48 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 3d5862d4c4e1618a27840d9136e890870e78a761..8b91b1d34ff639a0efb80b9cdd7274f785643153 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -10,21 +10,6 @@
  */
 
 
-/*
- * Note about this structure:
- *
- * This structure was historically called systemcfg and exposed to
- * userland via /proc/ppc64/systemcfg. Unfortunately, this became an
- * ABI issue as some proprietary software started relying on being able
- * to mmap() it, thus we have to keep the base layout at least for a
- * few kernel versions.
- *
- * However, since ppc32 doesn't suffer from this backward handicap,
- * a simpler version of the data structure is used there with only the
- * fields actually used by the vDSO.
- *
- */
-
 /*
  * If the major version changes we are incompatible.
  * Minor version changes are a hint.
@@ -40,13 +25,9 @@
 
 #define SYSCALL_MAP_SIZE      ((NR_syscalls + 31) / 32)
 
-/*
- * So here is the ppc64 backward compatible version
- */
-
 #ifdef CONFIG_PPC64
 
-struct vdso_arch_data {
+struct systemcfg {
 	__u8  eye_catcher[16];		/* Eyecatcher: SYSTEMCFG:PPC64	0x00 */
 	struct {			/* Systemcfg version numbers	     */
 		__u32 major;		/* Major number			0x10 */
@@ -71,10 +52,12 @@ struct vdso_arch_data {
 	__u32 dcache_line_size;		/* L1 d-cache line size		0x64 */
 	__u32 icache_size;		/* L1 i-cache size		0x68 */
 	__u32 icache_line_size;		/* L1 i-cache line size		0x6C */
+};
 
-	/* those additional ones don't have to be located anywhere
-	 * special as they were not part of the original systemcfg
-	 */
+extern struct systemcfg *systemcfg;
+
+struct vdso_arch_data {
+	__u64 tb_ticks_per_sec;			/* Timebase tics / sec */
 	__u32 dcache_block_size;		/* L1 d-cache block size     */
 	__u32 icache_block_size;		/* L1 i-cache block size     */
 	__u32 dcache_log_block_size;		/* L1 d-cache log block size */
@@ -88,9 +71,6 @@ struct vdso_arch_data {
 
 #else /* CONFIG_PPC64 */
 
-/*
- * And here is the simpler 32 bits version
- */
 struct vdso_arch_data {
 	__u64 tb_ticks_per_sec;		/* Timebase tics / sec */
 	__u32 syscall_map[SYSCALL_MAP_SIZE]; /* Map of syscalls */
diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index 3bda365843e44357538651c6c24c11a41de2eb06..e8083e05a1d03f74d9f24bac99e3ab526368c8e2 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/proc_fs.h>
 #include <linux/kernel.h>
@@ -44,13 +45,35 @@ static const struct proc_ops page_map_proc_ops = {
 	.proc_mmap	= page_map_mmap,
 };
 
+static union {
+	struct systemcfg	data;
+	u8			page[PAGE_SIZE];
+} systemcfg_data_store __page_aligned_data;
+struct systemcfg *systemcfg = &systemcfg_data_store.data;
 
 static int __init proc_ppc64_init(void)
 {
 	struct proc_dir_entry *pde;
 
+	strcpy((char *)systemcfg->eye_catcher, "SYSTEMCFG:PPC64");
+	systemcfg->version.major = SYSTEMCFG_MAJOR;
+	systemcfg->version.minor = SYSTEMCFG_MINOR;
+	systemcfg->processor = mfspr(SPRN_PVR);
+	/*
+	 * Fake the old platform number for pSeries and add
+	 * in LPAR bit if necessary
+	 */
+	systemcfg->platform = 0x100;
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		systemcfg->platform |= 1;
+	systemcfg->physicalMemorySize = memblock_phys_mem_size();
+	systemcfg->dcache_size = ppc64_caches.l1d.size;
+	systemcfg->dcache_line_size = ppc64_caches.l1d.line_size;
+	systemcfg->icache_size = ppc64_caches.l1i.size;
+	systemcfg->icache_line_size = ppc64_caches.l1i.line_size;
+
 	pde = proc_create_data("powerpc/systemcfg", S_IFREG | 0444, NULL,
-			       &page_map_proc_ops, vdso_data);
+			       &page_map_proc_ops, systemcfg);
 	if (!pde)
 		return 1;
 	proc_set_size(pde, PAGE_SIZE);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 943430077375a4e3c95f4ee9c8d38270081d557e..d0b32ff2bc8dedc5aa7afce17f07a5c7c255387c 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -560,7 +560,9 @@ void __init smp_setup_cpu_maps(void)
 	out:
 		of_node_put(dn);
 	}
-	vdso_data->processorCount = num_present_cpus();
+#endif
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
+	systemcfg->processorCount = num_present_cpus();
 #endif /* CONFIG_PPC64 */
 
         /* Initialize CPU <=> thread mapping/
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 4ab9b8cee77a1a775b22ed041d62ca43c9e1f61d..87ae45bf1045d8974e3eed09e284bc582310f3e2 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1186,8 +1186,8 @@ int generic_cpu_disable(void)
 		return -EBUSY;
 
 	set_cpu_online(cpu, false);
-#ifdef CONFIG_PPC64
-	vdso_data->processorCount--;
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
+	systemcfg->processorCount--;
 #endif
 	/* Update affinity of all IRQs previously aimed at this CPU */
 	irq_migrate_all_off_this_cpu();
@@ -1642,10 +1642,12 @@ void start_secondary(void *unused)
 
 	secondary_cpu_time_init();
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
 	if (system_state == SYSTEM_RUNNING)
-		vdso_data->processorCount++;
+		systemcfg->processorCount++;
+#endif
 
+#ifdef CONFIG_PPC64
 	vdso_getcpu_init();
 #endif
 	set_numa_node(numa_cpu_lookup_table[cpu]);
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 0ff9f038e800db6dbc910ce581550b457ee5f2db..6c53a0153c0d1c7cd74017a4dadb09ba149e456f 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -951,6 +951,9 @@ void __init time_init(void)
 	}
 
 	vdso_data->tb_ticks_per_sec = tb_ticks_per_sec;
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
+	systemcfg->tb_ticks_per_sec = tb_ticks_per_sec;
+#endif
 
 	/* initialise and enable the large decrementer (if we have one) */
 	set_decrementer_max();
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index ee4b9d676cff546caced78f6dd76923239697a3c..924f7f4fa597ef4b78f3e8a11ea1c22909c9f0c2 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -16,7 +16,6 @@
 #include <linux/user.h>
 #include <linux/elf.h>
 #include <linux/security.h>
-#include <linux/memblock.h>
 #include <linux/syscalls.h>
 #include <linux/time_namespace.h>
 #include <vdso/datapage.h>
@@ -349,25 +348,6 @@ static struct page ** __init vdso_setup_pages(void *start, void *end)
 static int __init vdso_init(void)
 {
 #ifdef CONFIG_PPC64
-	/*
-	 * Fill up the "systemcfg" stuff for backward compatibility
-	 */
-	strcpy((char *)vdso_data->eye_catcher, "SYSTEMCFG:PPC64");
-	vdso_data->version.major = SYSTEMCFG_MAJOR;
-	vdso_data->version.minor = SYSTEMCFG_MINOR;
-	vdso_data->processor = mfspr(SPRN_PVR);
-	/*
-	 * Fake the old platform number for pSeries and add
-	 * in LPAR bit if necessary
-	 */
-	vdso_data->platform = 0x100;
-	if (firmware_has_feature(FW_FEATURE_LPAR))
-		vdso_data->platform |= 1;
-	vdso_data->physicalMemorySize = memblock_phys_mem_size();
-	vdso_data->dcache_size = ppc64_caches.l1d.size;
-	vdso_data->dcache_line_size = ppc64_caches.l1d.line_size;
-	vdso_data->icache_size = ppc64_caches.l1i.size;
-	vdso_data->icache_line_size = ppc64_caches.l1i.line_size;
 	vdso_data->dcache_block_size = ppc64_caches.l1d.block_size;
 	vdso_data->icache_block_size = ppc64_caches.l1i.block_size;
 	vdso_data->dcache_log_block_size = ppc64_caches.l1d.log_block_size;
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 8f14f0581a21b131411eedcccec5c6775a0353fe..672209428b98459ef0a5595c0ec7128a5c5f17a2 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -136,7 +136,9 @@ static int pnv_smp_cpu_disable(void)
 	 * the generic fixup_irqs. --BenH.
 	 */
 	set_cpu_online(cpu, false);
-	vdso_data->processorCount--;
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
+	systemcfg->processorCount--;
+#endif
 	if (cpu == boot_cpuid)
 		boot_cpuid = cpumask_any(cpu_online_mask);
 	if (xive_enabled())
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 6838a0fcda296b1b03fbe7d1bfdcee138343b862..7b80d35d045dc9d947c0b512a58a82ef7398150d 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -83,7 +83,9 @@ static int pseries_cpu_disable(void)
 	int cpu = smp_processor_id();
 
 	set_cpu_online(cpu, false);
-	vdso_data->processorCount--;
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
+	systemcfg->processorCount--;
+#endif
 
 	/*fix boot_cpuid here*/
 	if (cpu == boot_cpuid)

-- 
2.47.0


