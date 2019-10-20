Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D31CEDDEF7
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2019 16:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfJTOqH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 10:46:07 -0400
Received: from forward106p.mail.yandex.net ([77.88.28.109]:47950 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726373AbfJTOqG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 10:46:06 -0400
Received: from mxback25g.mail.yandex.net (mxback25g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:326])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 48ED81C81065;
        Sun, 20 Oct 2019 17:45:57 +0300 (MSK)
Received: from myt1-e9eae5d2de9d.qloud-c.yandex.net (myt1-e9eae5d2de9d.qloud-c.yandex.net [2a02:6b8:c00:1290:0:640:e9ea:e5d2])
        by mxback25g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 7iL7q7nc3Z-juZac3QF;
        Sun, 20 Oct 2019 17:45:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571582757;
        bh=E5B2vL0yhXEJThSAgArAfkjAwtqLV/TgpXR9CYFboQQ=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=YsqjafwygdDNtjMIwTVRhdHbh4W0Pr1l1OFfnJUk41JswjM5i6STU5dli3o4ZulWt
         pfKGHJeHvpDzi9urov9eVOFsK/3bwpg3jmbe7oxIgp8bG7WgCaFjdV+PdFuBX2QZej
         nkJ1UEZPgd3wW0NSd3K9cYHAXJbmsuk1E6Nt4LJs=
Authentication-Results: mxback25g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt1-e9eae5d2de9d.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id cvdeeoAR7I-jFtafpXG;
        Sun, 20 Oct 2019 17:45:19 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/6] MIPS: Loongson2ef: clean up loongson64 related code
Date:   Sun, 20 Oct 2019 22:43:15 +0800
Message-Id: <20191020144318.18341-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unrelevent macros, defines and codes from loongson2ef mach.
Also rename some defines to match new naming.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson2ef/boot_param.h | 221 -----------------
 .../mach-loongson2ef/cpu-feature-overrides.h  |  15 +-
 arch/mips/include/asm/mach-loongson2ef/irq.h  |  44 ----
 .../asm/mach-loongson2ef/kernel-entry-init.h  |  90 -------
 .../include/asm/mach-loongson2ef/loongson.h   |  37 +--
 .../asm/mach-loongson2ef/loongson_hwmon.h     |  56 -----
 .../asm/mach-loongson2ef/loongson_regs.h      | 227 ------------------
 .../include/asm/mach-loongson2ef/machine.h    |  12 +-
 .../asm/mach-loongson2ef/mc146818rtc.h        |   6 +-
 arch/mips/include/asm/mach-loongson2ef/mem.h  |   6 +-
 .../include/asm/mach-loongson2ef/mmzone.h     |  50 ----
 arch/mips/include/asm/mach-loongson2ef/pci.h  |  12 +-
 .../include/asm/mach-loongson2ef/spaces.h     |   4 +-
 .../include/asm/mach-loongson2ef/topology.h   |  23 --
 .../asm/mach-loongson2ef/workarounds.h        |   8 -
 arch/mips/loongson2ef/Kconfig                 |   3 -
 arch/mips/loongson2ef/common/early_printk.c   |   2 +-
 arch/mips/loongson2ef/common/env.c            | 141 -----------
 arch/mips/loongson2ef/common/init.c           |   5 -
 arch/mips/loongson2ef/common/machtype.c       |   1 -
 arch/mips/loongson2ef/common/mem.c            |  37 ---
 arch/mips/loongson2ef/common/pci.c            |   8 -
 arch/mips/loongson2ef/common/pm.c             |   9 +-
 arch/mips/loongson2ef/common/reset.c          |  21 --
 arch/mips/loongson2ef/common/serial.c         |  67 ++----
 arch/mips/loongson2ef/common/setup.c          |  21 --
 arch/mips/loongson2ef/common/time.c           |   4 -
 arch/mips/loongson2ef/common/uart_base.c      |  17 +-
 arch/mips/loongson2ef/lemote-2f/clock.c       |   4 +-
 arch/mips/loongson2ef/lemote-2f/reset.c       |   2 +-
 30 files changed, 56 insertions(+), 1097 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/boot_param.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/irq.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/kernel-entry-init.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/loongson_hwmon.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/loongson_regs.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/mmzone.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/topology.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/workarounds.h

diff --git a/arch/mips/include/asm/mach-loongson2ef/boot_param.h b/arch/mips/include/asm/mach-loongson2ef/boot_param.h
deleted file mode 100644
index 8c286bedff3e..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/boot_param.h
+++ /dev/null
@@ -1,221 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MACH_LOONGSON64_BOOT_PARAM_H_
-#define __ASM_MACH_LOONGSON64_BOOT_PARAM_H_
-
-#define SYSTEM_RAM_LOW		1
-#define SYSTEM_RAM_HIGH		2
-#define SYSTEM_RAM_RESERVED	3
-#define PCI_IO			4
-#define PCI_MEM			5
-#define LOONGSON_CFG_REG	6
-#define VIDEO_ROM		7
-#define ADAPTER_ROM		8
-#define ACPI_TABLE		9
-#define SMBIOS_TABLE		10
-#define MAX_MEMORY_TYPE		11
-
-#define LOONGSON3_BOOT_MEM_MAP_MAX 128
-struct efi_memory_map_loongson {
-	u16 vers;	/* version of efi_memory_map */
-	u32 nr_map;	/* number of memory_maps */
-	u32 mem_freq;	/* memory frequence */
-	struct mem_map {
-		u32 node_id;	/* node_id which memory attached to */
-		u32 mem_type;	/* system memory, pci memory, pci io, etc. */
-		u64 mem_start;	/* memory map start address */
-		u32 mem_size;	/* each memory_map size, not the total size */
-	} map[LOONGSON3_BOOT_MEM_MAP_MAX];
-} __packed;
-
-enum loongson_cpu_type {
-	Legacy_2E = 0x0,
-	Legacy_2F = 0x1,
-	Legacy_3A = 0x2,
-	Legacy_3B = 0x3,
-	Legacy_1A = 0x4,
-	Legacy_1B = 0x5,
-	Legacy_2G = 0x6,
-	Legacy_2H = 0x7,
-	Loongson_1A = 0x100,
-	Loongson_1B = 0x101,
-	Loongson_2E = 0x200,
-	Loongson_2F = 0x201,
-	Loongson_2G = 0x202,
-	Loongson_2H = 0x203,
-	Loongson_3A = 0x300,
-	Loongson_3B = 0x301
-};
-
-/*
- * Capability and feature descriptor structure for MIPS CPU
- */
-struct efi_cpuinfo_loongson {
-	u16 vers;     /* version of efi_cpuinfo_loongson */
-	u32 processor_id; /* PRID, e.g. 6305, 6306 */
-	u32 cputype;  /* Loongson_3A/3B, etc. */
-	u32 total_node;   /* num of total numa nodes */
-	u16 cpu_startup_core_id; /* Boot core id */
-	u16 reserved_cores_mask;
-	u32 cpu_clock_freq; /* cpu_clock */
-	u32 nr_cpus;
-} __packed;
-
-#define MAX_UARTS 64
-struct uart_device {
-	u32 iotype; /* see include/linux/serial_core.h */
-	u32 uartclk;
-	u32 int_offset;
-	u64 uart_base;
-} __packed;
-
-#define MAX_SENSORS 64
-#define SENSOR_TEMPER  0x00000001
-#define SENSOR_VOLTAGE 0x00000002
-#define SENSOR_FAN     0x00000004
-struct sensor_device {
-	char name[32];  /* a formal name */
-	char label[64]; /* a flexible description */
-	u32 type;       /* SENSOR_* */
-	u32 id;         /* instance id of a sensor-class */
-	u32 fan_policy; /* see loongson_hwmon.h */
-	u32 fan_percent;/* only for constant speed policy */
-	u64 base_addr;  /* base address of device registers */
-} __packed;
-
-struct system_loongson {
-	u16 vers;     /* version of system_loongson */
-	u32 ccnuma_smp; /* 0: no numa; 1: has numa */
-	u32 sing_double_channel; /* 1:single; 2:double */
-	u32 nr_uarts;
-	struct uart_device uarts[MAX_UARTS];
-	u32 nr_sensors;
-	struct sensor_device sensors[MAX_SENSORS];
-	char has_ec;
-	char ec_name[32];
-	u64 ec_base_addr;
-	char has_tcm;
-	char tcm_name[32];
-	u64 tcm_base_addr;
-	u64 workarounds; /* see workarounds.h */
-} __packed;
-
-struct irq_source_routing_table {
-	u16 vers;
-	u16 size;
-	u16 rtr_bus;
-	u16 rtr_devfn;
-	u32 vendor;
-	u32 device;
-	u32 PIC_type;   /* conform use HT or PCI to route to CPU-PIC */
-	u64 ht_int_bit; /* 3A: 1<<24; 3B: 1<<16 */
-	u64 ht_enable;  /* irqs used in this PIC */
-	u32 node_id;    /* node id: 0x0-0; 0x1-1; 0x10-2; 0x11-3 */
-	u64 pci_mem_start_addr;
-	u64 pci_mem_end_addr;
-	u64 pci_io_start_addr;
-	u64 pci_io_end_addr;
-	u64 pci_config_addr;
-	u32 dma_mask_bits;
-} __packed;
-
-struct interface_info {
-	u16 vers; /* version of the specificition */
-	u16 size;
-	u8  flag;
-	char description[64];
-} __packed;
-
-#define MAX_RESOURCE_NUMBER 128
-struct resource_loongson {
-	u64 start; /* resource start address */
-	u64 end;   /* resource end address */
-	char name[64];
-	u32 flags;
-};
-
-struct archdev_data {};  /* arch specific additions */
-
-struct board_devices {
-	char name[64];    /* hold the device name */
-	u32 num_resources; /* number of device_resource */
-	/* for each device's resource */
-	struct resource_loongson resource[MAX_RESOURCE_NUMBER];
-	/* arch specific additions */
-	struct archdev_data archdata;
-};
-
-struct loongson_special_attribute {
-	u16 vers;     /* version of this special */
-	char special_name[64]; /* special_atribute_name */
-	u32 loongson_special_type; /* type of special device */
-	/* for each device's resource */
-	struct resource_loongson resource[MAX_RESOURCE_NUMBER];
-};
-
-struct loongson_params {
-	u64 memory_offset;	/* efi_memory_map_loongson struct offset */
-	u64 cpu_offset;		/* efi_cpuinfo_loongson struct offset */
-	u64 system_offset;	/* system_loongson struct offset */
-	u64 irq_offset;		/* irq_source_routing_table struct offset */
-	u64 interface_offset;	/* interface_info struct offset */
-	u64 special_offset;	/* loongson_special_attribute struct offset */
-	u64 boarddev_table_offset;  /* board_devices offset */
-};
-
-struct smbios_tables {
-	u16 vers;     /* version of smbios */
-	u64 vga_bios; /* vga_bios address */
-	struct loongson_params lp;
-};
-
-struct efi_reset_system_t {
-	u64 ResetCold;
-	u64 ResetWarm;
-	u64 ResetType;
-	u64 Shutdown;
-	u64 DoSuspend; /* NULL if not support */
-};
-
-struct efi_loongson {
-	u64 mps;	/* MPS table */
-	u64 acpi;	/* ACPI table (IA64 ext 0.71) */
-	u64 acpi20;	/* ACPI table (ACPI 2.0) */
-	struct smbios_tables smbios;	/* SM BIOS table */
-	u64 sal_systab;	/* SAL system table */
-	u64 boot_info;	/* boot info table */
-};
-
-struct boot_params {
-	struct efi_loongson efi;
-	struct efi_reset_system_t reset_system;
-};
-
-struct loongson_system_configuration {
-	u32 nr_cpus;
-	u32 nr_nodes;
-	int cores_per_node;
-	int cores_per_package;
-	u16 boot_cpu_id;
-	u16 reserved_cpus_mask;
-	enum loongson_cpu_type cputype;
-	u64 ht_control_base;
-	u64 pci_mem_start_addr;
-	u64 pci_mem_end_addr;
-	u64 pci_io_base;
-	u64 restart_addr;
-	u64 poweroff_addr;
-	u64 suspend_addr;
-	u64 vgabios_addr;
-	u32 dma_mask_bits;
-	char ecname[32];
-	u32 nr_uarts;
-	struct uart_device uarts[MAX_UARTS];
-	u32 nr_sensors;
-	struct sensor_device sensors[MAX_SENSORS];
-	u64 workarounds;
-};
-
-extern struct efi_memory_map_loongson *loongson_memmap;
-extern struct loongson_system_configuration loongson_sysconf;
-
-#endif
diff --git a/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
index 83ad90d8005d..b2ee859ca0b7 100644
--- a/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
@@ -1,8 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2009 Wu Zhangjin <wuzhangjin@gmail.com>
  * Copyright (C) 2009 Philippe Vachon <philippe@cowpig.ca>
  * Copyright (C) 2009 Zhang Le <r0bertz@gentoo.org>
@@ -13,8 +10,8 @@
  *	loongson2f user manual.
  */
 
-#ifndef __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H
-#define __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H
+#ifndef __ASM_MACH_LOONGSON2EF_CPU_FEATURE_OVERRIDES_H
+#define __ASM_MACH_LOONGSON2EF_CPU_FEATURE_OVERRIDES_H
 
 #define cpu_has_32fpr		1
 #define cpu_has_3k_cache	0
@@ -44,10 +41,4 @@
 #define cpu_has_vtag_icache	0
 #define cpu_has_watch		1
 
-#ifdef CONFIG_CPU_LOONGSON64
-#define cpu_has_wsbh		1
-#define cpu_has_ic_fills_f_dc	1
-#define cpu_hwrena_impl_bits	0xc0000000
-#endif
-
 #endif /* __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/irq.h b/arch/mips/include/asm/mach-loongson2ef/irq.h
deleted file mode 100644
index 557e069c400c..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/irq.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MACH_LOONGSON64_IRQ_H_
-#define __ASM_MACH_LOONGSON64_IRQ_H_
-
-#include <boot_param.h>
-
-#ifdef CONFIG_CPU_LOONGSON64
-
-/* cpu core interrupt numbers */
-#define MIPS_CPU_IRQ_BASE 56
-
-#define LOONGSON_UART_IRQ   (MIPS_CPU_IRQ_BASE + 2) /* UART */
-#define LOONGSON_BRIDGE_IRQ (MIPS_CPU_IRQ_BASE + 3) /* CASCADE */
-#define LOONGSON_TIMER_IRQ  (MIPS_CPU_IRQ_BASE + 7) /* CPU Timer */
-
-#define LOONGSON_HT1_CFG_BASE		loongson_sysconf.ht_control_base
-#define LOONGSON_HT1_INT_VECTOR_BASE	(LOONGSON_HT1_CFG_BASE + 0x80)
-#define LOONGSON_HT1_INT_EN_BASE	(LOONGSON_HT1_CFG_BASE + 0xa0)
-#define LOONGSON_HT1_INT_VECTOR(n)	\
-		LOONGSON3_REG32(LOONGSON_HT1_INT_VECTOR_BASE, 4 * (n))
-#define LOONGSON_HT1_INTN_EN(n)		\
-		LOONGSON3_REG32(LOONGSON_HT1_INT_EN_BASE, 4 * (n))
-
-#define LOONGSON_INT_ROUTER_OFFSET	0x1400
-#define LOONGSON_INT_ROUTER_INTEN	\
-	  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x24)
-#define LOONGSON_INT_ROUTER_INTENSET	\
-	  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x28)
-#define LOONGSON_INT_ROUTER_INTENCLR	\
-	  LOONGSON3_REG32(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + 0x2c)
-#define LOONGSON_INT_ROUTER_ENTRY(n)	\
-	  LOONGSON3_REG8(LOONGSON3_REG_BASE, LOONGSON_INT_ROUTER_OFFSET + n)
-#define LOONGSON_INT_ROUTER_LPC		LOONGSON_INT_ROUTER_ENTRY(0x0a)
-#define LOONGSON_INT_ROUTER_HT1(n)	LOONGSON_INT_ROUTER_ENTRY(n + 0x18)
-
-#define LOONGSON_INT_COREx_INTy(x, y)	(1<<(x) | 1<<(y+4))	/* route to int y of core x */
-
-#endif
-
-extern void fixup_irqs(void);
-extern void loongson3_ipi_interrupt(struct pt_regs *regs);
-
-#include_next <irq.h>
-#endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
diff --git a/arch/mips/include/asm/mach-loongson2ef/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson2ef/kernel-entry-init.h
deleted file mode 100644
index 28ccb06c8289..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/kernel-entry-init.h
+++ /dev/null
@@ -1,90 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2005 Embedded Alley Solutions, Inc
- * Copyright (C) 2005 Ralf Baechle (ralf@linux-mips.org)
- * Copyright (C) 2009 Jiajie Chen (chenjiajie@cse.buaa.edu.cn)
- * Copyright (C) 2012 Huacai Chen (chenhc@lemote.com)
- */
-#ifndef __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H
-#define __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H
-
-#include <asm/cpu.h>
-
-/*
- * Override macros used in arch/mips/kernel/head.S.
- */
-	.macro	kernel_entry_setup
-#ifdef CONFIG_CPU_LOONGSON64
-	.set	push
-	.set	mips64
-	/* Set LPA on LOONGSON3 config3 */
-	mfc0	t0, CP0_CONFIG3
-	or	t0, (0x1 << 7)
-	mtc0	t0, CP0_CONFIG3
-	/* Set ELPA on LOONGSON3 pagegrain */
-	mfc0	t0, CP0_PAGEGRAIN
-	or	t0, (0x1 << 29)
-	mtc0	t0, CP0_PAGEGRAIN
-	/* Enable STFill Buffer */
-	mfc0	t0, CP0_PRID
-	/* Loongson-3A R4+ */
-	andi	t1, t0, PRID_IMP_MASK
-	li	t2, PRID_IMP_LOONGSON_64G
-	beq     t1, t2, 1f
-	nop
-	/* Loongson-3A R2/R3 */
-	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
-	bnez	t0, 2f
-	nop
-1:
-	mfc0	t0, CP0_CONFIG6
-	or	t0, 0x100
-	mtc0	t0, CP0_CONFIG6
-2:
-	_ehb
-	.set	pop
-#endif
-	.endm
-
-/*
- * Do SMP slave processor setup.
- */
-	.macro	smp_slave_setup
-#ifdef CONFIG_CPU_LOONGSON64
-	.set	push
-	.set	mips64
-	/* Set LPA on LOONGSON3 config3 */
-	mfc0	t0, CP0_CONFIG3
-	or	t0, (0x1 << 7)
-	mtc0	t0, CP0_CONFIG3
-	/* Set ELPA on LOONGSON3 pagegrain */
-	mfc0	t0, CP0_PAGEGRAIN
-	or	t0, (0x1 << 29)
-	mtc0	t0, CP0_PAGEGRAIN
-	/* Enable STFill Buffer */
-	mfc0	t0, CP0_PRID
-	/* Loongson-3A R4+ */
-	andi	t1, t0, PRID_IMP_MASK
-	li	t2, PRID_IMP_LOONGSON_64G
-	beq     t1, t2, 1f
-	nop
-	/* Loongson-3A R2/R3 */
-	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
-	bnez	t0, 2f
-	nop
-1:
-	mfc0	t0, CP0_CONFIG6
-	or	t0, 0x100
-	mtc0	t0, CP0_CONFIG6
-2:
-	_ehb
-	.set	pop
-#endif
-	.endm
-
-#endif /* __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
index 40a24b76b874..8ed460a64d10 100644
--- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
+++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
@@ -4,13 +4,12 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_LOONGSON_H
-#define __ASM_MACH_LOONGSON64_LOONGSON_H
+#ifndef __ASM_MACH_LOONGSON2EF_LOONGSON_H
+#define __ASM_MACH_LOONGSON2EF_LOONGSON_H
 
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/irq.h>
-#include <boot_param.h>
 
 /* loongson internal northbridge initialization */
 extern void bonito_irq_init(void);
@@ -30,7 +29,7 @@ extern void __init prom_init_cmdline(void);
 extern void __init prom_init_machtype(void);
 extern void __init prom_init_env(void);
 #ifdef CONFIG_LOONGSON_UART_BASE
-extern unsigned long _loongson_uart_base[], loongson_uart_base[];
+extern unsigned long _loongson_uart_base, loongson_uart_base;
 extern void prom_init_loongson_uart_base(void);
 #endif
 
@@ -58,12 +57,6 @@ extern int mach_i8259_irq(void);
 #define LOONGSON_REG(x) \
 	(*(volatile u32 *)((char *)CKSEG1ADDR(LOONGSON_REG_BASE) + (x)))
 
-#define LOONGSON3_REG8(base, x) \
-	(*(volatile u8 *)((char *)TO_UNCAC(base) + (x)))
-
-#define LOONGSON3_REG32(base, x) \
-	(*(volatile u32 *)((char *)TO_UNCAC(base) + (x)))
-
 #define LOONGSON_IRQ_BASE	32
 #define LOONGSON2_PERFCNT_IRQ	(MIPS_CPU_IRQ_BASE + 6) /* cpu perf counter */
 
@@ -89,10 +82,6 @@ static inline void do_perfcnt_IRQ(void)
 #define LOONGSON_REG_BASE	0x1fe00000
 #define LOONGSON_REG_SIZE	0x00100000	/* 256Bytes + 256Bytes + ??? */
 #define LOONGSON_REG_TOP	(LOONGSON_REG_BASE+LOONGSON_REG_SIZE-1)
-/* Loongson-3 specific registers */
-#define LOONGSON3_REG_BASE	0x3ff00000
-#define LOONGSON3_REG_SIZE	0x00100000	/* 256Bytes + 256Bytes + ??? */
-#define LOONGSON3_REG_TOP	(LOONGSON3_REG_BASE+LOONGSON3_REG_SIZE-1)
 
 #define LOONGSON_LIO1_BASE	0x1ff00000
 #define LOONGSON_LIO1_SIZE	0x00100000	/* 1M */
@@ -108,12 +97,7 @@ static inline void do_perfcnt_IRQ(void)
 #define LOONGSON_PCICFG_BASE	0x1fe80000
 #define LOONGSON_PCICFG_SIZE	0x00000800	/* 2K */
 #define LOONGSON_PCICFG_TOP	(LOONGSON_PCICFG_BASE+LOONGSON_PCICFG_SIZE-1)
-
-#ifdef CONFIG_CPU_LOONGSON64
-#define LOONGSON_PCIIO_BASE	loongson_sysconf.pci_io_base
-#else
 #define LOONGSON_PCIIO_BASE	0x1fd00000
-#endif
 
 #define LOONGSON_PCIIO_SIZE	0x00100000	/* 1M */
 #define LOONGSON_PCIIO_TOP	(LOONGSON_PCIIO_BASE+LOONGSON_PCIIO_SIZE-1)
@@ -244,19 +228,8 @@ static inline void do_perfcnt_IRQ(void)
 #define LOONGSON_PXARB_CFG		LOONGSON_REG(LOONGSON_REGBASE + 0x68)
 #define LOONGSON_PXARB_STATUS		LOONGSON_REG(LOONGSON_REGBASE + 0x6c)
 
-#define MAX_PACKAGES 4
-
 /* Chip Config registor of each physical cpu package, PRid >= Loongson-2F */
-extern u64 loongson_chipcfg[MAX_PACKAGES];
-#define LOONGSON_CHIPCFG(id) (*(volatile u32 *)(loongson_chipcfg[id]))
-
-/* Chip Temperature registor of each physical cpu package, PRid >= Loongson-3A */
-extern u64 loongson_chiptemp[MAX_PACKAGES];
-#define LOONGSON_CHIPTEMP(id) (*(volatile u32 *)(loongson_chiptemp[id]))
-
-/* Freq Control register of each physical cpu package, PRid >= Loongson-3B */
-extern u64 loongson_freqctrl[MAX_PACKAGES];
-#define LOONGSON_FREQCTRL(id) (*(volatile u32 *)(loongson_freqctrl[id]))
+#define LOONGSON_CHIPCFG	(void __iomem *)TO_UNCAC(0x1fc00180)
 
 /* pcimap */
 
@@ -352,4 +325,4 @@ extern unsigned long _loongson_addrwincfg_base;
 
 #endif	/* ! CONFIG_CPU_SUPPORTS_ADDRWINCFG */
 
-#endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
+#endif /* __ASM_MACH_LOONGSON2EF_LOONGSON_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson_hwmon.h b/arch/mips/include/asm/mach-loongson2ef/loongson_hwmon.h
deleted file mode 100644
index 545f91f2ae16..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/loongson_hwmon.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LOONGSON_HWMON_H_
-#define __LOONGSON_HWMON_H_
-
-#include <linux/types.h>
-
-#define MIN_TEMP	0
-#define MAX_TEMP	255
-#define NOT_VALID_TEMP	999
-
-typedef int (*get_temp_fun)(int);
-extern int loongson3_cpu_temp(int);
-
-/* 0:Max speed, 1:Manual, 2:Auto */
-enum fan_control_mode {
-	FAN_FULL_MODE = 0,
-	FAN_MANUAL_MODE = 1,
-	FAN_AUTO_MODE = 2,
-	FAN_MODE_END
-};
-
-struct temp_range {
-	u8 low;
-	u8 high;
-	u8 level;
-};
-
-#define CONSTANT_SPEED_POLICY	0  /* at constant speed */
-#define STEP_SPEED_POLICY	1  /* use up/down arrays to describe policy */
-#define KERNEL_HELPER_POLICY	2  /* kernel as a helper to fan control */
-
-#define MAX_STEP_NUM	16
-#define MAX_FAN_LEVEL	255
-
-/* loongson_fan_policy works when fan work at FAN_AUTO_MODE */
-struct loongson_fan_policy {
-	u8	type;
-
-	/* percent only used when type is CONSTANT_SPEED_POLICY */
-	u8	percent;
-
-	/* period between two check. (Unit: S) */
-	u8	adjust_period;
-
-	/* fan adjust usually depend on a temprature input */
-	get_temp_fun	depend_temp;
-
-	/* up_step/down_step used when type is STEP_SPEED_POLICY */
-	u8	up_step_num;
-	u8	down_step_num;
-	struct temp_range up_step[MAX_STEP_NUM];
-	struct temp_range down_step[MAX_STEP_NUM];
-	struct delayed_work work;
-};
-
-#endif /* __LOONGSON_HWMON_H_*/
diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson_regs.h b/arch/mips/include/asm/mach-loongson2ef/loongson_regs.h
deleted file mode 100644
index 6e3569ab8936..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/loongson_regs.h
+++ /dev/null
@@ -1,227 +0,0 @@
-/*
- * Read/Write Loongson Extension Registers
- */
-
-#ifndef _LOONGSON_REGS_H_
-#define _LOONGSON_REGS_H_
-
-#include <linux/types.h>
-#include <linux/bits.h>
-
-#include <asm/mipsregs.h>
-#include <asm/cpu.h>
-
-static inline bool cpu_has_cfg(void)
-{
-	return ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G);
-}
-
-static inline u32 read_cpucfg(u32 reg)
-{
-	u32 __res;
-
-	__asm__ __volatile__(
-		"parse_r __res,%0\n\t"
-		"parse_r reg,%1\n\t"
-		".insn \n\t"
-		".word (0xc8080118 | (reg << 21) | (__res << 11))\n\t"
-		:"=r"(__res)
-		:"r"(reg)
-		:
-		);
-	return __res;
-}
-
-/* Bit Domains for CFG registers */
-#define LOONGSON_CFG0	0x0
-#define LOONGSON_CFG0_PRID GENMASK(31, 0)
-
-#define LOONGSON_CFG1 0x1
-#define LOONGSON_CFG1_FP	BIT(0)
-#define LOONGSON_CFG1_FPREV	GENMASK(3, 1)
-#define LOONGSON_CFG1_MMI	BIT(4)
-#define LOONGSON_CFG1_MSA1	BIT(5)
-#define LOONGSON_CFG1_MSA2	BIT(6)
-#define LOONGSON_CFG1_CGP	BIT(7)
-#define LOONGSON_CFG1_WRP	BIT(8)
-#define LOONGSON_CFG1_LSX1	BIT(9)
-#define LOONGSON_CFG1_LSX2	BIT(10)
-#define LOONGSON_CFG1_LASX	BIT(11)
-#define LOONGSON_CFG1_R6FXP	BIT(12)
-#define LOONGSON_CFG1_R6CRCP	BIT(13)
-#define LOONGSON_CFG1_R6FPP	BIT(14)
-#define LOONGSON_CFG1_CNT64	BIT(15)
-#define LOONGSON_CFG1_LSLDR0	BIT(16)
-#define LOONGSON_CFG1_LSPREF	BIT(17)
-#define LOONGSON_CFG1_LSPREFX	BIT(18)
-#define LOONGSON_CFG1_LSSYNCI	BIT(19)
-#define LOONGSON_CFG1_LSUCA	BIT(20)
-#define LOONGSON_CFG1_LLSYNC	BIT(21)
-#define LOONGSON_CFG1_TGTSYNC	BIT(22)
-#define LOONGSON_CFG1_LLEXC	BIT(23)
-#define LOONGSON_CFG1_SCRAND	BIT(24)
-#define LOONGSON_CFG1_MUALP	BIT(25)
-#define LOONGSON_CFG1_KMUALEN	BIT(26)
-#define LOONGSON_CFG1_ITLBT	BIT(27)
-#define LOONGSON_CFG1_LSUPERF	BIT(28)
-#define LOONGSON_CFG1_SFBP	BIT(29)
-#define LOONGSON_CFG1_CDMAP	BIT(30)
-
-#define LOONGSON_CFG2 0x2
-#define LOONGSON_CFG2_LEXT1	BIT(0)
-#define LOONGSON_CFG2_LEXT2	BIT(1)
-#define LOONGSON_CFG2_LEXT3	BIT(2)
-#define LOONGSON_CFG2_LSPW	BIT(3)
-#define LOONGSON_CFG2_LBT1	BIT(4)
-#define LOONGSON_CFG2_LBT2	BIT(5)
-#define LOONGSON_CFG2_LBT3	BIT(6)
-#define LOONGSON_CFG2_LBTMMU	BIT(7)
-#define LOONGSON_CFG2_LPMP	BIT(8)
-#define LOONGSON_CFG2_LPMPREV	GENMASK(11, 9)
-#define LOONGSON_CFG2_LAMO	BIT(12)
-#define LOONGSON_CFG2_LPIXU	BIT(13)
-#define LOONGSON_CFG2_LPIXUN	BIT(14)
-#define LOONGSON_CFG2_LZVP	BIT(15)
-#define LOONGSON_CFG2_LZVREV	GENMASK(18, 16)
-#define LOONGSON_CFG2_LGFTP	BIT(19)
-#define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
-#define LOONGSON_CFG2_LLFTP	BIT(23)
-#define LOONGSON_CFG2_LLFTPREV	GENMASK(24, 26)
-#define LOONGSON_CFG2_LCSRP	BIT(27)
-#define LOONGSON_CFG2_LDISBLIKELY	BIT(28)
-
-#define LOONGSON_CFG3 0x3
-#define LOONGSON_CFG3_LCAMP	BIT(0)
-#define LOONGSON_CFG3_LCAMREV	GENMASK(3, 1)
-#define LOONGSON_CFG3_LCAMNUM	GENMASK(11, 4)
-#define LOONGSON_CFG3_LCAMKW	GENMASK(19, 12)
-#define LOONGSON_CFG3_LCAMVW	GENMASK(27, 20)
-
-#define LOONGSON_CFG4 0x4
-#define LOONGSON_CFG4_CCFREQ	GENMASK(31, 0)
-
-#define LOONGSON_CFG5 0x5
-#define LOONGSON_CFG5_CFM	GENMASK(15, 0)
-#define LOONGSON_CFG5_CFD	GENMASK(31, 16)
-
-#define LOONGSON_CFG6 0x6
-
-#define LOONGSON_CFG7 0x7
-#define LOONGSON_CFG7_GCCAEQRP	BIT(0)
-#define LOONGSON_CFG7_UCAWINP	BIT(1)
-
-static inline bool cpu_has_csr(void)
-{
-	if (cpu_has_cfg())
-		return (read_cpucfg(LOONGSON_CFG2) & LOONGSON_CFG2_LCSRP);
-
-	return false;
-}
-
-static inline u32 csr_readl(u32 reg)
-{
-	u32 __res;
-
-	/* RDCSR reg, val */
-	__asm__ __volatile__(
-		"parse_r __res,%0\n\t"
-		"parse_r reg,%1\n\t"
-		".insn \n\t"
-		".word (0xc8000118 | (reg << 21) | (__res << 11))\n\t"
-		:"=r"(__res)
-		:"r"(reg)
-		:
-		);
-	return __res;
-}
-
-static inline u64 csr_readq(u32 reg)
-{
-	u64 __res;
-
-	/* DWRCSR reg, val */
-	__asm__ __volatile__(
-		"parse_r __res,%0\n\t"
-		"parse_r reg,%1\n\t"
-		".insn \n\t"
-		".word (0xc8020118 | (reg << 21) | (__res << 11))\n\t"
-		:"=r"(__res)
-		:"r"(reg)
-		:
-		);
-	return __res;
-}
-
-static inline void csr_writel(u32 val, u32 reg)
-{
-	/* WRCSR reg, val */
-	__asm__ __volatile__(
-		"parse_r reg,%0\n\t"
-		"parse_r val,%1\n\t"
-		".insn \n\t"
-		".word (0xc8010118 | (reg << 21) | (val << 11))\n\t"
-		:
-		:"r"(reg),"r"(val)
-		:
-		);
-}
-
-static inline void csr_writeq(u64 val, u32 reg)
-{
-	/* DWRCSR reg, val */
-	__asm__ __volatile__(
-		"parse_r reg,%0\n\t"
-		"parse_r val,%1\n\t"
-		".insn \n\t"
-		".word (0xc8030118 | (reg << 21) | (val << 11))\n\t"
-		:
-		:"r"(reg),"r"(val)
-		:
-		);
-}
-
-/* Public CSR Register can also be accessed with regular addresses */
-#define CSR_PUBLIC_MMIO_BASE 0x1fe00000
-
-#define MMIO_CSR(x)		(void *)TO_UNCAC(CSR_PUBLIC_MMIO_BASE + x)
-
-#define LOONGSON_CSR_FEATURES	0x8
-#define LOONGSON_CSRF_TEMP	BIT(0)
-#define LOONGSON_CSRF_NODECNT	BIT(1)
-#define LOONGSON_CSRF_MSI	BIT(2)
-#define LOONGSON_CSRF_EXTIOI	BIT(3)
-#define LOONGSON_CSRF_IPI	BIT(4)
-#define LOONGSON_CSRF_FREQ	BIT(5)
-
-#define LOONGSON_CSR_VENDOR	0x10 /* Vendor name string, should be "Loongson" */
-#define LOONGSON_CSR_CPUNAME	0x20 /* Processor name string */
-#define LOONGSON_CSR_NODECNT	0x408
-#define LOONGSON_CSR_CPUTEMP	0x428
-
-/* PerCore CSR, only accessable by local cores */
-#define LOONGSON_CSR_IPI_STATUS	0x1000
-#define LOONGSON_CSR_IPI_EN	0x1004
-#define LOONGSON_CSR_IPI_SET	0x1008
-#define LOONGSON_CSR_IPI_CLEAR	0x100c
-#define LOONGSON_CSR_IPI_SEND	0x1040
-#define CSR_IPI_SEND_IP_SHIFT	0
-#define CSR_IPI_SEND_CPU_SHIFT	16
-#define CSR_IPI_SEND_BLOCK	BIT(31)
-
-static inline u64 drdtime(void)
-{
-	int rID = 0;
-	u64 val = 0;
-
-	__asm__ __volatile__(
-		"parse_r rID,%0\n\t"
-		"parse_r val,%1\n\t"
-		".insn \n\t"
-		".word (0xc8090118 | (rID << 21) | (val << 11))\n\t"
-		:"=r"(rID),"=r"(val)
-		:
-		);
-	return val;
-}
-
-#endif
diff --git a/arch/mips/include/asm/mach-loongson2ef/machine.h b/arch/mips/include/asm/mach-loongson2ef/machine.h
index 8ef7ea94a26d..4097267ef186 100644
--- a/arch/mips/include/asm/mach-loongson2ef/machine.h
+++ b/arch/mips/include/asm/mach-loongson2ef/machine.h
@@ -4,8 +4,8 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_MACHINE_H
-#define __ASM_MACH_LOONGSON64_MACHINE_H
+#ifndef __ASM_MACH_LOONGSON2EF_MACHINE_H
+#define __ASM_MACH_LOONGSON2EF_MACHINE_H
 
 #ifdef CONFIG_LEMOTE_FULOONG2E
 
@@ -20,10 +20,4 @@
 
 #endif
 
-#ifdef CONFIG_LOONGSON_MACH3X
-
-#define LOONGSON_MACHTYPE MACH_LOONGSON_GENERIC
-
-#endif /* CONFIG_LOONGSON_MACH3X */
-
-#endif /* __ASM_MACH_LOONGSON64_MACHINE_H */
+#endif /* __ASM_MACH_LOONGSON2EF_MACHINE_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
index ebdccfee50be..00d602629a55 100644
--- a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
@@ -7,8 +7,8 @@
  *
  * RTC routines for PC style attached Dallas chip.
  */
-#ifndef __ASM_MACH_LOONGSON64_MC146818RTC_H
-#define __ASM_MACH_LOONGSON64_MC146818RTC_H
+#ifndef __ASM_MACH_LOONGSON2EF_MC146818RTC_H
+#define __ASM_MACH_LOONGSON2EF_MC146818RTC_H
 
 #include <linux/io.h>
 
@@ -33,4 +33,4 @@ static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
 #define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1970)
 #endif
 
-#endif /* __ASM_MACH_LOONGSON64_MC146818RTC_H */
+#endif /* __ASM_MACH_LOONGSON2EF_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/mem.h b/arch/mips/include/asm/mach-loongson2ef/mem.h
index ce33c174c04d..d1d759b8974e 100644
--- a/arch/mips/include/asm/mach-loongson2ef/mem.h
+++ b/arch/mips/include/asm/mach-loongson2ef/mem.h
@@ -4,8 +4,8 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_MEM_H
-#define __ASM_MACH_LOONGSON64_MEM_H
+#ifndef __ASM_MACH_LOONGSON2EF_MEM_H
+#define __ASM_MACH_LOONGSON2EF_MEM_H
 
 /*
  * high memory space
@@ -34,4 +34,4 @@
 #define LOONGSON_MMIO_MEM_END	0x80000000
 #endif
 
-#endif /* __ASM_MACH_LOONGSON64_MEM_H */
+#endif /* __ASM_MACH_LOONGSON2EF_MEM_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/mmzone.h b/arch/mips/include/asm/mach-loongson2ef/mmzone.h
deleted file mode 100644
index 62073d60739f..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/mmzone.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2010 Loongson Inc. & Lemote Inc. &
- *                    Institute of Computing Technology
- * Author:  Xiang Gao, gaoxiang@ict.ac.cn
- *          Huacai Chen, chenhc@lemote.com
- *          Xiaofu Meng, Shuangshuang Zhang
- */
-#ifndef _ASM_MACH_MMZONE_H
-#define _ASM_MACH_MMZONE_H
-
-#include <boot_param.h>
-#define NODE_ADDRSPACE_SHIFT 44
-#define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
-#define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
-#define NODE2_ADDRSPACE_OFFSET 0x200000000000UL
-#define NODE3_ADDRSPACE_OFFSET 0x300000000000UL
-
-#define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
-#define nid_to_addrbase(nid) ((nid) << NODE_ADDRSPACE_SHIFT)
-
-#define LEVELS_PER_SLICE 128
-
-struct slice_data {
-	unsigned long irq_enable_mask[2];
-	int level_to_irq[LEVELS_PER_SLICE];
-};
-
-struct hub_data {
-	cpumask_t	h_cpus;
-	unsigned long slice_map;
-	unsigned long irq_alloc_mask[2];
-	struct slice_data slice[2];
-};
-
-struct node_data {
-	struct pglist_data pglist;
-	struct hub_data hub;
-	cpumask_t cpumask;
-};
-
-extern struct node_data *__node_data[];
-
-#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
-#define hub_data(n)		(&__node_data[(n)]->hub)
-
-extern void setup_zero_pages(void);
-extern void __init prom_init_numa_memory(void);
-
-#endif /* _ASM_MACH_MMZONE_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/pci.h b/arch/mips/include/asm/mach-loongson2ef/pci.h
index 05cc9052772f..5588c5bc5395 100644
--- a/arch/mips/include/asm/mach-loongson2ef/pci.h
+++ b/arch/mips/include/asm/mach-loongson2ef/pci.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2009 Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_PCI_H_
-#define __ASM_MACH_LOONGSON64_PCI_H_
+#ifndef __ASM_MACH_LOONGSON2EF_PCI_H_
+#define __ASM_MACH_LOONGSON2EF_PCI_H_
 
 extern struct pci_ops loongson_pci_ops;
 
@@ -35,16 +35,12 @@ extern struct pci_ops loongson_pci_ops;
 #else	/* loongson2f/32bit & loongson2e */
 
 /* this pci memory space is mapped by pcimap in pci.c */
-#ifdef CONFIG_CPU_LOONGSON64
-#define LOONGSON_PCI_MEM_START	0x40000000UL
-#define LOONGSON_PCI_MEM_END	0x7effffffUL
-#else
 #define LOONGSON_PCI_MEM_START	LOONGSON_PCILO1_BASE
 #define LOONGSON_PCI_MEM_END	(LOONGSON_PCILO1_BASE + 0x04000000 * 2)
-#endif
+
 /* this is an offset from mips_io_port_base */
 #define LOONGSON_PCI_IO_START	0x00004000UL
 
 #endif	/* !CONFIG_CPU_SUPPORTS_ADDRWINCFG */
 
-#endif /* !__ASM_MACH_LOONGSON64_PCI_H_ */
+#endif /* !__ASM_MACH_LOONGSON2EF_PCI_H_ */
diff --git a/arch/mips/include/asm/mach-loongson2ef/spaces.h b/arch/mips/include/asm/mach-loongson2ef/spaces.h
index e85bc1d9c4f2..ba4e8e9b618e 100644
--- a/arch/mips/include/asm/mach-loongson2ef/spaces.h
+++ b/arch/mips/include/asm/mach-loongson2ef/spaces.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MACH_LOONGSON64_SPACES_H_
-#define __ASM_MACH_LOONGSON64_SPACES_H_
+#ifndef __ASM_MACH_LOONGSON2EF_SPACES_H_
+#define __ASM_MACH_LOONGSON2EF_SPACES_H_
 
 #if defined(CONFIG_64BIT)
 #define CAC_BASE        _AC(0x9800000000000000, UL)
diff --git a/arch/mips/include/asm/mach-loongson2ef/topology.h b/arch/mips/include/asm/mach-loongson2ef/topology.h
deleted file mode 100644
index 7ff819ab308a..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/topology.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_MACH_TOPOLOGY_H
-#define _ASM_MACH_TOPOLOGY_H
-
-#ifdef CONFIG_NUMA
-
-#define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
-#define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
-
-struct pci_bus;
-extern int pcibus_to_node(struct pci_bus *);
-
-#define cpumask_of_pcibus(bus)	(cpu_online_mask)
-
-extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
-
-#define node_distance(from, to)	(__node_distances[(from)][(to)])
-
-#endif
-
-#include <asm-generic/topology.h>
-
-#endif /* _ASM_MACH_TOPOLOGY_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/workarounds.h b/arch/mips/include/asm/mach-loongson2ef/workarounds.h
deleted file mode 100644
index 17b71172a097..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/workarounds.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MACH_LOONGSON64_WORKAROUNDS_H_
-#define __ASM_MACH_LOONGSON64_WORKAROUNDS_H_
-
-#define WORKAROUND_CPUFREQ	0x00000001
-#define WORKAROUND_CPUHOTPLUG	0x00000002
-
-#endif
diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
index 007bd023a4e9..66a584a833e5 100644
--- a/arch/mips/loongson2ef/Kconfig
+++ b/arch/mips/loongson2ef/Kconfig
@@ -90,7 +90,4 @@ config LOONGSON_MC146818
 	bool
 	default n
 
-config LEFI_FIRMWARE_INTERFACE
-	bool
-
 endif # MACH_LOONGSON2EF
diff --git a/arch/mips/loongson2ef/common/early_printk.c b/arch/mips/loongson2ef/common/early_printk.c
index 5e2a151aa30c..d90c5e5a0e78 100644
--- a/arch/mips/loongson2ef/common/early_printk.c
+++ b/arch/mips/loongson2ef/common/early_printk.c
@@ -27,7 +27,7 @@ void prom_putchar(char c)
 	int timeout;
 	unsigned char *uart_base;
 
-	uart_base = (unsigned char *)_loongson_uart_base[0];
+	uart_base = (unsigned char *)_loongson_uart_base;
 	timeout = 1024;
 
 	while (((serial_in(uart_base, UART_LSR) & UART_LSR_THRE) == 0) &&
diff --git a/arch/mips/loongson2ef/common/env.c b/arch/mips/loongson2ef/common/env.c
index 09d5cf4676ca..29c5fecb8282 100644
--- a/arch/mips/loongson2ef/common/env.c
+++ b/arch/mips/loongson2ef/common/env.c
@@ -16,17 +16,9 @@
 #include <linux/export.h>
 #include <asm/bootinfo.h>
 #include <loongson.h>
-#include <boot_param.h>
-#include <workarounds.h>
 
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
-struct efi_memory_map_loongson *loongson_memmap;
-struct loongson_system_configuration loongson_sysconf;
-
-u64 loongson_chipcfg[MAX_PACKAGES] = {0xffffffffbfc00180};
-u64 loongson_chiptemp[MAX_PACKAGES];
-u64 loongson_freqctrl[MAX_PACKAGES];
 
 unsigned long long smp_group[4];
 
@@ -42,8 +34,6 @@ void __init prom_init_env(void)
 {
 	/* pmon passes arguments in 32bit pointers */
 	unsigned int processor_id;
-
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 	int *_prom_envp;
 	long l;
 
@@ -61,128 +51,8 @@ void __init prom_init_env(void)
 	if (memsize == 0)
 		memsize = 256;
 
-	loongson_sysconf.nr_uarts = 1;
-
 	pr_info("memsize=%u, highmemsize=%u\n", memsize, highmemsize);
-#else
-	struct boot_params *boot_p;
-	struct loongson_params *loongson_p;
-	struct system_loongson *esys;
-	struct efi_cpuinfo_loongson *ecpu;
-	struct irq_source_routing_table *eirq_source;
-
-	/* firmware arguments are initialized in head.S */
-	boot_p = (struct boot_params *)fw_arg2;
-	loongson_p = &(boot_p->efi.smbios.lp);
-
-	esys = (struct system_loongson *)
-		((u64)loongson_p + loongson_p->system_offset);
-	ecpu = (struct efi_cpuinfo_loongson *)
-		((u64)loongson_p + loongson_p->cpu_offset);
-	eirq_source = (struct irq_source_routing_table *)
-		((u64)loongson_p + loongson_p->irq_offset);
-	loongson_memmap = (struct efi_memory_map_loongson *)
-		((u64)loongson_p + loongson_p->memory_offset);
-
-	cpu_clock_freq = ecpu->cpu_clock_freq;
-	loongson_sysconf.cputype = ecpu->cputype;
-	switch (ecpu->cputype) {
-	case Legacy_3A:
-	case Loongson_3A:
-		loongson_sysconf.cores_per_node = 4;
-		loongson_sysconf.cores_per_package = 4;
-		smp_group[0] = 0x900000003ff01000;
-		smp_group[1] = 0x900010003ff01000;
-		smp_group[2] = 0x900020003ff01000;
-		smp_group[3] = 0x900030003ff01000;
-		loongson_chipcfg[0] = 0x900000001fe00180;
-		loongson_chipcfg[1] = 0x900010001fe00180;
-		loongson_chipcfg[2] = 0x900020001fe00180;
-		loongson_chipcfg[3] = 0x900030001fe00180;
-		loongson_chiptemp[0] = 0x900000001fe0019c;
-		loongson_chiptemp[1] = 0x900010001fe0019c;
-		loongson_chiptemp[2] = 0x900020001fe0019c;
-		loongson_chiptemp[3] = 0x900030001fe0019c;
-		loongson_freqctrl[0] = 0x900000001fe001d0;
-		loongson_freqctrl[1] = 0x900010001fe001d0;
-		loongson_freqctrl[2] = 0x900020001fe001d0;
-		loongson_freqctrl[3] = 0x900030001fe001d0;
-		loongson_sysconf.ht_control_base = 0x90000EFDFB000000;
-		loongson_sysconf.workarounds = WORKAROUND_CPUFREQ;
-		break;
-	case Legacy_3B:
-	case Loongson_3B:
-		loongson_sysconf.cores_per_node = 4; /* One chip has 2 nodes */
-		loongson_sysconf.cores_per_package = 8;
-		smp_group[0] = 0x900000003ff01000;
-		smp_group[1] = 0x900010003ff05000;
-		smp_group[2] = 0x900020003ff09000;
-		smp_group[3] = 0x900030003ff0d000;
-		loongson_chipcfg[0] = 0x900000001fe00180;
-		loongson_chipcfg[1] = 0x900020001fe00180;
-		loongson_chipcfg[2] = 0x900040001fe00180;
-		loongson_chipcfg[3] = 0x900060001fe00180;
-		loongson_chiptemp[0] = 0x900000001fe0019c;
-		loongson_chiptemp[1] = 0x900020001fe0019c;
-		loongson_chiptemp[2] = 0x900040001fe0019c;
-		loongson_chiptemp[3] = 0x900060001fe0019c;
-		loongson_freqctrl[0] = 0x900000001fe001d0;
-		loongson_freqctrl[1] = 0x900020001fe001d0;
-		loongson_freqctrl[2] = 0x900040001fe001d0;
-		loongson_freqctrl[3] = 0x900060001fe001d0;
-		loongson_sysconf.ht_control_base = 0x90001EFDFB000000;
-		loongson_sysconf.workarounds = WORKAROUND_CPUHOTPLUG;
-		break;
-	default:
-		loongson_sysconf.cores_per_node = 1;
-		loongson_sysconf.cores_per_package = 1;
-		loongson_chipcfg[0] = 0x900000001fe00180;
-	}
 
-	loongson_sysconf.nr_cpus = ecpu->nr_cpus;
-	loongson_sysconf.boot_cpu_id = ecpu->cpu_startup_core_id;
-	loongson_sysconf.reserved_cpus_mask = ecpu->reserved_cores_mask;
-	if (ecpu->nr_cpus > NR_CPUS || ecpu->nr_cpus == 0)
-		loongson_sysconf.nr_cpus = NR_CPUS;
-	loongson_sysconf.nr_nodes = (loongson_sysconf.nr_cpus +
-		loongson_sysconf.cores_per_node - 1) /
-		loongson_sysconf.cores_per_node;
-
-	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
-	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
-	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
-	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
-	if (loongson_sysconf.dma_mask_bits < 32 ||
-		loongson_sysconf.dma_mask_bits > 64)
-		loongson_sysconf.dma_mask_bits = 32;
-
-	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
-	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
-	loongson_sysconf.suspend_addr = boot_p->reset_system.DoSuspend;
-
-	loongson_sysconf.vgabios_addr = boot_p->efi.smbios.vga_bios;
-	pr_debug("Shutdown Addr: %llx, Restart Addr: %llx, VBIOS Addr: %llx\n",
-		loongson_sysconf.poweroff_addr, loongson_sysconf.restart_addr,
-		loongson_sysconf.vgabios_addr);
-
-	memset(loongson_sysconf.ecname, 0, 32);
-	if (esys->has_ec)
-		memcpy(loongson_sysconf.ecname, esys->ec_name, 32);
-	loongson_sysconf.workarounds |= esys->workarounds;
-
-	loongson_sysconf.nr_uarts = esys->nr_uarts;
-	if (esys->nr_uarts < 1 || esys->nr_uarts > MAX_UARTS)
-		loongson_sysconf.nr_uarts = 1;
-	memcpy(loongson_sysconf.uarts, esys->uarts,
-		sizeof(struct uart_device) * loongson_sysconf.nr_uarts);
-
-	loongson_sysconf.nr_sensors = esys->nr_sensors;
-	if (loongson_sysconf.nr_sensors > MAX_SENSORS)
-		loongson_sysconf.nr_sensors = 0;
-	if (loongson_sysconf.nr_sensors)
-		memcpy(loongson_sysconf.sensors, esys->sensors,
-			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
-#endif
 	if (cpu_clock_freq == 0) {
 		processor_id = (&current_cpu_data)->processor_id;
 		switch (processor_id & PRID_REV_MASK) {
@@ -192,17 +62,6 @@ void __init prom_init_env(void)
 		case PRID_REV_LOONGSON2F:
 			cpu_clock_freq = 797000000;
 			break;
-		case PRID_REV_LOONGSON3A_R1:
-		case PRID_REV_LOONGSON3A_R2_0:
-		case PRID_REV_LOONGSON3A_R2_1:
-		case PRID_REV_LOONGSON3A_R3_0:
-		case PRID_REV_LOONGSON3A_R3_1:
-			cpu_clock_freq = 900000000;
-			break;
-		case PRID_REV_LOONGSON3B_R1:
-		case PRID_REV_LOONGSON3B_R2:
-			cpu_clock_freq = 1000000000;
-			break;
 		default:
 			cpu_clock_freq = 100000000;
 			break;
diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
index 912fe61c4fc7..a45430365729 100644
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -38,12 +38,7 @@ void __init prom_init(void)
 	/* init base address of io space */
 	set_io_port_base((unsigned long)
 		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
-
-#ifdef CONFIG_NUMA
-	prom_init_numa_memory();
-#else
 	prom_init_memory();
-#endif
 
 	/*init the uart base address */
 	prom_init_uart_base();
diff --git a/arch/mips/loongson2ef/common/machtype.c b/arch/mips/loongson2ef/common/machtype.c
index 4e42d929f1c7..82f6de49f20f 100644
--- a/arch/mips/loongson2ef/common/machtype.c
+++ b/arch/mips/loongson2ef/common/machtype.c
@@ -23,7 +23,6 @@ static const char *system_types[] = {
 	[MACH_DEXXON_GDIUM2F10]	= "dexxon-gdium-2f",
 	[MACH_LEMOTE_NAS]	= "lemote-nas-2f",
 	[MACH_LEMOTE_LL2F]	= "lemote-lynloong-2f",
-	[MACH_LOONGSON_GENERIC]	= "generic-loongson-machine",
 	[MACH_LOONGSON_END]	= NULL,
 };
 
diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
index 4254ac4ec616..11bf6eefb82a 100644
--- a/arch/mips/loongson2ef/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -9,11 +9,9 @@
 #include <asm/bootinfo.h>
 
 #include <loongson.h>
-#include <boot_param.h>
 #include <mem.h>
 #include <pci.h>
 
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 
 u32 memsize, highmemsize;
 
@@ -52,41 +50,6 @@ void __init prom_init_memory(void)
 #endif /* !CONFIG_64BIT */
 }
 
-#else /* CONFIG_LEFI_FIRMWARE_INTERFACE */
-
-void __init prom_init_memory(void)
-{
-	int i;
-	u32 node_id;
-	u32 mem_type;
-
-	/* parse memory information */
-	for (i = 0; i < loongson_memmap->nr_map; i++) {
-		node_id = loongson_memmap->map[i].node_id;
-		mem_type = loongson_memmap->map[i].mem_type;
-
-		if (node_id != 0)
-			continue;
-
-		switch (mem_type) {
-		case SYSTEM_RAM_LOW:
-			memblock_add(loongson_memmap->map[i].mem_start,
-				(u64)loongson_memmap->map[i].mem_size << 20);
-			break;
-		case SYSTEM_RAM_HIGH:
-			memblock_add(loongson_memmap->map[i].mem_start,
-				(u64)loongson_memmap->map[i].mem_size << 20);
-			break;
-		case SYSTEM_RAM_RESERVED:
-			memblock_reserve(loongson_memmap->map[i].mem_start,
-				(u64)loongson_memmap->map[i].mem_size << 20);
-			break;
-		}
-	}
-}
-
-#endif /* CONFIG_LEFI_FIRMWARE_INTERFACE */
-
 /* override of arch/mips/mm/cache.c: __uncached_access */
 int __uncached_access(struct file *file, unsigned long addr)
 {
diff --git a/arch/mips/loongson2ef/common/pci.c b/arch/mips/loongson2ef/common/pci.c
index 2d9755c49524..200916925e95 100644
--- a/arch/mips/loongson2ef/common/pci.c
+++ b/arch/mips/loongson2ef/common/pci.c
@@ -7,7 +7,6 @@
 
 #include <pci.h>
 #include <loongson.h>
-#include <boot_param.h>
 
 static struct resource loongson_pci_mem_resource = {
 	.name	= "pci memory space",
@@ -81,15 +80,8 @@ static int __init pcibios_init(void)
 	setup_pcimap();
 
 	loongson_pci_controller.io_map_base = mips_io_port_base;
-#ifdef CONFIG_LEFI_FIRMWARE_INTERFACE
-	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
-	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
-#endif
 	register_pci_controller(&loongson_pci_controller);
 
-#ifdef CONFIG_CPU_LOONGSON64
-	sbx00_acpi_init();
-#endif
 
 	return 0;
 }
diff --git a/arch/mips/loongson2ef/common/pm.c b/arch/mips/loongson2ef/common/pm.c
index b8aed878d912..11f4cfd581fb 100644
--- a/arch/mips/loongson2ef/common/pm.c
+++ b/arch/mips/loongson2ef/common/pm.c
@@ -75,7 +75,7 @@ int __weak wakeup_loongson(void)
 static void wait_for_wakeup_events(void)
 {
 	while (!wakeup_loongson())
-		LOONGSON_CHIPCFG(0) &= ~0x7;
+		writel(readl(LOONGSON_CHIPCFG) & ~0x7, LOONGSON_CHIPCFG);
 }
 
 /*
@@ -98,15 +98,16 @@ static void loongson_suspend_enter(void)
 
 	stop_perf_counters();
 
-	cached_cpu_freq = LOONGSON_CHIPCFG(0);
+	cached_cpu_freq = readl(LOONGSON_CHIPCFG);
 
 	/* Put CPU into wait mode */
-	LOONGSON_CHIPCFG(0) &= ~0x7;
+	writel(readl(LOONGSON_CHIPCFG) & ~0x7, LOONGSON_CHIPCFG);
 
 	/* wait for the given events to wakeup cpu from wait mode */
 	wait_for_wakeup_events();
 
-	LOONGSON_CHIPCFG(0) = cached_cpu_freq;
+	writel(cached_cpu_freq, LOONGSON_CHIPCFG);
+
 	mmiowb();
 }
 
diff --git a/arch/mips/loongson2ef/common/reset.c b/arch/mips/loongson2ef/common/reset.c
index ce39e918e4d5..e7c87161ce00 100644
--- a/arch/mips/loongson2ef/common/reset.c
+++ b/arch/mips/loongson2ef/common/reset.c
@@ -13,7 +13,6 @@
 #include <asm/reboot.h>
 
 #include <loongson.h>
-#include <boot_param.h>
 
 static inline void loongson_reboot(void)
 {
@@ -35,26 +34,15 @@ static inline void loongson_reboot(void)
 
 static void loongson_restart(char *command)
 {
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 	/* do preparation for reboot */
 	mach_prepare_reboot();
 
 	/* reboot via jumping to boot base address */
 	loongson_reboot();
-#else
-	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
-
-	fw_restart();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
-#endif
 }
 
 static void loongson_poweroff(void)
 {
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 	mach_prepare_shutdown();
 
 	/*
@@ -62,15 +50,6 @@ static void loongson_poweroff(void)
 	 * a generic delay loop, machine_hang(), so simply return.
 	 */
 	return;
-#else
-	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
-
-	fw_poweroff();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
-#endif
 }
 
 static void loongson_halt(void)
diff --git a/arch/mips/loongson2ef/common/serial.c b/arch/mips/loongson2ef/common/serial.c
index 98c3a7feb10f..ac4f6e3ebc3e 100644
--- a/arch/mips/loongson2ef/common/serial.c
+++ b/arch/mips/loongson2ef/common/serial.c
@@ -38,16 +38,15 @@
 	.regshift	= 0,					\
 }
 
-static struct plat_serial8250_port uart8250_data[][MAX_UARTS + 1] = {
+static struct plat_serial8250_port uart8250_data[MACH_LOONGSON_END + 1] = {
 	[MACH_LOONGSON_UNKNOWN]	= {},
-	[MACH_LEMOTE_FL2E]	= {PORT(4, 1843200), {} },
-	[MACH_LEMOTE_FL2F]	= {PORT(3, 1843200), {} },
-	[MACH_LEMOTE_ML2F7]	= {PORT_M(3, 3686400), {} },
-	[MACH_LEMOTE_YL2F89]	= {PORT_M(3, 3686400), {} },
-	[MACH_DEXXON_GDIUM2F10]	= {PORT_M(3, 3686400), {} },
-	[MACH_LEMOTE_NAS]	= {PORT_M(3, 3686400), {} },
-	[MACH_LEMOTE_LL2F]	= {PORT(3, 1843200), {} },
-	[MACH_LOONGSON_GENERIC]	= {PORT_M(2, 25000000), {} },
+	[MACH_LEMOTE_FL2E]	= PORT(4, 1843200),
+	[MACH_LEMOTE_FL2F]	= PORT(3, 1843200),
+	[MACH_LEMOTE_ML2F7]	= PORT_M(3, 3686400),
+	[MACH_LEMOTE_YL2F89]	= PORT_M(3, 3686400),
+	[MACH_DEXXON_GDIUM2F10]	= PORT_M(3, 3686400),
+	[MACH_LEMOTE_NAS]	= PORT_M(3, 3686400),
+	[MACH_LEMOTE_LL2F]	= PORT(3, 1843200),
 	[MACH_LOONGSON_END]	= {},
 };
 
@@ -58,53 +57,23 @@ static struct platform_device uart8250_device = {
 
 static int __init serial_init(void)
 {
-	int i;
 	unsigned char iotype;
 
-	iotype = uart8250_data[mips_machtype][0].iotype;
+	iotype = uart8250_data[mips_machtype].iotype;
 
 	if (UPIO_MEM == iotype) {
-		uart8250_data[mips_machtype][0].mapbase =
-			loongson_uart_base[0];
-		uart8250_data[mips_machtype][0].membase =
-			(void __iomem *)_loongson_uart_base[0];
+		uart8250_data[mips_machtype].mapbase =
+			loongson_uart_base;
+		uart8250_data[mips_machtype].membase =
+			(void __iomem *)_loongson_uart_base;
 	}
 	else if (UPIO_PORT == iotype)
-		uart8250_data[mips_machtype][0].iobase =
-			loongson_uart_base[0] - LOONGSON_PCIIO_BASE;
+		uart8250_data[mips_machtype].iobase =
+			loongson_uart_base - LOONGSON_PCIIO_BASE;
 
-	if (loongson_sysconf.uarts[0].uartclk)
-		uart8250_data[mips_machtype][0].uartclk =
-			loongson_sysconf.uarts[0].uartclk;
-
-	for (i = 1; i < loongson_sysconf.nr_uarts; i++) {
-		iotype = loongson_sysconf.uarts[i].iotype;
-		uart8250_data[mips_machtype][i].iotype = iotype;
-		loongson_uart_base[i] = loongson_sysconf.uarts[i].uart_base;
-
-		if (UPIO_MEM == iotype) {
-			uart8250_data[mips_machtype][i].irq =
-				MIPS_CPU_IRQ_BASE + loongson_sysconf.uarts[i].int_offset;
-			uart8250_data[mips_machtype][i].mapbase =
-				loongson_uart_base[i];
-			uart8250_data[mips_machtype][i].membase =
-				ioremap_nocache(loongson_uart_base[i], 8);
-		} else if (UPIO_PORT == iotype) {
-			uart8250_data[mips_machtype][i].irq =
-				loongson_sysconf.uarts[i].int_offset;
-			uart8250_data[mips_machtype][i].iobase =
-				loongson_uart_base[i] - LOONGSON_PCIIO_BASE;
-		}
-
-		uart8250_data[mips_machtype][i].uartclk =
-			loongson_sysconf.uarts[i].uartclk;
-		uart8250_data[mips_machtype][i].flags =
-			UPF_BOOT_AUTOCONF | UPF_SKIP_TEST;
-	}
-
-	memset(&uart8250_data[mips_machtype][loongson_sysconf.nr_uarts],
-			0, sizeof(struct plat_serial8250_port));
-	uart8250_device.dev.platform_data = uart8250_data[mips_machtype];
+	memset(&uart8250_data[mips_machtype + 1], 0,
+			sizeof(struct plat_serial8250_port));
+	uart8250_device.dev.platform_data = &uart8250_data[mips_machtype];
 
 	return platform_device_register(&uart8250_device);
 }
diff --git a/arch/mips/loongson2ef/common/setup.c b/arch/mips/loongson2ef/common/setup.c
index bc2da4c140c4..4fd27f4f90ed 100644
--- a/arch/mips/loongson2ef/common/setup.c
+++ b/arch/mips/loongson2ef/common/setup.c
@@ -11,11 +11,6 @@
 
 #include <loongson.h>
 
-#ifdef CONFIG_VT
-#include <linux/console.h>
-#include <linux/screen_info.h>
-#endif
-
 static void wbflush_loongson(void)
 {
 	asm(".set\tpush\n\t"
@@ -32,20 +27,4 @@ EXPORT_SYMBOL(__wbflush);
 
 void __init plat_mem_setup(void)
 {
-#ifdef CONFIG_VT
-#if defined(CONFIG_VGA_CONSOLE)
-	conswitchp = &vga_con;
-
-	screen_info = (struct screen_info) {
-		.orig_x			= 0,
-		.orig_y			= 25,
-		.orig_video_cols	= 80,
-		.orig_video_lines	= 25,
-		.orig_video_isVGA	= VIDEO_TYPE_VGAC,
-		.orig_video_points	= 16,
-	};
-#elif defined(CONFIG_DUMMY_CONSOLE)
-	conswitchp = &dummy_con;
-#endif
-#endif
 }
diff --git a/arch/mips/loongson2ef/common/time.c b/arch/mips/loongson2ef/common/time.c
index e78760ce475b..585741af42a9 100644
--- a/arch/mips/loongson2ef/common/time.c
+++ b/arch/mips/loongson2ef/common/time.c
@@ -18,11 +18,7 @@ void __init plat_time_init(void)
 	/* setup mips r4k timer */
 	mips_hpt_frequency = cpu_clock_freq / 2;
 
-#ifdef CONFIG_RS780_HPET
-	setup_hpet_timer();
-#else
 	setup_mfgpt0_timer();
-#endif
 }
 
 void read_persistent_clock64(struct timespec64 *ts)
diff --git a/arch/mips/loongson2ef/common/uart_base.c b/arch/mips/loongson2ef/common/uart_base.c
index e88d937f10fe..bbfe1095a843 100644
--- a/arch/mips/loongson2ef/common/uart_base.c
+++ b/arch/mips/loongson2ef/common/uart_base.c
@@ -10,9 +10,9 @@
 #include <loongson.h>
 
 /* raw */
-unsigned long loongson_uart_base[MAX_UARTS] = {};
+unsigned long loongson_uart_base;
 /* ioremapped */
-unsigned long _loongson_uart_base[MAX_UARTS] = {};
+unsigned long _loongson_uart_base;
 
 EXPORT_SYMBOL(loongson_uart_base);
 EXPORT_SYMBOL(_loongson_uart_base);
@@ -20,16 +20,12 @@ EXPORT_SYMBOL(_loongson_uart_base);
 void prom_init_loongson_uart_base(void)
 {
 	switch (mips_machtype) {
-	case MACH_LOONGSON_GENERIC:
-		/* The CPU provided serial port (CPU) */
-		loongson_uart_base[0] = LOONGSON_REG_BASE + 0x1e0;
-		break;
 	case MACH_LEMOTE_FL2E:
-		loongson_uart_base[0] = LOONGSON_PCIIO_BASE + 0x3f8;
+		loongson_uart_base = LOONGSON_PCIIO_BASE + 0x3f8;
 		break;
 	case MACH_LEMOTE_FL2F:
 	case MACH_LEMOTE_LL2F:
-		loongson_uart_base[0] = LOONGSON_PCIIO_BASE + 0x2f8;
+		loongson_uart_base = LOONGSON_PCIIO_BASE + 0x2f8;
 		break;
 	case MACH_LEMOTE_ML2F7:
 	case MACH_LEMOTE_YL2F89:
@@ -37,10 +33,9 @@ void prom_init_loongson_uart_base(void)
 	case MACH_LEMOTE_NAS:
 	default:
 		/* The CPU provided serial port (LPC) */
-		loongson_uart_base[0] = LOONGSON_LIO1_BASE + 0x3f8;
+		loongson_uart_base = LOONGSON_LIO1_BASE + 0x3f8;
 		break;
 	}
 
-	_loongson_uart_base[0] =
-		(unsigned long)ioremap_nocache(loongson_uart_base[0], 8);
+	_loongson_uart_base = TO_UNCAC(loongson_uart_base);
 }
diff --git a/arch/mips/loongson2ef/lemote-2f/clock.c b/arch/mips/loongson2ef/lemote-2f/clock.c
index 1ced30e7aeef..414f282c8ab5 100644
--- a/arch/mips/loongson2ef/lemote-2f/clock.c
+++ b/arch/mips/loongson2ef/lemote-2f/clock.c
@@ -118,9 +118,9 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 
 	clk->rate = rate;
 
-	regval = LOONGSON_CHIPCFG(0);
+	regval = readl(LOONGSON_CHIPCFG);
 	regval = (regval & ~0x7) | (pos->driver_data - 1);
-	LOONGSON_CHIPCFG(0) = regval;
+	writel(regval, LOONGSON_CHIPCFG);
 
 	return ret;
 }
diff --git a/arch/mips/loongson2ef/lemote-2f/reset.c b/arch/mips/loongson2ef/lemote-2f/reset.c
index 0db0934302ea..197dae4ffd23 100644
--- a/arch/mips/loongson2ef/lemote-2f/reset.c
+++ b/arch/mips/loongson2ef/lemote-2f/reset.c
@@ -24,7 +24,7 @@ static void reset_cpu(void)
 	 * reset cpu to full speed, this is needed when enabling cpu frequency
 	 * scalling
 	 */
-	LOONGSON_CHIPCFG(0) |= 0x7;
+	writel(readl(LOONGSON_CHIPCFG) | 0x7, LOONGSON_CHIPCFG);
 }
 
 /* reset support for fuloong2f */
-- 
2.23.0

