Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8969119775B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgC3JB0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:01:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34102 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729704AbgC3JBZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:01:25 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz91htYFeHZohAA--.15S2;
        Mon, 30 Mar 2020 17:01:21 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 39/39] MIPS: Remove HAVE_MACH_HEAD_FILES option
Date:   Mon, 30 Mar 2020 05:01:21 -0400
Message-Id: <1585558881-15961-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxz91htYFeHZohAA--.15S2
X-Coremail-Antispam: 1UD129KBjvAXoW3ZF4DKr13Cr4fWw4fKFy7trb_yoW8Cr1kZo
        Z7K3Z2kr4Fy3yfGF13WF1YkayrZF9agr48Za9xGwsrJF9xJa43t34F9a4jqFy5Gr1ft3sr
        WrWfuFW5Jr18Xa4kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYe7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjc
        xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr
        0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
        1lIxAIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY
        6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU59iSJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All platform has HAVE_MACH_HEAD_FILES option enabled, now remove
this option

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                    | 40 ------------------------------------
 arch/mips/Makefile                   |  3 ---
 arch/mips/include/asm/addrspace.h    |  4 ----
 arch/mips/include/asm/cache.h        |  4 ----
 arch/mips/include/asm/cpu-features.h |  4 ----
 arch/mips/include/asm/fixmap.h       |  4 ----
 arch/mips/include/asm/floppy.h       |  4 ----
 arch/mips/include/asm/i8259.h        |  4 ----
 arch/mips/include/asm/ide.h          |  4 ----
 arch/mips/include/asm/io.h           |  5 -----
 arch/mips/include/asm/irq.h          |  4 ----
 arch/mips/include/asm/mc146818rtc.h  |  4 ----
 arch/mips/include/asm/mmzone.h       |  4 ----
 arch/mips/include/asm/page.h         |  4 ----
 arch/mips/include/asm/topology.h     |  4 ----
 arch/mips/include/asm/war.h          |  4 ----
 arch/mips/kernel/head.S              |  4 ----
 arch/mips/txx9/Kconfig               |  2 --
 drivers/gpio/gpio-loongson.c         |  4 ----
 19 files changed, 110 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3c85656..a1f973c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -144,7 +144,6 @@ config MIPS_GENERIC
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Select this to build a kernel which aims to support multiple boards,
 	  generally using a flattened device tree passed from the bootloader
@@ -164,7 +163,6 @@ config MIPS_ALCHEMY
 	select GPIOLIB
 	select SYS_SUPPORTS_ZBOOT
 	select COMMON_CLK
-	select HAVE_MACH_HEAD_FILES
 
 config AR7
 	bool "Texas Instruments AR7"
@@ -184,7 +182,6 @@ config AR7
 	select GPIOLIB
 	select VLYNQ
 	select HAVE_CLK
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for the Texas Instruments AR7 System-on-a-Chip
 	  family: TNETD7100, 7200 and 7300.
@@ -200,7 +197,6 @@ config ATH25
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_HAS_EARLY_PRINTK
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for Atheros AR231x and Atheros AR531x based boards
 
@@ -225,7 +221,6 @@ config ATH79
 	select SYS_SUPPORTS_ZBOOT_UART_PROM
 	select USE_OF
 	select USB_EHCI_ROOT_HUB_TT if USB_EHCI_HCD_PLATFORM
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for the Atheros AR71XX/AR724X/AR913X SoCs.
 
@@ -260,7 +255,6 @@ config BMIPS_GENERIC
 	select USB_OHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_OHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select HARDIRQS_SW_RESEND
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Build a generic DT-based kernel image that boots on select
 	  BCM33xx cable modem chips, BCM63xx DSL chips, and BCM7xxx set-top
@@ -288,7 +282,6 @@ config BCM47XX
 	select BCM47XX_NVRAM
 	select BCM47XX_SPROM
 	select BCM47XX_SSB if !BCM47XX_BCMA
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for BCM47XX based boards
 
@@ -308,7 +301,6 @@ config BCM63XX
 	select HAVE_CLK
 	select MIPS_L1_CACHE_SHIFT_4
 	select CLKDEV_LOOKUP
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for BCM63XX based boards
 
@@ -330,7 +322,6 @@ config MIPS_COBALT
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select USE_GENERIC_EARLY_PRINTK_8250
-	select HAVE_MACH_HEAD_FILES
 
 config MACH_DECSTATION
 	bool "DECstations"
@@ -354,7 +345,6 @@ config MACH_DECSTATION
 	select SYS_SUPPORTS_256HZ
 	select SYS_SUPPORTS_1024HZ
 	select MIPS_L1_CACHE_SHIFT_4
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for DEC's MIPS based workstations.  For details
 	  see the Linux/MIPS FAQ on <http://www.linux-mips.org/> and the
@@ -392,7 +382,6 @@ config MACH_JAZZ
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_100HZ
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This a family of machines based on the MIPS R4030 chipset which was
 	  used by several vendors to build RISC/os and Windows NT workstations.
@@ -413,7 +402,6 @@ config MACH_INGENIC
 	select GENERIC_IRQ_CHIP
 	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
 	select USE_OF
-	select HAVE_MACH_HEAD_FILES
 
 config LANTIQ
 	bool "Lantiq based platforms"
@@ -438,7 +426,6 @@ config LANTIQ
 	select PINCTRL_LANTIQ
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
-	select HAVE_MACH_HEAD_FILES
 
 config LASAT
 	bool "LASAT Networks platforms"
@@ -456,12 +443,10 @@ config LASAT
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL if BROKEN
 	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select HAVE_MACH_HEAD_FILES
 
 config MACH_LOONGSON32
 	bool "Loongson 32-bit family of machines"
 	select SYS_SUPPORTS_ZBOOT
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the Loongson-1 family of machines.
 
@@ -472,7 +457,6 @@ config MACH_LOONGSON32
 config MACH_LOONGSON2EF
 	bool "Loongson-2E/F family of machines"
 	select SYS_SUPPORTS_ZBOOT
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables the support of early Loongson-2E/F family of machines.
 
@@ -507,7 +491,6 @@ config MACH_LOONGSON64
 	select COMMON_CLK
 	select USE_OF
 	select BUILTIN_DTB
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
@@ -542,7 +525,6 @@ config MACH_PISTACHIO
 	select SYS_HAS_EARLY_PRINTK
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select USE_OF
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the IMG Pistachio SoC platform.
 
@@ -599,14 +581,12 @@ config MIPS_MALTA
 	select SYS_SUPPORTS_ZBOOT
 	select USE_OF
 	select ZONE_DMA32 if 64BIT
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the MIPS Technologies Malta evaluation
 	  board.
 
 config MACH_PIC32
 	bool "Microchip PIC32 Family"
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the Microchip PIC32 family of platforms.
 
@@ -627,7 +607,6 @@ config MACH_VR41XX
 	select SYS_HAS_CPU_VR41XX
 	select SYS_SUPPORTS_MIPS16
 	select GPIOLIB
-	select HAVE_MACH_HEAD_FILES
 
 config NXP_STB220
 	bool "NXP STB220 board"
@@ -660,7 +639,6 @@ config PMC_MSP
 	select SERIAL_8250_CONSOLE
 	select USB_EHCI_BIG_ENDIAN_MMIO
 	select USB_EHCI_BIG_ENDIAN_DESC
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This adds support for the PMC-Sierra family of Multi-Service
 	  Processor System-On-A-Chips.  These parts include a number
@@ -684,7 +662,6 @@ config RALINK
 	select CLKDEV_LOOKUP
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
-	select HAVE_MACH_HEAD_FILES
 
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
@@ -718,7 +695,6 @@ config SGI_IP22
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select MIPS_L1_CACHE_SHIFT_7
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This are the SGI Indy, Challenge S and Indigo2, as well as certain
 	  OEM variants like the Tandem CMN B006S. To compile a Linux kernel
@@ -746,7 +722,6 @@ config SGI_IP27
 	select SYS_SUPPORTS_NUMA
 	select SYS_SUPPORTS_SMP
 	select MIPS_L1_CACHE_SHIFT_7
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y
@@ -781,7 +756,6 @@ config SGI_IP28
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select MIPS_L1_CACHE_SHIFT_7
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This is the SGI Indigo2 with R10000 processor.  To compile a Linux
 	  kernel that runs on these, say Y here.
@@ -809,7 +783,6 @@ config SGI_IP30
 	select SYS_SUPPORTS_SMP
 	select MIPS_L1_CACHE_SHIFT_7
 	select ARC_MEMORY
-	select HAVE_MACH_HEAD_FILES
 	help
 	  These are the SGI Octane and Octane2 graphics workstations.  To
 	  compile a Linux kernel that runs on these, say Y here.
@@ -835,7 +808,6 @@ config SGI_IP32
 	select SYS_HAS_CPU_NEVADA
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
-	select HAVE_MACH_HEAD_FILES
 	help
 	  If you want this kernel to run on SGI O2 workstation, say Y here.
 
@@ -958,7 +930,6 @@ config SNI_RM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select HAVE_MACH_HEAD_FILES
 	help
 	  The SNI RM200/300/400 are MIPS-based machines manufactured by
 	  Siemens Nixdorf Informationssysteme (SNI), parent company of Pyramid
@@ -985,7 +956,6 @@ config MIKROTIK_RB532
 	select BOOT_RAW
 	select GPIOLIB
 	select MIPS_L1_CACHE_SHIFT_4
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support the Mikrotik(tm) RouterBoard 532 series,
 	  based on the IDT RC32434 SoC.
@@ -1055,7 +1025,6 @@ config NLM_XLR_BOARD
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_SUPPORTS_ZBOOT_UART16550
-	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for systems based on Netlogic XLR and XLS processors.
 	  Say Y here if you have a XLR or XLS based board.
@@ -1084,7 +1053,6 @@ config NLM_XLP_BOARD
 	select USE_OF
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_SUPPORTS_ZBOOT_UART16550
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This board is based on Netlogic XLP Processor.
 	  Say Y here if you have a XLP based board.
@@ -1104,7 +1072,6 @@ config MIPS_PARAVIRT
 	select SYS_HAS_CPU_CAVIUM_OCTEON
 	select HAVE_PCI
 	select SWAP_IO_SPACE
-	select HAVE_MACH_HEAD_FILES
 	help
 	  This option supports guest running under ????
 
@@ -1150,10 +1117,6 @@ config SCHED_OMIT_FRAME_POINTER
 	bool
 	default y
 
-config HAVE_MACH_HEAD_FILES
-	bool
-	default n
-
 #
 # Select some configuration options automatically based on user selections.
 #
@@ -1381,7 +1344,6 @@ config SOC_EMMA2RH
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
-	select HAVE_MACH_HEAD_FILES
 
 config SOC_PNX833X
 	bool
@@ -1395,7 +1357,6 @@ config SOC_PNX833X
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_MIPS16
 	select CPU_MIPSR2_IRQ_VI
-	select HAVE_MACH_HEAD_FILES
 
 config SOC_PNX8335
 	bool
@@ -1807,7 +1768,6 @@ config CPU_CAVIUM_OCTEON
 	select USB_OHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select MIPS_L1_CACHE_SHIFT_7
 	select HAVE_KVM
-	select HAVE_MACH_HEAD_FILES
 	help
 	  The Cavium Octeon processor is a highly integrated chip containing
 	  many ethernet hardware widgets for networking tasks. The processor
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index dae3d53..d6f35a5 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -263,9 +263,6 @@ load-y					= $(CONFIG_PHYSICAL_START)
 endif
 
 entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
-ifndef CONFIG_HAVE_MACH_HEAD_FILES
-cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
-endif
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
 #
diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 9cf7926..cb7ce7f 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -10,11 +10,7 @@
 #ifndef _ASM_ADDRSPACE_H
 #define _ASM_ADDRSPACE_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/spaces.h>
-#else
-#include <spaces.h>
-#endif
 
 /*
  *  Configure language
diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index a0867f9..722eb4d 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -9,11 +9,7 @@
 #ifndef _ASM_CACHE_H
 #define _ASM_CACHE_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/kmalloc.h>
-#else
-#include <kmalloc.h>
-#endif
 
 #define L1_CACHE_SHIFT		CONFIG_MIPS_L1_CACHE_SHIFT
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index facd189..c49be09 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -12,11 +12,7 @@
 #include <asm/cpu.h>
 #include <asm/cpu-info.h>
 #include <asm/isa-rev.h>
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/cpu-feature-overrides.h>
-#else
-#include <cpu-feature-overrides.h>
-#endif
 
 #define __ase(ase)			(cpu_data[0].ases & (ase))
 #define __isa(isa)			(cpu_data[0].isa_level & (isa))
diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
index 1723929..ba08b10 100644
--- a/arch/mips/include/asm/fixmap.h
+++ b/arch/mips/include/asm/fixmap.h
@@ -14,11 +14,7 @@
 #define _ASM_FIXMAP_H
 
 #include <asm/page.h>
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/spaces.h>
-#else
-#include <spaces.h>
-#endif
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <asm/kmap_types.h>
diff --git a/arch/mips/include/asm/floppy.h b/arch/mips/include/asm/floppy.h
index 55fb950..86d37c6 100644
--- a/arch/mips/include/asm/floppy.h
+++ b/arch/mips/include/asm/floppy.h
@@ -51,10 +51,6 @@ static inline void fd_cacheflush(char * addr, long size)
 
 #define EXTRA_FLOPPY_PARAMS
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/floppy.h>
-#else
-#include <floppy.h>
-#endif
 
 #endif /* _ASM_FLOPPY_H */
diff --git a/arch/mips/include/asm/i8259.h b/arch/mips/include/asm/i8259.h
index f9b6518..868c4ca 100644
--- a/arch/mips/include/asm/i8259.h
+++ b/arch/mips/include/asm/i8259.h
@@ -14,11 +14,7 @@
 #include <linux/spinlock.h>
 
 #include <asm/io.h>
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/irq.h>
-#else
-#include <irq.h>
-#endif
 
 /* i8259A PIC registers */
 #define PIC_MASTER_CMD		0x20
diff --git a/arch/mips/include/asm/ide.h b/arch/mips/include/asm/ide.h
index 1302c7d..d89933d 100644
--- a/arch/mips/include/asm/ide.h
+++ b/arch/mips/include/asm/ide.h
@@ -8,11 +8,7 @@
 #ifndef __ASM_IDE_H
 #define __ASM_IDE_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/ide.h>
-#else
-#include <ide.h>
-#endif
 
 
 
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index fe8f4a9..f5db090 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -31,13 +31,8 @@
 #include <asm/processor.h>
 #include <asm/string.h>
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/ioremap.h>
 #include <mach/mangle-port.h>
-#else
-#include <ioremap.h>
-#include <mangle-port.h>
-#endif
 
 /*
  * Raw operations are never swapped in software.  OTOH values that raw
diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index c8cab02..ce213e2 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -15,11 +15,7 @@
 
 #include <asm/mipsmtregs.h>
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/irq.h>
-#else
-#include <irq.h>
-#endif
 
 #define IRQ_STACK_SIZE			THREAD_SIZE
 #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
diff --git a/arch/mips/include/asm/mc146818rtc.h b/arch/mips/include/asm/mc146818rtc.h
index a0e1d91..9f61732 100644
--- a/arch/mips/include/asm/mc146818rtc.h
+++ b/arch/mips/include/asm/mc146818rtc.h
@@ -11,10 +11,6 @@
 #ifndef _ASM_MC146818RTC_H
 #define _ASM_MC146818RTC_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/mc146818rtc.h>
-#else
-#include <mc146818rtc.h>
-#endif
 
 #endif /* _ASM_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index 043f88c..9bf755b 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -9,11 +9,7 @@
 #include <asm/page.h>
 
 #ifdef CONFIG_NEED_MULTIPLE_NODES
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/mmzone.h>
-#else
-# include <mmzone.h>
-#endif
 #endif
 
 #ifndef pa_to_nid
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 4fb4ee2..e697da0 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -9,11 +9,7 @@
 #ifndef _ASM_PAGE_H
 #define _ASM_PAGE_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/spaces.h>
-#else
-#include <spaces.h>
-#endif
 #include <linux/const.h>
 #include <linux/kernel.h>
 #include <asm/mipsregs.h>
diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/topology.h
index ed955bb..71c7e1a 100644
--- a/arch/mips/include/asm/topology.h
+++ b/arch/mips/include/asm/topology.h
@@ -8,11 +8,7 @@
 #ifndef __ASM_TOPOLOGY_H
 #define __ASM_TOPOLOGY_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/topology.h>
-#else
-#include <topology.h>
-#endif
 #include <linux/smp.h>
 
 #ifdef CONFIG_SMP
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 66264e1..5cdf44c 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -9,11 +9,7 @@
 #ifndef _ASM_WAR_H
 #define _ASM_WAR_H
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/war.h>
-#else
-#include <war.h>
-#endif
 
 /*
  * Work around certain R4000 CPU errata (as implemented by GCC):
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index a45cdae..b3491db 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -24,11 +24,7 @@
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
 
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/kernel-entry-init.h>
-#else
-#include <kernel-entry-init.h>
-#endif
 
 	/*
 	 * For the moment disable interrupts, mark the kernel mode and
diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 12dbce7..9a22a18 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -3,7 +3,6 @@ config MACH_TX39XX
 	bool
 	select MACH_TXX9
 	select SYS_HAS_CPU_TX39XX
-	select HAVE_MACH_HEAD_FILES
 
 config MACH_TX49XX
 	bool
@@ -13,7 +12,6 @@ config MACH_TX49XX
 	select IRQ_MIPS_CPU
 	select SYS_HAS_CPU_TX49XX
 	select SYS_SUPPORTS_64BIT_KERNEL
-	select HAVE_MACH_HEAD_FILES
 
 config MACH_TXX9
 	bool
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index ebcd75a..ca22ad0 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -17,11 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
 #include <asm/types.h>
-#ifdef CONFIG_HAVE_MACH_HEAD_FILES
 #include <mach/loongson.h>
-#else
-#include <loongson.h>
-#endif
 
 #define STLS2F_N_GPIO		4
 #define STLS3A_N_GPIO		16
-- 
1.8.3.1

