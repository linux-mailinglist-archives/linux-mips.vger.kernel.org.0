Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F96FA4A0E
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfIAPnH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:43:07 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:32659 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAPnH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:43:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A6B843F771
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:36:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Yk9dODtmJJSB for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:36:00 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 93E5E3F76C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:36:00 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:35:59 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 001/120] MIPS: R5900: Initial support for the Emotion Engine
 in the PlayStation 2
Message-ID: <074470b707e277f2277bfedfe89ee4acbe159396.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The R5900 implements the 64-bit MIPS III instruction set except LL, SC,
LLD and SCD, with additional PREFETCH and conditional move instructions
from MIPS IV as well as three-operand multiply and multiply-accumulate
instructions[1]. It also has a set of R5900 specific 128-bit multimedia
instructions. Endianness is not configurable and taken to be little-
endian. The R5900 does not implement CP0.Status.{UX,SX,KX,PX}.

The COP1 FPU implements single-precision floating-point operations but
is not entirely IEEE 754 compatible. In particular,

- NaN (not a number) and plus/minus infinities are not supported;
- exception mechanisms are not fully supported;
- denormalized numbers are not supported;
- rounding towards nearest and plus/minus infinities are not supported;
- computed results usually differs in the least significant bit;
- saturating instructions can differ more than the least significant bit.

Since only rounding towards zero is supported, the two least significant
bits of FCR31 are hardwired to 01. To support IEEE 754 in applications
the FPU is emulated in software by the kernel.

The VPU0 is a vector processor of the Emotion Engine. In macro mode, it
functions as COP2 (coprocessor) and instructions execute simultaneously
in the main integer pipeline I1 and the COP2 pipeline[2]. In micro mode,
the VPU0 functions as a stand-alone processor. The VPU1 is an additional
vector processor that operates independently of both the R5900 and the
VPU0. It primarily acts as a preprocessor to the Graphics Synthesizer[3].
The vector processors are initially disabled.

The scratch pad RAM (SPRAM) of the Emotion Engine is 16 KiB of very fast
static RAM organised in 128-bit quadwords[4]. Both the DMA controller and
the R5900 can access the SPRAM. The SPRAM is initially disabled.

The R5900 has several significant hardware bugs. Perhaps the most
important bug affecting applications is the short loop bug that under
certain conditions causes loops to execute only once or twice.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, https://wiki.qemu.org/File:C790.pdf

[2] "VU User's Manual", version 6.0, Sony Computer Entertainment Inc.

[3] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.

[4] "EE Core User's Manual", version 6.0, Sony Computer Entertainment Inc.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/Kconfig                | 13 ++++++++++++-
 arch/mips/Makefile               |  1 +
 arch/mips/include/asm/cpu-type.h |  4 ++++
 arch/mips/include/asm/cpu.h      |  3 ++-
 arch/mips/include/asm/module.h   |  2 ++
 arch/mips/kernel/cpu-probe.c     |  8 ++++++++
 arch/mips/mm/Makefile            |  1 +
 arch/mips/mm/c-r4k.c             | 19 +++++++++++++++++++
 8 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..88d6c13260e1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1749,6 +1749,14 @@ config CPU_BMIPS
 	help
 	  Support for BMIPS32/3300/4350/4380 and BMIPS5000 processors.
 
+config CPU_R5900
+	bool "R5900"
+	depends on SYS_HAS_CPU_R5900
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select IRQ_MIPS_CPU
+	help
+	  Toshiba R5900 processor (Emotion Engine in the Sony PlayStation 2).
+
 config CPU_XLR
 	bool "Netlogic XLR SoC"
 	depends on SYS_HAS_CPU_XLR
@@ -1987,6 +1995,9 @@ config SYS_HAS_CPU_R5432
 config SYS_HAS_CPU_R5500
 	bool
 
+config SYS_HAS_CPU_R5900
+	bool
+
 config SYS_HAS_CPU_NEVADA
 	bool
 
@@ -2309,7 +2320,7 @@ config MIPS_FP_SUPPORT
 config CPU_R2300_FPU
 	bool
 	depends on MIPS_FP_SUPPORT
-	default y if CPU_R3000 || CPU_TX39XX
+	default y if CPU_R3000 || CPU_TX39XX || CPU_R5900
 
 config CPU_R4K_FPU
 	bool
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index eceff9b75b22..81cd620d32f7 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -178,6 +178,7 @@ cflags-$(CONFIG_CPU_R5432)	+= $(call cc-option,-march=r5400,-march=r5000) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_R5500)	+= $(call cc-option,-march=r5500,-march=r5000) \
 			-Wa,--trap
+cflags-$(CONFIG_CPU_R5900)	+= -march=r5900 -Wa,--trap
 cflags-$(CONFIG_CPU_NEVADA)	+= $(call cc-option,-march=rm5200,-march=r5000) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_RM7000)	+= $(call cc-option,-march=rm7000,-march=r5000) \
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index a45af3de075d..7d35100e0e18 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -151,6 +151,10 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 	case CPU_R5500:
 #endif
 
+#ifdef CONFIG_SYS_HAS_CPU_R5900
+	case CPU_R5900:
+#endif
+
 #ifdef CONFIG_SYS_HAS_CPU_NEVADA
 	case CPU_NEVADA:
 #endif
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 290369fa44a4..05a0f5a07f08 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -83,6 +83,7 @@
 #define PRID_IMP_R4650		0x2200		/* Same as R4640 */
 #define PRID_IMP_R5000		0x2300
 #define PRID_IMP_TX49		0x2d00
+#define PRID_IMP_R5900		0x2e00		/* PlayStation 2 */
 #define PRID_IMP_SONIC		0x2400
 #define PRID_IMP_MAGIC		0x2500
 #define PRID_IMP_RM7000		0x2700
@@ -298,7 +299,7 @@ enum cpu_type_enum {
 	CPU_R4700, CPU_R5000, CPU_R5500, CPU_NEVADA, CPU_R5432, CPU_R10000,
 	CPU_R12000, CPU_R14000, CPU_R16000, CPU_VR41XX, CPU_VR4111, CPU_VR4121,
 	CPU_VR4122, CPU_VR4131, CPU_VR4133, CPU_VR4181, CPU_VR4181A, CPU_RM7000,
-	CPU_SR71000, CPU_TX49XX,
+	CPU_SR71000, CPU_TX49XX, CPU_R5900,
 
 	/*
 	 * R8000 class processors
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
index 6dc0b21b8acd..d6fbc3aad2a1 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -115,6 +115,8 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "R5432 "
 #elif defined CONFIG_CPU_R5500
 #define MODULE_PROC_FAMILY "R5500 "
+#elif defined CONFIG_CPU_R5900
+#define MODULE_PROC_FAMILY "R5900 "
 #elif defined CONFIG_CPU_NEVADA
 #define MODULE_PROC_FAMILY "NEVADA "
 #elif defined CONFIG_CPU_R8000
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 9635c1db3ae6..629391948ab4 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1484,6 +1484,14 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			     MIPS_CPU_WATCH | MIPS_CPU_LLSC;
 		c->tlbsize = 48;
 		break;
+	case PRID_IMP_R5900:
+		c->cputype = CPU_R5900;
+		__cpu_name[cpu] = "R5900";
+		c->isa_level = MIPS_CPU_ISA_III;
+		c->fpu_msk31 |= FPU_CSR_CONDX;
+		c->options = R4K_OPTS | MIPS_CPU_DIVEC;
+		c->tlbsize = 48;
+		break;
 	case PRID_IMP_NEVADA:
 		c->cputype = CPU_NEVADA;
 		__cpu_name[cpu] = "Nevada";
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 1e8d335025d7..08db8f27d125 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_DMA_NONCOHERENT)	+= dma-noncoherent.o
 
 obj-$(CONFIG_CPU_R4K_CACHE_TLB) += c-r4k.o cex-gen.o tlb-r4k.o
 obj-$(CONFIG_CPU_R3000)		+= c-r3k.o tlb-r3k.o
+obj-$(CONFIG_CPU_R5900)		+= c-r4k.o cex-gen.o tlb-r4k.o
 obj-$(CONFIG_CPU_R8000)		+= c-r4k.o cex-gen.o tlb-r8k.o
 obj-$(CONFIG_CPU_SB1)		+= c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o
 obj-$(CONFIG_CPU_TX39XX)	+= c-tx39.o tlb-r3k.o
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5166e38cd1c6..4f2cecbec722 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1113,6 +1113,18 @@ static void probe_pcache(void)
 		c->options |= MIPS_CPU_CACHE_CDEX_P | MIPS_CPU_PREFETCH;
 		break;
 
+	case CPU_R5900:
+		icache_size = 1 << (12 + ((config & CONF_IC) >> 9));
+		c->icache.linesz = 64;
+		c->icache.ways = 2;
+		c->icache.waybit = 0;
+
+		dcache_size = 1 << (12 + ((config & CONF_DC) >> 6));
+		c->dcache.linesz = 64;
+		c->dcache.ways = 2;
+		c->dcache.waybit = 0;
+		break;
+
 	case CPU_TX49XX:
 		icache_size = 1 << (12 + ((config & CONF_IC) >> 9));
 		c->icache.linesz = 16 << ((config & CONF_IB) >> 5);
@@ -1388,6 +1400,13 @@ static void probe_pcache(void)
 	case CPU_R16000:
 		break;
 
+	case CPU_R5900:
+		if (c->icache.waysize > PAGE_SIZE)
+			c->dcache.flags |= MIPS_CACHE_ALIASES;
+		if (c->dcache.waysize > PAGE_SIZE)
+			c->dcache.flags |= MIPS_CACHE_ALIASES;
+		break;
+
 	case CPU_74K:
 	case CPU_1074K:
 		has_74k_erratum = alias_74k_erratum(c);
-- 
2.21.0

