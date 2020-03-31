Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B709198A9A
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 05:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgCaDnL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 23:43:11 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:41552 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbgCaDnL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 23:43:11 -0400
Received: from [192.168.1.13] (c-73-173-172-109.hsd1.md.comcast.net [73.173.172.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id F26BC34F085;
        Tue, 31 Mar 2020 03:43:08 +0000 (UTC)
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] Split R10000 to allow for R12K+ optimizations
Openpgp: preference=signencrypt
Message-ID: <b20f5597-e9ee-ec7c-c7a3-7e8c1b57063a@gentoo.org>
Date:   Mon, 30 Mar 2020 23:43:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The attached patch adds more-specific support for R12000 and higher
CPUs by splitting the R10000 logic at several places.  This avoids
the workarounds enabled by R10000_LLSC_WAR and passes -mno-fix-r10000
to gcc during the kernel compile.

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 arch/mips/Kconfig                     |   21 +++++++++++++++++++--
 arch/mips/Makefile                    |    3 +++
 arch/mips/include/asm/cpu-type.h      |    2 ++
 arch/mips/include/asm/hazards.h       |    3 ++-
 arch/mips/include/asm/mach-ip27/war.h |    7 ++++++-
 arch/mips/include/asm/module.h        |    2 ++
 arch/mips/oprofile/Makefile           |    1 +
 arch/mips/sgi-ip27/Platform           |   15 ++++++++-------
 arch/mips/sgi-ip30/Platform           |    2 ++
 arch/mips/sgi-ip32/Platform           |    2 ++
 drivers/video/fbdev/gbefb.c           |    2 +-
 11 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 797d7f1ad5fe..93c6a9166983 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -715,6 +715,7 @@ config SGI_IP27
 	select PCI_DRIVERS_GENERIC
 	select PCI_XTALK_BRIDGE
 	select SYS_HAS_CPU_R10000
+	select SYS_HAS_CPU_R12K_R14K_R16K
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_NUMA
@@ -776,6 +777,7 @@ config SGI_IP30
 	select PCI_XTALK_BRIDGE
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_HAS_CPU_R10000
+	select SYS_HAS_CPU_R12K_R14K_R16K
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_SMP
@@ -802,6 +804,7 @@ config SGI_IP32
 	select RM7000_CPU_SCACHE
 	select SYS_HAS_CPU_R5000
 	select SYS_HAS_CPU_R10000 if BROKEN
+	select SYS_HAS_CPU_R12K_R14K_R16K if BROKEN
 	select SYS_HAS_CPU_RM7000
 	select SYS_HAS_CPU_NEVADA
 	select SYS_SUPPORTS_64BIT_KERNEL
@@ -1722,8 +1725,19 @@ config CPU_R10000
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 	help
-	  MIPS Technologies R10000-series processors.
+	  MIPS Technologies R10000 processor.
 
+config CPU_R12K_R14K_R16K
+	bool "R12k/R14k/R16k"
+	depends on SYS_HAS_CPU_R12K_R14K_R16K
+	select CPU_HAS_PREFETCH
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_64BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select CPU_SUPPORTS_HUGEPAGES
+	help
+	  MIPS Technologies R12000, R14000, & R16000 processors.
+ 
 config CPU_RM7000
 	bool "RM7000"
 	depends on SYS_HAS_CPU_RM7000
@@ -2014,6 +2028,9 @@ config SYS_HAS_CPU_R10000
 	bool
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if DMA_NONCOHERENT
 
+config SYS_HAS_CPU_R12K_R14K_R16K
+	bool
+
 config SYS_HAS_CPU_RM7000
 	bool
 
@@ -2752,7 +2769,7 @@ config NODES_SHIFT
 
 config HW_PERF_EVENTS
 	bool "Enable hardware performance counter support for perf events"
-	depends on PERF_EVENTS && !OPROFILE && (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON64)
+	depends on PERF_EVENTS && !OPROFILE && (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_R12K_R14K_R16K || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON64)
 	default y
 	help
 	  Enable hardware performance counter support for perf events. If
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..514349c87e01 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -188,6 +188,9 @@ cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mdmx)
 cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mips3d)
 cflags-$(CONFIG_CPU_R10000)	+= $(call cc-option,-march=r10000,-march=r8000) \
 			-Wa,--trap
+cflags-$(CONFIG_CPU_R12K_R14K_R16K)	+= $(call cc-option,-march=r12000,-march=r10000) \
+			$(call cc-option,-mno-fix-r10000,) \
+			-Wa,--trap
 cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += $(call cc-option,-march=octeon) -Wa,--trap
 ifeq (,$(findstring march=octeon, $(cflags-$(CONFIG_CPU_CAVIUM_OCTEON))))
 cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += -Wa,-march=octeon
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index 49f0061a6051..833694782d05 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -148,6 +148,8 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 
 #ifdef CONFIG_SYS_HAS_CPU_R10000
 	case CPU_R10000:
+#endif
+#ifdef CONFIG_SYS_HAS_CPU_R12K_R14K_R16K
 	case CPU_R12000:
 	case CPU_R14000:
 	case CPU_R16000:
diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index a0b92205f933..190ad53091ea 100644
--- a/arch/mips/include/asm/hazards.h
+++ b/arch/mips/include/asm/hazards.h
@@ -159,7 +159,8 @@ do {									\
 
 #elif defined(CONFIG_MIPS_ALCHEMY) || defined(CONFIG_CPU_CAVIUM_OCTEON) || \
 	defined(CONFIG_CPU_LOONGSON2EF) || defined(CONFIG_CPU_LOONGSON64) || \
-	defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R5500) || defined(CONFIG_CPU_XLR)
+	defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R12K_R14K_R16K) || \
+	defined(CONFIG_CPU_R5500) || defined(CONFIG_CPU_XLR)
 
 /*
  * R10000 rocks - all hazards handled in hardware, so this becomes a nobrainer.
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index ef3efce0094a..845b8951d74f 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -17,7 +17,12 @@
 #define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
-#define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
 
+#ifdef CONFIG_CPU_R10000
+#define R10000_LLSC_WAR			1
+#else
+#define R10000_LLSC_WAR			0
+#endif
+
 #endif /* __ASM_MIPS_MACH_IP27_WAR_H */
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
index 9846047b3d3d..9697414af51c 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -115,6 +115,8 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "NEVADA "
 #elif defined CONFIG_CPU_R10000
 #define MODULE_PROC_FAMILY "R10000 "
+#elif defined CONFIG_CPU_R12K_R14K_R16K
+#define MODULE_PROC_FAMILY "R12K/R14K/R16K "
 #elif defined CONFIG_CPU_RM7000
 #define MODULE_PROC_FAMILY "RM7000 "
 #elif defined CONFIG_CPU_SB1
diff --git a/arch/mips/oprofile/Makefile b/arch/mips/oprofile/Makefile
index e10f216d0422..60dfffdb32a0 100644
--- a/arch/mips/oprofile/Makefile
+++ b/arch/mips/oprofile/Makefile
@@ -12,6 +12,7 @@ oprofile-y				:= $(DRIVER_OBJS) common.o backtrace.o
 oprofile-$(CONFIG_CPU_MIPS32)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_MIPS64)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_R10000)		+= op_model_mipsxx.o
+oprofile-$(CONFIG_CPU_R12K_R14K_R16K)	+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_SB1)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_XLR)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_LOONGSON2EF)	+= op_model_loongson2.o
diff --git a/arch/mips/sgi-ip27/Platform b/arch/mips/sgi-ip27/Platform
index 1fb9c2ea7c8f..4ad7060a33ac 100644
--- a/arch/mips/sgi-ip27/Platform
+++ b/arch/mips/sgi-ip27/Platform
@@ -6,14 +6,15 @@
 # be 16kb aligned or the handling of the current variable will break.
 #
 ifdef CONFIG_SGI_IP27
-platform-$(CONFIG_SGI_IP27)	+= sgi-ip27/
-cflags-$(CONFIG_SGI_IP27)	+= -I$(srctree)/arch/mips/include/asm/mach-ip27
+platform-$(CONFIG_SGI_IP27)		+= sgi-ip27/
+cflags-$(CONFIG_SGI_IP27)		+= -I$(srctree)/arch/mips/include/asm/mach-ip27
+cflags-$(CONFIG_CPU_R12K_R14K_R16K)	+= -mno-fix-r10000
 ifdef CONFIG_MAPPED_KERNEL
-load-$(CONFIG_SGI_IP27)		+= 0xc00000004001c000
-OBJCOPYFLAGS			:= --change-addresses=0x3fffffff80000000
-dataoffset-$(CONFIG_SGI_IP27)	+= 0x01000000
+load-$(CONFIG_SGI_IP27)			+= 0xc00000004001c000
+OBJCOPYFLAGS				:= --change-addresses=0x3fffffff80000000
+dataoffset-$(CONFIG_SGI_IP27)		+= 0x01000000
 else
-load-$(CONFIG_SGI_IP27)		+= 0xa80000000001c000
-OBJCOPYFLAGS			:= --change-addresses=0x57ffffff80000000
+load-$(CONFIG_SGI_IP27)			+= 0xa80000000001c000
+OBJCOPYFLAGS				:= --change-addresses=0x57ffffff80000000
 endif
 endif
diff --git a/arch/mips/sgi-ip30/Platform b/arch/mips/sgi-ip30/Platform
index 2b5695c2049a..403a8112147d 100644
--- a/arch/mips/sgi-ip30/Platform
+++ b/arch/mips/sgi-ip30/Platform
@@ -4,5 +4,7 @@
 ifdef CONFIG_SGI_IP30
 platform-$(CONFIG_SGI_IP30)		+= sgi-ip30/
 cflags-$(CONFIG_SGI_IP30)		+= -I$(srctree)/arch/mips/include/asm/mach-ip30
+cflags-$(CONFIG_CPU_R12K_R14K_R16K)	+= -mno-fix-r10000
+#load-$(CONFIG_SGI_IP30)		+= 0xa800000020080000
 load-$(CONFIG_SGI_IP30)			+= 0xa800000020004000
 endif
diff --git a/arch/mips/sgi-ip32/Platform b/arch/mips/sgi-ip32/Platform
index 0fea556f3641..589930560088 100644
--- a/arch/mips/sgi-ip32/Platform
+++ b/arch/mips/sgi-ip32/Platform
@@ -8,4 +8,6 @@
 #
 platform-$(CONFIG_SGI_IP32)	+= sgi-ip32/
 cflags-$(CONFIG_SGI_IP32)	+= -I$(srctree)/arch/mips/include/asm/mach-ip32
+cflags-$(CONFIG_CPU_R10000)		+= -mr10k-cache-barrier=load-store
+cflags-$(CONFIG_CPU_R12K_R14K_R16K)	+= -mno-fix-r10000 -mr10k-cache-barrier=load-store
 load-$(CONFIG_SGI_IP32)		+= 0xffffffff80004000
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 31270a8986e8..9d62246b0b42 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -43,7 +43,7 @@ struct gbefb_par {
 
 /* macro for fastest write-though access to the framebuffer */
 #ifdef CONFIG_MIPS
-#ifdef CONFIG_CPU_R10000
+#if defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R12K_R14K_R16K)
 #define pgprot_fb(_prot) (((_prot) & (~_CACHE_MASK)) | _CACHE_UNCACHED_ACCELERATED)
 #else
 #define pgprot_fb(_prot) (((_prot) & (~_CACHE_MASK)) | _CACHE_CACHABLE_NO_WA)
