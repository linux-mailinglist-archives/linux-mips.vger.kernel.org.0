Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC35D135F
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 17:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbfJIP7o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 11:59:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:42998 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730256AbfJIP7o (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 11:59:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7BF7BAC37;
        Wed,  9 Oct 2019 15:59:35 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: add support for SGI Octane (IP30)
Date:   Wed,  9 Oct 2019 17:59:27 +0200
Message-Id: <20191009155928.3047-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This changeset adds support for SGI Octane/Octane2 workstations.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kbuild.platforms                         |   1 +
 arch/mips/Kconfig                                  |  27 ++
 .../include/asm/mach-ip30/cpu-feature-overrides.h  |  83 ++++++
 arch/mips/include/asm/mach-ip30/irq.h              |  87 ++++++
 .../mips/include/asm/mach-ip30/kernel-entry-init.h |  13 +
 arch/mips/include/asm/mach-ip30/mangle-port.h      |  22 ++
 arch/mips/include/asm/mach-ip30/spaces.h           |  20 ++
 arch/mips/include/asm/mach-ip30/war.h              |  26 ++
 arch/mips/include/asm/sgi/heart.h                  | 272 +++++++++++++++++
 arch/mips/sgi-ip30/Makefile                        |  10 +
 arch/mips/sgi-ip30/Platform                        |   8 +
 arch/mips/sgi-ip30/ip30-console.c                  |  23 ++
 arch/mips/sgi-ip30/ip30-irq.c                      | 328 +++++++++++++++++++++
 arch/mips/sgi-ip30/ip30-pci.c                      |  19 ++
 arch/mips/sgi-ip30/ip30-power.c                    |  41 +++
 arch/mips/sgi-ip30/ip30-setup.c                    | 138 +++++++++
 arch/mips/sgi-ip30/ip30-smp.c                      | 149 ++++++++++
 arch/mips/sgi-ip30/ip30-timer.c                    |  63 ++++
 arch/mips/sgi-ip30/ip30-xtalk.c                    | 152 ++++++++++
 19 files changed, 1482 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
 create mode 100644 arch/mips/include/asm/mach-ip30/irq.h
 create mode 100644 arch/mips/include/asm/mach-ip30/kernel-entry-init.h
 create mode 100644 arch/mips/include/asm/mach-ip30/mangle-port.h
 create mode 100644 arch/mips/include/asm/mach-ip30/spaces.h
 create mode 100644 arch/mips/include/asm/mach-ip30/war.h
 create mode 100644 arch/mips/include/asm/sgi/heart.h
 create mode 100644 arch/mips/sgi-ip30/Makefile
 create mode 100644 arch/mips/sgi-ip30/Platform
 create mode 100644 arch/mips/sgi-ip30/ip30-console.c
 create mode 100644 arch/mips/sgi-ip30/ip30-irq.c
 create mode 100644 arch/mips/sgi-ip30/ip30-pci.c
 create mode 100644 arch/mips/sgi-ip30/ip30-power.c
 create mode 100644 arch/mips/sgi-ip30/ip30-setup.c
 create mode 100644 arch/mips/sgi-ip30/ip30-smp.c
 create mode 100644 arch/mips/sgi-ip30/ip30-timer.c
 create mode 100644 arch/mips/sgi-ip30/ip30-xtalk.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 0de839882106..17413b2d5fd3 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -30,6 +30,7 @@ platforms += ralink
 platforms += rb532
 platforms += sgi-ip22
 platforms += sgi-ip27
+platforms += sgi-ip30
 platforms += sgi-ip32
 platforms += sibyte
 platforms += sni
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4d403be641bb..2ef3129cc4ad 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -727,6 +727,33 @@ config SGI_IP28
 	  This is the SGI Indigo2 with R10000 processor.  To compile a Linux
 	  kernel that runs on these, say Y here.
 
+config SGI_IP30
+	bool "SGI IP30 (Octane/Octane2)"
+	select ARCH_HAS_PHYS_TO_DMA
+	select FW_ARC
+	select FW_ARC64
+	select BOOT_ELF64
+	select CEVT_R4K
+	select CSRC_R4K
+	select SYNC_R4K if SMP
+	select ZONE_DMA32
+	select HAVE_PCI
+	select IRQ_MIPS_CPU
+	select IRQ_DOMAIN_HIERARCHY
+	select NR_CPUS_DEFAULT_2
+	select PCI_DRIVERS_GENERIC
+	select PCI_XTALK_BRIDGE
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_CPU_R10000
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_SUPPORTS_SMP
+	select MIPS_L1_CACHE_SHIFT_7
+	select ARC_MEMORY
+	help
+	  These are the SGI Octane and Octane2 graphics workstations.  To
+	  compile a Linux kernel that runs on these, say Y here.
+
 config SGI_IP32
 	bool "SGI IP32 (O2)"
 	select ARC_MEMORY
diff --git a/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
new file mode 100644
index 000000000000..cfa02f3d25df
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IP30/Octane cpu-features overrides.
+ *
+ * Copyright (C) 2003 Ralf Baechle <ralf@linux-mips.org>
+ *		 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ *		 2009 Johannes Dickgreber <tanzy@gmx.de>
+ *		 2015 Joshua Kinard <kumba@gentoo.org>
+ *
+ */
+#ifndef __ASM_MACH_IP30_CPU_FEATURE_OVERRIDES_H
+#define __ASM_MACH_IP30_CPU_FEATURE_OVERRIDES_H
+
+#include <asm/cpu.h>
+
+/*
+ * IP30 only supports R1[024]000 processors, all using the same config
+ */
+#define cpu_has_tlb			1
+#define cpu_has_tlbinv			0
+#define cpu_has_segments		0
+#define cpu_has_eva			0
+#define cpu_has_htw			0
+#define cpu_has_rixiex			0
+#define cpu_has_maar			0
+#define cpu_has_rw_llb			0
+#define cpu_has_3kex			0
+#define cpu_has_4kex			1
+#define cpu_has_3k_cache		0
+#define cpu_has_4k_cache		1
+#define cpu_has_6k_cache		0
+#define cpu_has_8k_cache		0
+#define cpu_has_tx39_cache		0
+#define cpu_has_fpu			1
+#define cpu_has_nofpuex			0
+#define cpu_has_32fpr			1
+#define cpu_has_counter			1
+#define cpu_has_watch			1
+#define cpu_has_64bits			1
+#define cpu_has_divec			0
+#define cpu_has_vce			0
+#define cpu_has_cache_cdex_p		0
+#define cpu_has_cache_cdex_s		0
+#define cpu_has_prefetch		1
+#define cpu_has_mcheck			0
+#define cpu_has_ejtag			0
+#define cpu_has_llsc			1
+#define cpu_has_mips16			0
+#define cpu_has_mdmx			0
+#define cpu_has_mips3d			0
+#define cpu_has_smartmips		0
+#define cpu_has_rixi			0
+#define cpu_has_xpa			0
+#define cpu_has_vtag_icache		0
+#define cpu_has_dc_aliases		0
+#define cpu_has_ic_fills_f_dc		0
+
+#define cpu_icache_snoops_remote_store	1
+
+#define cpu_has_mips32r1		0
+#define cpu_has_mips32r2		0
+#define cpu_has_mips64r1		0
+#define cpu_has_mips64r2		0
+#define cpu_has_mips32r6		0
+#define cpu_has_mips64r6		0
+
+#define cpu_has_dsp			0
+#define cpu_has_dsp2			0
+#define cpu_has_mipsmt			0
+#define cpu_has_userlocal		0
+#define cpu_has_inclusive_pcaches	1
+#define cpu_hwrena_impl_bits		0
+#define cpu_has_perf_cntr_intr_bit	0
+#define cpu_has_vz			0
+#define cpu_has_fre			0
+#define cpu_has_cdmm			0
+
+#define cpu_dcache_line_size()		32
+#define cpu_icache_line_size()		64
+#define cpu_scache_line_size()		128
+
+#endif /* __ASM_MACH_IP30_CPU_FEATURE_OVERRIDES_H */
+
diff --git a/arch/mips/include/asm/mach-ip30/irq.h b/arch/mips/include/asm/mach-ip30/irq.h
new file mode 100644
index 000000000000..e5c3dd965266
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip30/irq.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * HEART IRQ defines
+ *
+ * Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
+ *		 2014-2016 Joshua Kinard <kumba@gentoo.org>
+ *
+ */
+
+#ifndef __ASM_MACH_IP30_IRQ_H
+#define __ASM_MACH_IP30_IRQ_H
+
+/*
+ * HEART has 64 hardware interrupts, but use 128 to leave room for a few
+ * software interrupts as well (such as the CPU timer interrupt.
+ */
+#define NR_IRQS				128
+
+extern void __init ip30_install_ipi(void);
+
+/*
+ * HEART has 64 interrupt vectors available to it, subdivided into five
+ * priority levels.  They are numbered 0 to 63.
+ */
+#define HEART_NUM_IRQS			64
+
+/*
+ * These are the five interrupt priority levels and their corresponding
+ * CPU IPx interrupt pins.
+ *
+ * Level 4 - Error Interrupts.
+ * Level 3 - HEART timer interrupt.
+ * Level 2 - CPU IPI, CPU debug, power putton, general device interrupts.
+ * Level 1 - General device interrupts.
+ * Level 0 - General device GFX flow control interrupts.
+ */
+#define HEART_L4_INT_MASK		0xfff8000000000000ULL	/* IP6 */
+#define HEART_L3_INT_MASK		0x0004000000000000ULL	/* IP5 */
+#define HEART_L2_INT_MASK		0x0003ffff00000000ULL	/* IP4 */
+#define HEART_L1_INT_MASK		0x00000000ffff0000ULL	/* IP3 */
+#define HEART_L0_INT_MASK		0x000000000000ffffULL	/* IP2 */
+
+/* HEART L0 Interrupts (Low Priority) */
+#define HEART_L0_INT_GENERIC		 0
+#define HEART_L0_INT_FLOW_CTRL_HWTR_0	 1
+#define HEART_L0_INT_FLOW_CTRL_HWTR_1	 2
+
+/* HEART L2 Interrupts (High Priority) */
+#define HEART_L2_INT_RESCHED_CPU_0	46
+#define HEART_L2_INT_RESCHED_CPU_1	47
+#define HEART_L2_INT_CALL_CPU_0		48
+#define HEART_L2_INT_CALL_CPU_1		49
+
+/* HEART L3 Interrupts (Compare/Counter Timer) */
+#define HEART_L3_INT_TIMER		50
+
+/* HEART L4 Interrupts (Errors) */
+#define HEART_L4_INT_XWID_ERR_9		51
+#define HEART_L4_INT_XWID_ERR_A		52
+#define HEART_L4_INT_XWID_ERR_B		53
+#define HEART_L4_INT_XWID_ERR_C		54
+#define HEART_L4_INT_XWID_ERR_D		55
+#define HEART_L4_INT_XWID_ERR_E		56
+#define HEART_L4_INT_XWID_ERR_F		57
+#define HEART_L4_INT_XWID_ERR_XBOW	58
+#define HEART_L4_INT_CPU_BUS_ERR_0	59
+#define HEART_L4_INT_CPU_BUS_ERR_1	60
+#define HEART_L4_INT_CPU_BUS_ERR_2	61
+#define HEART_L4_INT_CPU_BUS_ERR_3	62
+#define HEART_L4_INT_HEART_EXCP		63
+
+/*
+ * Power Switch is wired via BaseIO BRIDGE slot #6.
+ *
+ * ACFail is wired via BaseIO BRIDGE slot #7.
+ */
+#define IP30_POWER_IRQ		HEART_L2_INT_POWER_BTN
+
+#include_next <irq.h>
+
+#define IP30_HEART_L0_IRQ	(MIPS_CPU_IRQ_BASE + 2)
+#define IP30_HEART_L1_IRQ	(MIPS_CPU_IRQ_BASE + 3)
+#define IP30_HEART_L2_IRQ	(MIPS_CPU_IRQ_BASE + 4)
+#define IP30_HEART_TIMER_IRQ	(MIPS_CPU_IRQ_BASE + 5)
+#define IP30_HEART_ERR_IRQ	(MIPS_CPU_IRQ_BASE + 6)
+
+#endif /* __ASM_MACH_IP30_IRQ_H */
diff --git a/arch/mips/include/asm/mach-ip30/kernel-entry-init.h b/arch/mips/include/asm/mach-ip30/kernel-entry-init.h
new file mode 100644
index 000000000000..be0472c977d8
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip30/kernel-entry-init.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_MACH_IP30_KERNEL_ENTRY_H
+#define __ASM_MACH_IP30_KERNEL_ENTRY_H
+
+	.macro  kernel_entry_setup
+	.endm
+
+	.macro	smp_slave_setup
+	move	gp, a0
+	.endm
+
+#endif /* __ASM_MACH_IP30_KERNEL_ENTRY_H */
diff --git a/arch/mips/include/asm/mach-ip30/mangle-port.h b/arch/mips/include/asm/mach-ip30/mangle-port.h
new file mode 100644
index 000000000000..f3e1262a2d5e
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip30/mangle-port.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2003, 2004 Ralf Baechle
+ */
+#ifndef __ASM_MACH_IP30_MANGLE_PORT_H
+#define __ASM_MACH_IP30_MANGLE_PORT_H
+
+#define __swizzle_addr_b(port)	((port)^3)
+#define __swizzle_addr_w(port)	((port)^2)
+#define __swizzle_addr_l(port)	(port)
+#define __swizzle_addr_q(port)	(port)
+
+#define ioswabb(a, x)		(x)
+#define __mem_ioswabb(a, x)	(x)
+#define ioswabw(a, x)		(x)
+#define __mem_ioswabw(a, x)	cpu_to_le16(x)
+#define ioswabl(a, x)		(x)
+#define __mem_ioswabl(a, x)	cpu_to_le32(x)
+#define ioswabq(a, x)		(x)
+#define __mem_ioswabq(a, x)	cpu_to_le64(x)
+
+#endif /* __ASM_MACH_IP30_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/mach-ip30/spaces.h b/arch/mips/include/asm/mach-ip30/spaces.h
new file mode 100644
index 000000000000..c8a302dfbe05
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip30/spaces.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2016 Joshua Kinard <kumba@gentoo.org>
+ *
+ */
+#ifndef _ASM_MACH_IP30_SPACES_H
+#define _ASM_MACH_IP30_SPACES_H
+
+/*
+ * Memory in IP30/Octane is offset 512MB in the physical address space.
+ */
+#define PHYS_OFFSET	_AC(0x20000000, UL)
+
+#ifdef CONFIG_64BIT
+#define CAC_BASE	_AC(0xA800000000000000, UL)
+#endif
+
+#include <asm/mach-generic/spaces.h>
+
+#endif /* _ASM_MACH_IP30_SPACES_H */
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
new file mode 100644
index 000000000000..a98ba204f183
--- /dev/null
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2002, 2004, 2007 by Ralf Baechle <ralf@linux-mips.org>
+ */
+#ifndef __ASM_MIPS_MACH_IP30_WAR_H
+#define __ASM_MIPS_MACH_IP30_WAR_H
+
+#define R4600_V1_INDEX_ICACHEOP_WAR	0
+#define R4600_V1_HIT_CACHEOP_WAR	0
+#define R4600_V2_HIT_CACHEOP_WAR	0
+#define MIPS_CACHE_SYNC_WAR		0
+#define BCM1250_M3_WAR			0
+#define SIBYTE_1956_WAR			0
+#define MIPS4K_ICACHE_REFILL_WAR	0
+#define MIPS34K_MISSED_ITLB_WAR		0
+#define R5432_CP0_INTERRUPT_WAR		0
+#define TX49XX_ICACHE_INDEX_INV_WAR	0
+#define ICACHE_REFILLS_WORKAROUND_WAR	0
+
+#ifdef CONFIG_CPU_R10000
+#define R10000_LLSC_WAR			1
+#else
+#define R10000_LLSC_WAR			0
+#endif
+
+#endif /* __ASM_MIPS_MACH_IP30_WAR_H */
diff --git a/arch/mips/include/asm/sgi/heart.h b/arch/mips/include/asm/sgi/heart.h
new file mode 100644
index 000000000000..c423221b4792
--- /dev/null
+++ b/arch/mips/include/asm/sgi/heart.h
@@ -0,0 +1,272 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * HEART chip definitions
+ *
+ * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ *		 2009 Johannes Dickgreber <tanzy@gmx.de>
+ *		 2007-2015 Joshua Kinard <kumba@gentoo.org>
+ */
+#ifndef __ASM_SGI_HEART_H
+#define __ASM_SGI_HEART_H
+
+#include <linux/types.h>
+#include <linux/time.h>
+
+/*
+ * There are 8 DIMM slots on an IP30 system
+ * board, which are grouped into four banks
+ */
+#define HEART_MEMORY_BANKS	4
+
+/* HEART can support up to four CPUs */
+#define HEART_MAX_CPUS		4
+
+#define HEART_XKPHYS_BASE	((void *)(IO_BASE | 0x000000000ff00000ULL))
+
+/**
+ * struct ip30_heart_regs - struct that maps IP30 HEART registers.
+ * @mode: HEART_MODE - Purpose Unknown, machine reset called from here.
+ * @sdram_mode: HEART_SDRAM_MODE - purpose unknown.
+ * @mem_refresh: HEART_MEM_REF - purpose unknown.
+ * @mem_req_arb: HEART_MEM_REQ_ARB - purpose unknown.
+ * @mem_cfg.q: union for 64bit access to HEART_MEMCFG - 4x 64bit registers.
+ * @mem_cfg.l: union for 32bit access to HEART_MEMCFG - 8x 32bit registers.
+ * @fc_mode: HEART_FC_MODE - Purpose Unknown, possibly for GFX flow control.
+ * @fc_timer_limit: HEART_FC_TIMER_LIMIT - purpose unknown.
+ * @fc_addr: HEART_FC0_ADDR, HEART_FC1_ADDR - purpose unknown.
+ * @fc_credit_cnt: HEART_FC0_CR_CNT, HEART_FC1_CR_CNT - purpose unknown.
+ * @fc_timer: HEART_FC0_TIMER, HEART_FC1_TIMER - purpose unknown.
+ * @status: HEART_STATUS - HEART status information.
+ * @bus_err_addr: HEART_BERR_ADDR - likely contains addr of recent SIGBUS.
+ * @bus_err_misc: HEART_BERR_MISC - purpose unknown.
+ * @mem_err_addr: HEART_MEMERR_ADDR - likely contains addr of recent mem err.
+ * @mem_err_data: HEART_MEMERR_DATA - purpose unknown.
+ * @piur_acc_err: HEART_PIUR_ACC_ERR - likely for access err to HEART regs.
+ * @mlan_clock_div: HEART_MLAN_CLK_DIV - MicroLAN clock divider.
+ * @mlan_ctrl: HEART_MLAN_CTL - MicroLAN control.
+ * @__pad0: 0x0f40 bytes of padding -> next HEART register 0x01000.
+ * @undefined: Undefined/diag register, write to it triggers PIUR_ACC_ERR.
+ * @__pad1: 0xeff8 bytes of padding -> next HEART register 0x10000.
+ * @imr: HEART_IMR0 to HEART_IMR3 - per-cpu interrupt mask register.
+ * @set_isr: HEART_SET_ISR - set interrupt status register.
+ * @clear_isr: HEART_CLR_ISR - clear interrupt status register.
+ * @isr: HEART_ISR - interrupt status register (read-only).
+ * @imsr: HEART_IMSR - purpose unknown.
+ * @cause: HEART_CAUSE - HEART cause information.
+ * @__pad2: 0xffb8 bytes of padding -> next HEART register 0x20000.
+ * @count: HEART_COUNT - 52-bit counter.
+ * @__pad3: 0xfff8 bytes of padding -> next HEART register 0x30000.
+ * @compare: HEART_COMPARE - 24-bit compare.
+ * @__pad4: 0xfff8 bytes of padding -> next HEART register 0x40000.
+ * @trigger: HEART_TRIGGER - purpose unknown.
+ * @__pad5: 0xfff8 bytes of padding -> next HEART register 0x50000.
+ * @cpuid: HEART_PRID - contains CPU ID of CPU currently accessing HEART.
+ * @__pad6: 0xfff8 bytes of padding -> next HEART register 0x60000.
+ * @sync: HEART_SYNC - purpose unknown.
+ *
+ * HEART is the main system controller ASIC for IP30 system.  It incorporates
+ * a memory controller, interrupt status/cause/set/clear management, basic
+ * timer with count/compare, and other functionality.  For Linux, not all of
+ * HEART's functions are fully understood.
+ *
+ * Implementation note: All HEART registers are 64bits-wide, but the mem_cfg
+ * register only reports correct values if queried in 32bits.  Hence the need
+ * for a union.  Even though mem_cfg.l has 8 array slots, we only ever query
+ * up to 4 of those.  IP30 has 8 DIMM slots arranged into 4 banks, w/ 2 DIMMs
+ * per bank.  Each 32bit read accesses one of these banks.  Perhaps HEART was
+ * designed to address up to 8 banks (16 DIMMs)?  We may never know.
+ */
+struct ip30_heart_regs {		/* 0x0ff00000 */
+	u64 mode;			/* +  0x00000 */
+	/* Memory */
+	u64 sdram_mode;			/* +  0x00008 */
+	u64 mem_refresh;		/* +  0x00010 */
+	u64 mem_req_arb;		/* +  0x00018 */
+	union {
+		u64 q[HEART_MEMORY_BANKS];	/* readq() */
+		u32 l[HEART_MEMORY_BANKS * 2];	/* readl() */
+	} mem_cfg;			/* +  0x00020 */
+	/* Flow control (gfx?) */
+	u64 fc_mode;			/* +  0x00040 */
+	u64 fc_timer_limit;		/* +  0x00048 */
+	u64 fc_addr[2];			/* +  0x00050 */
+	u64 fc_credit_cnt[2];		/* +  0x00060 */
+	u64 fc_timer[2];		/* +  0x00070 */
+	/* Status */
+	u64 status;			/* +  0x00080 */
+	/* Bus error */
+	u64 bus_err_addr;		/* +  0x00088 */
+	u64 bus_err_misc;		/* +  0x00090 */
+	/* Memory error */
+	u64 mem_err_addr;		/* +  0x00098 */
+	u64 mem_err_data;		/* +  0x000a0 */
+	/* Misc */
+	u64 piur_acc_err;		/* +  0x000a8 */
+	u64 mlan_clock_div;		/* +  0x000b0 */
+	u64 mlan_ctrl;			/* +  0x000b8 */
+	u64 __pad0[0x01e8];		/* +  0x000c0 + 0x0f40 */
+	/* Undefined */
+	u64 undefined;			/* +  0x01000 */
+	u64 __pad1[0x1dff];		/* +  0x01008 + 0xeff8 */
+	/* Interrupts */
+	u64 imr[HEART_MAX_CPUS];	/* +  0x10000 */
+	u64 set_isr;			/* +  0x10020 */
+	u64 clear_isr;			/* +  0x10028 */
+	u64 isr;			/* +  0x10030 */
+	u64 imsr;			/* +  0x10038 */
+	u64 cause;			/* +  0x10040 */
+	u64 __pad2[0x1ff7];		/* +  0x10048 + 0xffb8 */
+	/* Timer */
+	u64 count;			/* +  0x20000 */
+	u64 __pad3[0x1fff];		/* +  0x20008 + 0xfff8 */
+	u64 compare;			/* +  0x30000 */
+	u64 __pad4[0x1fff];		/* +  0x30008 + 0xfff8 */
+	u64 trigger;			/* +  0x40000 */
+	u64 __pad5[0x1fff];		/* +  0x40008 + 0xfff8 */
+	/* Misc */
+	u64 cpuid;			/* +  0x50000 */
+	u64 __pad6[0x1fff];		/* +  0x50008 + 0xfff8 */
+	u64 sync;			/* +  0x60000 */
+};
+
+
+/* For timer-related bits. */
+#define HEART_NS_PER_CYCLE	80
+#define HEART_CYCLES_PER_SEC	(NSEC_PER_SEC / HEART_NS_PER_CYCLE)
+
+
+/*
+ * XXX: Everything below this comment will either go away or be cleaned
+ *      up to fit in better with Linux.  A lot of the bit definitions for
+ *      HEART were derived from IRIX's sys/RACER/heart.h header file.
+ */
+
+/* HEART Masks */
+#define HEART_ATK_MASK		0x0007ffffffffffff	/* HEART attack mask */
+#define HEART_ACK_ALL_MASK	0xffffffffffffffff	/* Ack everything */
+#define HEART_CLR_ALL_MASK	0x0000000000000000	/* Clear all */
+#define HEART_BR_ERR_MASK	0x7ff8000000000000	/* BRIDGE error mask */
+#define HEART_CPU0_ERR_MASK	0x8ff8000000000000	/* CPU0 error mask */
+#define HEART_CPU1_ERR_MASK	0x97f8000000000000	/* CPU1 error mask */
+#define HEART_CPU2_ERR_MASK	0xa7f8000000000000	/* CPU2 error mask */
+#define HEART_CPU3_ERR_MASK	0xc7f8000000000000	/* CPU3 error mask */
+#define HEART_ERR_MASK		0x1ff			/* HEART error mask */
+#define HEART_ERR_MASK_START	51			/* HEART error start */
+#define HEART_ERR_MASK_END	63			/* HEART error end */
+
+/* Bits in the HEART_MODE register. */
+#define HM_PROC_DISABLE_SHFT		60
+#define HM_PROC_DISABLE_MSK		(0xfUL << HM_PROC_DISABLE_SHFT)
+#define HM_PROC_DISABLE(x)		(0x1UL << (x) + HM_PROC_DISABLE_SHFT)
+#define HM_MAX_PSR			(0x7UL << 57)
+#define HM_MAX_IOSR			(0x7UL << 54)
+#define HM_MAX_PEND_IOSR		(0x7UL << 51)
+#define HM_TRIG_SRC_SEL_MSK		(0x7UL << 48)
+#define HM_TRIG_HEART_EXC		(0x0UL << 48)
+#define HM_TRIG_REG_BIT			(0x1UL << 48)
+#define HM_TRIG_SYSCLK			(0x2UL << 48)
+#define HM_TRIG_MEMCLK_2X		(0x3UL << 48)
+#define HM_TRIG_MEMCLK			(0x4UL << 48)
+#define HM_TRIG_IOCLK			(0x5UL << 48)
+#define HM_PIU_TEST_MODE		(0xfUL << 40)
+#define HM_GP_FLAG_MSK			(0xfUL << 36)
+#define HM_GP_FLAG(x)			BIT((x) + 36)
+#define HM_MAX_PROC_HYST		(0xfUL << 32)
+#define HM_LLP_WRST_AFTER_RST		BIT(28)
+#define HM_LLP_LINK_RST			BIT(27)
+#define HM_LLP_WARM_RST			BIT(26)
+#define HM_COR_ECC_LCK			BIT(25)
+#define HM_REDUCED_PWR			BIT(24)
+#define HM_COLD_RST			BIT(23)
+#define HM_SW_RST			BIT(22)
+#define HM_MEM_FORCE_WR			BIT(21)
+#define HM_DB_ERR_GEN			BIT(20)
+#define HM_SB_ERR_GEN			BIT(19)
+#define HM_CACHED_PIO_EN		BIT(18)
+#define HM_CACHED_PROM_EN		BIT(17)
+#define HM_PE_SYS_COR_ERE		BIT(16)
+#define HM_GLOBAL_ECC_EN		BIT(15)
+#define HM_IO_COH_EN			BIT(14)
+#define HM_INT_EN			BIT(13)
+#define HM_DATA_CHK_EN			BIT(12)
+#define HM_REF_EN			BIT(11)
+#define HM_BAD_SYSWR_ERE		BIT(10)
+#define HM_BAD_SYSRD_ERE		BIT(9)
+#define HM_SYSSTATE_ERE			BIT(8)
+#define HM_SYSCMD_ERE			BIT(7)
+#define HM_NCOR_SYS_ERE			BIT(6)
+#define HM_COR_SYS_ERE			BIT(5)
+#define HM_DATA_ELMNT_ERE		BIT(4)
+#define HM_MEM_ADDR_PROC_ERE		BIT(3)
+#define HM_MEM_ADDR_IO_ERE		BIT(2)
+#define HM_NCOR_MEM_ERE			BIT(1)
+#define HM_COR_MEM_ERE			BIT(0)
+
+/* Bits in the HEART_MEM_REF register. */
+#define HEART_MEMREF_REFS(x)		((0xfUL & (x)) << 16)
+#define HEART_MEMREF_PERIOD(x)		((0xffffUL & (x)))
+#define HEART_MEMREF_REFS_VAL		HEART_MEMREF_REFS(8)
+#define HEART_MEMREF_PERIOD_VAL		HEART_MEMREF_PERIOD(0x4000)
+#define HEART_MEMREF_VAL		(HEART_MEMREF_REFS_VAL | \
+					 HEART_MEMREF_PERIOD_VAL)
+
+/* Bits in the HEART_MEM_REQ_ARB register. */
+#define HEART_MEMARB_IODIS		(1  << 20)
+#define HEART_MEMARB_MAXPMWRQS		(15 << 16)
+#define HEART_MEMARB_MAXPMRRQS		(15 << 12)
+#define HEART_MEMARB_MAXPMRQS		(15 << 8)
+#define HEART_MEMARB_MAXRRRQS		(15 << 4)
+#define HEART_MEMARB_MAXGBRRQS		(15)
+
+/* Bits in the HEART_MEMCFG<x> registers. */
+#define HEART_MEMCFG_VALID		0x80000000	/* Bank is valid */
+#define HEART_MEMCFG_DENSITY		0x01c00000	/* Mem density */
+#define HEART_MEMCFG_SIZE_MASK		0x003f0000	/* Mem size mask */
+#define HEART_MEMCFG_ADDR_MASK		0x000001ff	/* Base addr mask */
+#define HEART_MEMCFG_SIZE_SHIFT		16		/* Mem size shift */
+#define HEART_MEMCFG_DENSITY_SHIFT	22		/* Density Shift */
+#define HEART_MEMCFG_UNIT_SHIFT		25		/* Unit Shift, 32MB */
+
+/* Bits in the HEART_STATUS register */
+#define HEART_STAT_HSTL_SDRV		BIT(14)
+#define HEART_STAT_FC_CR_OUT(x)		BIT((x) + 12)
+#define HEART_STAT_DIR_CNNCT		BIT(11)
+#define HEART_STAT_TRITON		BIT(10)
+#define HEART_STAT_R4K			BIT(9)
+#define HEART_STAT_BIG_ENDIAN		BIT(8)
+#define HEART_STAT_PROC_SHFT		4
+#define HEART_STAT_PROC_MSK		(0xfUL << HEART_STAT_PROC_SHFT)
+#define HEART_STAT_PROC_ACTIVE(x)	(0x1UL << ((x) + HEART_STAT_PROC_SHFT))
+#define HEART_STAT_WIDGET_ID		0xf
+
+/* Bits in the HEART_CAUSE register */
+#define HC_PE_SYS_COR_ERR_MSK		(0xfUL << 60)
+#define HC_PE_SYS_COR_ERR(x)		BIT((x) + 60)
+#define HC_PIOWDB_OFLOW			BIT(44)
+#define HC_PIORWRB_OFLOW		BIT(43)
+#define HC_PIUR_ACC_ERR			BIT(42)
+#define HC_BAD_SYSWR_ERR		BIT(41)
+#define HC_BAD_SYSRD_ERR		BIT(40)
+#define HC_SYSSTATE_ERR_MSK		(0xfUL << 36)
+#define HC_SYSSTATE_ERR(x)		BIT((x) + 36)
+#define HC_SYSCMD_ERR_MSK		(0xfUL << 32)
+#define HC_SYSCMD_ERR(x)		BIT((x) + 32)
+#define HC_NCOR_SYSAD_ERR_MSK		(0xfUL << 28)
+#define HC_NCOR_SYSAD_ERR(x)		BIT((x) + 28)
+#define HC_COR_SYSAD_ERR_MSK		(0xfUL << 24)
+#define HC_COR_SYSAD_ERR(x)		BIT((x) + 24)
+#define HC_DATA_ELMNT_ERR_MSK		(0xfUL << 20)
+#define HC_DATA_ELMNT_ERR(x)		BIT((x) + 20)
+#define HC_WIDGET_ERR			BIT(16)
+#define HC_MEM_ADDR_ERR_PROC_MSK	(0xfUL << 4)
+#define HC_MEM_ADDR_ERR_PROC(x)	BIT((x) + 4)
+#define HC_MEM_ADDR_ERR_IO		BIT(2)
+#define HC_NCOR_MEM_ERR			BIT(1)
+#define HC_COR_MEM_ERR			BIT(0)
+
+extern struct ip30_heart_regs __iomem *heart_regs;
+
+#define heart_read	____raw_readq
+#define heart_write	____raw_writeq
+
+#endif /* __ASM_SGI_HEART_H */
diff --git a/arch/mips/sgi-ip30/Makefile b/arch/mips/sgi-ip30/Makefile
new file mode 100644
index 000000000000..736cebf0343a
--- /dev/null
+++ b/arch/mips/sgi-ip30/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the IP30 specific kernel interface routines under Linux.
+#
+
+obj-y	:= ip30-irq.o ip30-pci.o ip30-power.o ip30-setup.o ip30-timer.o \
+	   ip30-xtalk.o
+
+obj-$(CONFIG_EARLY_PRINTK)	+= ip30-console.o
+obj-$(CONFIG_SMP)		+= ip30-smp.o
diff --git a/arch/mips/sgi-ip30/Platform b/arch/mips/sgi-ip30/Platform
new file mode 100644
index 000000000000..2b5695c2049a
--- /dev/null
+++ b/arch/mips/sgi-ip30/Platform
@@ -0,0 +1,8 @@
+#
+# SGI-IP30 (Octane/Octane2)
+#
+ifdef CONFIG_SGI_IP30
+platform-$(CONFIG_SGI_IP30)		+= sgi-ip30/
+cflags-$(CONFIG_SGI_IP30)		+= -I$(srctree)/arch/mips/include/asm/mach-ip30
+load-$(CONFIG_SGI_IP30)			+= 0xa800000020004000
+endif
diff --git a/arch/mips/sgi-ip30/ip30-console.c b/arch/mips/sgi-ip30/ip30-console.c
new file mode 100644
index 000000000000..b91f8c4fdc78
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-console.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/io.h>
+
+#include <asm/sn/ioc3.h>
+
+static inline struct ioc3_uartregs *console_uart(void)
+{
+	struct ioc3 *ioc3;
+
+	ioc3 = (struct ioc3 *)((void *)(0x900000001f600000));
+	return &ioc3->sregs.uarta;
+}
+
+void prom_putchar(char c)
+{
+	struct ioc3_uartregs *uart = console_uart();
+
+	while ((readb(&uart->iu_lsr) & 0x20) == 0)
+		cpu_relax();
+
+	writeb(c, &uart->iu_thr);
+}
diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
new file mode 100644
index 000000000000..d46655b914f1
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ip30-irq.c: Highlevel interrupt handling for IP30 architecture.
+ */
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/percpu.h>
+#include <linux/spinlock.h>
+#include <linux/tick.h>
+#include <linux/types.h>
+
+#include <asm/irq_cpu.h>
+#include <asm/sgi/heart.h>
+
+struct heart_irq_data {
+	u64	*irq_mask;
+	int	cpu;
+};
+
+static DECLARE_BITMAP(heart_irq_map, HEART_NUM_IRQS);
+
+static DEFINE_PER_CPU(unsigned long, irq_enable_mask);
+
+static inline int heart_alloc_int(void)
+{
+	int bit;
+
+again:
+	bit = find_first_zero_bit(heart_irq_map, HEART_NUM_IRQS);
+	if (bit >= HEART_NUM_IRQS)
+		return -ENOSPC;
+
+	if (test_and_set_bit(bit, heart_irq_map))
+		goto again;
+
+	return bit;
+}
+
+static void ip30_error_irq(struct irq_desc *desc)
+{
+	u64 pending, mask, cause, error_irqs, err_reg;
+	int cpu = smp_processor_id();
+	int i;
+
+	pending = heart_read(&heart_regs->isr);
+	mask = heart_read(&heart_regs->imr[cpu]);
+	cause = heart_read(&heart_regs->cause);
+	error_irqs = (pending & HEART_L4_INT_MASK & mask);
+
+	/* Bail if there's nothing to process (how did we get here, then?) */
+	if (unlikely(!error_irqs))
+		return;
+
+	/* Prevent any of the error IRQs from firing again. */
+	heart_write(mask & ~(pending), &heart_regs->imr[cpu]);
+
+	/* Ack all error IRQs. */
+	heart_write(HEART_L4_INT_MASK, &heart_regs->clear_isr);
+
+	/*
+	 * If we also have a cause value, then something happened, so loop
+	 * through the error IRQs and report a "heart attack" for each one
+	 * and print the value of the HEART cause register.  This is really
+	 * primitive right now, but it should hopefully work until a more
+	 * robust error handling routine can be put together.
+	 *
+	 * Refer to heart.h for the HC_* macros to work out the cause
+	 * that got us here.
+	 */
+	if (cause) {
+		pr_alert("IP30: CPU%d: HEART ATTACK! ISR = 0x%.16llx, IMR = 0x%.16llx, CAUSE = 0x%.16llx\n",
+			 cpu, pending, mask, cause);
+
+		if (cause & HC_COR_MEM_ERR) {
+			err_reg = heart_read(&heart_regs->mem_err_addr);
+			pr_alert("  HEART_MEMERR_ADDR = 0x%.16llx\n", err_reg);
+		}
+
+		/* i = 63; i >= 51; i-- */
+		for (i = HEART_ERR_MASK_END; i >= HEART_ERR_MASK_START; i--)
+			if ((pending >> i) & 1)
+				pr_alert("  HEART Error IRQ #%d\n", i);
+
+		/* XXX: Seems possible to loop forever here, so panic(). */
+		panic("IP30: Fatal Error !\n");
+	}
+
+	/* Unmask the error IRQs. */
+	heart_write(mask, &heart_regs->imr[cpu]);
+}
+
+static void ip30_normal_irq(struct irq_desc *desc)
+{
+	int cpu = smp_processor_id();
+	struct irq_domain *domain;
+	u64 pend, mask;
+	int irq;
+
+	pend = heart_read(&heart_regs->isr);
+	mask = (heart_read(&heart_regs->imr[cpu]) &
+		(HEART_L0_INT_MASK | HEART_L1_INT_MASK | HEART_L2_INT_MASK));
+
+	pend &= mask;
+	if (unlikely(!pend))
+		return;
+
+#ifdef CONFIG_SMP
+	if (pend & BIT_ULL(HEART_L2_INT_RESCHED_CPU_0)) {
+		heart_write(BIT_ULL(HEART_L2_INT_RESCHED_CPU_0),
+			    &heart_regs->clear_isr);
+		scheduler_ipi();
+	} else if (pend & BIT_ULL(HEART_L2_INT_RESCHED_CPU_1)) {
+		heart_write(BIT_ULL(HEART_L2_INT_RESCHED_CPU_1),
+			    &heart_regs->clear_isr);
+		scheduler_ipi();
+	} else if (pend & BIT_ULL(HEART_L2_INT_CALL_CPU_0)) {
+		heart_write(BIT_ULL(HEART_L2_INT_CALL_CPU_0),
+			    &heart_regs->clear_isr);
+		generic_smp_call_function_interrupt();
+	} else if (pend & BIT_ULL(HEART_L2_INT_CALL_CPU_1)) {
+		heart_write(BIT_ULL(HEART_L2_INT_CALL_CPU_1),
+			    &heart_regs->clear_isr);
+		generic_smp_call_function_interrupt();
+	} else
+#endif
+	{
+		domain = irq_desc_get_handler_data(desc);
+		irq = irq_linear_revmap(domain, __ffs(pend));
+		if (irq)
+			generic_handle_irq(irq);
+		else
+			spurious_interrupt();
+	}
+}
+
+static void ip30_ack_heart_irq(struct irq_data *d)
+{
+	heart_write(BIT_ULL(d->hwirq), &heart_regs->clear_isr);
+}
+
+static void ip30_mask_heart_irq(struct irq_data *d)
+{
+	struct heart_irq_data *hd = irq_data_get_irq_chip_data(d);
+	unsigned long *mask = &per_cpu(irq_enable_mask, hd->cpu);
+
+	clear_bit(d->hwirq, mask);
+	heart_write(*mask, &heart_regs->imr[hd->cpu]);
+}
+
+static void ip30_mask_and_ack_heart_irq(struct irq_data *d)
+{
+	struct heart_irq_data *hd = irq_data_get_irq_chip_data(d);
+	unsigned long *mask = &per_cpu(irq_enable_mask, hd->cpu);
+
+	clear_bit(d->hwirq, mask);
+	heart_write(*mask, &heart_regs->imr[hd->cpu]);
+	heart_write(BIT_ULL(d->hwirq), &heart_regs->clear_isr);
+}
+
+static void ip30_unmask_heart_irq(struct irq_data *d)
+{
+	struct heart_irq_data *hd = irq_data_get_irq_chip_data(d);
+	unsigned long *mask = &per_cpu(irq_enable_mask, hd->cpu);
+
+	set_bit(d->hwirq, mask);
+	heart_write(*mask, &heart_regs->imr[hd->cpu]);
+}
+
+static int ip30_set_heart_irq_affinity(struct irq_data *d,
+				       const struct cpumask *mask, bool force)
+{
+	struct heart_irq_data *hd = irq_data_get_irq_chip_data(d);
+
+	if (!hd)
+		return -EINVAL;
+
+	if (irqd_is_started(d))
+		ip30_mask_and_ack_heart_irq(d);
+
+	hd->cpu = cpumask_first_and(mask, cpu_online_mask);
+
+	if (irqd_is_started(d))
+		ip30_unmask_heart_irq(d);
+
+	irq_data_update_effective_affinity(d, cpumask_of(hd->cpu));
+
+	return 0;
+}
+
+static struct irq_chip heart_irq_chip = {
+	.name			= "HEART",
+	.irq_ack		= ip30_ack_heart_irq,
+	.irq_mask		= ip30_mask_heart_irq,
+	.irq_mask_ack		= ip30_mask_and_ack_heart_irq,
+	.irq_unmask		= ip30_unmask_heart_irq,
+	.irq_set_affinity	= ip30_set_heart_irq_affinity,
+};
+
+static int heart_domain_alloc(struct irq_domain *domain, unsigned int virq,
+			      unsigned int nr_irqs, void *arg)
+{
+	struct irq_alloc_info *info = arg;
+	struct heart_irq_data *hd;
+	int hwirq;
+
+	if (nr_irqs > 1 || !info)
+		return -EINVAL;
+
+	hd = kzalloc(sizeof(*hd), GFP_KERNEL);
+	if (!hd)
+		return -ENOMEM;
+
+	hwirq = heart_alloc_int();
+	if (hwirq < 0) {
+		kfree(hd);
+		return -EAGAIN;
+	}
+	irq_domain_set_info(domain, virq, hwirq, &heart_irq_chip, hd,
+			    handle_level_irq, NULL, NULL);
+
+	return 0;
+}
+
+static void heart_domain_free(struct irq_domain *domain,
+			      unsigned int virq, unsigned int nr_irqs)
+{
+	struct irq_data *irqd;
+
+	if (nr_irqs > 1)
+		return;
+
+	irqd = irq_domain_get_irq_data(domain, virq);
+	clear_bit(irqd->hwirq, heart_irq_map);
+	if (irqd && irqd->chip_data)
+		kfree(irqd->chip_data);
+}
+
+static const struct irq_domain_ops heart_domain_ops = {
+	.alloc = heart_domain_alloc,
+	.free  = heart_domain_free,
+};
+
+void __init ip30_install_ipi(void)
+{
+	int cpu = smp_processor_id();
+	unsigned long *mask = &per_cpu(irq_enable_mask, cpu);
+
+	set_bit(HEART_L2_INT_RESCHED_CPU_0 + cpu, mask);
+	heart_write(BIT_ULL(HEART_L2_INT_RESCHED_CPU_0 + cpu),
+		    &heart_regs->clear_isr);
+	set_bit(HEART_L2_INT_CALL_CPU_0 + cpu, mask);
+	heart_write(BIT_ULL(HEART_L2_INT_CALL_CPU_0 + cpu),
+		    &heart_regs->clear_isr);
+
+	heart_write(*mask, &heart_regs->imr[cpu]);
+}
+
+void __init arch_init_irq(void)
+{
+	struct irq_domain *domain;
+	struct fwnode_handle *fn;
+	unsigned long *mask;
+	int i;
+
+	mips_cpu_irq_init();
+
+	/* Mask all IRQs. */
+	heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[0]);
+	heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[1]);
+	heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[2]);
+	heart_write(HEART_CLR_ALL_MASK, &heart_regs->imr[3]);
+
+	/* Ack everything. */
+	heart_write(HEART_ACK_ALL_MASK, &heart_regs->clear_isr);
+
+	/* Enable specific HEART error IRQs for each CPU. */
+	mask = &per_cpu(irq_enable_mask, 0);
+	*mask |= HEART_CPU0_ERR_MASK;
+	heart_write(*mask, &heart_regs->imr[0]);
+	mask = &per_cpu(irq_enable_mask, 1);
+	*mask |= HEART_CPU1_ERR_MASK;
+	heart_write(*mask, &heart_regs->imr[1]);
+
+	/*
+	 * Some HEART bits are reserved by hardware or by software convention.
+	 * Mark these as reserved right away so they won't be accidentally
+	 * used later.
+	 */
+	set_bit(HEART_L0_INT_GENERIC, heart_irq_map);
+	set_bit(HEART_L0_INT_FLOW_CTRL_HWTR_0, heart_irq_map);
+	set_bit(HEART_L0_INT_FLOW_CTRL_HWTR_1, heart_irq_map);
+	set_bit(HEART_L2_INT_RESCHED_CPU_0, heart_irq_map);
+	set_bit(HEART_L2_INT_RESCHED_CPU_1, heart_irq_map);
+	set_bit(HEART_L2_INT_CALL_CPU_0, heart_irq_map);
+	set_bit(HEART_L2_INT_CALL_CPU_1, heart_irq_map);
+	set_bit(HEART_L3_INT_TIMER, heart_irq_map);
+
+	/* Reserve the error interrupts (#51 to #63). */
+	for (i = HEART_L4_INT_XWID_ERR_9; i <= HEART_L4_INT_HEART_EXCP; i++)
+		set_bit(i, heart_irq_map);
+
+	fn = irq_domain_alloc_named_fwnode("HEART");
+	WARN_ON(fn == NULL);
+	if (!fn)
+		return;
+	domain = irq_domain_create_linear(fn, HEART_NUM_IRQS,
+					  &heart_domain_ops, NULL);
+	WARN_ON(domain == NULL);
+	if (!domain)
+		return;
+
+	irq_set_default_host(domain);
+
+	irq_set_percpu_devid(IP30_HEART_L0_IRQ);
+	irq_set_chained_handler_and_data(IP30_HEART_L0_IRQ, ip30_normal_irq,
+					 domain);
+	irq_set_percpu_devid(IP30_HEART_L1_IRQ);
+	irq_set_chained_handler_and_data(IP30_HEART_L1_IRQ, ip30_normal_irq,
+					 domain);
+	irq_set_percpu_devid(IP30_HEART_L2_IRQ);
+	irq_set_chained_handler_and_data(IP30_HEART_L2_IRQ, ip30_normal_irq,
+					 domain);
+	irq_set_percpu_devid(IP30_HEART_ERR_IRQ);
+	irq_set_chained_handler_and_data(IP30_HEART_ERR_IRQ, ip30_error_irq,
+					 domain);
+}
diff --git a/arch/mips/sgi-ip30/ip30-pci.c b/arch/mips/sgi-ip30/ip30-pci.c
new file mode 100644
index 000000000000..0547d9a1080e
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-pci.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ip30-pci.c: misc PCI related helper code for IP30 architecture
+ */
+
+#include <asm/pci/bridge.h>
+
+dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
+
+	return bc->baddr + paddr;
+}
+
+phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+{
+	return dma_addr & ~(0xffUL << 56);
+}
diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-power.c
new file mode 100644
index 000000000000..120b3f3d5108
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-power.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ip30-power.c: Software powerdown and reset handling for IP30 architecture.
+ *
+ * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ *               2014 Joshua Kinard <kumba@gentoo.org>
+ *               2009 Johannes Dickgreber <tanzy@gmx.de>
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/notifier.h>
+#include <linux/delay.h>
+#include <linux/rtc/ds1685.h>
+#include <linux/interrupt.h>
+#include <linux/pm.h>
+
+#include <asm/reboot.h>
+#include <asm/sgi/heart.h>
+
+static void __noreturn ip30_machine_restart(char *cmd)
+{
+	/*
+	 * Execute HEART cold reset
+	 *   Yes, it's cold-HEARTed!
+	 */
+	heart_write((heart_read(&heart_regs->mode) | HM_COLD_RST),
+		    &heart_regs->mode);
+	unreachable();
+}
+
+static int __init ip30_reboot_setup(void)
+{
+	_machine_restart = ip30_machine_restart;
+
+	return 0;
+}
+
+subsys_initcall(ip30_reboot_setup);
diff --git a/arch/mips/sgi-ip30/ip30-setup.c b/arch/mips/sgi-ip30/ip30-setup.c
new file mode 100644
index 000000000000..53d9828c752d
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-setup.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SGI IP30 miscellaneous setup bits.
+ *
+ * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ *               2007 Joshua Kinard <kumba@gentoo.org>
+ *               2009 Johannes Dickgreber <tanzy@gmx.de>
+ */
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/percpu.h>
+#include <linux/memblock.h>
+
+#include <asm/smp-ops.h>
+#include <asm/sgialib.h>
+#include <asm/time.h>
+#include <asm/sgi/heart.h>
+
+extern struct plat_smp_ops ip30_smp_ops;
+
+/* Structure of accessible HEART registers located in XKPHYS space. */
+struct ip30_heart_regs __iomem *heart_regs = HEART_XKPHYS_BASE;
+
+/*
+ * ARCS will report up to the first 1GB of
+ * memory if queried.  Anything beyond that
+ * is marked as reserved.
+ */
+#define IP30_MAX_PROM_MEMORY	_AC(0x40000000, UL)
+
+/*
+ * Memory in the Octane starts at 512MB
+ */
+#define IP30_MEMORY_BASE	_AC(0x20000000, UL)
+
+/*
+ * If using ARCS to probe for memory, then
+ * remaining memory will start at this offset.
+ */
+#define IP30_REAL_MEMORY_START  (IP30_MEMORY_BASE + IP30_MAX_PROM_MEMORY)
+
+#define MEM_SHIFT(x) ((x) >> 20)
+
+static void __init ip30_mem_init(void)
+{
+	unsigned long total_mem;
+	phys_addr_t addr;
+	phys_addr_t size;
+	u32 memcfg;
+	int i;
+
+	total_mem = 0;
+	for (i = 0; i < HEART_MEMORY_BANKS; i++) {
+		memcfg = __raw_readl(&heart_regs->mem_cfg.l[i]);
+		if (!(memcfg & HEART_MEMCFG_VALID))
+			continue;
+
+		addr = memcfg & HEART_MEMCFG_ADDR_MASK;
+		addr <<= HEART_MEMCFG_UNIT_SHIFT;
+		addr += IP30_MEMORY_BASE;
+		size = memcfg & HEART_MEMCFG_SIZE_MASK;
+		size >>= HEART_MEMCFG_SIZE_SHIFT;
+		size += 1;
+		size <<= HEART_MEMCFG_UNIT_SHIFT;
+
+		total_mem += size;
+
+		if (addr >= IP30_REAL_MEMORY_START)
+			memblock_free(addr, size);
+		else if ((addr + size) > IP30_REAL_MEMORY_START)
+			memblock_free(IP30_REAL_MEMORY_START,
+				     size - IP30_MAX_PROM_MEMORY);
+	}
+	pr_info("Detected %luMB of physical memory.\n", MEM_SHIFT(total_mem));
+}
+
+/**
+ * ip30_cpu_time_init - platform time initialization.
+ */
+static void __init ip30_cpu_time_init(void)
+{
+	int cpu = smp_processor_id();
+	u64 heart_compare;
+	unsigned int start, end;
+	int time_diff;
+
+	heart_compare = (heart_read(&heart_regs->count) +
+			 (HEART_CYCLES_PER_SEC / 10));
+	start = read_c0_count();
+	while ((heart_read(&heart_regs->count) - heart_compare) & 0x800000)
+		cpu_relax();
+
+	end = read_c0_count();
+	time_diff = (int)end - (int)start;
+	mips_hpt_frequency = time_diff * 10;
+	pr_info("IP30: CPU%d: %d MHz CPU detected.\n", cpu,
+		(mips_hpt_frequency * 2) / 1000000);
+}
+
+void __init ip30_per_cpu_init(void)
+{
+	/* Disable all interrupts. */
+	clear_c0_status(ST0_IM);
+
+	ip30_cpu_time_init();
+#ifdef CONFIG_SMP
+	ip30_install_ipi();
+#endif
+
+	enable_percpu_irq(IP30_HEART_L0_IRQ, IRQ_TYPE_NONE);
+	enable_percpu_irq(IP30_HEART_L1_IRQ, IRQ_TYPE_NONE);
+	enable_percpu_irq(IP30_HEART_L2_IRQ, IRQ_TYPE_NONE);
+	enable_percpu_irq(IP30_HEART_ERR_IRQ, IRQ_TYPE_NONE);
+}
+
+/**
+ * plat_mem_setup - despite the name, misc setup happens here.
+ */
+void __init plat_mem_setup(void)
+{
+	ip30_mem_init();
+
+	/* XXX: Hard lock on /sbin/init if this flag isn't specified. */
+	prom_flags |= PROM_FLAG_DONT_FREE_TEMP;
+
+#ifdef CONFIG_SMP
+	register_smp_ops(&ip30_smp_ops);
+#else
+	ip30_per_cpu_init();
+#endif
+
+	ioport_resource.start = 0;
+	ioport_resource.end = ~0UL;
+	set_io_port_base(IO_BASE);
+}
diff --git a/arch/mips/sgi-ip30/ip30-smp.c b/arch/mips/sgi-ip30/ip30-smp.c
new file mode 100644
index 000000000000..de7b7bd87c75
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-smp.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ip30-smp.c: SMP on IP30 architecture.
+ * Based off of the original IP30 SMP code, with inspiration from ip27-smp.c
+ * and smp-bmips.c.
+ *
+ * Copyright (C) 2005-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ *               2006-2007, 2014-2015 Joshua Kinard <kumba@gentoo.org>
+ *               2009 Johannes Dickgreber <tanzy@gmx.de>
+ */
+
+#include <linux/init.h>
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+
+#include <asm/time.h>
+#include <asm/sgi/heart.h>
+
+#define MPCONF_MAGIC	0xbaddeed2
+#define	MPCONF_ADDR	0xa800000000000600L
+#define MPCONF_SIZE	0x80
+#define MPCONF(x)	(MPCONF_ADDR + (x) * MPCONF_SIZE)
+
+/* HEART can theoretically do 4 CPUs, but only 2 are physically possible */
+#define MP_NCPU		2
+
+struct mpconf {
+	u32 magic;
+	u32 prid;
+	u32 physid;
+	u32 virtid;
+	u32 scachesz;
+	u16 fanloads;
+	u16 res;
+	void *launch;
+	void *rendezvous;
+	u64 res2[3];
+	void *stackaddr;
+	void *lnch_parm;
+	void *rndv_parm;
+	u32 idleflag;
+};
+
+extern void __init ip30_per_cpu_init(void);
+
+static void ip30_smp_send_ipi_single(int cpu, u32 action)
+{
+	int irq;
+
+	switch (action) {
+	case SMP_RESCHEDULE_YOURSELF:
+		irq = HEART_L2_INT_RESCHED_CPU_0;
+		break;
+	case SMP_CALL_FUNCTION:
+		irq = HEART_L2_INT_CALL_CPU_0;
+		break;
+	default:
+		panic("IP30: Unknown action value in %s!\n", __func__);
+	}
+
+	irq += cpu;
+
+	/* Poke the other CPU -- it's got mail! */
+	heart_write(BIT_ULL(irq), &heart_regs->set_isr);
+}
+
+static void ip30_smp_send_ipi_mask(const struct cpumask *mask, u32 action)
+{
+	u32 i;
+
+	for_each_cpu(i, mask)
+		ip30_smp_send_ipi_single(i, action);
+}
+
+static void __init ip30_smp_setup(void)
+{
+	int i;
+	int ncpu = 0;
+	struct mpconf *mpc;
+
+	init_cpu_possible(cpumask_of(0));
+
+	/* Scan the MPCONF structure and enumerate available CPUs. */
+	for (i = 0; i < MP_NCPU; i++) {
+		mpc = (struct mpconf *)MPCONF(i);
+		if (mpc->magic == MPCONF_MAGIC) {
+			set_cpu_possible(i, true);
+			__cpu_number_map[i] = ++ncpu;
+			__cpu_logical_map[ncpu] = i;
+			pr_info("IP30: Slot: %d, PrID: %.8x, PhyID: %d, VirtID: %d\n",
+				i, mpc->prid, mpc->physid, mpc->virtid);
+		}
+	}
+	pr_info("IP30: Detected %d CPU(s) present.\n", ncpu);
+
+	/*
+	 * Set the coherency algorithm to '5' (cacheable coherent
+	 * exclusive on write).  This is needed on IP30 SMP, especially
+	 * for R14000 CPUs, otherwise, instruction bus errors will
+	 * occur upon reaching userland.
+	 */
+	change_c0_config(CONF_CM_CMASK, CONF_CM_CACHABLE_COW);
+}
+
+static void __init ip30_smp_prepare_cpus(unsigned int max_cpus)
+{
+	/* nothing to do here */
+}
+
+static int __init ip30_smp_boot_secondary(int cpu, struct task_struct *idle)
+{
+	struct mpconf *mpc = (struct mpconf *)MPCONF(cpu);
+
+	/* Stack pointer (sp). */
+	mpc->stackaddr = (void *)__KSTK_TOS(idle);
+
+	/* Global pointer (gp). */
+	mpc->lnch_parm = task_thread_info(idle);
+
+	mb(); /* make sure stack and lparm are written */
+
+	/* Boot CPUx. */
+	mpc->launch = smp_bootstrap;
+
+	/* CPUx now executes smp_bootstrap, then ip30_smp_finish */
+	return 0;
+}
+
+static void __init ip30_smp_init_cpu(void)
+{
+	ip30_per_cpu_init();
+}
+
+static void __init ip30_smp_finish(void)
+{
+	enable_percpu_irq(get_c0_compare_int(), IRQ_TYPE_NONE);
+	local_irq_enable();
+}
+
+struct plat_smp_ops __read_mostly ip30_smp_ops = {
+	.send_ipi_single	= ip30_smp_send_ipi_single,
+	.send_ipi_mask		= ip30_smp_send_ipi_mask,
+	.smp_setup		= ip30_smp_setup,
+	.prepare_cpus		= ip30_smp_prepare_cpus,
+	.boot_secondary		= ip30_smp_boot_secondary,
+	.init_secondary		= ip30_smp_init_cpu,
+	.smp_finish		= ip30_smp_finish,
+	.prepare_boot_cpu	= ip30_smp_init_cpu,
+};
diff --git a/arch/mips/sgi-ip30/ip30-timer.c b/arch/mips/sgi-ip30/ip30-timer.c
new file mode 100644
index 000000000000..d13e105478ae
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-timer.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ip30-timer.c: Clocksource/clockevent support for the
+ *               HEART chip in SGI Octane (IP30) systems.
+ *
+ * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ * Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
+ * Copyright (C) 2011 Joshua Kinard <kumba@gentoo.org>
+ */
+
+#include <linux/clocksource.h>
+#include <linux/cpumask.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/percpu.h>
+#include <linux/sched_clock.h>
+
+#include <asm/time.h>
+#include <asm/cevt-r4k.h>
+#include <asm/sgi/heart.h>
+
+static u64 ip30_heart_counter_read(struct clocksource *cs)
+{
+	return heart_read(&heart_regs->count);
+}
+
+struct clocksource ip30_heart_clocksource = {
+	.name	= "HEART",
+	.rating	= 400,
+	.read	= ip30_heart_counter_read,
+	.mask	= CLOCKSOURCE_MASK(52),
+	.flags	= (CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_VALID_FOR_HRES),
+};
+
+static u64 notrace ip30_heart_read_sched_clock(void)
+{
+	return heart_read(&heart_regs->count);
+}
+
+static void __init ip30_heart_clocksource_init(void)
+{
+	struct clocksource *cs = &ip30_heart_clocksource;
+
+	clocksource_register_hz(cs, HEART_CYCLES_PER_SEC);
+
+	sched_clock_register(ip30_heart_read_sched_clock, 52,
+			     HEART_CYCLES_PER_SEC);
+}
+
+void __init plat_time_init(void)
+{
+	int irq = get_c0_compare_int();
+
+	cp0_timer_irq_installed = 1;
+	c0_compare_irqaction.percpu_dev_id = &mips_clockevent_device;
+	c0_compare_irqaction.flags &= ~IRQF_SHARED;
+	irq_set_handler(irq, handle_percpu_devid_irq);
+	irq_set_percpu_devid(irq);
+	setup_percpu_irq(irq, &c0_compare_irqaction);
+	enable_percpu_irq(irq, IRQ_TYPE_NONE);
+
+	ip30_heart_clocksource_init();
+}
diff --git a/arch/mips/sgi-ip30/ip30-xtalk.c b/arch/mips/sgi-ip30/ip30-xtalk.c
new file mode 100644
index 000000000000..8a2894645529
--- /dev/null
+++ b/arch/mips/sgi-ip30/ip30-xtalk.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ip30-xtalk.c - Very basic Crosstalk (XIO) detection support.
+ *   Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ *   Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
+ *   Copyright (C) 2007, 2014-2016 Joshua Kinard <kumba@gentoo.org>
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/sgi-w1.h>
+#include <linux/platform_data/xtalk-bridge.h>
+
+#include <asm/xtalk/xwidget.h>
+#include <asm/pci/bridge.h>
+
+#define IP30_SWIN_BASE(widget) \
+		(0x0000000010000000 | (((unsigned long)(widget)) << 24))
+
+#define IP30_RAW_SWIN_BASE(widget)	(IO_BASE + IP30_SWIN_BASE(widget))
+
+#define IP30_SWIN_SIZE		(1 << 24)
+
+#define IP30_WIDGET_XBOW        _AC(0x0, UL)    /* XBow is always 0 */
+#define IP30_WIDGET_HEART       _AC(0x8, UL)    /* HEART is always 8 */
+#define IP30_WIDGET_PCI_BASE    _AC(0xf, UL)    /* BaseIO PCI is always 15 */
+
+#define XTALK_NODEV             0xffffffff
+
+#define XBOW_REG_LINK_STAT_0    0x114
+#define XBOW_REG_LINK_BLK_SIZE  0x40
+#define XBOW_REG_LINK_ALIVE     0x80000000
+
+#define HEART_INTR_ADDR		0x00000080
+
+#define xtalk_read	__raw_readl
+
+static void bridge_platform_create(int widget, int masterwid)
+{
+	struct xtalk_bridge_platform_data *bd;
+	struct sgi_w1_platform_data *wd;
+	struct platform_device *pdev;
+	struct resource w1_res;
+
+	wd = kzalloc(sizeof(*wd), GFP_KERNEL);
+	if (!wd)
+		goto no_mem;
+
+	snprintf(wd->dev_id, sizeof(wd->dev_id), "bridge-%012lx",
+		 IP30_SWIN_BASE(widget));
+
+	memset(&w1_res, 0, sizeof(w1_res));
+	w1_res.start = IP30_SWIN_BASE(widget) +
+				offsetof(struct bridge_regs, b_nic);
+	w1_res.end = w1_res.start + 3;
+	w1_res.flags = IORESOURCE_MEM;
+
+	pdev = platform_device_alloc("sgi_w1", PLATFORM_DEVID_AUTO);
+	if (!pdev) {
+		kfree(wd);
+		goto no_mem;
+	}
+	platform_device_add_resources(pdev, &w1_res, 1);
+	platform_device_add_data(pdev, wd, sizeof(*wd));
+	platform_device_add(pdev);
+
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		goto no_mem;
+	pdev = platform_device_alloc("xtalk-bridge", PLATFORM_DEVID_AUTO);
+	if (!pdev) {
+		kfree(bd);
+		goto no_mem;
+	}
+
+	bd->bridge_addr	= IP30_RAW_SWIN_BASE(widget);
+	bd->intr_addr	= HEART_INTR_ADDR;
+	bd->nasid	= 0;
+	bd->masterwid	= masterwid;
+
+	bd->mem.name	= "Bridge PCI MEM";
+	bd->mem.start	= IP30_SWIN_BASE(widget) + BRIDGE_DEVIO0;
+	bd->mem.end	= IP30_SWIN_BASE(widget) + IP30_SWIN_SIZE - 1;
+	bd->mem.flags	= IORESOURCE_MEM;
+	bd->mem_offset	= IP30_SWIN_BASE(widget);
+
+	bd->io.name	= "Bridge PCI IO";
+	bd->io.start	= IP30_SWIN_BASE(widget) + BRIDGE_DEVIO0;
+	bd->io.end	= IP30_SWIN_BASE(widget) + IP30_SWIN_SIZE - 1;
+	bd->io.flags	= IORESOURCE_IO;
+	bd->io_offset	= IP30_SWIN_BASE(widget);
+
+	platform_device_add_data(pdev, bd, sizeof(*bd));
+	platform_device_add(pdev);
+	pr_info("xtalk:%x bridge widget\n", widget);
+	return;
+
+no_mem:
+	pr_warn("xtalk:%x bridge create out of memory\n", widget);
+}
+
+static unsigned int __init xbow_widget_active(s8 wid)
+{
+	unsigned int link_stat;
+
+	link_stat = xtalk_read((void *)(IP30_RAW_SWIN_BASE(IP30_WIDGET_XBOW) +
+					XBOW_REG_LINK_STAT_0 +
+					XBOW_REG_LINK_BLK_SIZE *
+					(wid - 8)));
+
+	return (link_stat & XBOW_REG_LINK_ALIVE) ? 1 : 0;
+}
+
+static void __init xtalk_init_widget(s8 wid, s8 masterwid)
+{
+	xwidget_part_num_t partnum;
+	widgetreg_t widget_id;
+
+	if (!xbow_widget_active(wid))
+		return;
+
+	widget_id = xtalk_read((void *)(IP30_RAW_SWIN_BASE(wid) + WIDGET_ID));
+
+	partnum = XWIDGET_PART_NUM(widget_id);
+
+	switch (partnum) {
+	case BRIDGE_WIDGET_PART_NUM:
+	case XBRIDGE_WIDGET_PART_NUM:
+		bridge_platform_create(wid, masterwid);
+		break;
+	default:
+		pr_info("xtalk:%x unknown widget (0x%x)\n", wid, partnum);
+		break;
+	}
+}
+
+static int __init ip30_xtalk_init(void)
+{
+	int i;
+
+	/*
+	 * Walk widget IDs backwards so that BaseIO is probed first.  This
+	 * ensures that the BaseIO IOC3 is always detected as eth0.
+	 */
+	for (i = IP30_WIDGET_PCI_BASE; i > IP30_WIDGET_HEART; i--)
+		xtalk_init_widget(i, IP30_WIDGET_HEART);
+
+	return 0;
+}
+
+arch_initcall(ip30_xtalk_init);
-- 
2.16.4

