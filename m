Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8B032C893
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237139AbhCDAut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:55332 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378337AbhCCS6g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 13:58:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D7558ADDB;
        Wed,  3 Mar 2021 18:57:18 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH] MIPS: kernel: Reserve exception base early to prevent corruption
Date:   Wed,  3 Mar 2021 19:57:13 +0100
Message-Id: <20210303185713.122531-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BMIPS is one of the few platforms that do change the exception base.
After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
with kernel_end") we started seeing BMIPS boards fail to boot with the
built-in FDT being corrupted.

Before the cited commit, early allocations would be in the [kernel_end,
RAM_END] range, but after commit they would be within [RAM_START +
PAGE_SIZE, RAM_END].

The custom exception base handler that is installed by
bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
memory region allocated by unflatten_and_copy_device_tree() thus
corrupting the FDT used by the kernel.

To fix this, we need to perform an early reservation of the custom
exception space. So we reserve it already in cpu_probe() for the CPUs
where this is fixed. For CPU with an ebase config register allocation
of exception space will be done in trap_init().

Huge thanks to Serget for analysing and proposing a solution to this
issue.

Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/traps.h    |  4 ++++
 arch/mips/kernel/cpu-probe.c     |  7 +++++++
 arch/mips/kernel/cpu-r3k-probe.c |  3 +++
 arch/mips/kernel/smp-bmips.c     |  9 +--------
 arch/mips/kernel/traps.c         | 31 ++++++++++++++++---------------
 5 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 6aa8f126a43d..d74d829e1655 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -24,7 +24,11 @@ extern void (*board_ebase_setup)(void);
 extern void (*board_cache_error_setup)(void);
 
 extern int register_nmi_notifier(struct notifier_block *nb);
+extern void reserve_exception_space(unsigned long addr, unsigned long size);
 extern char except_vec_nmi[];
+extern unsigned long ebase_size;
+
+#define VECTORSPACING 0x100	/* for EI/VI mode */
 
 #define nmi_notifier(fn, pri)						\
 ({									\
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 9a89637b4ecf..effc45cbb351 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -26,6 +26,7 @@
 #include <asm/elf.h>
 #include <asm/pgtable-bits.h>
 #include <asm/spram.h>
+#include <asm/traps.h>
 #include <linux/uaccess.h>
 
 #include "fpu-probe.h"
@@ -1628,6 +1629,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_BMIPS3300;
 		__cpu_name[cpu] = "Broadcom BMIPS3300";
 		set_elf_platform(cpu, "bmips3300");
+		reserve_exception_space(0x80000400, VECTORSPACING * 64);
 		break;
 	case PRID_IMP_BMIPS43XX: {
 		int rev = c->processor_id & PRID_REV_MASK;
@@ -1638,6 +1640,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS4380";
 			set_elf_platform(cpu, "bmips4380");
 			c->options |= MIPS_CPU_RIXI;
+			reserve_exception_space(0x80000400, VECTORSPACING * 64);
 		} else {
 			c->cputype = CPU_BMIPS4350;
 			__cpu_name[cpu] = "Broadcom BMIPS4350";
@@ -1654,6 +1657,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS5000";
 		set_elf_platform(cpu, "bmips5000");
 		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
+		reserve_exception_space(0x80001000, VECTORSPACING * 64);
 		break;
 	}
 }
@@ -2133,6 +2137,9 @@ void cpu_probe(void)
 	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vmbits) - 1);
 #endif
+
+	if (ebase_size == 0 && !cpu_has_mips_r2_r6)
+		reserve_exception_space(CAC_BASE, 0x400);
 }
 
 void cpu_report(void)
diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
index abdbbe8c5a43..6e3f4c17b810 100644
--- a/arch/mips/kernel/cpu-r3k-probe.c
+++ b/arch/mips/kernel/cpu-r3k-probe.c
@@ -21,6 +21,7 @@
 #include <asm/fpu.h>
 #include <asm/mipsregs.h>
 #include <asm/elf.h>
+#include <asm/traps.h>
 
 #include "fpu-probe.h"
 
@@ -158,6 +159,8 @@ void cpu_probe(void)
 		cpu_set_fpu_opts(c);
 	else
 		cpu_set_nofpu_opts(c);
+
+	reserve_exception_space(CAC_BASE, 0x400);
 }
 
 void cpu_report(void)
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index b6ef5f7312cf..ad3f2282a65a 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -528,10 +528,6 @@ static void bmips_set_reset_vec(int cpu, u32 val)
 
 void bmips_ebase_setup(void)
 {
-	unsigned long new_ebase = ebase;
-
-	BUG_ON(ebase != CKSEG0);
-
 	switch (current_cpu_type()) {
 	case CPU_BMIPS4350:
 		/*
@@ -554,7 +550,6 @@ void bmips_ebase_setup(void)
 		 * 0x8000_0000: reset/NMI (initially in kseg1)
 		 * 0x8000_0400: normal vectors
 		 */
-		new_ebase = 0x80000400;
 		bmips_set_reset_vec(0, RESET_FROM_KSEG0);
 		break;
 	case CPU_BMIPS5000:
@@ -562,16 +557,14 @@ void bmips_ebase_setup(void)
 		 * 0x8000_0000: reset/NMI (initially in kseg1)
 		 * 0x8000_1000: normal vectors
 		 */
-		new_ebase = 0x80001000;
 		bmips_set_reset_vec(0, RESET_FROM_KSEG0);
-		write_c0_ebase(new_ebase);
+		write_c0_ebase(ebase);
 		break;
 	default:
 		return;
 	}
 
 	board_nmi_handler_setup = &bmips_nmi_handler_setup;
-	ebase = new_ebase;
 }
 
 asmlinkage void __weak plat_wired_tlb_setup(void)
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index e0352958e2f7..670b824b05a0 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2009,13 +2009,19 @@ void __noreturn nmi_exception_handler(struct pt_regs *regs)
 	nmi_exit();
 }
 
-#define VECTORSPACING 0x100	/* for EI/VI mode */
-
 unsigned long ebase;
 EXPORT_SYMBOL_GPL(ebase);
+unsigned long ebase_size;
 unsigned long exception_handlers[32];
 unsigned long vi_handlers[64];
 
+void reserve_exception_space(unsigned long addr, unsigned long size)
+{
+	ebase = addr;
+	ebase_size = size;
+	memblock_reserve(__pa((void *)ebase), ebase_size);
+}
+
 void __init *set_except_vector(int n, void *addr)
 {
 	unsigned long handler = (unsigned long) addr;
@@ -2360,27 +2366,22 @@ void __init trap_init(void)
 	extern char except_vec3_generic;
 	extern char except_vec4;
 	extern char except_vec3_r4000;
-	unsigned long i, vec_size;
 	phys_addr_t ebase_pa;
+	unsigned long i;
 
 	check_wait();
 
-	if (!cpu_has_mips_r2_r6) {
-		ebase = CAC_BASE;
-		ebase_pa = virt_to_phys((void *)ebase);
-		vec_size = 0x400;
-
-		memblock_reserve(ebase_pa, vec_size);
-	} else {
+	if (cpu_has_mips_r2_r6) {
 		if (cpu_has_veic || cpu_has_vint)
-			vec_size = 0x200 + VECTORSPACING*64;
+			ebase_size = 0x200 + VECTORSPACING*64;
 		else
-			vec_size = PAGE_SIZE;
+			ebase_size = PAGE_SIZE;
 
-		ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
+		ebase_pa = memblock_phys_alloc(ebase_size,
+					       1 << fls(ebase_size));
 		if (!ebase_pa)
 			panic("%s: Failed to allocate %lu bytes align=0x%x\n",
-			      __func__, vec_size, 1 << fls(vec_size));
+			      __func__, ebase_size, 1 << fls(ebase_size));
 
 		/*
 		 * Try to ensure ebase resides in KSeg0 if possible.
@@ -2534,7 +2535,7 @@ void __init trap_init(void)
 	else
 		set_handler(0x080, &except_vec3_generic, 0x80);
 
-	local_flush_icache_range(ebase, ebase + vec_size);
+	local_flush_icache_range(ebase, ebase + ebase_size);
 
 	sort_extable(__start___dbe_table, __stop___dbe_table);
 
-- 
2.29.2

