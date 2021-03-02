Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEDD32AF8E
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238139AbhCCA0e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:26:34 -0500
Received: from elvis.franken.de ([193.175.24.41]:37893 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233745AbhCBXzQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Mar 2021 18:55:16 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lHEqL-00081Z-02; Wed, 03 Mar 2021 00:54:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 458A4C0477; Wed,  3 Mar 2021 00:54:11 +0100 (CET)
Date:   Wed, 3 Mar 2021 00:54:11 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, rppt@kernel.org,
        fancer.lancer@gmail.com, guro@fb.com, akpm@linux-foundation.org,
        paul@crapouillou.net,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
Message-ID: <20210302235411.GA3897@alpha.franken.de>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
 <20210302041940.3663823-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302041940.3663823-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 08:19:38PM -0800, Florian Fainelli wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception that is going to be installed and this needs to happen at
> plat_mem_setup() time to ensure that unflatten_and_copy_device_tree()
> finds a space that is suitable, away from reserved memory.
> 
> Huge thanks to Serget for analysing and proposing a solution to this
> issue.
> 
> Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Thomas,
> 
> This is intended as a stop-gap solution for 5.12-rc1 and to be picked up
> by the stable team for 5.11. We should find a safer way to avoid these
> problems for 5.13 maybe.

let's try to make it in one ago. Hwo about reserving vector space in
cpu_probe, if it's known there and leave the rest to trap_init() ?

Below patch got a quick test on IP22 (real hardware) and malta (qemu).
Not sure, if I got all BMIPS parts correct, so please check/test.
BTW. do we really need to EXPORT_SYMBOL ebase ?

Thomas,


diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index bb36a400203d..3ef62c23c34f 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -23,7 +23,7 @@ typedef void (*vi_handler_t)(void);
 extern void *set_vi_handler(int n, vi_handler_t addr);
 
 extern void *set_except_vector(int n, void *addr);
-extern unsigned long ebase;
+extern unsigned long ebase, ebase_size;
 extern unsigned int hwrena;
 extern void per_cpu_trap_init(bool);
 extern void cpu_cache_init(void);
diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 6aa8f126a43d..f7d59831aae3 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -26,6 +26,8 @@ extern void (*board_cache_error_setup)(void);
 extern int register_nmi_notifier(struct notifier_block *nb);
 extern char except_vec_nmi[];
 
+#define VECTORSPACING 0x100	/* for EI/VI mode */
+
 #define nmi_notifier(fn, pri)						\
 ({									\
 	static struct notifier_block fn##_nb = {			\
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 9a89637b4ecf..eef1a4e304da 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -13,6 +13,7 @@
 #include <linux/smp.h>
 #include <linux/stddef.h>
 #include <linux/export.h>
+#include <linux/memblock.h>
 
 #include <asm/bugs.h>
 #include <asm/cpu.h>
@@ -25,7 +26,9 @@
 #include <asm/watch.h>
 #include <asm/elf.h>
 #include <asm/pgtable-bits.h>
+#include <asm/setup.h>
 #include <asm/spram.h>
+#include <asm/traps.h>
 #include <linux/uaccess.h>
 
 #include "fpu-probe.h"
@@ -1628,6 +1631,8 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_BMIPS3300;
 		__cpu_name[cpu] = "Broadcom BMIPS3300";
 		set_elf_platform(cpu, "bmips3300");
+		ebase = 0x80000400;
+		ebase_size = VECTORSPACING * 64;
 		break;
 	case PRID_IMP_BMIPS43XX: {
 		int rev = c->processor_id & PRID_REV_MASK;
@@ -1638,6 +1643,8 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS4380";
 			set_elf_platform(cpu, "bmips4380");
 			c->options |= MIPS_CPU_RIXI;
+			ebase = 0x80000400;
+			ebase_size = VECTORSPACING * 64;
 		} else {
 			c->cputype = CPU_BMIPS4350;
 			__cpu_name[cpu] = "Broadcom BMIPS4350";
@@ -1654,6 +1661,8 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS5000";
 		set_elf_platform(cpu, "bmips5000");
 		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
+		ebase = 0x80001000;
+		ebase_size = VECTORSPACING * 64;
 		break;
 	}
 }
@@ -2133,6 +2142,13 @@ void cpu_probe(void)
 	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vmbits) - 1);
 #endif
+
+	if (ebase_size == 0 && !cpu_has_mips_r2_r6) {
+		ebase = CAC_BASE;
+		ebase_size = 0x400;
+	}
+	if (ebase_size)
+		memblock_reserve(__pa((void *)ebase), ebase_size);
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
index e0352958e2f7..21ba9d04683e 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2009,10 +2009,10 @@ void __noreturn nmi_exception_handler(struct pt_regs *regs)
 	nmi_exit();
 }
 
-#define VECTORSPACING 0x100	/* for EI/VI mode */
-
 unsigned long ebase;
 EXPORT_SYMBOL_GPL(ebase);
+unsigned long ebase_size;
+EXPORT_SYMBOL_GPL(ebase_size);
 unsigned long exception_handlers[32];
 unsigned long vi_handlers[64];
 
@@ -2360,27 +2360,22 @@ void __init trap_init(void)
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
@@ -2534,7 +2529,7 @@ void __init trap_init(void)
 	else
 		set_handler(0x080, &except_vec3_generic, 0x80);
 
-	local_flush_icache_range(ebase, ebase + vec_size);
+	local_flush_icache_range(ebase, ebase + ebase_size);
 
 	sort_extable(__start___dbe_table, __stop___dbe_table);
 



-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
