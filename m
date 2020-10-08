Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249682879F3
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 18:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgJHQ1s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 12:27:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:47930 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgJHQ1s (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 12:27:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 51E9DABF4;
        Thu,  8 Oct 2020 16:27:44 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: cpu-probe: move fpu probing/handling into its own file
Date:   Thu,  8 Oct 2020 18:27:26 +0200
Message-Id: <20201008162727.4018-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cpu-probe.c has grown when supporting more and more CPUs and there
are use cases where probing for all the CPUs isn't useful like
running on a R3k system. But still the fpu handling is nearly
the same. For sharing put the fpu code into it's own file.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/Makefile    |   1 +
 arch/mips/kernel/cpu-probe.c | 326 +------------------------------------------
 arch/mips/kernel/fpu-probe.c | 322 ++++++++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/fpu-probe.h |  40 ++++++
 4 files changed, 365 insertions(+), 324 deletions(-)
 create mode 100644 arch/mips/kernel/fpu-probe.c
 create mode 100644 arch/mips/kernel/fpu-probe.h

diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 13a26d254829..026801c21724 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -42,6 +42,7 @@ sw-$(CONFIG_CPU_TX39XX)		:= r2300_switch.o
 sw-$(CONFIG_CPU_CAVIUM_OCTEON)	:= octeon_switch.o
 obj-y				+= $(sw-y)
 
+obj-$(CONFIG_MIPS_FP_SUPPORT)	+= fpu-probe.o
 obj-$(CONFIG_CPU_R2300_FPU)	+= r2300_fpu.o
 obj-$(CONFIG_CPU_R4K_FPU)	+= r4k_fpu.o
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6be23f205e74..b8e073772bdb 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -28,336 +28,14 @@
 #include <asm/spram.h>
 #include <linux/uaccess.h>
 
+#include "fpu-probe.h"
+
 #include <asm/mach-loongson64/cpucfg-emul.h>
 
 /* Hardware capabilities */
 unsigned int elf_hwcap __read_mostly;
 EXPORT_SYMBOL_GPL(elf_hwcap);
 
-#ifdef CONFIG_MIPS_FP_SUPPORT
-
-/*
- * Get the FPU Implementation/Revision.
- */
-static inline unsigned long cpu_get_fpu_id(void)
-{
-	unsigned long tmp, fpu_id;
-
-	tmp = read_c0_status();
-	__enable_fpu(FPU_AS_IS);
-	fpu_id = read_32bit_cp1_register(CP1_REVISION);
-	write_c0_status(tmp);
-	return fpu_id;
-}
-
-/*
- * Check if the CPU has an external FPU.
- */
-static inline int __cpu_has_fpu(void)
-{
-	return (cpu_get_fpu_id() & FPIR_IMP_MASK) != FPIR_IMP_NONE;
-}
-
-/*
- * Determine the FCSR mask for FPU hardware.
- */
-static inline void cpu_set_fpu_fcsr_mask(struct cpuinfo_mips *c)
-{
-	unsigned long sr, mask, fcsr, fcsr0, fcsr1;
-
-	fcsr = c->fpu_csr31;
-	mask = FPU_CSR_ALL_X | FPU_CSR_ALL_E | FPU_CSR_ALL_S | FPU_CSR_RM;
-
-	sr = read_c0_status();
-	__enable_fpu(FPU_AS_IS);
-
-	fcsr0 = fcsr & mask;
-	write_32bit_cp1_register(CP1_STATUS, fcsr0);
-	fcsr0 = read_32bit_cp1_register(CP1_STATUS);
-
-	fcsr1 = fcsr | ~mask;
-	write_32bit_cp1_register(CP1_STATUS, fcsr1);
-	fcsr1 = read_32bit_cp1_register(CP1_STATUS);
-
-	write_32bit_cp1_register(CP1_STATUS, fcsr);
-
-	write_c0_status(sr);
-
-	c->fpu_msk31 = ~(fcsr0 ^ fcsr1) & ~mask;
-}
-
-/*
- * Determine the IEEE 754 NaN encodings and ABS.fmt/NEG.fmt execution modes
- * supported by FPU hardware.
- */
-static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
-{
-	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
-			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
-			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
-			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
-		unsigned long sr, fir, fcsr, fcsr0, fcsr1;
-
-		sr = read_c0_status();
-		__enable_fpu(FPU_AS_IS);
-
-		fir = read_32bit_cp1_register(CP1_REVISION);
-		if (fir & MIPS_FPIR_HAS2008) {
-			fcsr = read_32bit_cp1_register(CP1_STATUS);
-
-			/*
-			 * MAC2008 toolchain never landed in real world, so we're only
-			 * testing wether it can be disabled and don't try to enabled
-			 * it.
-			 */
-			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008 | FPU_CSR_MAC2008);
-			write_32bit_cp1_register(CP1_STATUS, fcsr0);
-			fcsr0 = read_32bit_cp1_register(CP1_STATUS);
-
-			fcsr1 = fcsr | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
-			write_32bit_cp1_register(CP1_STATUS, fcsr1);
-			fcsr1 = read_32bit_cp1_register(CP1_STATUS);
-
-			write_32bit_cp1_register(CP1_STATUS, fcsr);
-
-			if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2)) {
-				/*
-				 * The bit for MAC2008 might be reused by R6 in future,
-				 * so we only test for R2-R5.
-				 */
-				if (fcsr0 & FPU_CSR_MAC2008)
-					c->options |= MIPS_CPU_MAC_2008_ONLY;
-			}
-
-			if (!(fcsr0 & FPU_CSR_NAN2008))
-				c->options |= MIPS_CPU_NAN_LEGACY;
-			if (fcsr1 & FPU_CSR_NAN2008)
-				c->options |= MIPS_CPU_NAN_2008;
-
-			if ((fcsr0 ^ fcsr1) & FPU_CSR_ABS2008)
-				c->fpu_msk31 &= ~FPU_CSR_ABS2008;
-			else
-				c->fpu_csr31 |= fcsr & FPU_CSR_ABS2008;
-
-			if ((fcsr0 ^ fcsr1) & FPU_CSR_NAN2008)
-				c->fpu_msk31 &= ~FPU_CSR_NAN2008;
-			else
-				c->fpu_csr31 |= fcsr & FPU_CSR_NAN2008;
-		} else {
-			c->options |= MIPS_CPU_NAN_LEGACY;
-		}
-
-		write_c0_status(sr);
-	} else {
-		c->options |= MIPS_CPU_NAN_LEGACY;
-	}
-}
-
-/*
- * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
- * ABS.fmt/NEG.fmt execution mode.
- */
-static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
-
-/*
- * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
- * to support by the FPU emulator according to the IEEE 754 conformance
- * mode selected.  Note that "relaxed" straps the emulator so that it
- * allows 2008-NaN binaries even for legacy processors.
- */
-static void cpu_set_nofpu_2008(struct cpuinfo_mips *c)
-{
-	c->options &= ~(MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY);
-	c->fpu_csr31 &= ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
-	c->fpu_msk31 &= ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
-
-	switch (ieee754) {
-	case STRICT:
-		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
-				    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
-				    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
-				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
-			c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
-		} else {
-			c->options |= MIPS_CPU_NAN_LEGACY;
-			c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
-		}
-		break;
-	case LEGACY:
-		c->options |= MIPS_CPU_NAN_LEGACY;
-		c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
-		break;
-	case STD2008:
-		c->options |= MIPS_CPU_NAN_2008;
-		c->fpu_csr31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
-		c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
-		break;
-	case RELAXED:
-		c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
-		break;
-	}
-}
-
-/*
- * Override the IEEE 754 NaN encoding and ABS.fmt/NEG.fmt execution mode
- * according to the "ieee754=" parameter.
- */
-static void cpu_set_nan_2008(struct cpuinfo_mips *c)
-{
-	switch (ieee754) {
-	case STRICT:
-		mips_use_nan_legacy = !!cpu_has_nan_legacy;
-		mips_use_nan_2008 = !!cpu_has_nan_2008;
-		break;
-	case LEGACY:
-		mips_use_nan_legacy = !!cpu_has_nan_legacy;
-		mips_use_nan_2008 = !cpu_has_nan_legacy;
-		break;
-	case STD2008:
-		mips_use_nan_legacy = !cpu_has_nan_2008;
-		mips_use_nan_2008 = !!cpu_has_nan_2008;
-		break;
-	case RELAXED:
-		mips_use_nan_legacy = true;
-		mips_use_nan_2008 = true;
-		break;
-	}
-}
-
-/*
- * IEEE 754 NaN encoding and ABS.fmt/NEG.fmt execution mode override
- * settings:
- *
- * strict:  accept binaries that request a NaN encoding supported by the FPU
- * legacy:  only accept legacy-NaN binaries
- * 2008:    only accept 2008-NaN binaries
- * relaxed: accept any binaries regardless of whether supported by the FPU
- */
-static int __init ieee754_setup(char *s)
-{
-	if (!s)
-		return -1;
-	else if (!strcmp(s, "strict"))
-		ieee754 = STRICT;
-	else if (!strcmp(s, "legacy"))
-		ieee754 = LEGACY;
-	else if (!strcmp(s, "2008"))
-		ieee754 = STD2008;
-	else if (!strcmp(s, "relaxed"))
-		ieee754 = RELAXED;
-	else
-		return -1;
-
-	if (!(boot_cpu_data.options & MIPS_CPU_FPU))
-		cpu_set_nofpu_2008(&boot_cpu_data);
-	cpu_set_nan_2008(&boot_cpu_data);
-
-	return 0;
-}
-
-early_param("ieee754", ieee754_setup);
-
-/*
- * Set the FIR feature flags for the FPU emulator.
- */
-static void cpu_set_nofpu_id(struct cpuinfo_mips *c)
-{
-	u32 value;
-
-	value = 0;
-	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
-			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
-			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
-			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
-		value |= MIPS_FPIR_D | MIPS_FPIR_S;
-	if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
-			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
-			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
-		value |= MIPS_FPIR_F64 | MIPS_FPIR_L | MIPS_FPIR_W;
-	if (c->options & MIPS_CPU_NAN_2008)
-		value |= MIPS_FPIR_HAS2008;
-	c->fpu_id = value;
-}
-
-/* Determined FPU emulator mask to use for the boot CPU with "nofpu".  */
-static unsigned int mips_nofpu_msk31;
-
-/*
- * Set options for FPU hardware.
- */
-static void cpu_set_fpu_opts(struct cpuinfo_mips *c)
-{
-	c->fpu_id = cpu_get_fpu_id();
-	mips_nofpu_msk31 = c->fpu_msk31;
-
-	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
-			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
-			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
-			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
-		if (c->fpu_id & MIPS_FPIR_3D)
-			c->ases |= MIPS_ASE_MIPS3D;
-		if (c->fpu_id & MIPS_FPIR_UFRP)
-			c->options |= MIPS_CPU_UFR;
-		if (c->fpu_id & MIPS_FPIR_FREP)
-			c->options |= MIPS_CPU_FRE;
-	}
-
-	cpu_set_fpu_fcsr_mask(c);
-	cpu_set_fpu_2008(c);
-	cpu_set_nan_2008(c);
-}
-
-/*
- * Set options for the FPU emulator.
- */
-static void cpu_set_nofpu_opts(struct cpuinfo_mips *c)
-{
-	c->options &= ~MIPS_CPU_FPU;
-	c->fpu_msk31 = mips_nofpu_msk31;
-
-	cpu_set_nofpu_2008(c);
-	cpu_set_nan_2008(c);
-	cpu_set_nofpu_id(c);
-}
-
-static int mips_fpu_disabled;
-
-static int __init fpu_disable(char *s)
-{
-	cpu_set_nofpu_opts(&boot_cpu_data);
-	mips_fpu_disabled = 1;
-
-	return 1;
-}
-
-__setup("nofpu", fpu_disable);
-
-#else /* !CONFIG_MIPS_FP_SUPPORT */
-
-#define mips_fpu_disabled 1
-
-static inline unsigned long cpu_get_fpu_id(void)
-{
-	return FPIR_IMP_NONE;
-}
-
-static inline int __cpu_has_fpu(void)
-{
-	return 0;
-}
-
-static void cpu_set_fpu_opts(struct cpuinfo_mips *c)
-{
-	/* no-op */
-}
-
-static void cpu_set_nofpu_opts(struct cpuinfo_mips *c)
-{
-	/* no-op */
-}
-
-#endif /* CONFIG_MIPS_FP_SUPPORT */
-
 static inline unsigned long cpu_get_msa_id(void)
 {
 	unsigned long status, msa_id;
diff --git a/arch/mips/kernel/fpu-probe.c b/arch/mips/kernel/fpu-probe.c
new file mode 100644
index 000000000000..45169c539d70
--- /dev/null
+++ b/arch/mips/kernel/fpu-probe.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Processor capabilities determination functions.
+ *
+ * Copyright (C) xxxx  the Anonymous
+ * Copyright (C) 1994 - 2006 Ralf Baechle
+ * Copyright (C) 2003, 2004  Maciej W. Rozycki
+ * Copyright (C) 2001, 2004, 2011, 2012	 MIPS Technologies, Inc.
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <asm/bugs.h>
+#include <asm/cpu.h>
+#include <asm/cpu-features.h>
+#include <asm/cpu-type.h>
+#include <asm/elf.h>
+#include <asm/fpu.h>
+#include <asm/mipsregs.h>
+
+#ifdef CONFIG_MIPS_FP_SUPPORT
+
+/*
+ * Get the FPU Implementation/Revision.
+ */
+static inline unsigned long cpu_get_fpu_id(void)
+{
+	unsigned long tmp, fpu_id;
+
+	tmp = read_c0_status();
+	__enable_fpu(FPU_AS_IS);
+	fpu_id = read_32bit_cp1_register(CP1_REVISION);
+	write_c0_status(tmp);
+	return fpu_id;
+}
+
+/*
+ * Check if the CPU has an external FPU.
+ */
+int __cpu_has_fpu(void)
+{
+	return (cpu_get_fpu_id() & FPIR_IMP_MASK) != FPIR_IMP_NONE;
+}
+
+/*
+ * Determine the FCSR mask for FPU hardware.
+ */
+static inline void cpu_set_fpu_fcsr_mask(struct cpuinfo_mips *c)
+{
+	unsigned long sr, mask, fcsr, fcsr0, fcsr1;
+
+	fcsr = c->fpu_csr31;
+	mask = FPU_CSR_ALL_X | FPU_CSR_ALL_E | FPU_CSR_ALL_S | FPU_CSR_RM;
+
+	sr = read_c0_status();
+	__enable_fpu(FPU_AS_IS);
+
+	fcsr0 = fcsr & mask;
+	write_32bit_cp1_register(CP1_STATUS, fcsr0);
+	fcsr0 = read_32bit_cp1_register(CP1_STATUS);
+
+	fcsr1 = fcsr | ~mask;
+	write_32bit_cp1_register(CP1_STATUS, fcsr1);
+	fcsr1 = read_32bit_cp1_register(CP1_STATUS);
+
+	write_32bit_cp1_register(CP1_STATUS, fcsr);
+
+	write_c0_status(sr);
+
+	c->fpu_msk31 = ~(fcsr0 ^ fcsr1) & ~mask;
+}
+
+/*
+ * Determine the IEEE 754 NaN encodings and ABS.fmt/NEG.fmt execution modes
+ * supported by FPU hardware.
+ */
+static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
+{
+	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
+			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
+		unsigned long sr, fir, fcsr, fcsr0, fcsr1;
+
+		sr = read_c0_status();
+		__enable_fpu(FPU_AS_IS);
+
+		fir = read_32bit_cp1_register(CP1_REVISION);
+		if (fir & MIPS_FPIR_HAS2008) {
+			fcsr = read_32bit_cp1_register(CP1_STATUS);
+
+			/*
+			 * MAC2008 toolchain never landed in real world, so we're only
+			 * testing whether it can be disabled and don't try to enabled
+			 * it.
+			 */
+			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008 | FPU_CSR_MAC2008);
+			write_32bit_cp1_register(CP1_STATUS, fcsr0);
+			fcsr0 = read_32bit_cp1_register(CP1_STATUS);
+
+			fcsr1 = fcsr | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
+			write_32bit_cp1_register(CP1_STATUS, fcsr1);
+			fcsr1 = read_32bit_cp1_register(CP1_STATUS);
+
+			write_32bit_cp1_register(CP1_STATUS, fcsr);
+
+			if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2)) {
+				/*
+				 * The bit for MAC2008 might be reused by R6 in future,
+				 * so we only test for R2-R5.
+				 */
+				if (fcsr0 & FPU_CSR_MAC2008)
+					c->options |= MIPS_CPU_MAC_2008_ONLY;
+			}
+
+			if (!(fcsr0 & FPU_CSR_NAN2008))
+				c->options |= MIPS_CPU_NAN_LEGACY;
+			if (fcsr1 & FPU_CSR_NAN2008)
+				c->options |= MIPS_CPU_NAN_2008;
+
+			if ((fcsr0 ^ fcsr1) & FPU_CSR_ABS2008)
+				c->fpu_msk31 &= ~FPU_CSR_ABS2008;
+			else
+				c->fpu_csr31 |= fcsr & FPU_CSR_ABS2008;
+
+			if ((fcsr0 ^ fcsr1) & FPU_CSR_NAN2008)
+				c->fpu_msk31 &= ~FPU_CSR_NAN2008;
+			else
+				c->fpu_csr31 |= fcsr & FPU_CSR_NAN2008;
+		} else {
+			c->options |= MIPS_CPU_NAN_LEGACY;
+		}
+
+		write_c0_status(sr);
+	} else {
+		c->options |= MIPS_CPU_NAN_LEGACY;
+	}
+}
+
+/*
+ * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
+ * ABS.fmt/NEG.fmt execution mode.
+ */
+static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
+
+/*
+ * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
+ * to support by the FPU emulator according to the IEEE 754 conformance
+ * mode selected.  Note that "relaxed" straps the emulator so that it
+ * allows 2008-NaN binaries even for legacy processors.
+ */
+static void cpu_set_nofpu_2008(struct cpuinfo_mips *c)
+{
+	c->options &= ~(MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY);
+	c->fpu_csr31 &= ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
+	c->fpu_msk31 &= ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
+
+	switch (ieee754) {
+	case STRICT:
+		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
+				    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+				    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
+			c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
+		} else {
+			c->options |= MIPS_CPU_NAN_LEGACY;
+			c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
+		}
+		break;
+	case LEGACY:
+		c->options |= MIPS_CPU_NAN_LEGACY;
+		c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
+		break;
+	case STD2008:
+		c->options |= MIPS_CPU_NAN_2008;
+		c->fpu_csr31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
+		c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
+		break;
+	case RELAXED:
+		c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
+		break;
+	}
+}
+
+/*
+ * Override the IEEE 754 NaN encoding and ABS.fmt/NEG.fmt execution mode
+ * according to the "ieee754=" parameter.
+ */
+static void cpu_set_nan_2008(struct cpuinfo_mips *c)
+{
+	switch (ieee754) {
+	case STRICT:
+		mips_use_nan_legacy = !!cpu_has_nan_legacy;
+		mips_use_nan_2008 = !!cpu_has_nan_2008;
+		break;
+	case LEGACY:
+		mips_use_nan_legacy = !!cpu_has_nan_legacy;
+		mips_use_nan_2008 = !cpu_has_nan_legacy;
+		break;
+	case STD2008:
+		mips_use_nan_legacy = !cpu_has_nan_2008;
+		mips_use_nan_2008 = !!cpu_has_nan_2008;
+		break;
+	case RELAXED:
+		mips_use_nan_legacy = true;
+		mips_use_nan_2008 = true;
+		break;
+	}
+}
+
+/*
+ * IEEE 754 NaN encoding and ABS.fmt/NEG.fmt execution mode override
+ * settings:
+ *
+ * strict:  accept binaries that request a NaN encoding supported by the FPU
+ * legacy:  only accept legacy-NaN binaries
+ * 2008:    only accept 2008-NaN binaries
+ * relaxed: accept any binaries regardless of whether supported by the FPU
+ */
+static int __init ieee754_setup(char *s)
+{
+	if (!s)
+		return -1;
+	else if (!strcmp(s, "strict"))
+		ieee754 = STRICT;
+	else if (!strcmp(s, "legacy"))
+		ieee754 = LEGACY;
+	else if (!strcmp(s, "2008"))
+		ieee754 = STD2008;
+	else if (!strcmp(s, "relaxed"))
+		ieee754 = RELAXED;
+	else
+		return -1;
+
+	if (!(boot_cpu_data.options & MIPS_CPU_FPU))
+		cpu_set_nofpu_2008(&boot_cpu_data);
+	cpu_set_nan_2008(&boot_cpu_data);
+
+	return 0;
+}
+
+early_param("ieee754", ieee754_setup);
+
+/*
+ * Set the FIR feature flags for the FPU emulator.
+ */
+static void cpu_set_nofpu_id(struct cpuinfo_mips *c)
+{
+	u32 value;
+
+	value = 0;
+	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
+			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
+		value |= MIPS_FPIR_D | MIPS_FPIR_S;
+	if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
+		value |= MIPS_FPIR_F64 | MIPS_FPIR_L | MIPS_FPIR_W;
+	if (c->options & MIPS_CPU_NAN_2008)
+		value |= MIPS_FPIR_HAS2008;
+	c->fpu_id = value;
+}
+
+/* Determined FPU emulator mask to use for the boot CPU with "nofpu".  */
+static unsigned int mips_nofpu_msk31;
+
+/*
+ * Set options for FPU hardware.
+ */
+void cpu_set_fpu_opts(struct cpuinfo_mips *c)
+{
+	c->fpu_id = cpu_get_fpu_id();
+	mips_nofpu_msk31 = c->fpu_msk31;
+
+	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
+			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
+		if (c->fpu_id & MIPS_FPIR_3D)
+			c->ases |= MIPS_ASE_MIPS3D;
+		if (c->fpu_id & MIPS_FPIR_UFRP)
+			c->options |= MIPS_CPU_UFR;
+		if (c->fpu_id & MIPS_FPIR_FREP)
+			c->options |= MIPS_CPU_FRE;
+	}
+
+	cpu_set_fpu_fcsr_mask(c);
+	cpu_set_fpu_2008(c);
+	cpu_set_nan_2008(c);
+}
+
+/*
+ * Set options for the FPU emulator.
+ */
+void cpu_set_nofpu_opts(struct cpuinfo_mips *c)
+{
+	c->options &= ~MIPS_CPU_FPU;
+	c->fpu_msk31 = mips_nofpu_msk31;
+
+	cpu_set_nofpu_2008(c);
+	cpu_set_nan_2008(c);
+	cpu_set_nofpu_id(c);
+}
+
+int mips_fpu_disabled;
+
+static int __init fpu_disable(char *s)
+{
+	cpu_set_nofpu_opts(&boot_cpu_data);
+	mips_fpu_disabled = 1;
+
+	return 1;
+}
+
+__setup("nofpu", fpu_disable);
+
+#else /* !CONFIG_MIPS_FP_SUPPORT */
+
+#endif /* CONFIG_MIPS_FP_SUPPORT */
diff --git a/arch/mips/kernel/fpu-probe.h b/arch/mips/kernel/fpu-probe.h
new file mode 100644
index 000000000000..951ce50890d0
--- /dev/null
+++ b/arch/mips/kernel/fpu-probe.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <linux/kernel.h>
+
+#include <asm/cpu.h>
+#include <asm/cpu-info.h>
+
+#ifdef CONFIG_MIPS_FP_SUPPORT
+
+extern int mips_fpu_disabled;
+
+int __cpu_has_fpu(void);
+void cpu_set_fpu_opts(struct cpuinfo_mips *c);
+void cpu_set_nofpu_opts(struct cpuinfo_mips *c);
+
+#else /* !CONFIG_MIPS_FP_SUPPORT */
+
+#define mips_fpu_disabled 1
+
+static inline unsigned long cpu_get_fpu_id(void)
+{
+	return FPIR_IMP_NONE;
+}
+
+static inline int __cpu_has_fpu(void)
+{
+	return 0;
+}
+
+static inline void cpu_set_fpu_opts(struct cpuinfo_mips *c)
+{
+	/* no-op */
+}
+
+static inline void cpu_set_nofpu_opts(struct cpuinfo_mips *c)
+{
+	/* no-op */
+}
+
+#endif /* CONFIG_MIPS_FP_SUPPORT */
-- 
2.16.4

