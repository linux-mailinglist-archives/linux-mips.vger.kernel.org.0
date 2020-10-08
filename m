Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77162879F4
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 18:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729739AbgJHQ1s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 12:27:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:47940 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728620AbgJHQ1s (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 12:27:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DF7A4AC85;
        Thu,  8 Oct 2020 16:27:45 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: cpu-probe: introduce exclusive R3k CPU probe
Date:   Thu,  8 Oct 2020 18:27:27 +0200
Message-Id: <20201008162727.4018-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201008162727.4018-1-tsbogend@alpha.franken.de>
References: <20201008162727.4018-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Running a kernel on a R3k of machine definitly will never see one of
the newer CPU cores. And since R3k system usually are low on memory
we could save quite some kbytes:

   text	   data	    bss	    dec	    hex	filename
  15070	     88	     32	  15190	   3b56	arch/mips/kernel/cpu-probe.o
    844	      4	     16	    864	    360	arch/mips/kernel/cpu-r3k-probe.o

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/Makefile        |   8 +-
 arch/mips/kernel/cpu-r3k-probe.c | 171 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/kernel/cpu-r3k-probe.c

diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 026801c21724..2a05b923f579 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -5,11 +5,17 @@
 
 extra-y		:= head.o vmlinux.lds
 
-obj-y		+= cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
+obj-y		+= branch.o cmpxchg.o elf.o entry.o genex.o idle.o irq.o \
 		   process.o prom.o ptrace.o reset.o setup.o signal.o \
 		   syscall.o time.o topology.o traps.o unaligned.o watch.o \
 		   vdso.o cacheinfo.o
 
+ifdef CONFIG_CPU_R3K_TLB
+obj-y		+= cpu-r3k-probe.o
+else
+obj-y		+= cpu-probe.o
+endif
+
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_ftrace.o = -pg
 CFLAGS_REMOVE_early_printk.o = -pg
diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
new file mode 100644
index 000000000000..abdbbe8c5a43
--- /dev/null
+++ b/arch/mips/kernel/cpu-r3k-probe.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Processor capabilities determination functions.
+ *
+ * Copyright (C) xxxx  the Anonymous
+ * Copyright (C) 1994 - 2006 Ralf Baechle
+ * Copyright (C) 2003, 2004  Maciej W. Rozycki
+ * Copyright (C) 2001, 2004, 2011, 2012	 MIPS Technologies, Inc.
+ */
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/ptrace.h>
+#include <linux/smp.h>
+#include <linux/stddef.h>
+#include <linux/export.h>
+
+#include <asm/bugs.h>
+#include <asm/cpu.h>
+#include <asm/cpu-features.h>
+#include <asm/cpu-type.h>
+#include <asm/fpu.h>
+#include <asm/mipsregs.h>
+#include <asm/elf.h>
+
+#include "fpu-probe.h"
+
+/* Hardware capabilities */
+unsigned int elf_hwcap __read_mostly;
+EXPORT_SYMBOL_GPL(elf_hwcap);
+
+void __init check_bugs32(void)
+{
+
+}
+
+/*
+ * Probe whether cpu has config register by trying to play with
+ * alternate cache bit and see whether it matters.
+ * It's used by cpu_probe to distinguish between R3000A and R3081.
+ */
+static inline int cpu_has_confreg(void)
+{
+#ifdef CONFIG_CPU_R3000
+	extern unsigned long r3k_cache_size(unsigned long);
+	unsigned long size1, size2;
+	unsigned long cfg = read_c0_conf();
+
+	size1 = r3k_cache_size(ST0_ISC);
+	write_c0_conf(cfg ^ R30XX_CONF_AC);
+	size2 = r3k_cache_size(ST0_ISC);
+	write_c0_conf(cfg);
+	return size1 != size2;
+#else
+	return 0;
+#endif
+}
+
+static inline void set_elf_platform(int cpu, const char *plat)
+{
+	if (cpu == 0)
+		__elf_platform = plat;
+}
+
+const char *__cpu_name[NR_CPUS];
+const char *__elf_platform;
+const char *__elf_base_platform;
+
+void cpu_probe(void)
+{
+	struct cpuinfo_mips *c = &current_cpu_data;
+	unsigned int cpu = smp_processor_id();
+
+	/*
+	 * Set a default elf platform, cpu probe may later
+	 * overwrite it with a more precise value
+	 */
+	set_elf_platform(cpu, "mips");
+
+	c->processor_id = PRID_IMP_UNKNOWN;
+	c->fpu_id	= FPIR_IMP_NONE;
+	c->cputype	= CPU_UNKNOWN;
+	c->writecombine = _CACHE_UNCACHED;
+
+	c->fpu_csr31	= FPU_CSR_RN;
+	c->fpu_msk31	= FPU_CSR_RSVD | FPU_CSR_ABS2008 | FPU_CSR_NAN2008 |
+			  FPU_CSR_CONDX | FPU_CSR_FS;
+
+	c->srsets = 1;
+
+	c->processor_id = read_c0_prid();
+	switch (c->processor_id & (PRID_COMP_MASK | PRID_IMP_MASK)) {
+	case PRID_COMP_LEGACY | PRID_IMP_R2000:
+		c->cputype = CPU_R2000;
+		__cpu_name[cpu] = "R2000";
+		c->options = MIPS_CPU_TLB | MIPS_CPU_3K_CACHE |
+			     MIPS_CPU_NOFPUEX;
+		if (__cpu_has_fpu())
+			c->options |= MIPS_CPU_FPU;
+		c->tlbsize = 64;
+		break;
+	case PRID_COMP_LEGACY | PRID_IMP_R3000:
+		if ((c->processor_id & PRID_REV_MASK) == PRID_REV_R3000A) {
+			if (cpu_has_confreg()) {
+				c->cputype = CPU_R3081E;
+				__cpu_name[cpu] = "R3081";
+			} else {
+				c->cputype = CPU_R3000A;
+				__cpu_name[cpu] = "R3000A";
+			}
+		} else {
+			c->cputype = CPU_R3000;
+			__cpu_name[cpu] = "R3000";
+		}
+		c->options = MIPS_CPU_TLB | MIPS_CPU_3K_CACHE |
+			     MIPS_CPU_NOFPUEX;
+		if (__cpu_has_fpu())
+			c->options |= MIPS_CPU_FPU;
+		c->tlbsize = 64;
+		break;
+	case PRID_COMP_LEGACY | PRID_IMP_TX39:
+		c->options = MIPS_CPU_TLB | MIPS_CPU_TX39_CACHE;
+
+		if ((c->processor_id & 0xf0) == (PRID_REV_TX3927 & 0xf0)) {
+			c->cputype = CPU_TX3927;
+			__cpu_name[cpu] = "TX3927";
+			c->tlbsize = 64;
+		} else {
+			switch (c->processor_id & PRID_REV_MASK) {
+			case PRID_REV_TX3912:
+				c->cputype = CPU_TX3912;
+				__cpu_name[cpu] = "TX3912";
+				c->tlbsize = 32;
+				break;
+			case PRID_REV_TX3922:
+				c->cputype = CPU_TX3922;
+				__cpu_name[cpu] = "TX3922";
+				c->tlbsize = 64;
+				break;
+			}
+		}
+		break;
+	}
+
+	BUG_ON(!__cpu_name[cpu]);
+	BUG_ON(c->cputype == CPU_UNKNOWN);
+
+	/*
+	 * Platform code can force the cpu type to optimize code
+	 * generation. In that case be sure the cpu type is correctly
+	 * manually setup otherwise it could trigger some nasty bugs.
+	 */
+	BUG_ON(current_cpu_type() != c->cputype);
+
+	if (mips_fpu_disabled)
+		c->options &= ~MIPS_CPU_FPU;
+
+	if (c->options & MIPS_CPU_FPU)
+		cpu_set_fpu_opts(c);
+	else
+		cpu_set_nofpu_opts(c);
+}
+
+void cpu_report(void)
+{
+	struct cpuinfo_mips *c = &current_cpu_data;
+
+	pr_info("CPU%d revision is: %08x (%s)\n",
+		smp_processor_id(), c->processor_id, cpu_name_string());
+	if (c->options & MIPS_CPU_FPU)
+		pr_info("FPU revision is: %08x\n", c->fpu_id);
+}
-- 
2.16.4

