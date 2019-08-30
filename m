Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C36A2E4D
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfH3E1E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:27:04 -0400
Received: from forward100o.mail.yandex.net ([37.140.190.180]:38025 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725901AbfH3E1E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:27:04 -0400
Received: from mxback29j.mail.yandex.net (mxback29j.mail.yandex.net [IPv6:2a02:6b8:0:1619::229])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 359224AC074C;
        Fri, 30 Aug 2019 07:26:55 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback29j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 8AjnIMTzPf-QseucSsj;
        Fri, 30 Aug 2019 07:26:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139215;
        bh=cBHr6ia9EVOb1pCmb6h2l4pQZuJ4M9Xld6bKEZZOlYw=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=L3T8MW+eGS06102MMiuWj6TLCoKJz6d/76WqkqnYUR5RjHPw/PLhkVz7SmvbirHRJ
         PlOm33PXmf0e99zLzfGUHmV6QB1KGnxKUABmOraLX61mejDD9D+4CRI5M+6CSNA31o
         u0W/mw88TY7Q6V7t/Ms+SL9VHPBu+q0JNI6kBlqc=
Authentication-Results: mxback29j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 77UXTEcPDw-QjT08DYm;
        Fri, 30 Aug 2019 07:26:51 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 01/18] MIPS: Loongson64: Rename CPU TYPES
Date:   Fri, 30 Aug 2019 12:25:51 +0800
Message-Id: <20190830042608.19569-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
References: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPU_LOONGSON2 -> CPU_LOONGSON2EF
CPU_LOONGSON3 -> CPU_LOONGSON64

As newer loongson-2 products (2G/2H/2K1000) can share kernel
implementation with loongson-3 while 2E/2F are less similar with
other LOONGSON64 products.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                             | 28 ++++++++--------
 arch/mips/include/asm/cop2.h                  |  2 +-
 arch/mips/include/asm/cpu-type.h              |  6 ++--
 arch/mips/include/asm/cpu.h                   |  4 +--
 arch/mips/include/asm/hazards.h               |  2 +-
 arch/mips/include/asm/io.h                    |  2 +-
 arch/mips/include/asm/irqflags.h              |  2 +-
 .../mach-loongson64/cpu-feature-overrides.h   |  2 +-
 arch/mips/include/asm/mach-loongson64/irq.h   |  2 +-
 .../asm/mach-loongson64/kernel-entry-init.h   |  4 +--
 .../include/asm/mach-loongson64/loongson.h    |  2 +-
 arch/mips/include/asm/mach-loongson64/pci.h   |  2 +-
 arch/mips/include/asm/module.h                |  8 ++---
 arch/mips/include/asm/pgtable-bits.h          |  2 +-
 arch/mips/include/asm/processor.h             |  2 +-
 arch/mips/include/asm/r4kcache.h              |  4 +--
 arch/mips/kernel/cpu-probe.c                  | 14 ++++----
 arch/mips/kernel/idle.c                       |  2 +-
 arch/mips/kernel/perf_event_mipsxx.c          |  4 +--
 arch/mips/kernel/setup.c                      |  2 +-
 arch/mips/kernel/traps.c                      |  2 +-
 arch/mips/lib/csum_partial.S                  |  4 +--
 arch/mips/loongson64/Kconfig                  |  2 +-
 arch/mips/loongson64/Makefile                 |  2 +-
 arch/mips/loongson64/Platform                 | 12 +++----
 arch/mips/loongson64/common/pci.c             |  2 +-
 arch/mips/mm/c-r4k.c                          | 32 +++++++++----------
 arch/mips/mm/page.c                           |  2 +-
 arch/mips/mm/tlb-r4k.c                        |  4 +--
 arch/mips/mm/tlbex.c                          |  6 ++--
 arch/mips/oprofile/Makefile                   |  4 +--
 arch/mips/oprofile/common.c                   |  4 +--
 drivers/gpio/Kconfig                          |  2 +-
 drivers/gpio/gpio-loongson.c                  |  2 +-
 include/drm/drm_cache.h                       |  2 +-
 35 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..cbc76f00d1fc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1367,9 +1367,9 @@ choice
 	prompt "CPU type"
 	default CPU_R4X00
 
-config CPU_LOONGSON3
-	bool "Loongson 3 CPU"
-	depends on SYS_HAS_CPU_LOONGSON3
+config CPU_LOONGSON64
+	bool "Loongson GSx64 Family CPU"
+	depends on SYS_HAS_CPU_LOONGSON64
 	select ARCH_HAS_PHYS_TO_DMA
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1382,15 +1382,15 @@ config CPU_LOONGSON3
 	select GPIOLIB
 	select SWIOTLB
 	help
-		The Loongson 3 processor implements the MIPS64R2 instruction
-		set with many extensions.
+		The Loongson GSx64 Family cores including Loongson-3A/3B/2series-soc
+		implements the MIPS64R2 instruction set with many extensions.
 
 config LOONGSON3_ENHANCEMENT
 	bool "New Loongson 3 CPU Enhancements"
 	default n
 	select CPU_MIPSR2
 	select CPU_HAS_PREFETCH
-	depends on CPU_LOONGSON3
+	depends on CPU_LOONGSON64
 	help
 	  New Loongson 3 CPU (since Loongson-3A R2, as opposed to Loongson-3A
 	  R1, Loongson-3B R1 and Loongson-3B R2) has many enhancements, such as
@@ -1406,7 +1406,7 @@ config LOONGSON3_ENHANCEMENT
 config CPU_LOONGSON3_WORKAROUNDS
 	bool "Old Loongson 3 LLSC Workarounds"
 	default y if SMP
-	depends on CPU_LOONGSON3
+	depends on CPU_LOONGSON64
 	help
 	  Loongson 3 processors have the llsc issues which require workarounds.
 	  Without workarounds the system may hang unexpectedly.
@@ -1421,7 +1421,7 @@ config CPU_LOONGSON3_WORKAROUNDS
 config CPU_LOONGSON2E
 	bool "Loongson 2E"
 	depends on SYS_HAS_CPU_LOONGSON2E
-	select CPU_LOONGSON2
+	select CPU_LOONGSON2EF
 	help
 	  The Loongson 2E processor implements the MIPS III instruction set
 	  with many extensions.
@@ -1432,7 +1432,7 @@ config CPU_LOONGSON2E
 config CPU_LOONGSON2F
 	bool "Loongson 2F"
 	depends on SYS_HAS_CPU_LOONGSON2F
-	select CPU_LOONGSON2
+	select CPU_LOONGSON2EF
 	select GPIOLIB
 	help
 	  The Loongson 2F processor implements the MIPS III instruction set
@@ -1870,7 +1870,7 @@ config SYS_SUPPORTS_ZBOOT_UART_PROM
 	bool
 	select SYS_SUPPORTS_ZBOOT
 
-config CPU_LOONGSON2
+config CPU_LOONGSON2EF
 	bool
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
@@ -1913,7 +1913,7 @@ config CPU_BMIPS5000
 	select SYS_SUPPORTS_HOTPLUG_CPU
 	select CPU_HAS_RIXI
 
-config SYS_HAS_CPU_LOONGSON3
+config SYS_HAS_CPU_LOONGSON64
 	bool
 	select CPU_SUPPORTS_CPUFREQ
 	select CPU_HAS_RIXI
@@ -2183,7 +2183,7 @@ choice
 
 config PAGE_SIZE_4KB
 	bool "4kB"
-	depends on !CPU_LOONGSON2 && !CPU_LOONGSON3
+	depends on !CPU_LOONGSON2EF && !CPU_LOONGSON64
 	help
 	  This option select the standard 4kB Linux page size.  On some
 	  R3000-family processors this is the only available page size.  Using
@@ -2631,7 +2631,7 @@ config CPU_SUPPORTS_MSA
 
 config ARCH_FLATMEM_ENABLE
 	def_bool y
-	depends on !NUMA && !CPU_LOONGSON2
+	depends on !NUMA && !CPU_LOONGSON2EF
 
 config ARCH_DISCONTIGMEM_ENABLE
 	bool
@@ -2721,7 +2721,7 @@ config NODES_SHIFT
 
 config HW_PERF_EVENTS
 	bool "Enable hardware performance counter support for perf events"
-	depends on PERF_EVENTS && !OPROFILE && (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON3)
+	depends on PERF_EVENTS && !OPROFILE && (CPU_MIPS32 || CPU_MIPS64 || CPU_R10000 || CPU_SB1 || CPU_CAVIUM_OCTEON || CPU_XLP || CPU_LOONGSON64)
 	default y
 	help
 	  Enable hardware performance counter support for perf events. If
diff --git a/arch/mips/include/asm/cop2.h b/arch/mips/include/asm/cop2.h
index 63b3468ede4c..6b7396a6a115 100644
--- a/arch/mips/include/asm/cop2.h
+++ b/arch/mips/include/asm/cop2.h
@@ -33,7 +33,7 @@ extern void nlm_cop2_restore(struct nlm_cop2_state *);
 #define cop2_present		1
 #define cop2_lazy_restore	0
 
-#elif defined(CONFIG_CPU_LOONGSON3)
+#elif defined(CONFIG_CPU_LOONGSON64)
 
 #define cop2_present		1
 #define cop2_lazy_restore	1
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index a45af3de075d..3d8911f8252b 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -17,11 +17,11 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 	switch (cpu_type) {
 #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2E) || \
     defined(CONFIG_SYS_HAS_CPU_LOONGSON2F)
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 #endif
 
-#ifdef CONFIG_SYS_HAS_CPU_LOONGSON3
-	case CPU_LOONGSON3:
+#ifdef CONFIG_SYS_HAS_CPU_LOONGSON64
+	case CPU_LOONGSON64:
 #endif
 
 #if defined(CONFIG_SYS_HAS_CPU_LOONGSON1B) || \
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 290369fa44a4..9f30234b2a3d 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -322,8 +322,8 @@ enum cpu_type_enum {
 	/*
 	 * MIPS64 class processors
 	 */
-	CPU_5KC, CPU_5KE, CPU_20KC, CPU_25KF, CPU_SB1, CPU_SB1A, CPU_LOONGSON2,
-	CPU_LOONGSON3, CPU_CAVIUM_OCTEON, CPU_CAVIUM_OCTEON_PLUS,
+	CPU_5KC, CPU_5KE, CPU_20KC, CPU_25KF, CPU_SB1, CPU_SB1A, CPU_LOONGSON2EF,
+	CPU_LOONGSON64, CPU_CAVIUM_OCTEON, CPU_CAVIUM_OCTEON_PLUS,
 	CPU_CAVIUM_OCTEON2, CPU_CAVIUM_OCTEON3, CPU_XLR, CPU_XLP, CPU_I6500,
 
 	CPU_QEMU_GENERIC,
diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index 0fa27446869a..a4f48b0f5541 100644
--- a/arch/mips/include/asm/hazards.h
+++ b/arch/mips/include/asm/hazards.h
@@ -158,7 +158,7 @@ do {									\
 } while (0)
 
 #elif defined(CONFIG_MIPS_ALCHEMY) || defined(CONFIG_CPU_CAVIUM_OCTEON) || \
-	defined(CONFIG_CPU_LOONGSON2) || defined(CONFIG_LOONGSON3_ENHANCEMENT) || \
+	defined(CONFIG_CPU_LOONGSON2EF) || defined(CONFIG_LOONGSON3_ENHANCEMENT) || \
 	defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R5500) || defined(CONFIG_CPU_XLR)
 
 /*
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 97a280640daf..173801d04faa 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -317,7 +317,7 @@ static inline void iounmap(const volatile void __iomem *addr)
 #undef __IS_KSEG1
 }
 
-#if defined(CONFIG_CPU_CAVIUM_OCTEON) || defined(CONFIG_CPU_LOONGSON3)
+#if defined(CONFIG_CPU_CAVIUM_OCTEON) || defined(CONFIG_CPU_LOONGSON64)
 #define war_io_reorder_wmb()		wmb()
 #else
 #define war_io_reorder_wmb()		barrier()
diff --git a/arch/mips/include/asm/irqflags.h b/arch/mips/include/asm/irqflags.h
index f0b862a83816..4d742acf2be0 100644
--- a/arch/mips/include/asm/irqflags.h
+++ b/arch/mips/include/asm/irqflags.h
@@ -41,7 +41,7 @@ static inline unsigned long arch_local_irq_save(void)
 	"	.set	push						\n"
 	"	.set	reorder						\n"
 	"	.set	noat						\n"
-#if defined(CONFIG_CPU_LOONGSON3) || defined (CONFIG_CPU_LOONGSON1)
+#if defined(CONFIG_CPU_LOONGSON64) || defined (CONFIG_CPU_LOONGSON1)
 	"	mfc0	%[flags], $12					\n"
 	"	di							\n"
 #else
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 581915ce231c..153b6042e174 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -45,7 +45,7 @@
 #define cpu_has_watch		1
 #define cpu_has_local_ebase	0
 
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 #define cpu_has_wsbh		1
 #define cpu_has_ic_fills_f_dc	1
 #define cpu_hwrena_impl_bits	0xc0000000
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index be9f727a9328..557e069c400c 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -4,7 +4,7 @@
 
 #include <boot_param.h>
 
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 
 /* cpu core interrupt numbers */
 #define MIPS_CPU_IRQ_BASE 56
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index b5e288a12dfe..74d94fc1ed53 100644
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
@@ -17,7 +17,7 @@
  * Override macros used in arch/mips/kernel/head.S.
  */
 	.macro	kernel_entry_setup
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 	.set	push
 	.set	mips64
 	/* Set LPA on LOONGSON3 config3 */
@@ -46,7 +46,7 @@
  * Do SMP slave processor setup.
  */
 	.macro	smp_slave_setup
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 	.set	push
 	.set	mips64
 	/* Set LPA on LOONGSON3 config3 */
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index 694a58574ec0..40a24b76b874 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -109,7 +109,7 @@ static inline void do_perfcnt_IRQ(void)
 #define LOONGSON_PCICFG_SIZE	0x00000800	/* 2K */
 #define LOONGSON_PCICFG_TOP	(LOONGSON_PCICFG_BASE+LOONGSON_PCICFG_SIZE-1)
 
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 #define LOONGSON_PCIIO_BASE	loongson_sysconf.pci_io_base
 #else
 #define LOONGSON_PCIIO_BASE	0x1fd00000
diff --git a/arch/mips/include/asm/mach-loongson64/pci.h b/arch/mips/include/asm/mach-loongson64/pci.h
index 97f807fb2117..05cc9052772f 100644
--- a/arch/mips/include/asm/mach-loongson64/pci.h
+++ b/arch/mips/include/asm/mach-loongson64/pci.h
@@ -35,7 +35,7 @@ extern struct pci_ops loongson_pci_ops;
 #else	/* loongson2f/32bit & loongson2e */
 
 /* this pci memory space is mapped by pcimap in pci.c */
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 #define LOONGSON_PCI_MEM_START	0x40000000UL
 #define LOONGSON_PCI_MEM_END	0x7effffffUL
 #else
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
index 6dc0b21b8acd..2e5aee37bade 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -127,10 +127,10 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "SB1 "
 #elif defined CONFIG_CPU_LOONGSON1
 #define MODULE_PROC_FAMILY "LOONGSON1 "
-#elif defined CONFIG_CPU_LOONGSON2
-#define MODULE_PROC_FAMILY "LOONGSON2 "
-#elif defined CONFIG_CPU_LOONGSON3
-#define MODULE_PROC_FAMILY "LOONGSON3 "
+#elif defined CONFIG_CPU_LOONGSON2EF
+#define MODULE_PROC_FAMILY "LOONGSON2EF "
+#elif defined CONFIG_CPU_LOONGSON64
+#define MODULE_PROC_FAMILY "LOONGSON64 "
 #elif defined CONFIG_CPU_CAVIUM_OCTEON
 #define MODULE_PROC_FAMILY "OCTEON "
 #elif defined CONFIG_CPU_XLR
diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index f88a48cd68b2..9807f05945fc 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -216,7 +216,7 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 
 #define _CACHE_CACHABLE_NONCOHERENT (5<<_CACHE_SHIFT)
 
-#elif defined(CONFIG_CPU_LOONGSON3)
+#elif defined(CONFIG_CPU_LOONGSON64)
 
 /* Using COHERENT flag for NONCOHERENT doesn't hurt. */
 
diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index aca909bd7841..684efaa990ee 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -390,7 +390,7 @@ unsigned long get_wchan(struct task_struct *p);
 #define KSTK_ESP(tsk) (task_pt_regs(tsk)->regs[29])
 #define KSTK_STATUS(tsk) (task_pt_regs(tsk)->cp0_status)
 
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 /*
  * Loongson-3's SFB (Store-Fill-Buffer) may buffer writes indefinitely when a
  * tight read loop is executed, because reads take priority over writes & the
diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 7f4a32d3345a..769d8b63f9fa 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -67,7 +67,7 @@ static inline void flush_scache_line_indexed(unsigned long addr)
 static inline void flush_icache_line(unsigned long addr)
 {
 	switch (boot_cpu_type()) {
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		cache_op(Hit_Invalidate_I_Loongson2, addr);
 		break;
 
@@ -149,7 +149,7 @@ static inline void flush_scache_line(unsigned long addr)
 static inline int protected_flush_icache_line(unsigned long addr)
 {
 	switch (boot_cpu_type()) {
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		return protected_cache_op(Hit_Invalidate_I_Loongson2, addr);
 
 	default:
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 9635c1db3ae6..b0517bfc2100 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -608,7 +608,7 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
 		if (!(flags & FTLB_EN))
 			return 1;
 		return 0;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		/* Flush ITLB, DTLB, VTLB and FTLB */
 		write_c0_diag(LOONGSON_DIAG_ITLB | LOONGSON_DIAG_DTLB |
 			      LOONGSON_DIAG_VTLB | LOONGSON_DIAG_FTLB);
@@ -1555,28 +1555,28 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 	case PRID_IMP_LOONGSON_64:  /* Loongson-2/3 */
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON2E:
-			c->cputype = CPU_LOONGSON2;
+			c->cputype = CPU_LOONGSON2EF;
 			__cpu_name[cpu] = "ICT Loongson-2";
 			set_elf_platform(cpu, "loongson2e");
 			set_isa(c, MIPS_CPU_ISA_III);
 			c->fpu_msk31 |= FPU_CSR_CONDX;
 			break;
 		case PRID_REV_LOONGSON2F:
-			c->cputype = CPU_LOONGSON2;
+			c->cputype = CPU_LOONGSON2EF;
 			__cpu_name[cpu] = "ICT Loongson-2";
 			set_elf_platform(cpu, "loongson2f");
 			set_isa(c, MIPS_CPU_ISA_III);
 			c->fpu_msk31 |= FPU_CSR_CONDX;
 			break;
 		case PRID_REV_LOONGSON3A_R1:
-			c->cputype = CPU_LOONGSON3;
+			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R1);
 			break;
 		case PRID_REV_LOONGSON3B_R1:
 		case PRID_REV_LOONGSON3B_R2:
-			c->cputype = CPU_LOONGSON3;
+			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3b");
 			set_isa(c, MIPS_CPU_ISA_M64R1);
@@ -1929,14 +1929,14 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON3A_R2_0:
 		case PRID_REV_LOONGSON3A_R2_1:
-			c->cputype = CPU_LOONGSON3;
+			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
 			break;
 		case PRID_REV_LOONGSON3A_R3_0:
 		case PRID_REV_LOONGSON3A_R3_1:
-			c->cputype = CPU_LOONGSON3;
+			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 7388f1374d5f..2524da19fafb 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -179,7 +179,7 @@ void __init check_wait(void)
 	case CPU_XLP:
 		cpu_wait = r4k_wait;
 		break;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		if ((c->processor_id & PRID_REV_MASK) >= PRID_REV_LOONGSON3A_R2_0)
 			cpu_wait = r4k_wait;
 		break;
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index a3e2da8391ea..0af456a94916 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -1623,7 +1623,7 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
 			raw_event.cntr_mask =
 				raw_id > 127 ? CNTR_ODD : CNTR_EVEN;
 		break;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		raw_event.cntr_mask = raw_id > 127 ? CNTR_ODD : CNTR_EVEN;
 	break;
 	}
@@ -1769,7 +1769,7 @@ init_hw_perf_events(void)
 		mipspmu.general_event_map = &mipsxxcore_event_map;
 		mipspmu.cache_event_map = &mipsxxcore_cache_map;
 		break;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		mipspmu.name = "mips/loongson3";
 		mipspmu.general_event_map = &loongson3_event_map;
 		mipspmu.cache_event_map = &loongson3_cache_map;
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ceef8240f171..3765893824f3 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -282,7 +282,7 @@ static unsigned long __init init_initrd(void)
  * Initialize the bootmem allocator. It also setup initrd related data
  * if needed.
  */
-#if defined(CONFIG_SGI_IP27) || (defined(CONFIG_CPU_LOONGSON3) && defined(CONFIG_NUMA))
+#if defined(CONFIG_SGI_IP27) || (defined(CONFIG_CPU_LOONGSON64) && defined(CONFIG_NUMA))
 
 static void __init bootmem_init(void)
 {
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 342e41de9d64..0c2570e6fcf6 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2394,7 +2394,7 @@ void __init trap_init(void)
 	else {
 		if (cpu_has_vtag_icache)
 			set_except_vector(EXCCODE_RI, handle_ri_rdhwr_tlbp);
-		else if (current_cpu_type() == CPU_LOONGSON3)
+		else if (current_cpu_type() == CPU_LOONGSON64)
 			set_except_vector(EXCCODE_RI, handle_ri_rdhwr_tlbp);
 		else
 			set_except_vector(EXCCODE_RI, handle_ri_rdhwr);
diff --git a/arch/mips/lib/csum_partial.S b/arch/mips/lib/csum_partial.S
index 2ff84f4b1717..fda7b57b826e 100644
--- a/arch/mips/lib/csum_partial.S
+++ b/arch/mips/lib/csum_partial.S
@@ -279,7 +279,7 @@ EXPORT_SYMBOL(csum_partial)
 #endif
 
 	/* odd buffer alignment? */
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_LOONGSON3)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_LOONGSON64)
 	.set	push
 	.set	arch=mips32r2
 	wsbh	v1, sum
@@ -732,7 +732,7 @@ EXPORT_SYMBOL(csum_partial)
 	addu	sum, v1
 #endif
 
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_LOONGSON3)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_LOONGSON64)
 	.set	push
 	.set	arch=mips32r2
 	wsbh	v1, sum
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index 4c14a11525f4..d08b20ff2b27 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -79,7 +79,7 @@ config LOONGSON_MACH3X
 	select I8259
 	select IRQ_MIPS_CPU
 	select NR_CPUS_DEFAULT_4
-	select SYS_HAS_CPU_LOONGSON3
+	select SYS_HAS_CPU_LOONGSON64
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_SMP
 	select SYS_SUPPORTS_HOTPLUG_CPU
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 1a5df773707d..c74bc0251e9d 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -21,4 +21,4 @@ obj-$(CONFIG_LEMOTE_MACH2F)  += lemote-2f/
 # All Loongson-3 family machines
 #
 
-obj-$(CONFIG_CPU_LOONGSON3)  += loongson-3/
+obj-$(CONFIG_CPU_LOONGSON64)  += loongson-3/
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index c1a4d4dc4665..b4d2582eb1ef 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -3,7 +3,7 @@
 #
 
 # Only gcc >= 4.4 have Loongson specific support
-cflags-$(CONFIG_CPU_LOONGSON2)	+= -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2EF)	+= -Wa,--trap
 cflags-$(CONFIG_CPU_LOONGSON2E) += \
 	$(call cc-option,-march=loongson2e,-march=r4600)
 cflags-$(CONFIG_CPU_LOONGSON2F) += \
@@ -22,7 +22,7 @@ ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
   endif
 endif
 
-cflags-$(CONFIG_CPU_LOONGSON3)	+= -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
 
 #
 # Some versions of binutils, not currently mainline as of 2019/02/04, support
@@ -44,7 +44,7 @@ cflags-$(CONFIG_CPU_LOONGSON3)	+= -Wa,--trap
 # binutils does not merge support for the flag then we can revisit & remove
 # this later - for now it ensures vendor toolchains don't cause problems.
 #
-cflags-$(CONFIG_CPU_LOONGSON3)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+cflags-$(CONFIG_CPU_LOONGSON64)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 
 #
 # binutils from v2.25 on and gcc starting from v4.9.0 treat -march=loongson3a
@@ -55,14 +55,14 @@ cflags-$(CONFIG_CPU_LOONGSON3)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3
 #
 ifeq ($(call cc-ifversion, -ge, 0409, y), y)
   ifeq ($(call ld-ifversion, -ge, 225000000, y), y)
-    cflags-$(CONFIG_CPU_LOONGSON3)  += \
+    cflags-$(CONFIG_CPU_LOONGSON64)  += \
       $(call cc-option,-march=loongson3a -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
   else
-    cflags-$(CONFIG_CPU_LOONGSON3)  += \
+    cflags-$(CONFIG_CPU_LOONGSON64)  += \
       $(call cc-option,-march=mips64r2,-mips64r2 -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
   endif
 else
-    cflags-$(CONFIG_CPU_LOONGSON3)  += \
+    cflags-$(CONFIG_CPU_LOONGSON64)  += \
       $(call cc-option,-march=mips64r2,-mips64r2 -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
 endif
 
diff --git a/arch/mips/loongson64/common/pci.c b/arch/mips/loongson64/common/pci.c
index c47bb7bf3aa4..2d9755c49524 100644
--- a/arch/mips/loongson64/common/pci.c
+++ b/arch/mips/loongson64/common/pci.c
@@ -87,7 +87,7 @@ static int __init pcibios_init(void)
 #endif
 	register_pci_controller(&loongson_pci_controller);
 
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 	sbx00_acpi_init();
 #endif
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5166e38cd1c6..38ed99b605a4 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -320,7 +320,7 @@ static void r4k_blast_icache_page_setup(void)
 		r4k_blast_icache_page = (void *)cache_noop;
 	else if (ic_lsize == 16)
 		r4k_blast_icache_page = blast_icache16_page;
-	else if (ic_lsize == 32 && current_cpu_type() == CPU_LOONGSON2)
+	else if (ic_lsize == 32 && current_cpu_type() == CPU_LOONGSON2EF)
 		r4k_blast_icache_page = loongson2_blast_icache32_page;
 	else if (ic_lsize == 32)
 		r4k_blast_icache_page = blast_icache32_page;
@@ -369,7 +369,7 @@ static void r4k_blast_icache_page_indexed_setup(void)
 		else if (TX49XX_ICACHE_INDEX_INV_WAR)
 			r4k_blast_icache_page_indexed =
 				tx49_blast_icache32_page_indexed;
-		else if (current_cpu_type() == CPU_LOONGSON2)
+		else if (current_cpu_type() == CPU_LOONGSON2EF)
 			r4k_blast_icache_page_indexed =
 				loongson2_blast_icache32_page_indexed;
 		else
@@ -395,7 +395,7 @@ static void r4k_blast_icache_setup(void)
 			r4k_blast_icache = blast_r4600_v1_icache32;
 		else if (TX49XX_ICACHE_INDEX_INV_WAR)
 			r4k_blast_icache = tx49_blast_icache32;
-		else if (current_cpu_type() == CPU_LOONGSON2)
+		else if (current_cpu_type() == CPU_LOONGSON2EF)
 			r4k_blast_icache = loongson2_blast_icache32;
 		else
 			r4k_blast_icache = blast_icache32;
@@ -465,7 +465,7 @@ static void r4k_blast_scache_node_setup(void)
 {
 	unsigned long sc_lsize = cpu_scache_line_size();
 
-	if (current_cpu_type() != CPU_LOONGSON3)
+	if (current_cpu_type() != CPU_LOONGSON64)
 		r4k_blast_scache_node = (void *)cache_noop;
 	else if (sc_lsize == 16)
 		r4k_blast_scache_node = blast_scache16_node;
@@ -480,7 +480,7 @@ static void r4k_blast_scache_node_setup(void)
 static inline void local_r4k___flush_cache_all(void * args)
 {
 	switch (current_cpu_type()) {
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 	case CPU_R4000SC:
 	case CPU_R4000MC:
 	case CPU_R4400SC:
@@ -497,7 +497,7 @@ static inline void local_r4k___flush_cache_all(void * args)
 		r4k_blast_scache();
 		break;
 
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		/* Use get_ebase_cpunum() for both NUMA=y/n */
 		r4k_blast_scache_node(get_ebase_cpunum() >> 2);
 		break;
@@ -770,7 +770,7 @@ static inline void __local_r4k_flush_icache_range(unsigned long start,
 		r4k_blast_icache();
 	else {
 		switch (boot_cpu_type()) {
-		case CPU_LOONGSON2:
+		case CPU_LOONGSON2EF:
 			protected_loongson2_blast_icache_range(start, end);
 			break;
 
@@ -863,7 +863,7 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 	preempt_disable();
 	if (cpu_has_inclusive_pcaches) {
 		if (size >= scache_size) {
-			if (current_cpu_type() != CPU_LOONGSON3)
+			if (current_cpu_type() != CPU_LOONGSON64)
 				r4k_blast_scache();
 			else
 				r4k_blast_scache_node(pa_to_nid(addr));
@@ -904,7 +904,7 @@ static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 	preempt_disable();
 	if (cpu_has_inclusive_pcaches) {
 		if (size >= scache_size) {
-			if (current_cpu_type() != CPU_LOONGSON3)
+			if (current_cpu_type() != CPU_LOONGSON64)
 				r4k_blast_scache();
 			else
 				r4k_blast_scache_node(pa_to_nid(addr));
@@ -1226,7 +1226,7 @@ static void probe_pcache(void)
 		c->options |= MIPS_CPU_PREFETCH;
 		break;
 
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		icache_size = 1 << (12 + ((config & CONF_IC) >> 9));
 		c->icache.linesz = 16 << ((config & CONF_IB) >> 5);
 		if (prid & 0x3)
@@ -1244,7 +1244,7 @@ static void probe_pcache(void)
 		c->dcache.waybit = 0;
 		break;
 
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		config1 = read_c0_config1();
 		lsize = (config1 >> 19) & 7;
 		if (lsize)
@@ -1454,7 +1454,7 @@ static void probe_pcache(void)
 		c->dcache.flags &= ~MIPS_CACHE_ALIASES;
 		break;
 
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		/*
 		 * LOONGSON2 has 4 way icache, but when using indexed cache op,
 		 * one op will act on all 4 ways
@@ -1480,7 +1480,7 @@ static void probe_vcache(void)
 	struct cpuinfo_mips *c = &current_cpu_data;
 	unsigned int config2, lsize;
 
-	if (current_cpu_type() != CPU_LOONGSON3)
+	if (current_cpu_type() != CPU_LOONGSON64)
 		return;
 
 	config2 = read_c0_config2();
@@ -1655,11 +1655,11 @@ static void setup_scache(void)
 #endif
 		return;
 
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		loongson2_sc_init();
 		return;
 
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		loongson3_sc_init();
 		return;
 
@@ -1928,7 +1928,7 @@ void r4k_cache_init(void)
 		/* Optimization: an L2 flush implicitly flushes the L1 */
 		current_cpu_data.options |= MIPS_CPU_INCLUSIVE_CACHES;
 		break;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		/* Loongson-3 maintains cache coherency by hardware */
 		__flush_cache_all	= cache_noop;
 		__flush_cache_vmap	= cache_noop;
diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index 56e4f8bffd4c..c5578897a4fa 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -187,7 +187,7 @@ static void set_prefetch_parameters(void)
 			}
 			break;
 
-		case CPU_LOONGSON3:
+		case CPU_LOONGSON64:
 			/* Loongson-3 only support the Pref_Load/Pref_Store. */
 			pref_bias_clear_store = 128;
 			pref_bias_copy_load = 128;
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index c13e46ced425..83b450ddbbc2 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -35,10 +35,10 @@ extern void build_tlb_refill_handler(void);
 static inline void flush_micro_tlb(void)
 {
 	switch (current_cpu_type()) {
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		write_c0_diag(LOONGSON_DIAG_ITLB);
 		break;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		write_c0_diag(LOONGSON_DIAG_ITLB | LOONGSON_DIAG_DTLB);
 		break;
 	default:
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 144ceb0fba88..05e64217842e 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -572,8 +572,8 @@ void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 	case CPU_BMIPS4350:
 	case CPU_BMIPS4380:
 	case CPU_BMIPS5000:
-	case CPU_LOONGSON2:
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON2EF:
+	case CPU_LOONGSON64:
 	case CPU_R5500:
 		if (m4kc_tlbp_war())
 			uasm_i_nop(p);
@@ -1372,7 +1372,7 @@ static void build_r4000_tlb_refill_handler(void)
 	switch (boot_cpu_type()) {
 	default:
 		if (sizeof(long) == 4) {
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		/* Loongson2 ebase is different than r4k, we have more space */
 			if ((p - tlb_handler) > 64)
 				panic("TLB refill handler space exceeded");
diff --git a/arch/mips/oprofile/Makefile b/arch/mips/oprofile/Makefile
index 011cf9f891e7..e10f216d0422 100644
--- a/arch/mips/oprofile/Makefile
+++ b/arch/mips/oprofile/Makefile
@@ -14,5 +14,5 @@ oprofile-$(CONFIG_CPU_MIPS64)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_R10000)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_SB1)		+= op_model_mipsxx.o
 oprofile-$(CONFIG_CPU_XLR)		+= op_model_mipsxx.o
-oprofile-$(CONFIG_CPU_LOONGSON2)	+= op_model_loongson2.o
-oprofile-$(CONFIG_CPU_LOONGSON3)	+= op_model_loongson3.o
+oprofile-$(CONFIG_CPU_LOONGSON2EF)	+= op_model_loongson2.o
+oprofile-$(CONFIG_CPU_LOONGSON64)	+= op_model_loongson3.o
diff --git a/arch/mips/oprofile/common.c b/arch/mips/oprofile/common.c
index 2f33992f6dff..25cfa70f0ae4 100644
--- a/arch/mips/oprofile/common.c
+++ b/arch/mips/oprofile/common.c
@@ -104,10 +104,10 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
 		lmodel = &op_model_mipsxx_ops;
 		break;
 
-	case CPU_LOONGSON2:
+	case CPU_LOONGSON2EF:
 		lmodel = &op_model_loongson2_ops;
 		break;
-	case CPU_LOONGSON3:
+	case CPU_LOONGSON64:
 		lmodel = &op_model_loongson3_ops;
 		break;
 	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bb13c266c329..6ed3f380a45e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -298,7 +298,7 @@ config GPIO_IXP4XX
 
 config GPIO_LOONGSON
 	bool "Loongson-2/3 GPIO support"
-	depends on CPU_LOONGSON2 || CPU_LOONGSON3
+	depends on CPU_LOONGSON2EF || CPU_LOONGSON64
 	help
 	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
 
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index 00943170ce36..a42145873cc9 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -22,7 +22,7 @@
 #define STLS2F_N_GPIO		4
 #define STLS3A_N_GPIO		16
 
-#ifdef CONFIG_CPU_LOONGSON3
+#ifdef CONFIG_CPU_LOONGSON64
 #define LOONGSON_N_GPIO	STLS3A_N_GPIO
 #else
 #define LOONGSON_N_GPIO	STLS2F_N_GPIO
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index 987ff16b9420..e9ad4863d915 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -45,7 +45,7 @@ static inline bool drm_arch_can_wc_memory(void)
 {
 #if defined(CONFIG_PPC) && !defined(CONFIG_NOT_COHERENT_CACHE)
 	return false;
-#elif defined(CONFIG_MIPS) && defined(CONFIG_CPU_LOONGSON3)
+#elif defined(CONFIG_MIPS) && defined(CONFIG_CPU_LOONGSON64)
 	return false;
 #elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 	/*
-- 
2.22.0

