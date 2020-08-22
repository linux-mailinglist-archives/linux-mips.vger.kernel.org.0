Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660BA24E637
	for <lists+linux-mips@lfdr.de>; Sat, 22 Aug 2020 10:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgHVIEk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Aug 2020 04:04:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:35572 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbgHVIEj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Aug 2020 04:04:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 773B6AB3E;
        Sat, 22 Aug 2020 08:05:01 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Remove PNX833x alias NXP_STB22x
Date:   Sat, 22 Aug 2020 10:04:27 +0200
Message-Id: <20200822080429.65704-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove another unused MIPS platform.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kbuild.platforms                       |   1 -
 arch/mips/Kconfig                                |  30 ---
 arch/mips/configs/pnx8335_stb225_defconfig       |  77 ------
 arch/mips/include/asm/mach-pnx833x/gpio.h        | 159 ------------
 arch/mips/include/asm/mach-pnx833x/irq-mapping.h | 112 ---------
 arch/mips/include/asm/mach-pnx833x/irq.h         |  40 ---
 arch/mips/include/asm/mach-pnx833x/pnx833x.h     | 189 --------------
 arch/mips/include/asm/mipsregs.h                 |  12 -
 arch/mips/pnx833x/Makefile                       |   4 -
 arch/mips/pnx833x/Platform                       |   4 -
 arch/mips/pnx833x/common/Makefile                |   2 -
 arch/mips/pnx833x/common/interrupts.c            | 303 -----------------------
 arch/mips/pnx833x/common/platform.c              | 224 -----------------
 arch/mips/pnx833x/common/prom.c                  |  51 ----
 arch/mips/pnx833x/common/reset.c                 |  31 ---
 arch/mips/pnx833x/common/setup.c                 |  48 ----
 arch/mips/pnx833x/stb22x/Makefile                |   2 -
 arch/mips/pnx833x/stb22x/board.c                 | 120 ---------
 18 files changed, 1409 deletions(-)
 delete mode 100644 arch/mips/configs/pnx8335_stb225_defconfig
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/gpio.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/irq-mapping.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/irq.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/pnx833x.h
 delete mode 100644 arch/mips/pnx833x/Makefile
 delete mode 100644 arch/mips/pnx833x/Platform
 delete mode 100644 arch/mips/pnx833x/common/Makefile
 delete mode 100644 arch/mips/pnx833x/common/interrupts.c
 delete mode 100644 arch/mips/pnx833x/common/platform.c
 delete mode 100644 arch/mips/pnx833x/common/prom.c
 delete mode 100644 arch/mips/pnx833x/common/reset.c
 delete mode 100644 arch/mips/pnx833x/common/setup.c
 delete mode 100644 arch/mips/pnx833x/stb22x/Makefile
 delete mode 100644 arch/mips/pnx833x/stb22x/board.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index a13c4cf6e608..af336a274a7a 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -22,7 +22,6 @@ platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
 platform-$(CONFIG_NLM_COMMON)		+= netlogic/
 platform-$(CONFIG_PIC32MZDA)		+= pic32/
 platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
-platform-$(CONFIG_SOC_PNX833X)		+= pnx833x/
 platform-$(CONFIG_RALINK)		+= ralink/
 platform-$(CONFIG_MIKROTIK_RB532)	+= rb532/
 platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484c..99220e7e465e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -589,19 +589,6 @@ config MACH_VR41XX
 	select SYS_SUPPORTS_MIPS16
 	select GPIOLIB
 
-config NXP_STB220
-	bool "NXP STB220 board"
-	select SOC_PNX833X
-	help
-	  Support for NXP Semiconductors STB220 Development Board.
-
-config NXP_STB225
-	bool "NXP 225 board"
-	select SOC_PNX833X
-	select SOC_PNX8335
-	help
-	  Support for NXP Semiconductors STB225 Development Board.
-
 config RALINK
 	bool "Ralink based machines"
 	select CEVT_R4K
@@ -1266,23 +1253,6 @@ config PCI_XTALK_BRIDGE
 config NO_EXCEPT_FILL
 	bool
 
-config SOC_PNX833X
-	bool
-	select CEVT_R4K
-	select CSRC_R4K
-	select IRQ_MIPS_CPU
-	select DMA_NONCOHERENT
-	select SYS_HAS_CPU_MIPS32_R2
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select SYS_SUPPORTS_BIG_ENDIAN
-	select SYS_SUPPORTS_MIPS16
-	select CPU_MIPSR2_IRQ_VI
-
-config SOC_PNX8335
-	bool
-	select SOC_PNX833X
-
 config MIPS_SPRAM
 	bool
 
diff --git a/arch/mips/configs/pnx8335_stb225_defconfig b/arch/mips/configs/pnx8335_stb225_defconfig
deleted file mode 100644
index d06db6b87959..000000000000
--- a/arch/mips/configs/pnx8335_stb225_defconfig
+++ /dev/null
@@ -1,77 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-# CONFIG_SWAP is not set
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-CONFIG_NXP_STB225=y
-CONFIG_CPU_LITTLE_ENDIAN=y
-CONFIG_HZ_128=y
-# CONFIG_SECCOMP is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_INET_AH=y
-# CONFIG_IPV6 is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_LE_BYTE_SWAP=y
-CONFIG_MTD_CFI_GEOMETRY=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_SD=y
-# CONFIG_SCSI_LOWLEVEL is not set
-CONFIG_ATA=y
-CONFIG_NETDEVICES=y
-CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_EVBUG=m
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_VT_CONSOLE is not set
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_PNX8XXX=y
-CONFIG_SERIAL_PNX8XXX_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_SOUND=m
-CONFIG_SND=m
-CONFIG_SND_VERBOSE_PRINTK=y
-CONFIG_SND_DEBUG=y
-CONFIG_SND_SEQUENCER=m
-CONFIG_EXT2_FS=m
-# CONFIG_DNOTIFY is not set
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=m
-CONFIG_NFSD_V3=y
-CONFIG_NLS=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_CODEPAGE_932=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_UTF8=m
diff --git a/arch/mips/include/asm/mach-pnx833x/gpio.h b/arch/mips/include/asm/mach-pnx833x/gpio.h
deleted file mode 100644
index 85b5b8e26118..000000000000
--- a/arch/mips/include/asm/mach-pnx833x/gpio.h
+++ /dev/null
@@ -1,159 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  gpio.h: GPIO Support for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- */
-#ifndef __ASM_MIPS_MACH_PNX833X_GPIO_H
-#define __ASM_MIPS_MACH_PNX833X_GPIO_H
-
-/* BIG FAT WARNING: races danger!
-   No protections exist here. Current users are only early init code,
-   when locking is not needed because no concurrency yet exists there,
-   and GPIO IRQ dispatcher, which does locking.
-   However, if many uses will ever happen, proper locking will be needed
-   - including locking between different uses
-*/
-
-#include <asm/mach-pnx833x/pnx833x.h>
-
-#define SET_REG_BIT(reg, bit)		do { (reg |= (1 << (bit))); } while (0)
-#define CLEAR_REG_BIT(reg, bit)		do { (reg &= ~(1 << (bit))); } while (0)
-
-/* Initialize GPIO to a known state */
-static inline void pnx833x_gpio_init(void)
-{
-	PNX833X_PIO_DIR = 0;
-	PNX833X_PIO_DIR2 = 0;
-	PNX833X_PIO_SEL = 0;
-	PNX833X_PIO_SEL2 = 0;
-	PNX833X_PIO_INT_EDGE = 0;
-	PNX833X_PIO_INT_HI = 0;
-	PNX833X_PIO_INT_LO = 0;
-
-	/* clear any GPIO interrupt requests */
-	PNX833X_PIO_INT_CLEAR = 0xffff;
-	PNX833X_PIO_INT_CLEAR = 0;
-	PNX833X_PIO_INT_ENABLE = 0;
-}
-
-/* Select GPIO direction for a pin */
-static inline void pnx833x_gpio_select_input(unsigned int pin)
-{
-	if (pin < 32)
-		CLEAR_REG_BIT(PNX833X_PIO_DIR, pin);
-	else
-		CLEAR_REG_BIT(PNX833X_PIO_DIR2, pin & 31);
-}
-static inline void pnx833x_gpio_select_output(unsigned int pin)
-{
-	if (pin < 32)
-		SET_REG_BIT(PNX833X_PIO_DIR, pin);
-	else
-		SET_REG_BIT(PNX833X_PIO_DIR2, pin & 31);
-}
-
-/* Select GPIO or alternate function for a pin */
-static inline void pnx833x_gpio_select_function_io(unsigned int pin)
-{
-	if (pin < 32)
-		CLEAR_REG_BIT(PNX833X_PIO_SEL, pin);
-	else
-		CLEAR_REG_BIT(PNX833X_PIO_SEL2, pin & 31);
-}
-static inline void pnx833x_gpio_select_function_alt(unsigned int pin)
-{
-	if (pin < 32)
-		SET_REG_BIT(PNX833X_PIO_SEL, pin);
-	else
-		SET_REG_BIT(PNX833X_PIO_SEL2, pin & 31);
-}
-
-/* Read GPIO pin */
-static inline int pnx833x_gpio_read(unsigned int pin)
-{
-	if (pin < 32)
-		return (PNX833X_PIO_IN >> pin) & 1;
-	else
-		return (PNX833X_PIO_IN2 >> (pin & 31)) & 1;
-}
-
-/* Write GPIO pin */
-static inline void pnx833x_gpio_write(unsigned int val, unsigned int pin)
-{
-	if (pin < 32) {
-		if (val)
-			SET_REG_BIT(PNX833X_PIO_OUT, pin);
-		else
-			CLEAR_REG_BIT(PNX833X_PIO_OUT, pin);
-	} else {
-		if (val)
-			SET_REG_BIT(PNX833X_PIO_OUT2, pin & 31);
-		else
-			CLEAR_REG_BIT(PNX833X_PIO_OUT2, pin & 31);
-	}
-}
-
-/* Configure GPIO interrupt */
-#define GPIO_INT_NONE		0
-#define GPIO_INT_LEVEL_LOW	1
-#define GPIO_INT_LEVEL_HIGH	2
-#define GPIO_INT_EDGE_RISING	3
-#define GPIO_INT_EDGE_FALLING	4
-#define GPIO_INT_EDGE_BOTH	5
-static inline void pnx833x_gpio_setup_irq(int when, unsigned int pin)
-{
-	switch (when) {
-	case GPIO_INT_LEVEL_LOW:
-		CLEAR_REG_BIT(PNX833X_PIO_INT_EDGE, pin);
-		CLEAR_REG_BIT(PNX833X_PIO_INT_HI, pin);
-		SET_REG_BIT(PNX833X_PIO_INT_LO, pin);
-		break;
-	case GPIO_INT_LEVEL_HIGH:
-		CLEAR_REG_BIT(PNX833X_PIO_INT_EDGE, pin);
-		SET_REG_BIT(PNX833X_PIO_INT_HI, pin);
-		CLEAR_REG_BIT(PNX833X_PIO_INT_LO, pin);
-		break;
-	case GPIO_INT_EDGE_RISING:
-		SET_REG_BIT(PNX833X_PIO_INT_EDGE, pin);
-		SET_REG_BIT(PNX833X_PIO_INT_HI, pin);
-		CLEAR_REG_BIT(PNX833X_PIO_INT_LO, pin);
-		break;
-	case GPIO_INT_EDGE_FALLING:
-		SET_REG_BIT(PNX833X_PIO_INT_EDGE, pin);
-		CLEAR_REG_BIT(PNX833X_PIO_INT_HI, pin);
-		SET_REG_BIT(PNX833X_PIO_INT_LO, pin);
-		break;
-	case GPIO_INT_EDGE_BOTH:
-		SET_REG_BIT(PNX833X_PIO_INT_EDGE, pin);
-		SET_REG_BIT(PNX833X_PIO_INT_HI, pin);
-		SET_REG_BIT(PNX833X_PIO_INT_LO, pin);
-		break;
-	default:
-		CLEAR_REG_BIT(PNX833X_PIO_INT_EDGE, pin);
-		CLEAR_REG_BIT(PNX833X_PIO_INT_HI, pin);
-		CLEAR_REG_BIT(PNX833X_PIO_INT_LO, pin);
-		break;
-	}
-}
-
-/* Enable/disable GPIO interrupt */
-static inline void pnx833x_gpio_enable_irq(unsigned int pin)
-{
-	SET_REG_BIT(PNX833X_PIO_INT_ENABLE, pin);
-}
-static inline void pnx833x_gpio_disable_irq(unsigned int pin)
-{
-	CLEAR_REG_BIT(PNX833X_PIO_INT_ENABLE, pin);
-}
-
-/* Clear GPIO interrupt request */
-static inline void pnx833x_gpio_clear_irq(unsigned int pin)
-{
-	SET_REG_BIT(PNX833X_PIO_INT_CLEAR, pin);
-	CLEAR_REG_BIT(PNX833X_PIO_INT_CLEAR, pin);
-}
-
-#endif
diff --git a/arch/mips/include/asm/mach-pnx833x/irq-mapping.h b/arch/mips/include/asm/mach-pnx833x/irq-mapping.h
deleted file mode 100644
index 32d8063c1bbc..000000000000
--- a/arch/mips/include/asm/mach-pnx833x/irq-mapping.h
+++ /dev/null
@@ -1,112 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-
-/*
- *  irq.h: IRQ mappings for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- */
-
-#ifndef __ASM_MIPS_MACH_PNX833X_IRQ_MAPPING_H
-#define __ASM_MIPS_MACH_PNX833X_IRQ_MAPPING_H
-/*
- * The "IRQ numbers" are completely virtual.
- *
- * In PNX8330/1, we have 48 interrupt lines, numbered from 1 to 48.
- * Let's use numbers 1..48 for PIC interrupts, number 0 for timer interrupt,
- * numbers 49..64 for (virtual) GPIO interrupts.
- *
- * In PNX8335, we have 57 interrupt lines, numbered from 1 to 57,
- * connected to PIC, which uses core hardware interrupt 2, and also
- * a timer interrupt through hardware interrupt 5.
- * Let's use numbers 1..64 for PIC interrupts, number 0 for timer interrupt,
- * numbers 65..80 for (virtual) GPIO interrupts.
- *
- */
-#include <irq.h>
-
-#define PNX833X_TIMER_IRQ				(MIPS_CPU_IRQ_BASE + 7)
-
-/* Interrupts supported by PIC */
-#define PNX833X_PIC_I2C0_INT			(PNX833X_PIC_IRQ_BASE +	 1)
-#define PNX833X_PIC_I2C1_INT			(PNX833X_PIC_IRQ_BASE +	 2)
-#define PNX833X_PIC_UART0_INT			(PNX833X_PIC_IRQ_BASE +	 3)
-#define PNX833X_PIC_UART1_INT			(PNX833X_PIC_IRQ_BASE +	 4)
-#define PNX833X_PIC_TS_IN0_DV_INT		(PNX833X_PIC_IRQ_BASE +	 5)
-#define PNX833X_PIC_TS_IN0_DMA_INT		(PNX833X_PIC_IRQ_BASE +	 6)
-#define PNX833X_PIC_GPIO_INT			(PNX833X_PIC_IRQ_BASE +	 7)
-#define PNX833X_PIC_AUDIO_DEC_INT		(PNX833X_PIC_IRQ_BASE +	 8)
-#define PNX833X_PIC_VIDEO_DEC_INT		(PNX833X_PIC_IRQ_BASE +	 9)
-#define PNX833X_PIC_CONFIG_INT			(PNX833X_PIC_IRQ_BASE + 10)
-#define PNX833X_PIC_AOI_INT				(PNX833X_PIC_IRQ_BASE + 11)
-#define PNX833X_PIC_SYNC_INT			(PNX833X_PIC_IRQ_BASE + 12)
-#define PNX8330_PIC_SPU_INT				(PNX833X_PIC_IRQ_BASE + 13)
-#define PNX8335_PIC_SATA_INT			(PNX833X_PIC_IRQ_BASE + 13)
-#define PNX833X_PIC_OSD_INT				(PNX833X_PIC_IRQ_BASE + 14)
-#define PNX833X_PIC_DISP1_INT			(PNX833X_PIC_IRQ_BASE + 15)
-#define PNX833X_PIC_DEINTERLACER_INT	(PNX833X_PIC_IRQ_BASE + 16)
-#define PNX833X_PIC_DISPLAY2_INT		(PNX833X_PIC_IRQ_BASE + 17)
-#define PNX833X_PIC_VC_INT				(PNX833X_PIC_IRQ_BASE + 18)
-#define PNX833X_PIC_SC_INT				(PNX833X_PIC_IRQ_BASE + 19)
-#define PNX833X_PIC_IDE_INT				(PNX833X_PIC_IRQ_BASE + 20)
-#define PNX833X_PIC_IDE_DMA_INT			(PNX833X_PIC_IRQ_BASE + 21)
-#define PNX833X_PIC_TS_IN1_DV_INT		(PNX833X_PIC_IRQ_BASE + 22)
-#define PNX833X_PIC_TS_IN1_DMA_INT		(PNX833X_PIC_IRQ_BASE + 23)
-#define PNX833X_PIC_SGDX_DMA_INT		(PNX833X_PIC_IRQ_BASE + 24)
-#define PNX833X_PIC_TS_OUT_INT			(PNX833X_PIC_IRQ_BASE + 25)
-#define PNX833X_PIC_IR_INT				(PNX833X_PIC_IRQ_BASE + 26)
-#define PNX833X_PIC_VMSP1_INT			(PNX833X_PIC_IRQ_BASE + 27)
-#define PNX833X_PIC_VMSP2_INT			(PNX833X_PIC_IRQ_BASE + 28)
-#define PNX833X_PIC_PIBC_INT			(PNX833X_PIC_IRQ_BASE + 29)
-#define PNX833X_PIC_TS_IN0_TRD_INT		(PNX833X_PIC_IRQ_BASE + 30)
-#define PNX833X_PIC_SGDX_TPD_INT		(PNX833X_PIC_IRQ_BASE + 31)
-#define PNX833X_PIC_USB_INT				(PNX833X_PIC_IRQ_BASE + 32)
-#define PNX833X_PIC_TS_IN1_TRD_INT		(PNX833X_PIC_IRQ_BASE + 33)
-#define PNX833X_PIC_CLOCK_INT			(PNX833X_PIC_IRQ_BASE + 34)
-#define PNX833X_PIC_SGDX_PARSER_INT		(PNX833X_PIC_IRQ_BASE + 35)
-#define PNX833X_PIC_VMSP_DMA_INT		(PNX833X_PIC_IRQ_BASE + 36)
-
-#if defined(CONFIG_SOC_PNX8335)
-#define PNX8335_PIC_MIU_INT					(PNX833X_PIC_IRQ_BASE + 37)
-#define PNX8335_PIC_AVCHIP_IRQ_INT			(PNX833X_PIC_IRQ_BASE + 38)
-#define PNX8335_PIC_SYNC_HD_INT				(PNX833X_PIC_IRQ_BASE + 39)
-#define PNX8335_PIC_DISP_HD_INT				(PNX833X_PIC_IRQ_BASE + 40)
-#define PNX8335_PIC_DISP_SCALER_INT			(PNX833X_PIC_IRQ_BASE + 41)
-#define PNX8335_PIC_OSD_HD1_INT				(PNX833X_PIC_IRQ_BASE + 42)
-#define PNX8335_PIC_DTL_WRITER_Y_INT		(PNX833X_PIC_IRQ_BASE + 43)
-#define PNX8335_PIC_DTL_WRITER_C_INT		(PNX833X_PIC_IRQ_BASE + 44)
-#define PNX8335_PIC_DTL_EMULATOR_Y_IR_INT	(PNX833X_PIC_IRQ_BASE + 45)
-#define PNX8335_PIC_DTL_EMULATOR_C_IR_INT	(PNX833X_PIC_IRQ_BASE + 46)
-#define PNX8335_PIC_DENC_TTX_INT			(PNX833X_PIC_IRQ_BASE + 47)
-#define PNX8335_PIC_MMI_SIF0_INT			(PNX833X_PIC_IRQ_BASE + 48)
-#define PNX8335_PIC_MMI_SIF1_INT			(PNX833X_PIC_IRQ_BASE + 49)
-#define PNX8335_PIC_MMI_CDMMU_INT			(PNX833X_PIC_IRQ_BASE + 50)
-#define PNX8335_PIC_PIBCS_INT				(PNX833X_PIC_IRQ_BASE + 51)
-#define PNX8335_PIC_ETHERNET_INT			(PNX833X_PIC_IRQ_BASE + 52)
-#define PNX8335_PIC_VMSP1_0_INT				(PNX833X_PIC_IRQ_BASE + 53)
-#define PNX8335_PIC_VMSP1_1_INT				(PNX833X_PIC_IRQ_BASE + 54)
-#define PNX8335_PIC_VMSP1_DMA_INT			(PNX833X_PIC_IRQ_BASE + 55)
-#define PNX8335_PIC_TDGR_DE_INT				(PNX833X_PIC_IRQ_BASE + 56)
-#define PNX8335_PIC_IR1_IRQ_INT				(PNX833X_PIC_IRQ_BASE + 57)
-#endif
-
-/* GPIO interrupts */
-#define PNX833X_GPIO_0_INT			(PNX833X_GPIO_IRQ_BASE +  0)
-#define PNX833X_GPIO_1_INT			(PNX833X_GPIO_IRQ_BASE +  1)
-#define PNX833X_GPIO_2_INT			(PNX833X_GPIO_IRQ_BASE +  2)
-#define PNX833X_GPIO_3_INT			(PNX833X_GPIO_IRQ_BASE +  3)
-#define PNX833X_GPIO_4_INT			(PNX833X_GPIO_IRQ_BASE +  4)
-#define PNX833X_GPIO_5_INT			(PNX833X_GPIO_IRQ_BASE +  5)
-#define PNX833X_GPIO_6_INT			(PNX833X_GPIO_IRQ_BASE +  6)
-#define PNX833X_GPIO_7_INT			(PNX833X_GPIO_IRQ_BASE +  7)
-#define PNX833X_GPIO_8_INT			(PNX833X_GPIO_IRQ_BASE +  8)
-#define PNX833X_GPIO_9_INT			(PNX833X_GPIO_IRQ_BASE +  9)
-#define PNX833X_GPIO_10_INT			(PNX833X_GPIO_IRQ_BASE + 10)
-#define PNX833X_GPIO_11_INT			(PNX833X_GPIO_IRQ_BASE + 11)
-#define PNX833X_GPIO_12_INT			(PNX833X_GPIO_IRQ_BASE + 12)
-#define PNX833X_GPIO_13_INT			(PNX833X_GPIO_IRQ_BASE + 13)
-#define PNX833X_GPIO_14_INT			(PNX833X_GPIO_IRQ_BASE + 14)
-#define PNX833X_GPIO_15_INT			(PNX833X_GPIO_IRQ_BASE + 15)
-
-#endif
diff --git a/arch/mips/include/asm/mach-pnx833x/irq.h b/arch/mips/include/asm/mach-pnx833x/irq.h
deleted file mode 100644
index b7a6dab5b9f7..000000000000
--- a/arch/mips/include/asm/mach-pnx833x/irq.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  irq.h: IRQ mappings for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- */
-
-#ifndef __ASM_MIPS_MACH_PNX833X_IRQ_H
-#define __ASM_MIPS_MACH_PNX833X_IRQ_H
-/*
- * The "IRQ numbers" are completely virtual.
- *
- * In PNX8330/1, we have 48 interrupt lines, numbered from 1 to 48.
- * Let's use numbers 1..48 for PIC interrupts, number 0 for timer interrupt,
- * numbers 49..64 for (virtual) GPIO interrupts.
- *
- * In PNX8335, we have 57 interrupt lines, numbered from 1 to 57,
- * connected to PIC, which uses core hardware interrupt 2, and also
- * a timer interrupt through hardware interrupt 5.
- * Let's use numbers 1..64 for PIC interrupts, number 0 for timer interrupt,
- * numbers 65..80 for (virtual) GPIO interrupts.
- *
- */
-#if defined(CONFIG_SOC_PNX8335)
-	#define PNX833X_PIC_NUM_IRQ			58
-#else
-	#define PNX833X_PIC_NUM_IRQ			37
-#endif
-
-#define MIPS_CPU_NUM_IRQ				8
-#define PNX833X_GPIO_NUM_IRQ			16
-
-#define MIPS_CPU_IRQ_BASE				0
-#define PNX833X_PIC_IRQ_BASE			(MIPS_CPU_IRQ_BASE + MIPS_CPU_NUM_IRQ)
-#define PNX833X_GPIO_IRQ_BASE			(PNX833X_PIC_IRQ_BASE + PNX833X_PIC_NUM_IRQ)
-#define NR_IRQS							(MIPS_CPU_NUM_IRQ + PNX833X_PIC_NUM_IRQ + PNX833X_GPIO_NUM_IRQ)
-
-#endif
diff --git a/arch/mips/include/asm/mach-pnx833x/pnx833x.h b/arch/mips/include/asm/mach-pnx833x/pnx833x.h
deleted file mode 100644
index 00bb67a36386..000000000000
--- a/arch/mips/include/asm/mach-pnx833x/pnx833x.h
+++ /dev/null
@@ -1,189 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  pnx833x.h: Register mappings for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- */
-#ifndef __ASM_MIPS_MACH_PNX833X_PNX833X_H
-#define __ASM_MIPS_MACH_PNX833X_PNX833X_H
-
-/* All regs are accessed in KSEG1 */
-#define PNX833X_BASE		(0xa0000000ul + 0x17E00000ul)
-
-#define PNX833X_REG(offs)	(*((volatile unsigned long *)(PNX833X_BASE + offs)))
-
-/* Registers are named exactly as in PNX833X docs, just with PNX833X_ prefix */
-
-/* Read access to multibit fields */
-#define PNX833X_BIT(val, reg, field)	((val) & PNX833X_##reg##_##field)
-#define PNX833X_REGBIT(reg, field)	PNX833X_BIT(PNX833X_##reg, reg, field)
-
-/* Use PNX833X_FIELD to extract a field from val */
-#define PNX_FIELD(cpu, val, reg, field) \
-		(((val) & PNX##cpu##_##reg##_##field##_MASK) >> \
-			PNX##cpu##_##reg##_##field##_SHIFT)
-#define PNX833X_FIELD(val, reg, field)	PNX_FIELD(833X, val, reg, field)
-#define PNX8330_FIELD(val, reg, field)	PNX_FIELD(8330, val, reg, field)
-#define PNX8335_FIELD(val, reg, field)	PNX_FIELD(8335, val, reg, field)
-
-/* Use PNX833X_REGFIELD to extract a field from a register */
-#define PNX833X_REGFIELD(reg, field)	PNX833X_FIELD(PNX833X_##reg, reg, field)
-#define PNX8330_REGFIELD(reg, field)	PNX8330_FIELD(PNX8330_##reg, reg, field)
-#define PNX8335_REGFIELD(reg, field)	PNX8335_FIELD(PNX8335_##reg, reg, field)
-
-
-#define PNX_WRITEFIELD(cpu, val, reg, field) \
-	(PNX##cpu##_##reg = (PNX##cpu##_##reg & ~(PNX##cpu##_##reg##_##field##_MASK)) | \
-						((val) << PNX##cpu##_##reg##_##field##_SHIFT))
-#define PNX833X_WRITEFIELD(val, reg, field) \
-					PNX_WRITEFIELD(833X, val, reg, field)
-#define PNX8330_WRITEFIELD(val, reg, field) \
-					PNX_WRITEFIELD(8330, val, reg, field)
-#define PNX8335_WRITEFIELD(val, reg, field) \
-					PNX_WRITEFIELD(8335, val, reg, field)
-
-
-/* Macros to detect CPU type */
-
-#define PNX833X_CONFIG_MODULE_ID		PNX833X_REG(0x7FFC)
-#define PNX833X_CONFIG_MODULE_ID_MAJREV_MASK	0x0000f000
-#define PNX833X_CONFIG_MODULE_ID_MAJREV_SHIFT	12
-#define PNX8330_CONFIG_MODULE_MAJREV		4
-#define PNX8335_CONFIG_MODULE_MAJREV		5
-#define CPU_IS_PNX8330	(PNX833X_REGFIELD(CONFIG_MODULE_ID, MAJREV) == \
-					PNX8330_CONFIG_MODULE_MAJREV)
-#define CPU_IS_PNX8335	(PNX833X_REGFIELD(CONFIG_MODULE_ID, MAJREV) == \
-					PNX8335_CONFIG_MODULE_MAJREV)
-
-
-
-#define PNX833X_RESET_CONTROL		PNX833X_REG(0x8004)
-#define PNX833X_RESET_CONTROL_2		PNX833X_REG(0x8014)
-
-#define PNX833X_PIC_REG(offs)		PNX833X_REG(0x01000 + (offs))
-#define PNX833X_PIC_INT_PRIORITY	PNX833X_PIC_REG(0x0)
-#define PNX833X_PIC_INT_SRC		PNX833X_PIC_REG(0x4)
-#define PNX833X_PIC_INT_SRC_INT_SRC_MASK	0x00000FF8ul	/* bits 11:3 */
-#define PNX833X_PIC_INT_SRC_INT_SRC_SHIFT	3
-#define PNX833X_PIC_INT_REG(irq)	PNX833X_PIC_REG(0x10 + 4*(irq))
-
-#define PNX833X_CLOCK_CPUCP_CTL PNX833X_REG(0x9228)
-#define PNX833X_CLOCK_CPUCP_CTL_EXIT_RESET	0x00000002ul	/* bit 1 */
-#define PNX833X_CLOCK_CPUCP_CTL_DIV_CLOCK_MASK	0x00000018ul	/* bits 4:3 */
-#define PNX833X_CLOCK_CPUCP_CTL_DIV_CLOCK_SHIFT 3
-
-#define PNX8335_CLOCK_PLL_CPU_CTL		PNX833X_REG(0x9020)
-#define PNX8335_CLOCK_PLL_CPU_CTL_FREQ_MASK	0x1f
-#define PNX8335_CLOCK_PLL_CPU_CTL_FREQ_SHIFT	0
-
-#define PNX833X_CONFIG_MUX		PNX833X_REG(0x7004)
-#define PNX833X_CONFIG_MUX_IDE_MUX	0x00000080		/* bit 7 */
-
-#define PNX8330_CONFIG_POLYFUSE_7	PNX833X_REG(0x7040)
-#define PNX8330_CONFIG_POLYFUSE_7_BOOT_MODE_MASK	0x00180000
-#define PNX8330_CONFIG_POLYFUSE_7_BOOT_MODE_SHIFT	19
-
-#define PNX833X_PIO_IN		PNX833X_REG(0xF000)
-#define PNX833X_PIO_OUT		PNX833X_REG(0xF004)
-#define PNX833X_PIO_DIR		PNX833X_REG(0xF008)
-#define PNX833X_PIO_SEL		PNX833X_REG(0xF014)
-#define PNX833X_PIO_INT_EDGE	PNX833X_REG(0xF020)
-#define PNX833X_PIO_INT_HI	PNX833X_REG(0xF024)
-#define PNX833X_PIO_INT_LO	PNX833X_REG(0xF028)
-#define PNX833X_PIO_INT_STATUS	PNX833X_REG(0xFFE0)
-#define PNX833X_PIO_INT_ENABLE	PNX833X_REG(0xFFE4)
-#define PNX833X_PIO_INT_CLEAR	PNX833X_REG(0xFFE8)
-#define PNX833X_PIO_IN2		PNX833X_REG(0xF05C)
-#define PNX833X_PIO_OUT2	PNX833X_REG(0xF060)
-#define PNX833X_PIO_DIR2	PNX833X_REG(0xF064)
-#define PNX833X_PIO_SEL2	PNX833X_REG(0xF068)
-
-#define PNX833X_UART0_PORTS_START	(PNX833X_BASE + 0xB000)
-#define PNX833X_UART0_PORTS_END		(PNX833X_BASE + 0xBFFF)
-#define PNX833X_UART1_PORTS_START	(PNX833X_BASE + 0xC000)
-#define PNX833X_UART1_PORTS_END		(PNX833X_BASE + 0xCFFF)
-
-#define PNX833X_USB_PORTS_START		(PNX833X_BASE + 0x19000)
-#define PNX833X_USB_PORTS_END		(PNX833X_BASE + 0x19FFF)
-
-#define PNX833X_CONFIG_USB		PNX833X_REG(0x7008)
-
-#define PNX833X_I2C0_PORTS_START	(PNX833X_BASE + 0xD000)
-#define PNX833X_I2C0_PORTS_END		(PNX833X_BASE + 0xDFFF)
-#define PNX833X_I2C1_PORTS_START	(PNX833X_BASE + 0xE000)
-#define PNX833X_I2C1_PORTS_END		(PNX833X_BASE + 0xEFFF)
-
-#define PNX833X_IDE_PORTS_START		(PNX833X_BASE + 0x1A000)
-#define PNX833X_IDE_PORTS_END		(PNX833X_BASE + 0x1AFFF)
-#define PNX833X_IDE_MODULE_ID		PNX833X_REG(0x1AFFC)
-
-#define PNX833X_IDE_MODULE_ID_MODULE_ID_MASK	0xFFFF0000
-#define PNX833X_IDE_MODULE_ID_MODULE_ID_SHIFT	16
-#define PNX833X_IDE_MODULE_ID_VALUE		0xA009
-
-
-#define PNX833X_MIU_SEL0			PNX833X_REG(0x2004)
-#define PNX833X_MIU_SEL0_TIMING		PNX833X_REG(0x2008)
-#define PNX833X_MIU_SEL1			PNX833X_REG(0x200C)
-#define PNX833X_MIU_SEL1_TIMING		PNX833X_REG(0x2010)
-#define PNX833X_MIU_SEL2			PNX833X_REG(0x2014)
-#define PNX833X_MIU_SEL2_TIMING		PNX833X_REG(0x2018)
-#define PNX833X_MIU_SEL3			PNX833X_REG(0x201C)
-#define PNX833X_MIU_SEL3_TIMING		PNX833X_REG(0x2020)
-
-#define PNX833X_MIU_SEL0_SPI_MODE_ENABLE_MASK	(1 << 14)
-#define PNX833X_MIU_SEL0_SPI_MODE_ENABLE_SHIFT	14
-
-#define PNX833X_MIU_SEL0_BURST_MODE_ENABLE_MASK (1 << 7)
-#define PNX833X_MIU_SEL0_BURST_MODE_ENABLE_SHIFT	7
-
-#define PNX833X_MIU_SEL0_BURST_PAGE_LEN_MASK	(0xF << 9)
-#define PNX833X_MIU_SEL0_BURST_PAGE_LEN_SHIFT	9
-
-#define PNX833X_MIU_CONFIG_SPI		PNX833X_REG(0x2000)
-
-#define PNX833X_MIU_CONFIG_SPI_OPCODE_MASK	(0xFF << 3)
-#define PNX833X_MIU_CONFIG_SPI_OPCODE_SHIFT	3
-
-#define PNX833X_MIU_CONFIG_SPI_DATA_ENABLE_MASK (1 << 2)
-#define PNX833X_MIU_CONFIG_SPI_DATA_ENABLE_SHIFT	2
-
-#define PNX833X_MIU_CONFIG_SPI_ADDR_ENABLE_MASK (1 << 1)
-#define PNX833X_MIU_CONFIG_SPI_ADDR_ENABLE_SHIFT	1
-
-#define PNX833X_MIU_CONFIG_SPI_SYNC_MASK	(1 << 0)
-#define PNX833X_MIU_CONFIG_SPI_SYNC_SHIFT	0
-
-#define PNX833X_WRITE_CONFIG_SPI(opcode, data_enable, addr_enable, sync) \
-   (PNX833X_MIU_CONFIG_SPI =						\
-    ((opcode) << PNX833X_MIU_CONFIG_SPI_OPCODE_SHIFT) |			\
-    ((data_enable) << PNX833X_MIU_CONFIG_SPI_DATA_ENABLE_SHIFT) |	\
-    ((addr_enable) << PNX833X_MIU_CONFIG_SPI_ADDR_ENABLE_SHIFT) |	\
-    ((sync) << PNX833X_MIU_CONFIG_SPI_SYNC_SHIFT))
-
-#define PNX8335_IP3902_PORTS_START		(PNX833X_BASE + 0x2F000)
-#define PNX8335_IP3902_PORTS_END		(PNX833X_BASE + 0x2FFFF)
-#define PNX8335_IP3902_MODULE_ID		PNX833X_REG(0x2FFFC)
-
-#define PNX8335_IP3902_MODULE_ID_MODULE_ID_MASK		0xFFFF0000
-#define PNX8335_IP3902_MODULE_ID_MODULE_ID_SHIFT	16
-#define PNX8335_IP3902_MODULE_ID_VALUE			0x3902
-
- /* I/O location(gets remapped)*/
-#define PNX8335_NAND_BASE	    0x18000000
-/* I/O location with CLE high */
-#define PNX8335_NAND_CLE_MASK	0x00100000
-/* I/O location with ALE high */
-#define PNX8335_NAND_ALE_MASK	0x00010000
-
-#define PNX8335_SATA_PORTS_START	(PNX833X_BASE + 0x2E000)
-#define PNX8335_SATA_PORTS_END		(PNX833X_BASE + 0x2EFFF)
-#define PNX8335_SATA_MODULE_ID		PNX833X_REG(0x2EFFC)
-
-#define PNX8335_SATA_MODULE_ID_MODULE_ID_MASK	0xFFFF0000
-#define PNX8335_SATA_MODULE_ID_MODULE_ID_SHIFT	16
-#define PNX8335_SATA_MODULE_ID_VALUE		0xA099
-
-#endif
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 4ddc12e4444a..1a03fdc2c74a 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1706,12 +1706,6 @@ do {									\
 #define read_c0_count()		__read_32bit_c0_register($9, 0)
 #define write_c0_count(val)	__write_32bit_c0_register($9, 0, val)
 
-#define read_c0_count2()	__read_32bit_c0_register($9, 6) /* pnx8550 */
-#define write_c0_count2(val)	__write_32bit_c0_register($9, 6, val)
-
-#define read_c0_count3()	__read_32bit_c0_register($9, 7) /* pnx8550 */
-#define write_c0_count3(val)	__write_32bit_c0_register($9, 7, val)
-
 #define read_c0_entryhi()	__read_ulong_c0_register($10, 0)
 #define write_c0_entryhi(val)	__write_ulong_c0_register($10, 0, val)
 
@@ -1730,12 +1724,6 @@ do {									\
 #define read_c0_guestctl0ext()	__read_32bit_c0_register($11, 4)
 #define write_c0_guestctl0ext(val) __write_32bit_c0_register($11, 4, val)
 
-#define read_c0_compare2()	__read_32bit_c0_register($11, 6) /* pnx8550 */
-#define write_c0_compare2(val)	__write_32bit_c0_register($11, 6, val)
-
-#define read_c0_compare3()	__read_32bit_c0_register($11, 7) /* pnx8550 */
-#define write_c0_compare3(val)	__write_32bit_c0_register($11, 7, val)
-
 #define read_c0_status()	__read_32bit_c0_register($12, 0)
 
 #define write_c0_status(val)	__write_32bit_c0_register($12, 0, val)
diff --git a/arch/mips/pnx833x/Makefile b/arch/mips/pnx833x/Makefile
deleted file mode 100644
index 927268a58237..000000000000
--- a/arch/mips/pnx833x/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_SOC_PNX833X)	+= common/
-obj-$(CONFIG_NXP_STB220)	+= stb22x/
-obj-$(CONFIG_NXP_STB225)	+= stb22x/
diff --git a/arch/mips/pnx833x/Platform b/arch/mips/pnx833x/Platform
deleted file mode 100644
index e5286a49fc3e..000000000000
--- a/arch/mips/pnx833x/Platform
+++ /dev/null
@@ -1,4 +0,0 @@
-# NXP STB225
-cflags-$(CONFIG_SOC_PNX833X)	+= -I$(srctree)/arch/mips/include/asm/mach-pnx833x
-load-$(CONFIG_NXP_STB220)	+= 0xffffffff80001000
-load-$(CONFIG_NXP_STB225)	+= 0xffffffff80001000
diff --git a/arch/mips/pnx833x/common/Makefile b/arch/mips/pnx833x/common/Makefile
deleted file mode 100644
index 9b4d394112b0..000000000000
--- a/arch/mips/pnx833x/common/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y := interrupts.o platform.o prom.o setup.o reset.o
diff --git a/arch/mips/pnx833x/common/interrupts.c b/arch/mips/pnx833x/common/interrupts.c
deleted file mode 100644
index 2fbbabcac386..000000000000
--- a/arch/mips/pnx833x/common/interrupts.c
+++ /dev/null
@@ -1,303 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  interrupts.c: Interrupt mappings for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- */
-#include <linux/kernel.h>
-#include <linux/irq.h>
-#include <linux/hardirq.h>
-#include <linux/interrupt.h>
-#include <asm/mipsregs.h>
-#include <asm/irq_cpu.h>
-#include <asm/setup.h>
-#include <irq.h>
-#include <irq-mapping.h>
-#include <gpio.h>
-
-static int mips_cpu_timer_irq;
-
-static const unsigned int irq_prio[PNX833X_PIC_NUM_IRQ] =
-{
-    0, /* unused */
-    4, /* PNX833X_PIC_I2C0_INT		       1 */
-    4, /* PNX833X_PIC_I2C1_INT		       2 */
-    1, /* PNX833X_PIC_UART0_INT		       3 */
-    1, /* PNX833X_PIC_UART1_INT		       4 */
-    6, /* PNX833X_PIC_TS_IN0_DV_INT	       5 */
-    6, /* PNX833X_PIC_TS_IN0_DMA_INT	       6 */
-    7, /* PNX833X_PIC_GPIO_INT		       7 */
-    4, /* PNX833X_PIC_AUDIO_DEC_INT	       8 */
-    5, /* PNX833X_PIC_VIDEO_DEC_INT	       9 */
-    4, /* PNX833X_PIC_CONFIG_INT	      10 */
-    4, /* PNX833X_PIC_AOI_INT		      11 */
-    9, /* PNX833X_PIC_SYNC_INT		      12 */
-    9, /* PNX8335_PIC_SATA_INT		      13 */
-    4, /* PNX833X_PIC_OSD_INT		      14 */
-    9, /* PNX833X_PIC_DISP1_INT		      15 */
-    4, /* PNX833X_PIC_DEINTERLACER_INT	      16 */
-    9, /* PNX833X_PIC_DISPLAY2_INT	      17 */
-    4, /* PNX833X_PIC_VC_INT		      18 */
-    4, /* PNX833X_PIC_SC_INT		      19 */
-    9, /* PNX833X_PIC_IDE_INT		      20 */
-    9, /* PNX833X_PIC_IDE_DMA_INT	      21 */
-    6, /* PNX833X_PIC_TS_IN1_DV_INT	      22 */
-    6, /* PNX833X_PIC_TS_IN1_DMA_INT	      23 */
-    4, /* PNX833X_PIC_SGDX_DMA_INT	      24 */
-    4, /* PNX833X_PIC_TS_OUT_INT	      25 */
-    4, /* PNX833X_PIC_IR_INT		      26 */
-    3, /* PNX833X_PIC_VMSP1_INT		      27 */
-    3, /* PNX833X_PIC_VMSP2_INT		      28 */
-    4, /* PNX833X_PIC_PIBC_INT		      29 */
-    4, /* PNX833X_PIC_TS_IN0_TRD_INT	      30 */
-    4, /* PNX833X_PIC_SGDX_TPD_INT	      31 */
-    5, /* PNX833X_PIC_USB_INT		      32 */
-    4, /* PNX833X_PIC_TS_IN1_TRD_INT	      33 */
-    4, /* PNX833X_PIC_CLOCK_INT		      34 */
-    4, /* PNX833X_PIC_SGDX_PARSER_INT	      35 */
-    4, /* PNX833X_PIC_VMSP_DMA_INT	      36 */
-#if defined(CONFIG_SOC_PNX8335)
-    4, /* PNX8335_PIC_MIU_INT		      37 */
-    4, /* PNX8335_PIC_AVCHIP_IRQ_INT	      38 */
-    9, /* PNX8335_PIC_SYNC_HD_INT	      39 */
-    9, /* PNX8335_PIC_DISP_HD_INT	      40 */
-    9, /* PNX8335_PIC_DISP_SCALER_INT	      41 */
-    4, /* PNX8335_PIC_OSD_HD1_INT	      42 */
-    4, /* PNX8335_PIC_DTL_WRITER_Y_INT	      43 */
-    4, /* PNX8335_PIC_DTL_WRITER_C_INT	      44 */
-    4, /* PNX8335_PIC_DTL_EMULATOR_Y_IR_INT   45 */
-    4, /* PNX8335_PIC_DTL_EMULATOR_C_IR_INT   46 */
-    4, /* PNX8335_PIC_DENC_TTX_INT	      47 */
-    4, /* PNX8335_PIC_MMI_SIF0_INT	      48 */
-    4, /* PNX8335_PIC_MMI_SIF1_INT	      49 */
-    4, /* PNX8335_PIC_MMI_CDMMU_INT	      50 */
-    4, /* PNX8335_PIC_PIBCS_INT		      51 */
-   12, /* PNX8335_PIC_ETHERNET_INT	      52 */
-    3, /* PNX8335_PIC_VMSP1_0_INT	      53 */
-    3, /* PNX8335_PIC_VMSP1_1_INT	      54 */
-    4, /* PNX8335_PIC_VMSP1_DMA_INT	      55 */
-    4, /* PNX8335_PIC_TDGR_DE_INT	      56 */
-    4, /* PNX8335_PIC_IR1_IRQ_INT	      57 */
-#endif
-};
-
-static void pnx833x_timer_dispatch(void)
-{
-	do_IRQ(mips_cpu_timer_irq);
-}
-
-static void pic_dispatch(void)
-{
-	unsigned int irq = PNX833X_REGFIELD(PIC_INT_SRC, INT_SRC);
-
-	if ((irq >= 1) && (irq < (PNX833X_PIC_NUM_IRQ))) {
-		unsigned long priority = PNX833X_PIC_INT_PRIORITY;
-		PNX833X_PIC_INT_PRIORITY = irq_prio[irq];
-
-		if (irq == PNX833X_PIC_GPIO_INT) {
-			unsigned long mask = PNX833X_PIO_INT_STATUS & PNX833X_PIO_INT_ENABLE;
-			int pin;
-			while ((pin = ffs(mask & 0xffff))) {
-				pin -= 1;
-				do_IRQ(PNX833X_GPIO_IRQ_BASE + pin);
-				mask &= ~(1 << pin);
-			}
-		} else {
-			do_IRQ(irq + PNX833X_PIC_IRQ_BASE);
-		}
-
-		PNX833X_PIC_INT_PRIORITY = priority;
-	} else {
-		printk(KERN_ERR "plat_irq_dispatch: unexpected irq %u\n", irq);
-	}
-}
-
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending = read_c0_status() & read_c0_cause();
-
-	if (pending & STATUSF_IP4)
-		pic_dispatch();
-	else if (pending & STATUSF_IP7)
-		do_IRQ(PNX833X_TIMER_IRQ);
-	else
-		spurious_interrupt();
-}
-
-static inline void pnx833x_hard_enable_pic_irq(unsigned int irq)
-{
-	/* Currently we do this by setting IRQ priority to 1.
-	   If priority support is being implemented, 1 should be repalced
-		by a better value. */
-	PNX833X_PIC_INT_REG(irq) = irq_prio[irq];
-}
-
-static inline void pnx833x_hard_disable_pic_irq(unsigned int irq)
-{
-	/* Disable IRQ by writing setting it's priority to 0 */
-	PNX833X_PIC_INT_REG(irq) = 0;
-}
-
-static DEFINE_RAW_SPINLOCK(pnx833x_irq_lock);
-
-static unsigned int pnx833x_startup_pic_irq(unsigned int irq)
-{
-	unsigned long flags;
-	unsigned int pic_irq = irq - PNX833X_PIC_IRQ_BASE;
-
-	raw_spin_lock_irqsave(&pnx833x_irq_lock, flags);
-	pnx833x_hard_enable_pic_irq(pic_irq);
-	raw_spin_unlock_irqrestore(&pnx833x_irq_lock, flags);
-	return 0;
-}
-
-static void pnx833x_enable_pic_irq(struct irq_data *d)
-{
-	unsigned long flags;
-	unsigned int pic_irq = d->irq - PNX833X_PIC_IRQ_BASE;
-
-	raw_spin_lock_irqsave(&pnx833x_irq_lock, flags);
-	pnx833x_hard_enable_pic_irq(pic_irq);
-	raw_spin_unlock_irqrestore(&pnx833x_irq_lock, flags);
-}
-
-static void pnx833x_disable_pic_irq(struct irq_data *d)
-{
-	unsigned long flags;
-	unsigned int pic_irq = d->irq - PNX833X_PIC_IRQ_BASE;
-
-	raw_spin_lock_irqsave(&pnx833x_irq_lock, flags);
-	pnx833x_hard_disable_pic_irq(pic_irq);
-	raw_spin_unlock_irqrestore(&pnx833x_irq_lock, flags);
-}
-
-static DEFINE_RAW_SPINLOCK(pnx833x_gpio_pnx833x_irq_lock);
-
-static void pnx833x_enable_gpio_irq(struct irq_data *d)
-{
-	int pin = d->irq - PNX833X_GPIO_IRQ_BASE;
-	unsigned long flags;
-	raw_spin_lock_irqsave(&pnx833x_gpio_pnx833x_irq_lock, flags);
-	pnx833x_gpio_enable_irq(pin);
-	raw_spin_unlock_irqrestore(&pnx833x_gpio_pnx833x_irq_lock, flags);
-}
-
-static void pnx833x_disable_gpio_irq(struct irq_data *d)
-{
-	int pin = d->irq - PNX833X_GPIO_IRQ_BASE;
-	unsigned long flags;
-	raw_spin_lock_irqsave(&pnx833x_gpio_pnx833x_irq_lock, flags);
-	pnx833x_gpio_disable_irq(pin);
-	raw_spin_unlock_irqrestore(&pnx833x_gpio_pnx833x_irq_lock, flags);
-}
-
-static int pnx833x_set_type_gpio_irq(struct irq_data *d, unsigned int flow_type)
-{
-	int pin = d->irq - PNX833X_GPIO_IRQ_BASE;
-	int gpio_mode;
-
-	switch (flow_type) {
-	case IRQ_TYPE_EDGE_RISING:
-		gpio_mode = GPIO_INT_EDGE_RISING;
-		break;
-	case IRQ_TYPE_EDGE_FALLING:
-		gpio_mode = GPIO_INT_EDGE_FALLING;
-		break;
-	case IRQ_TYPE_EDGE_BOTH:
-		gpio_mode = GPIO_INT_EDGE_BOTH;
-		break;
-	case IRQ_TYPE_LEVEL_HIGH:
-		gpio_mode = GPIO_INT_LEVEL_HIGH;
-		break;
-	case IRQ_TYPE_LEVEL_LOW:
-		gpio_mode = GPIO_INT_LEVEL_LOW;
-		break;
-	default:
-		gpio_mode = GPIO_INT_NONE;
-		break;
-	}
-
-	pnx833x_gpio_setup_irq(gpio_mode, pin);
-
-	return 0;
-}
-
-static struct irq_chip pnx833x_pic_irq_type = {
-	.name = "PNX-PIC",
-	.irq_enable = pnx833x_enable_pic_irq,
-	.irq_disable = pnx833x_disable_pic_irq,
-};
-
-static struct irq_chip pnx833x_gpio_irq_type = {
-	.name = "PNX-GPIO",
-	.irq_enable = pnx833x_enable_gpio_irq,
-	.irq_disable = pnx833x_disable_gpio_irq,
-	.irq_set_type = pnx833x_set_type_gpio_irq,
-};
-
-void __init arch_init_irq(void)
-{
-	unsigned int irq;
-
-	/* setup standard internal cpu irqs */
-	mips_cpu_irq_init();
-
-	/* Set IRQ information in irq_desc */
-	for (irq = PNX833X_PIC_IRQ_BASE; irq < (PNX833X_PIC_IRQ_BASE + PNX833X_PIC_NUM_IRQ); irq++) {
-		pnx833x_hard_disable_pic_irq(irq);
-		irq_set_chip_and_handler(irq, &pnx833x_pic_irq_type,
-					 handle_simple_irq);
-	}
-
-	for (irq = PNX833X_GPIO_IRQ_BASE; irq < (PNX833X_GPIO_IRQ_BASE + PNX833X_GPIO_NUM_IRQ); irq++)
-		irq_set_chip_and_handler(irq, &pnx833x_gpio_irq_type,
-					 handle_simple_irq);
-
-	/* Set PIC priority limiter register to 0 */
-	PNX833X_PIC_INT_PRIORITY = 0;
-
-	/* Setup GPIO IRQ dispatching */
-	pnx833x_startup_pic_irq(PNX833X_PIC_GPIO_INT);
-
-	/* Enable PIC IRQs (HWIRQ2) */
-	if (cpu_has_vint)
-		set_vi_handler(4, pic_dispatch);
-
-	write_c0_status(read_c0_status() | IE_IRQ2);
-}
-
-unsigned int get_c0_compare_int(void)
-{
-	if (cpu_has_vint)
-		set_vi_handler(cp0_compare_irq, pnx833x_timer_dispatch);
-
-	mips_cpu_timer_irq = MIPS_CPU_IRQ_BASE + cp0_compare_irq;
-	return mips_cpu_timer_irq;
-}
-
-void __init plat_time_init(void)
-{
-	/* calculate mips_hpt_frequency based on PNX833X_CLOCK_CPUCP_CTL reg */
-
-	extern unsigned long mips_hpt_frequency;
-	unsigned long reg = PNX833X_CLOCK_CPUCP_CTL;
-
-	if (!(PNX833X_BIT(reg, CLOCK_CPUCP_CTL, EXIT_RESET))) {
-		/* Functional clock is disabled so use crystal frequency */
-		mips_hpt_frequency = 25;
-	} else {
-#if defined(CONFIG_SOC_PNX8335)
-		/* Functional clock is enabled, so get clock multiplier */
-		mips_hpt_frequency = 90 + (10 * PNX8335_REGFIELD(CLOCK_PLL_CPU_CTL, FREQ));
-#else
-		static const unsigned long int freq[4] = {240, 160, 120, 80};
-		mips_hpt_frequency = freq[PNX833X_FIELD(reg, CLOCK_CPUCP_CTL, DIV_CLOCK)];
-#endif
-	}
-
-	printk(KERN_INFO "CPU clock is %ld MHz\n", mips_hpt_frequency);
-
-	mips_hpt_frequency *= 500000;
-}
diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
deleted file mode 100644
index 5fa0373f1c9e..000000000000
--- a/arch/mips/pnx833x/common/platform.c
+++ /dev/null
@@ -1,224 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  platform.c: platform support for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- *
- *  Based on software written by:
- *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
- */
-#include <linux/device.h>
-#include <linux/dma-mapping.h>
-#include <linux/platform_device.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/resource.h>
-#include <linux/serial.h>
-#include <linux/serial_pnx8xxx.h>
-#include <linux/mtd/platnand.h>
-
-#include <irq.h>
-#include <irq-mapping.h>
-#include <pnx833x.h>
-
-static u64 uart_dmamask	    = DMA_BIT_MASK(32);
-
-static struct resource pnx833x_uart_resources[] = {
-	[0] = {
-		.start		= PNX833X_UART0_PORTS_START,
-		.end		= PNX833X_UART0_PORTS_END,
-		.flags		= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start		= PNX833X_PIC_UART0_INT,
-		.end		= PNX833X_PIC_UART0_INT,
-		.flags		= IORESOURCE_IRQ,
-	},
-	[2] = {
-		.start		= PNX833X_UART1_PORTS_START,
-		.end		= PNX833X_UART1_PORTS_END,
-		.flags		= IORESOURCE_MEM,
-	},
-	[3] = {
-		.start		= PNX833X_PIC_UART1_INT,
-		.end		= PNX833X_PIC_UART1_INT,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-struct pnx8xxx_port pnx8xxx_ports[] = {
-	[0] = {
-		.port	= {
-			.type		= PORT_PNX8XXX,
-			.iotype		= UPIO_MEM,
-			.membase	= (void __iomem *)PNX833X_UART0_PORTS_START,
-			.mapbase	= PNX833X_UART0_PORTS_START,
-			.irq		= PNX833X_PIC_UART0_INT,
-			.uartclk	= 3692300,
-			.fifosize	= 16,
-			.flags		= UPF_BOOT_AUTOCONF,
-			.line		= 0,
-		},
-	},
-	[1] = {
-		.port	= {
-			.type		= PORT_PNX8XXX,
-			.iotype		= UPIO_MEM,
-			.membase	= (void __iomem *)PNX833X_UART1_PORTS_START,
-			.mapbase	= PNX833X_UART1_PORTS_START,
-			.irq		= PNX833X_PIC_UART1_INT,
-			.uartclk	= 3692300,
-			.fifosize	= 16,
-			.flags		= UPF_BOOT_AUTOCONF,
-			.line		= 1,
-		},
-	},
-};
-
-static struct platform_device pnx833x_uart_device = {
-	.name		= "pnx8xxx-uart",
-	.id		= -1,
-	.dev = {
-		.dma_mask		= &uart_dmamask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-		.platform_data		= pnx8xxx_ports,
-	},
-	.num_resources	= ARRAY_SIZE(pnx833x_uart_resources),
-	.resource	= pnx833x_uart_resources,
-};
-
-static u64 ehci_dmamask	    = DMA_BIT_MASK(32);
-
-static struct resource pnx833x_usb_ehci_resources[] = {
-	[0] = {
-		.start		= PNX833X_USB_PORTS_START,
-		.end		= PNX833X_USB_PORTS_END,
-		.flags		= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start		= PNX833X_PIC_USB_INT,
-		.end		= PNX833X_PIC_USB_INT,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device pnx833x_usb_ehci_device = {
-	.name		= "pnx833x-ehci",
-	.id		= -1,
-	.dev = {
-		.dma_mask		= &ehci_dmamask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	},
-	.num_resources	= ARRAY_SIZE(pnx833x_usb_ehci_resources),
-	.resource	= pnx833x_usb_ehci_resources,
-};
-
-static u64 ethernet_dmamask = DMA_BIT_MASK(32);
-
-static struct resource pnx833x_ethernet_resources[] = {
-	[0] = {
-		.start = PNX8335_IP3902_PORTS_START,
-		.end   = PNX8335_IP3902_PORTS_END,
-		.flags = IORESOURCE_MEM,
-	},
-#ifdef CONFIG_SOC_PNX8335
-	[1] = {
-		.start = PNX8335_PIC_ETHERNET_INT,
-		.end   = PNX8335_PIC_ETHERNET_INT,
-		.flags = IORESOURCE_IRQ,
-	},
-#endif
-};
-
-static struct platform_device pnx833x_ethernet_device = {
-	.name = "ip3902-eth",
-	.id   = -1,
-	.dev  = {
-		.dma_mask	   = &ethernet_dmamask,
-		.coherent_dma_mask = DMA_BIT_MASK(32),
-	},
-	.num_resources = ARRAY_SIZE(pnx833x_ethernet_resources),
-	.resource      = pnx833x_ethernet_resources,
-};
-
-static struct resource pnx833x_sata_resources[] = {
-	[0] = {
-		.start = PNX8335_SATA_PORTS_START,
-		.end   = PNX8335_SATA_PORTS_END,
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = PNX8335_PIC_SATA_INT,
-		.end   = PNX8335_PIC_SATA_INT,
-		.flags = IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device pnx833x_sata_device = {
-	.name	       = "pnx833x-sata",
-	.id	       = -1,
-	.num_resources = ARRAY_SIZE(pnx833x_sata_resources),
-	.resource      = pnx833x_sata_resources,
-};
-
-static void
-pnx833x_flash_nand_cmd_ctrl(struct nand_chip *this, int cmd, unsigned int ctrl)
-{
-	unsigned long nandaddr = (unsigned long)this->legacy.IO_ADDR_W;
-
-	if (cmd == NAND_CMD_NONE)
-		return;
-
-	if (ctrl & NAND_CLE)
-		writeb(cmd, (void __iomem *)(nandaddr + PNX8335_NAND_CLE_MASK));
-	else
-		writeb(cmd, (void __iomem *)(nandaddr + PNX8335_NAND_ALE_MASK));
-}
-
-static struct platform_nand_data pnx833x_flash_nand_data = {
-	.chip = {
-		.nr_chips		= 1,
-		.chip_delay		= 25,
-	},
-	.ctrl = {
-		.cmd_ctrl		= pnx833x_flash_nand_cmd_ctrl
-	}
-};
-
-/*
- * Set start to be the correct address (PNX8335_NAND_BASE with no 0xb!!),
- * 12 bytes more seems to be the standard that allows for NAND access.
- */
-static struct resource pnx833x_flash_nand_resource = {
-	.start	= PNX8335_NAND_BASE,
-	.end	= PNX8335_NAND_BASE + 12,
-	.flags	= IORESOURCE_MEM,
-};
-
-static struct platform_device pnx833x_flash_nand = {
-	.name		= "gen_nand",
-	.id			= -1,
-	.num_resources	= 1,
-	.resource	    = &pnx833x_flash_nand_resource,
-	.dev		= {
-		.platform_data = &pnx833x_flash_nand_data,
-	},
-};
-
-static struct platform_device *pnx833x_platform_devices[] __initdata = {
-	&pnx833x_uart_device,
-	&pnx833x_usb_ehci_device,
-	&pnx833x_ethernet_device,
-	&pnx833x_sata_device,
-	&pnx833x_flash_nand,
-};
-
-static int __init pnx833x_platform_init(void)
-{
-	return platform_add_devices(pnx833x_platform_devices,
-				    ARRAY_SIZE(pnx833x_platform_devices));
-}
-
-arch_initcall(pnx833x_platform_init);
diff --git a/arch/mips/pnx833x/common/prom.c b/arch/mips/pnx833x/common/prom.c
deleted file mode 100644
index 12733ef25782..000000000000
--- a/arch/mips/pnx833x/common/prom.c
+++ /dev/null
@@ -1,51 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  prom.c:
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- *
- *  Based on software written by:
- *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
- */
-#include <linux/init.h>
-#include <asm/bootinfo.h>
-#include <linux/string.h>
-
-void __init prom_init_cmdline(void)
-{
-	int argc = fw_arg0;
-	char **argv = (char **)fw_arg1;
-	char *c = &(arcs_cmdline[0]);
-	int i;
-
-	for (i = 1; i < argc; i++) {
-		strcpy(c, argv[i]);
-		c += strlen(argv[i]);
-		if (i < argc-1)
-			*c++ = ' ';
-	}
-	*c = 0;
-}
-
-char __init *prom_getenv(char *envname)
-{
-	extern char **prom_envp;
-	char **env = prom_envp;
-	int i;
-
-	i = strlen(envname);
-
-	while (*env) {
-		if (strncmp(envname, *env, i) == 0 && *(*env+i) == '=')
-			return *env + i + 1;
-		env++;
-	}
-
-	return 0;
-}
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/pnx833x/common/reset.c b/arch/mips/pnx833x/common/reset.c
deleted file mode 100644
index b48e83bf912b..000000000000
--- a/arch/mips/pnx833x/common/reset.c
+++ /dev/null
@@ -1,31 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  reset.c: reset support for PNX833X.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- *
- *  Based on software written by:
- *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
- */
-#include <linux/reboot.h>
-#include <pnx833x.h>
-
-void pnx833x_machine_restart(char *command)
-{
-	PNX833X_RESET_CONTROL_2 = 0;
-	PNX833X_RESET_CONTROL = 0;
-}
-
-void pnx833x_machine_halt(void)
-{
-	while (1)
-		__asm__ __volatile__ ("wait");
-
-}
-
-void pnx833x_machine_power_off(void)
-{
-	pnx833x_machine_halt();
-}
diff --git a/arch/mips/pnx833x/common/setup.c b/arch/mips/pnx833x/common/setup.c
deleted file mode 100644
index abf68d92ce4a..000000000000
--- a/arch/mips/pnx833x/common/setup.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  setup.c: Setup PNX833X Soc.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- *
- *  Based on software written by:
- *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
- */
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/ioport.h>
-#include <linux/io.h>
-#include <linux/pci.h>
-#include <asm/reboot.h>
-#include <pnx833x.h>
-#include <gpio.h>
-
-extern void pnx833x_board_setup(void);
-extern void pnx833x_machine_restart(char *);
-extern void pnx833x_machine_halt(void);
-extern void pnx833x_machine_power_off(void);
-
-int __init plat_mem_setup(void)
-{
-	/* set mips clock to 320MHz */
-#if defined(CONFIG_SOC_PNX8335)
-	PNX8335_WRITEFIELD(0x17, CLOCK_PLL_CPU_CTL, FREQ);
-#endif
-	pnx833x_gpio_init();	/* so it will be ready in board_setup() */
-
-	pnx833x_board_setup();
-
-	_machine_restart = pnx833x_machine_restart;
-	_machine_halt = pnx833x_machine_halt;
-	pm_power_off = pnx833x_machine_power_off;
-
-	/* IO/MEM resources. */
-	set_io_port_base(KSEG1);
-	ioport_resource.start = 0;
-	ioport_resource.end = ~0;
-	iomem_resource.start = 0;
-	iomem_resource.end = ~0;
-
-	return 0;
-}
diff --git a/arch/mips/pnx833x/stb22x/Makefile b/arch/mips/pnx833x/stb22x/Makefile
deleted file mode 100644
index 7c5ddf36b735..000000000000
--- a/arch/mips/pnx833x/stb22x/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y := board.o
diff --git a/arch/mips/pnx833x/stb22x/board.c b/arch/mips/pnx833x/stb22x/board.c
deleted file mode 100644
index 93d8e7b73427..000000000000
--- a/arch/mips/pnx833x/stb22x/board.c
+++ /dev/null
@@ -1,120 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  board.c: STB225 board support.
- *
- *  Copyright 2008 NXP Semiconductors
- *	  Chris Steel <chris.steel@nxp.com>
- *    Daniel Laird <daniel.j.laird@nxp.com>
- *
- *  Based on software written by:
- *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
- */
-#include <linux/init.h>
-#include <asm/bootinfo.h>
-#include <linux/mm.h>
-#include <pnx833x.h>
-#include <gpio.h>
-
-/* endianess twiddlers */
-#define PNX8335_DEBUG0 0x4400
-#define PNX8335_DEBUG1 0x4404
-#define PNX8335_DEBUG2 0x4408
-#define PNX8335_DEBUG3 0x440c
-#define PNX8335_DEBUG4 0x4410
-#define PNX8335_DEBUG5 0x4414
-#define PNX8335_DEBUG6 0x4418
-#define PNX8335_DEBUG7 0x441c
-
-int prom_argc;
-char **prom_argv, **prom_envp;
-
-extern void prom_init_cmdline(void);
-extern char *prom_getenv(char *envname);
-
-const char *get_system_type(void)
-{
-	return "NXP STB22x";
-}
-
-static inline unsigned long env_or_default(char *env, unsigned long dfl)
-{
-	char *str = prom_getenv(env);
-	return str ? simple_strtol(str, 0, 0) : dfl;
-}
-
-void __init prom_init(void)
-{
-	unsigned long memsize;
-
-	prom_argc = fw_arg0;
-	prom_argv = (char **)fw_arg1;
-	prom_envp = (char **)fw_arg2;
-
-	prom_init_cmdline();
-
-	memsize = env_or_default("memsize", 0x02000000);
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
-}
-
-void __init pnx833x_board_setup(void)
-{
-	pnx833x_gpio_select_function_alt(4);
-	pnx833x_gpio_select_output(4);
-	pnx833x_gpio_select_function_alt(5);
-	pnx833x_gpio_select_input(5);
-	pnx833x_gpio_select_function_alt(6);
-	pnx833x_gpio_select_input(6);
-	pnx833x_gpio_select_function_alt(7);
-	pnx833x_gpio_select_output(7);
-
-	pnx833x_gpio_select_function_alt(25);
-	pnx833x_gpio_select_function_alt(26);
-
-	pnx833x_gpio_select_function_alt(27);
-	pnx833x_gpio_select_function_alt(28);
-	pnx833x_gpio_select_function_alt(29);
-	pnx833x_gpio_select_function_alt(30);
-	pnx833x_gpio_select_function_alt(31);
-	pnx833x_gpio_select_function_alt(32);
-	pnx833x_gpio_select_function_alt(33);
-
-#if IS_ENABLED(CONFIG_MTD_NAND_PLATFORM)
-	/* Setup MIU for NAND access on CS0...
-	 *
-	 * (it seems that we must also configure CS1 for reliable operation,
-	 * otherwise the first read ID command will fail if it's read as 4 bytes
-	 * but pass if it's read as 1 word.)
-	 */
-
-	/* Setup MIU CS0 & CS1 timing */
-	PNX833X_MIU_SEL0 = 0;
-	PNX833X_MIU_SEL1 = 0;
-	PNX833X_MIU_SEL0_TIMING = 0x50003081;
-	PNX833X_MIU_SEL1_TIMING = 0x50003081;
-
-	/* Setup GPIO 00 for use as MIU CS1 (CS0 is not multiplexed, so does not need this) */
-	pnx833x_gpio_select_function_alt(0);
-
-	/* Setup GPIO 04 to input NAND read/busy signal */
-	pnx833x_gpio_select_function_io(4);
-	pnx833x_gpio_select_input(4);
-
-	/* Setup GPIO 05 to disable NAND write protect */
-	pnx833x_gpio_select_function_io(5);
-	pnx833x_gpio_select_output(5);
-	pnx833x_gpio_write(1, 5);
-
-#elif IS_ENABLED(CONFIG_MTD_CFI)
-
-	/* Set up MIU for 16-bit NOR access on CS0 and CS1... */
-
-	/* Setup MIU CS0 & CS1 timing */
-	PNX833X_MIU_SEL0 = 1;
-	PNX833X_MIU_SEL1 = 1;
-	PNX833X_MIU_SEL0_TIMING = 0x6A08D082;
-	PNX833X_MIU_SEL1_TIMING = 0x6A08D082;
-
-	/* Setup GPIO 00 for use as MIU CS1 (CS0 is not multiplexed, so does not need this) */
-	pnx833x_gpio_select_function_alt(0);
-#endif
-}
-- 
2.16.4

