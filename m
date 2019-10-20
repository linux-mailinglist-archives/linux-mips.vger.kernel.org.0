Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C650DDF02
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2019 17:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfJTPFR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 11:05:17 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:44584 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726373AbfJTPFQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 11:05:16 -0400
Received: from mxback16g.mail.yandex.net (mxback16g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:316])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 924896680DCB;
        Sun, 20 Oct 2019 18:02:21 +0300 (MSK)
Received: from iva8-ec9a273f19c6.qloud-c.yandex.net (iva8-ec9a273f19c6.qloud-c.yandex.net [2a02:6b8:c0c:1209:0:640:ec9a:273f])
        by mxback16g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id PgKqTsUHfb-2KLWHPee;
        Sun, 20 Oct 2019 18:02:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571583741;
        bh=upkNqAmh6cihY0LDJi91deGwUU30WFCbnnsEByxVaaw=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=UOfTO6MTC6NxGfW3xFNGUGLlU3f3NqGcsuYySd/pKP+BXprI8lPtWTRFB+TcaTqSq
         IzFrqaJBdRQ87CkRk5jDzN9MR6bcqy65frdsa4lvw4tq/68bU3ovaVAorDWQd6bwY+
         V5v14VBBftVXslc5JMBQAz/hsOALtgzfxrlKIqeQ=
Authentication-Results: mxback16g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva8-ec9a273f19c6.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id H3HbL3CO93-1xHiwQTk;
        Sun, 20 Oct 2019 18:02:05 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/6] MIPS: Loongson64: Cleanup unused code
Date:   Sun, 20 Oct 2019 23:01:35 +0800
Message-Id: <20191020150137.19256-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clean up legacy code after stripping out Loongson2ef code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/bootinfo.h              |   3 +-
 .../mach-loongson64/cpu-feature-overrides.h   |   2 -
 .../asm/mach-loongson64/cs5536/cs5536.h       | 306 ------------------
 .../asm/mach-loongson64/cs5536/cs5536_mfgpt.h |  36 ---
 .../asm/mach-loongson64/cs5536/cs5536_pci.h   | 153 ---------
 .../asm/mach-loongson64/cs5536/cs5536_vsm.h   |  32 --
 arch/mips/include/asm/mach-loongson64/irq.h   |   4 -
 .../asm/mach-loongson64/kernel-entry-init.h   |   4 -
 .../include/asm/mach-loongson64/loongson.h    | 114 -------
 .../include/asm/mach-loongson64/machine.h     |  29 --
 arch/mips/include/asm/mach-loongson64/mem.h   |  37 ---
 .../mips/include/asm/mach-loongson64/mmzone.h |  29 +-
 arch/mips/include/asm/mach-loongson64/pci.h   |  31 --
 .../include/asm/mach-loongson64/topology.h    |   4 +-
 arch/mips/loongson64/Kconfig                  |  10 +-
 arch/mips/loongson64/Platform                 |   2 +-
 arch/mips/loongson64/common/Makefile          |   9 +-
 arch/mips/loongson64/common/bonito-irq.c      |  49 ---
 arch/mips/loongson64/common/cmdline.c         |   2 -
 arch/mips/loongson64/common/early_printk.c    |  38 ---
 arch/mips/loongson64/common/env.c             |  62 +---
 arch/mips/loongson64/common/init.c            |  17 +-
 arch/mips/loongson64/common/irq.c             |  63 ----
 arch/mips/loongson64/common/machtype.c        |  63 ----
 arch/mips/loongson64/common/mem.c             | 157 ---------
 arch/mips/loongson64/common/pci.c             |   5 +-
 arch/mips/loongson64/common/platform.c        |  27 --
 arch/mips/loongson64/common/pm.c              |  53 ---
 arch/mips/loongson64/common/reset.c           |  30 --
 arch/mips/loongson64/common/serial.c          | 117 -------
 arch/mips/loongson64/common/setup.c           |  21 --
 arch/mips/loongson64/common/time.c            |   3 -
 arch/mips/loongson64/common/uart_base.c       |  46 ---
 arch/mips/loongson64/loongson-3/irq.c         |   8 +-
 arch/mips/loongson64/loongson-3/numa.c        |  11 +-
 35 files changed, 34 insertions(+), 1543 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/machine.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/mem.h
 delete mode 100644 arch/mips/loongson64/common/bonito-irq.c
 delete mode 100644 arch/mips/loongson64/common/early_printk.c
 delete mode 100644 arch/mips/loongson64/common/irq.c
 delete mode 100644 arch/mips/loongson64/common/machtype.c
 delete mode 100644 arch/mips/loongson64/common/mem.c
 delete mode 100644 arch/mips/loongson64/common/platform.c
 delete mode 100644 arch/mips/loongson64/common/serial.c
 delete mode 100644 arch/mips/loongson64/common/uart_base.c

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index a9250f5c964f..d41a5057bc69 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -61,7 +61,7 @@
 /*
  * Valid machtype for Loongson family
  */
-enum loongson_machine_type {
+enum loongson2ef_machine_type {
 	MACH_LOONGSON_UNKNOWN,
 	MACH_LEMOTE_FL2E,
 	MACH_LEMOTE_FL2F,
@@ -70,7 +70,6 @@ enum loongson_machine_type {
 	MACH_DEXXON_GDIUM2F10,
 	MACH_LEMOTE_NAS,
 	MACH_LEMOTE_LL2F,
-	MACH_LOONGSON_GENERIC,
 	MACH_LOONGSON_END
 };
 
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 83ad90d8005d..895607eb81ca 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -44,10 +44,8 @@
 #define cpu_has_vtag_icache	0
 #define cpu_has_watch		1
 
-#ifdef CONFIG_CPU_LOONGSON64
 #define cpu_has_wsbh		1
 #define cpu_has_ic_fills_f_dc	1
 #define cpu_hwrena_impl_bits	0xc0000000
-#endif
 
 #endif /* __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h b/arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h
deleted file mode 100644
index 9795b3361532..000000000000
--- a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h
+++ /dev/null
@@ -1,306 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * The header file of cs5536 south bridge.
- *
- * Copyright (C) 2007 Lemote, Inc.
- * Author : jlliu <liujl@lemote.com>
- */
-
-#ifndef _CS5536_H
-#define _CS5536_H
-
-#include <linux/types.h>
-
-extern void _rdmsr(u32 msr, u32 *hi, u32 *lo);
-extern void _wrmsr(u32 msr, u32 hi, u32 lo);
-
-/*
- * MSR module base
- */
-#define CS5536_SB_MSR_BASE	(0x00000000)
-#define CS5536_GLIU_MSR_BASE	(0x10000000)
-#define CS5536_ILLEGAL_MSR_BASE (0x20000000)
-#define CS5536_USB_MSR_BASE	(0x40000000)
-#define CS5536_IDE_MSR_BASE	(0x60000000)
-#define CS5536_DIVIL_MSR_BASE	(0x80000000)
-#define CS5536_ACC_MSR_BASE	(0xa0000000)
-#define CS5536_UNUSED_MSR_BASE	(0xc0000000)
-#define CS5536_GLCP_MSR_BASE	(0xe0000000)
-
-#define SB_MSR_REG(offset)	(CS5536_SB_MSR_BASE	| (offset))
-#define GLIU_MSR_REG(offset)	(CS5536_GLIU_MSR_BASE	| (offset))
-#define ILLEGAL_MSR_REG(offset) (CS5536_ILLEGAL_MSR_BASE | (offset))
-#define USB_MSR_REG(offset)	(CS5536_USB_MSR_BASE	| (offset))
-#define IDE_MSR_REG(offset)	(CS5536_IDE_MSR_BASE	| (offset))
-#define DIVIL_MSR_REG(offset)	(CS5536_DIVIL_MSR_BASE	| (offset))
-#define ACC_MSR_REG(offset)	(CS5536_ACC_MSR_BASE	| (offset))
-#define UNUSED_MSR_REG(offset)	(CS5536_UNUSED_MSR_BASE | (offset))
-#define GLCP_MSR_REG(offset)	(CS5536_GLCP_MSR_BASE	| (offset))
-
-/*
- * BAR SPACE OF VIRTUAL PCI :
- * range for pci probe use, length is the actual size.
- */
-/* IO space for all DIVIL modules */
-#define CS5536_IRQ_RANGE	0xffffffe0 /* USERD FOR PCI PROBE */
-#define CS5536_IRQ_LENGTH	0x20	/* THE REGS ACTUAL LENGTH */
-#define CS5536_SMB_RANGE	0xfffffff8
-#define CS5536_SMB_LENGTH	0x08
-#define CS5536_GPIO_RANGE	0xffffff00
-#define CS5536_GPIO_LENGTH	0x100
-#define CS5536_MFGPT_RANGE	0xffffffc0
-#define CS5536_MFGPT_LENGTH	0x40
-#define CS5536_ACPI_RANGE	0xffffffe0
-#define CS5536_ACPI_LENGTH	0x20
-#define CS5536_PMS_RANGE	0xffffff80
-#define CS5536_PMS_LENGTH	0x80
-/* IO space for IDE */
-#define CS5536_IDE_RANGE	0xfffffff0
-#define CS5536_IDE_LENGTH	0x10
-/* IO space for ACC */
-#define CS5536_ACC_RANGE	0xffffff80
-#define CS5536_ACC_LENGTH	0x80
-/* MEM space for ALL USB modules */
-#define CS5536_OHCI_RANGE	0xfffff000
-#define CS5536_OHCI_LENGTH	0x1000
-#define CS5536_EHCI_RANGE	0xfffff000
-#define CS5536_EHCI_LENGTH	0x1000
-
-/*
- * PCI MSR ACCESS
- */
-#define PCI_MSR_CTRL		0xF0
-#define PCI_MSR_ADDR		0xF4
-#define PCI_MSR_DATA_LO		0xF8
-#define PCI_MSR_DATA_HI		0xFC
-
-/**************** MSR *****************************/
-
-/*
- * GLIU STANDARD MSR
- */
-#define GLIU_CAP		0x00
-#define GLIU_CONFIG		0x01
-#define GLIU_SMI		0x02
-#define GLIU_ERROR		0x03
-#define GLIU_PM			0x04
-#define GLIU_DIAG		0x05
-
-/*
- * GLIU SPEC. MSR
- */
-#define GLIU_P2D_BM0		0x20
-#define GLIU_P2D_BM1		0x21
-#define GLIU_P2D_BM2		0x22
-#define GLIU_P2D_BMK0		0x23
-#define GLIU_P2D_BMK1		0x24
-#define GLIU_P2D_BM3		0x25
-#define GLIU_P2D_BM4		0x26
-#define GLIU_COH		0x80
-#define GLIU_PAE		0x81
-#define GLIU_ARB		0x82
-#define GLIU_ASMI		0x83
-#define GLIU_AERR		0x84
-#define GLIU_DEBUG		0x85
-#define GLIU_PHY_CAP		0x86
-#define GLIU_NOUT_RESP		0x87
-#define GLIU_NOUT_WDATA		0x88
-#define GLIU_WHOAMI		0x8B
-#define GLIU_SLV_DIS		0x8C
-#define GLIU_IOD_BM0		0xE0
-#define GLIU_IOD_BM1		0xE1
-#define GLIU_IOD_BM2		0xE2
-#define GLIU_IOD_BM3		0xE3
-#define GLIU_IOD_BM4		0xE4
-#define GLIU_IOD_BM5		0xE5
-#define GLIU_IOD_BM6		0xE6
-#define GLIU_IOD_BM7		0xE7
-#define GLIU_IOD_BM8		0xE8
-#define GLIU_IOD_BM9		0xE9
-#define GLIU_IOD_SC0		0xEA
-#define GLIU_IOD_SC1		0xEB
-#define GLIU_IOD_SC2		0xEC
-#define GLIU_IOD_SC3		0xED
-#define GLIU_IOD_SC4		0xEE
-#define GLIU_IOD_SC5		0xEF
-#define GLIU_IOD_SC6		0xF0
-#define GLIU_IOD_SC7		0xF1
-
-/*
- * SB STANDARD
- */
-#define SB_CAP		0x00
-#define SB_CONFIG	0x01
-#define SB_SMI		0x02
-#define SB_ERROR	0x03
-#define SB_MAR_ERR_EN		0x00000001
-#define SB_TAR_ERR_EN		0x00000002
-#define SB_RSVD_BIT1		0x00000004
-#define SB_EXCEP_ERR_EN		0x00000008
-#define SB_SYSE_ERR_EN		0x00000010
-#define SB_PARE_ERR_EN		0x00000020
-#define SB_TAS_ERR_EN		0x00000040
-#define SB_MAR_ERR_FLAG		0x00010000
-#define SB_TAR_ERR_FLAG		0x00020000
-#define SB_RSVD_BIT2		0x00040000
-#define SB_EXCEP_ERR_FLAG	0x00080000
-#define SB_SYSE_ERR_FLAG	0x00100000
-#define SB_PARE_ERR_FLAG	0x00200000
-#define SB_TAS_ERR_FLAG		0x00400000
-#define SB_PM		0x04
-#define SB_DIAG		0x05
-
-/*
- * SB SPEC.
- */
-#define SB_CTRL		0x10
-#define SB_R0		0x20
-#define SB_R1		0x21
-#define SB_R2		0x22
-#define SB_R3		0x23
-#define SB_R4		0x24
-#define SB_R5		0x25
-#define SB_R6		0x26
-#define SB_R7		0x27
-#define SB_R8		0x28
-#define SB_R9		0x29
-#define SB_R10		0x2A
-#define SB_R11		0x2B
-#define SB_R12		0x2C
-#define SB_R13		0x2D
-#define SB_R14		0x2E
-#define SB_R15		0x2F
-
-/*
- * GLCP STANDARD
- */
-#define GLCP_CAP		0x00
-#define GLCP_CONFIG		0x01
-#define GLCP_SMI		0x02
-#define GLCP_ERROR		0x03
-#define GLCP_PM			0x04
-#define GLCP_DIAG		0x05
-
-/*
- * GLCP SPEC.
- */
-#define GLCP_CLK_DIS_DELAY	0x08
-#define GLCP_PM_CLK_DISABLE	0x09
-#define GLCP_GLB_PM		0x0B
-#define GLCP_DBG_OUT		0x0C
-#define GLCP_RSVD1		0x0D
-#define GLCP_SOFT_COM		0x0E
-#define SOFT_BAR_SMB_FLAG	0x00000001
-#define SOFT_BAR_GPIO_FLAG	0x00000002
-#define SOFT_BAR_MFGPT_FLAG	0x00000004
-#define SOFT_BAR_IRQ_FLAG	0x00000008
-#define SOFT_BAR_PMS_FLAG	0x00000010
-#define SOFT_BAR_ACPI_FLAG	0x00000020
-#define SOFT_BAR_IDE_FLAG	0x00000400
-#define SOFT_BAR_ACC_FLAG	0x00000800
-#define SOFT_BAR_OHCI_FLAG	0x00001000
-#define SOFT_BAR_EHCI_FLAG	0x00002000
-#define GLCP_RSVD2		0x0F
-#define GLCP_CLK_OFF		0x10
-#define GLCP_CLK_ACTIVE		0x11
-#define GLCP_CLK_DISABLE	0x12
-#define GLCP_CLK4ACK		0x13
-#define GLCP_SYS_RST		0x14
-#define GLCP_RSVD3		0x15
-#define GLCP_DBG_CLK_CTRL	0x16
-#define GLCP_CHIP_REV_ID	0x17
-
-/* PIC */
-#define PIC_YSEL_LOW		0x20
-#define PIC_YSEL_LOW_USB_SHIFT		8
-#define PIC_YSEL_LOW_ACC_SHIFT		16
-#define PIC_YSEL_LOW_FLASH_SHIFT	24
-#define PIC_YSEL_HIGH		0x21
-#define PIC_ZSEL_LOW		0x22
-#define PIC_ZSEL_HIGH		0x23
-#define PIC_IRQM_PRIM		0x24
-#define PIC_IRQM_LPC		0x25
-#define PIC_XIRR_STS_LOW	0x26
-#define PIC_XIRR_STS_HIGH	0x27
-#define PCI_SHDW		0x34
-
-/*
- * DIVIL STANDARD
- */
-#define DIVIL_CAP		0x00
-#define DIVIL_CONFIG		0x01
-#define DIVIL_SMI		0x02
-#define DIVIL_ERROR		0x03
-#define DIVIL_PM		0x04
-#define DIVIL_DIAG		0x05
-
-/*
- * DIVIL SPEC.
- */
-#define DIVIL_LBAR_IRQ		0x08
-#define DIVIL_LBAR_KEL		0x09
-#define DIVIL_LBAR_SMB		0x0B
-#define DIVIL_LBAR_GPIO		0x0C
-#define DIVIL_LBAR_MFGPT	0x0D
-#define DIVIL_LBAR_ACPI		0x0E
-#define DIVIL_LBAR_PMS		0x0F
-#define DIVIL_LEG_IO		0x14
-#define DIVIL_BALL_OPTS		0x15
-#define DIVIL_SOFT_IRQ		0x16
-#define DIVIL_SOFT_RESET	0x17
-
-/* MFGPT */
-#define MFGPT_IRQ	0x28
-
-/*
- * IDE STANDARD
- */
-#define IDE_CAP		0x00
-#define IDE_CONFIG	0x01
-#define IDE_SMI		0x02
-#define IDE_ERROR	0x03
-#define IDE_PM		0x04
-#define IDE_DIAG	0x05
-
-/*
- * IDE SPEC.
- */
-#define IDE_IO_BAR	0x08
-#define IDE_CFG		0x10
-#define IDE_DTC		0x12
-#define IDE_CAST	0x13
-#define IDE_ETC		0x14
-#define IDE_INTERNAL_PM 0x15
-
-/*
- * ACC STANDARD
- */
-#define ACC_CAP		0x00
-#define ACC_CONFIG	0x01
-#define ACC_SMI		0x02
-#define ACC_ERROR	0x03
-#define ACC_PM		0x04
-#define ACC_DIAG	0x05
-
-/*
- * USB STANDARD
- */
-#define USB_CAP		0x00
-#define USB_CONFIG	0x01
-#define USB_SMI		0x02
-#define USB_ERROR	0x03
-#define USB_PM		0x04
-#define USB_DIAG	0x05
-
-/*
- * USB SPEC.
- */
-#define USB_OHCI	0x08
-#define USB_EHCI	0x09
-
-/****************** NATIVE ***************************/
-/* GPIO : I/O SPACE; REG : 32BITS */
-#define GPIOL_OUT_VAL		0x00
-#define GPIOL_OUT_EN		0x04
-
-#endif				/* _CS5536_H */
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h b/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h
deleted file mode 100644
index 52e8bb0fc04d..000000000000
--- a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * cs5536 mfgpt header file
- */
-
-#ifndef _CS5536_MFGPT_H
-#define _CS5536_MFGPT_H
-
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
-
-#ifdef CONFIG_CS5536_MFGPT
-extern void setup_mfgpt0_timer(void);
-extern void disable_mfgpt0_counter(void);
-extern void enable_mfgpt0_counter(void);
-#else
-static inline void __maybe_unused setup_mfgpt0_timer(void)
-{
-}
-static inline void __maybe_unused disable_mfgpt0_counter(void)
-{
-}
-static inline void __maybe_unused enable_mfgpt0_counter(void)
-{
-}
-#endif
-
-#define MFGPT_TICK_RATE 14318000
-#define COMPARE	 ((MFGPT_TICK_RATE + HZ/2) / HZ)
-
-#define MFGPT_BASE	mfgpt_base
-#define MFGPT0_CMP2	(MFGPT_BASE + 2)
-#define MFGPT0_CNT	(MFGPT_BASE + 4)
-#define MFGPT0_SETUP	(MFGPT_BASE + 6)
-
-#endif /*!_CS5536_MFGPT_H */
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h b/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h
deleted file mode 100644
index a0d4b752899e..000000000000
--- a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h
+++ /dev/null
@@ -1,153 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * the definition file of cs5536 Virtual Support Module(VSM).
- * pci configuration space can be accessed through the VSM, so
- * there is no need of the MSR read/write now, except the spec.
- * MSR registers which are not implemented yet.
- *
- * Copyright (C) 2007 Lemote Inc.
- * Author : jlliu, liujl@lemote.com
- */
-
-#ifndef _CS5536_PCI_H
-#define _CS5536_PCI_H
-
-#include <linux/types.h>
-#include <linux/pci_regs.h>
-
-extern void cs5536_pci_conf_write4(int function, int reg, u32 value);
-extern u32 cs5536_pci_conf_read4(int function, int reg);
-
-#define CS5536_ACC_INTR		9
-#define CS5536_IDE_INTR		14
-#define CS5536_USB_INTR		11
-#define CS5536_MFGPT_INTR	5
-#define CS5536_UART1_INTR	4
-#define CS5536_UART2_INTR	3
-
-/************** PCI BUS DEVICE FUNCTION ***************/
-
-/*
- * PCI bus device function
- */
-#define PCI_BUS_CS5536		0
-#define PCI_IDSEL_CS5536	14
-
-/********** STANDARD PCI-2.2 EXPANSION ****************/
-
-/*
- * PCI configuration space
- * we have to virtualize the PCI configure space head, so we should
- * define the necessary IDs and some others.
- */
-
-/* CONFIG of PCI VENDOR ID*/
-#define CFG_PCI_VENDOR_ID(mod_dev_id, sys_vendor_id) \
-	(((mod_dev_id) << 16) | (sys_vendor_id))
-
-/* VENDOR ID */
-#define CS5536_VENDOR_ID	0x1022
-
-/* DEVICE ID */
-#define CS5536_ISA_DEVICE_ID		0x2090
-#define CS5536_IDE_DEVICE_ID		0x209a
-#define CS5536_ACC_DEVICE_ID		0x2093
-#define CS5536_OHCI_DEVICE_ID		0x2094
-#define CS5536_EHCI_DEVICE_ID		0x2095
-
-/* CLASS CODE : CLASS SUB-CLASS INTERFACE */
-#define CS5536_ISA_CLASS_CODE		0x060100
-#define CS5536_IDE_CLASS_CODE		0x010180
-#define CS5536_ACC_CLASS_CODE		0x040100
-#define CS5536_OHCI_CLASS_CODE		0x0C0310
-#define CS5536_EHCI_CLASS_CODE		0x0C0320
-
-/* BHLC : BIST HEADER-TYPE LATENCY-TIMER CACHE-LINE-SIZE */
-
-#define CFG_PCI_CACHE_LINE_SIZE(header_type, latency_timer)	\
-	((PCI_NONE_BIST << 24) | ((header_type) << 16) \
-		| ((latency_timer) << 8) | PCI_NORMAL_CACHE_LINE_SIZE);
-
-#define PCI_NONE_BIST			0x00	/* RO not implemented yet. */
-#define PCI_BRIDGE_HEADER_TYPE		0x80	/* RO */
-#define PCI_NORMAL_HEADER_TYPE		0x00
-#define PCI_NORMAL_LATENCY_TIMER	0x00
-#define PCI_NORMAL_CACHE_LINE_SIZE	0x08	/* RW */
-
-/* BAR */
-#define PCI_BAR0_REG			0x10
-#define PCI_BAR1_REG			0x14
-#define PCI_BAR2_REG			0x18
-#define PCI_BAR3_REG			0x1c
-#define PCI_BAR4_REG			0x20
-#define PCI_BAR5_REG			0x24
-#define PCI_BAR_RANGE_MASK		0xFFFFFFFF
-
-/* CARDBUS CIS POINTER */
-#define PCI_CARDBUS_CIS_POINTER		0x00000000
-
-/* SUBSYSTEM VENDOR ID	*/
-#define CS5536_SUB_VENDOR_ID		CS5536_VENDOR_ID
-
-/* SUBSYSTEM ID */
-#define CS5536_ISA_SUB_ID		CS5536_ISA_DEVICE_ID
-#define CS5536_IDE_SUB_ID		CS5536_IDE_DEVICE_ID
-#define CS5536_ACC_SUB_ID		CS5536_ACC_DEVICE_ID
-#define CS5536_OHCI_SUB_ID		CS5536_OHCI_DEVICE_ID
-#define CS5536_EHCI_SUB_ID		CS5536_EHCI_DEVICE_ID
-
-/* EXPANSION ROM BAR */
-#define PCI_EXPANSION_ROM_BAR		0x00000000
-
-/* CAPABILITIES POINTER */
-#define PCI_CAPLIST_POINTER		0x00000000
-#define PCI_CAPLIST_USB_POINTER		0x40
-/* INTERRUPT */
-
-#define CFG_PCI_INTERRUPT_LINE(pin, mod_intr) \
-	((PCI_MAX_LATENCY << 24) | (PCI_MIN_GRANT << 16) | \
-		((pin) << 8) | (mod_intr))
-
-#define PCI_MAX_LATENCY			0x40
-#define PCI_MIN_GRANT			0x00
-#define PCI_DEFAULT_PIN			0x01
-
-/*********** EXPANSION PCI REG ************************/
-
-/*
- * ISA EXPANSION
- */
-#define PCI_UART1_INT_REG	0x50
-#define PCI_UART2_INT_REG	0x54
-#define PCI_ISA_FIXUP_REG	0x58
-
-/*
- * IDE EXPANSION
- */
-#define PCI_IDE_CFG_REG		0x40
-#define CS5536_IDE_FLASH_SIGNATURE	0xDEADBEEF
-#define PCI_IDE_DTC_REG		0x48
-#define PCI_IDE_CAST_REG	0x4C
-#define PCI_IDE_ETC_REG		0x50
-#define PCI_IDE_PM_REG		0x54
-#define PCI_IDE_INT_REG		0x60
-
-/*
- * ACC EXPANSION
- */
-#define PCI_ACC_INT_REG		0x50
-
-/*
- * OHCI EXPANSION : INTTERUPT IS IMPLEMENTED BY THE OHCI
- */
-#define PCI_OHCI_PM_REG		0x40
-#define PCI_OHCI_INT_REG	0x50
-
-/*
- * EHCI EXPANSION
- */
-#define PCI_EHCI_LEGSMIEN_REG	0x50
-#define PCI_EHCI_LEGSMISTS_REG	0x54
-#define PCI_EHCI_FLADJ_REG	0x60
-
-#endif				/* _CS5536_PCI_H_ */
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h b/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h
deleted file mode 100644
index 70d0153cccc3..000000000000
--- a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * the read/write interfaces for Virtual Support Module(VSM)
- *
- * Copyright (C) 2009 Lemote, Inc.
- * Author: Wu Zhangjin <wuzhangjin@gmail.com>
- */
-
-#ifndef _CS5536_VSM_H
-#define _CS5536_VSM_H
-
-#include <linux/types.h>
-
-typedef void (*cs5536_pci_vsm_write)(int reg, u32 value);
-typedef u32 (*cs5536_pci_vsm_read)(int reg);
-
-#define DECLARE_CS5536_MODULE(name) \
-extern void pci_##name##_write_reg(int reg, u32 value); \
-extern u32 pci_##name##_read_reg(int reg);
-
-/* ide module */
-DECLARE_CS5536_MODULE(ide)
-/* acc module */
-DECLARE_CS5536_MODULE(acc)
-/* ohci module */
-DECLARE_CS5536_MODULE(ohci)
-/* isa module */
-DECLARE_CS5536_MODULE(isa)
-/* ehci module */
-DECLARE_CS5536_MODULE(ehci)
-
-#endif				/* _CS5536_VSM_H */
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index 557e069c400c..73a89913dc38 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -4,8 +4,6 @@
 
 #include <boot_param.h>
 
-#ifdef CONFIG_CPU_LOONGSON64
-
 /* cpu core interrupt numbers */
 #define MIPS_CPU_IRQ_BASE 56
 
@@ -35,8 +33,6 @@
 
 #define LOONGSON_INT_COREx_INTy(x, y)	(1<<(x) | 1<<(y+4))	/* route to int y of core x */
 
-#endif
-
 extern void fixup_irqs(void);
 extern void loongson3_ipi_interrupt(struct pt_regs *regs);
 
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index 28ccb06c8289..87a5bfbf8cfe 100644
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
@@ -17,7 +17,6 @@
  * Override macros used in arch/mips/kernel/head.S.
  */
 	.macro	kernel_entry_setup
-#ifdef CONFIG_CPU_LOONGSON64
 	.set	push
 	.set	mips64
 	/* Set LPA on LOONGSON3 config3 */
@@ -47,14 +46,12 @@
 2:
 	_ehb
 	.set	pop
-#endif
 	.endm
 
 /*
  * Do SMP slave processor setup.
  */
 	.macro	smp_slave_setup
-#ifdef CONFIG_CPU_LOONGSON64
 	.set	push
 	.set	mips64
 	/* Set LPA on LOONGSON3 config3 */
@@ -84,7 +81,6 @@
 2:
 	_ehb
 	.set	pop
-#endif
 	.endm
 
 #endif /* __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H */
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index 40a24b76b874..bc00c2d88225 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -12,8 +12,6 @@
 #include <linux/irq.h>
 #include <boot_param.h>
 
-/* loongson internal northbridge initialization */
-extern void bonito_irq_init(void);
 
 /* machine-specific reboot/halt operation */
 extern void mach_prepare_reboot(void);
@@ -27,24 +25,9 @@ extern const struct plat_smp_ops loongson3_smp_ops;
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
 extern void __init prom_init_cmdline(void);
-extern void __init prom_init_machtype(void);
 extern void __init prom_init_env(void);
-#ifdef CONFIG_LOONGSON_UART_BASE
-extern unsigned long _loongson_uart_base[], loongson_uart_base[];
-extern void prom_init_loongson_uart_base(void);
-#endif
-
-static inline void prom_init_uart_base(void)
-{
-#ifdef CONFIG_LOONGSON_UART_BASE
-	prom_init_loongson_uart_base();
-#endif
-}
 
 /* irq operation functions */
-extern void bonito_irqdispatch(void);
-extern void __init bonito_irq_init(void);
-extern void __init mach_init_irq(void);
 extern void mach_irq_dispatch(unsigned int pending);
 extern int mach_i8259_irq(void);
 
@@ -64,17 +47,6 @@ extern int mach_i8259_irq(void);
 #define LOONGSON3_REG32(base, x) \
 	(*(volatile u32 *)((char *)TO_UNCAC(base) + (x)))
 
-#define LOONGSON_IRQ_BASE	32
-#define LOONGSON2_PERFCNT_IRQ	(MIPS_CPU_IRQ_BASE + 6) /* cpu perf counter */
-
-#include <linux/interrupt.h>
-static inline void do_perfcnt_IRQ(void)
-{
-#if IS_ENABLED(CONFIG_OPROFILE)
-	do_IRQ(LOONGSON2_PERFCNT_IRQ);
-#endif
-}
-
 #define LOONGSON_FLASH_BASE	0x1c000000
 #define LOONGSON_FLASH_SIZE	0x02000000	/* 32M */
 #define LOONGSON_FLASH_TOP	(LOONGSON_FLASH_BASE+LOONGSON_FLASH_SIZE-1)
@@ -109,11 +81,7 @@ static inline void do_perfcnt_IRQ(void)
 #define LOONGSON_PCICFG_SIZE	0x00000800	/* 2K */
 #define LOONGSON_PCICFG_TOP	(LOONGSON_PCICFG_BASE+LOONGSON_PCICFG_SIZE-1)
 
-#ifdef CONFIG_CPU_LOONGSON64
 #define LOONGSON_PCIIO_BASE	loongson_sysconf.pci_io_base
-#else
-#define LOONGSON_PCIIO_BASE	0x1fd00000
-#endif
 
 #define LOONGSON_PCIIO_SIZE	0x00100000	/* 1M */
 #define LOONGSON_PCIIO_TOP	(LOONGSON_PCIIO_BASE+LOONGSON_PCIIO_SIZE-1)
@@ -270,86 +238,4 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
 #define LOONGSON_PCIMAP_WIN(WIN, ADDR)	\
 	((((ADDR)>>26) & LOONGSON_PCIMAP_PCIMAP_LO0) << ((WIN)*6))
 
-#ifdef CONFIG_CPU_SUPPORTS_CPUFREQ
-#include <linux/cpufreq.h>
-extern struct cpufreq_frequency_table loongson2_clockmod_table[];
-#endif
-
-/*
- * address windows configuration module
- *
- * loongson2e do not have this module
- */
-#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
-
-/* address window config module base address */
-#define LOONGSON_ADDRWINCFG_BASE		0x3ff00000ul
-#define LOONGSON_ADDRWINCFG_SIZE		0x180
-
-extern unsigned long _loongson_addrwincfg_base;
-#define LOONGSON_ADDRWINCFG(offset) \
-	(*(volatile u64 *)(_loongson_addrwincfg_base + (offset)))
-
-#define CPU_WIN0_BASE	LOONGSON_ADDRWINCFG(0x00)
-#define CPU_WIN1_BASE	LOONGSON_ADDRWINCFG(0x08)
-#define CPU_WIN2_BASE	LOONGSON_ADDRWINCFG(0x10)
-#define CPU_WIN3_BASE	LOONGSON_ADDRWINCFG(0x18)
-
-#define CPU_WIN0_MASK	LOONGSON_ADDRWINCFG(0x20)
-#define CPU_WIN1_MASK	LOONGSON_ADDRWINCFG(0x28)
-#define CPU_WIN2_MASK	LOONGSON_ADDRWINCFG(0x30)
-#define CPU_WIN3_MASK	LOONGSON_ADDRWINCFG(0x38)
-
-#define CPU_WIN0_MMAP	LOONGSON_ADDRWINCFG(0x40)
-#define CPU_WIN1_MMAP	LOONGSON_ADDRWINCFG(0x48)
-#define CPU_WIN2_MMAP	LOONGSON_ADDRWINCFG(0x50)
-#define CPU_WIN3_MMAP	LOONGSON_ADDRWINCFG(0x58)
-
-#define PCIDMA_WIN0_BASE	LOONGSON_ADDRWINCFG(0x60)
-#define PCIDMA_WIN1_BASE	LOONGSON_ADDRWINCFG(0x68)
-#define PCIDMA_WIN2_BASE	LOONGSON_ADDRWINCFG(0x70)
-#define PCIDMA_WIN3_BASE	LOONGSON_ADDRWINCFG(0x78)
-
-#define PCIDMA_WIN0_MASK	LOONGSON_ADDRWINCFG(0x80)
-#define PCIDMA_WIN1_MASK	LOONGSON_ADDRWINCFG(0x88)
-#define PCIDMA_WIN2_MASK	LOONGSON_ADDRWINCFG(0x90)
-#define PCIDMA_WIN3_MASK	LOONGSON_ADDRWINCFG(0x98)
-
-#define PCIDMA_WIN0_MMAP	LOONGSON_ADDRWINCFG(0xa0)
-#define PCIDMA_WIN1_MMAP	LOONGSON_ADDRWINCFG(0xa8)
-#define PCIDMA_WIN2_MMAP	LOONGSON_ADDRWINCFG(0xb0)
-#define PCIDMA_WIN3_MMAP	LOONGSON_ADDRWINCFG(0xb8)
-
-#define ADDRWIN_WIN0	0
-#define ADDRWIN_WIN1	1
-#define ADDRWIN_WIN2	2
-#define ADDRWIN_WIN3	3
-
-#define ADDRWIN_MAP_DST_DDR	0
-#define ADDRWIN_MAP_DST_PCI	1
-#define ADDRWIN_MAP_DST_LIO	1
-
-/*
- * s: CPU, PCIDMA
- * d: DDR, PCI, LIO
- * win: 0, 1, 2, 3
- * src: map source
- * dst: map destination
- * size: ~mask + 1
- */
-#define LOONGSON_ADDRWIN_CFG(s, d, w, src, dst, size) do {\
-	s##_WIN##w##_BASE = (src); \
-	s##_WIN##w##_MMAP = (dst) | ADDRWIN_MAP_DST_##d; \
-	s##_WIN##w##_MASK = ~(size-1); \
-} while (0)
-
-#define LOONGSON_ADDRWIN_CPUTOPCI(win, src, dst, size) \
-	LOONGSON_ADDRWIN_CFG(CPU, PCI, win, src, dst, size)
-#define LOONGSON_ADDRWIN_CPUTODDR(win, src, dst, size) \
-	LOONGSON_ADDRWIN_CFG(CPU, DDR, win, src, dst, size)
-#define LOONGSON_ADDRWIN_PCITODDR(win, src, dst, size) \
-	LOONGSON_ADDRWIN_CFG(PCIDMA, DDR, win, src, dst, size)
-
-#endif	/* ! CONFIG_CPU_SUPPORTS_ADDRWINCFG */
-
 #endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
diff --git a/arch/mips/include/asm/mach-loongson64/machine.h b/arch/mips/include/asm/mach-loongson64/machine.h
deleted file mode 100644
index 8ef7ea94a26d..000000000000
--- a/arch/mips/include/asm/mach-loongson64/machine.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2009 Lemote, Inc.
- * Author: Wu Zhangjin <wuzhangjin@gmail.com>
- */
-
-#ifndef __ASM_MACH_LOONGSON64_MACHINE_H
-#define __ASM_MACH_LOONGSON64_MACHINE_H
-
-#ifdef CONFIG_LEMOTE_FULOONG2E
-
-#define LOONGSON_MACHTYPE MACH_LEMOTE_FL2E
-
-#endif
-
-/* use fuloong2f as the default machine of LEMOTE_MACH2F */
-#ifdef CONFIG_LEMOTE_MACH2F
-
-#define LOONGSON_MACHTYPE MACH_LEMOTE_FL2F
-
-#endif
-
-#ifdef CONFIG_LOONGSON_MACH3X
-
-#define LOONGSON_MACHTYPE MACH_LOONGSON_GENERIC
-
-#endif /* CONFIG_LOONGSON_MACH3X */
-
-#endif /* __ASM_MACH_LOONGSON64_MACHINE_H */
diff --git a/arch/mips/include/asm/mach-loongson64/mem.h b/arch/mips/include/asm/mach-loongson64/mem.h
deleted file mode 100644
index ce33c174c04d..000000000000
--- a/arch/mips/include/asm/mach-loongson64/mem.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2009 Lemote, Inc.
- * Author: Wu Zhangjin <wuzhangjin@gmail.com>
- */
-
-#ifndef __ASM_MACH_LOONGSON64_MEM_H
-#define __ASM_MACH_LOONGSON64_MEM_H
-
-/*
- * high memory space
- *
- * in loongson2e, starts from 512M
- * in loongson2f, starts from 2G 256M
- */
-#ifdef CONFIG_CPU_LOONGSON2E
-#define LOONGSON_HIGHMEM_START	0x20000000
-#else
-#define LOONGSON_HIGHMEM_START	0x90000000
-#endif
-
-/*
- * the peripheral registers(MMIO):
- *
- * On the Lemote Loongson 2e system, reside between 0x1000:0000 and 0x2000:0000.
- * On the Lemote Loongson 2f system, reside between 0x1000:0000 and 0x8000:0000.
- */
-
-#define LOONGSON_MMIO_MEM_START 0x10000000
-
-#ifdef CONFIG_CPU_LOONGSON2E
-#define LOONGSON_MMIO_MEM_END	0x20000000
-#else
-#define LOONGSON_MMIO_MEM_END	0x80000000
-#endif
-
-#endif /* __ASM_MACH_LOONGSON64_MEM_H */
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index 62073d60739f..3a25dbd3b3e9 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -6,8 +6,8 @@
  *          Huacai Chen, chenhc@lemote.com
  *          Xiaofu Meng, Shuangshuang Zhang
  */
-#ifndef _ASM_MACH_MMZONE_H
-#define _ASM_MACH_MMZONE_H
+#ifndef _ASM_MACH_LOONGSON64_MMZONE_H
+#define _ASM_MACH_LOONGSON64_MMZONE_H
 
 #include <boot_param.h>
 #define NODE_ADDRSPACE_SHIFT 44
@@ -19,30 +19,9 @@
 #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
 #define nid_to_addrbase(nid) ((nid) << NODE_ADDRSPACE_SHIFT)
 
-#define LEVELS_PER_SLICE 128
+extern struct pglist_data *__node_data[];
 
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
+#define NODE_DATA(n)		(__node_data[n])
 
 extern void setup_zero_pages(void);
 extern void __init prom_init_numa_memory(void);
diff --git a/arch/mips/include/asm/mach-loongson64/pci.h b/arch/mips/include/asm/mach-loongson64/pci.h
index 05cc9052772f..8b59d64a23e8 100644
--- a/arch/mips/include/asm/mach-loongson64/pci.h
+++ b/arch/mips/include/asm/mach-loongson64/pci.h
@@ -12,39 +12,8 @@ extern struct pci_ops loongson_pci_ops;
 /* this is an offset from mips_io_port_base */
 #define LOONGSON_PCI_IO_START	0x00004000UL
 
-#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
-
-/*
- * we use address window2 to map cpu address space to pci space
- * window2: cpu [1G, 2G] -> pci [1G, 2G]
- * why not use window 0 & 1? because they are used by cpu when booting.
- * window0: cpu [0, 256M] -> ddr [0, 256M]
- * window1: cpu [256M, 512M] -> pci [256M, 512M]
- */
-
-/* the smallest LOONGSON_CPU_MEM_SRC can be 512M */
-#define LOONGSON_CPU_MEM_SRC	0x40000000ul		/* 1G */
-#define LOONGSON_PCI_MEM_DST	LOONGSON_CPU_MEM_SRC
-
-#define LOONGSON_PCI_MEM_START	LOONGSON_PCI_MEM_DST
-#define LOONGSON_PCI_MEM_END	(0x80000000ul-1)	/* 2G */
-
-#define MMAP_CPUTOPCI_SIZE	(LOONGSON_PCI_MEM_END - \
-					LOONGSON_PCI_MEM_START + 1)
-
-#else	/* loongson2f/32bit & loongson2e */
-
-/* this pci memory space is mapped by pcimap in pci.c */
-#ifdef CONFIG_CPU_LOONGSON64
 #define LOONGSON_PCI_MEM_START	0x40000000UL
 #define LOONGSON_PCI_MEM_END	0x7effffffUL
-#else
-#define LOONGSON_PCI_MEM_START	LOONGSON_PCILO1_BASE
-#define LOONGSON_PCI_MEM_END	(LOONGSON_PCILO1_BASE + 0x04000000 * 2)
-#endif
-/* this is an offset from mips_io_port_base */
-#define LOONGSON_PCI_IO_START	0x00004000UL
 
-#endif	/* !CONFIG_CPU_SUPPORTS_ADDRWINCFG */
 
 #endif /* !__ASM_MACH_LOONGSON64_PCI_H_ */
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
index 7ff819ab308a..3414a1fd1783 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -5,7 +5,9 @@
 #ifdef CONFIG_NUMA
 
 #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
-#define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
+
+extern cpumask_t __node_cpumask[];
+#define cpumask_of_node(node)	(&__node_cpumask[node])
 
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index 0e99a5af6e90..3215b768bb88 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -20,6 +20,7 @@ config LOONGSON_MACH3X
 	select I8259
 	select IRQ_MIPS_CPU
 	select NR_CPUS_DEFAULT_4
+	select USE_GENERIC_EARLY_PRINTK_8250
 	select SYS_HAS_CPU_LOONGSON64
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_SMP
@@ -30,7 +31,7 @@ config LOONGSON_MACH3X
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select LOONGSON_MC146818
 	select ZONE_DMA32
-	select LEFI_FIRMWARE_INTERFACE
+	select NUMA
 	help
 		Generic Loongson 3 family machines utilize the 3A/3B revision
 		of Loongson processor and RS780/SBX00 chipset.
@@ -48,16 +49,9 @@ config RS780_HPET
 
 	  If unsure, say Yes.
 
-config LOONGSON_UART_BASE
-	bool
-	default y
-	depends on EARLY_PRINTK || SERIAL_8250
 
 config LOONGSON_MC146818
 	bool
 	default n
 
-config LEFI_FIRMWARE_INTERFACE
-	bool
-
 endif # MACH_LOONGSON64
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index 31167e568e46..a1efea6ce6bb 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -53,4 +53,4 @@ endif
 
 platform-$(CONFIG_MACH_LOONGSON64) += loongson64/
 cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
-load-$(CONFIG_LOONGSON_MACH3X) += 0xffffffff80200000
+load-$(CONFIG_CPU_LOONGSON64) += 0xffffffff80200000
diff --git a/arch/mips/loongson64/common/Makefile b/arch/mips/loongson64/common/Makefile
index 85438df80950..c476401c9b13 100644
--- a/arch/mips/loongson64/common/Makefile
+++ b/arch/mips/loongson64/common/Makefile
@@ -3,15 +3,10 @@
 # Makefile for loongson based machines.
 #
 
-obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
-    bonito-irq.o mem.o machtype.o platform.o serial.o
+obj-y += setup.o init.o cmdline.o env.o time.o reset.o
+
 obj-$(CONFIG_PCI) += pci.o
 
-#
-# Serial port support
-#
-obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
-obj-$(CONFIG_LOONGSON_UART_BASE) += uart_base.o
 obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
 
 #
diff --git a/arch/mips/loongson64/common/bonito-irq.c b/arch/mips/loongson64/common/bonito-irq.c
deleted file mode 100644
index 82352cc25e4c..000000000000
--- a/arch/mips/loongson64/common/bonito-irq.c
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2001 MontaVista Software Inc.
- * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
- * Copyright (C) 2000, 2001 Ralf Baechle (ralf@gnu.org)
- *
- * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
- * Author: Fuxin Zhang, zhangfx@lemote.com
- */
-#include <linux/interrupt.h>
-#include <linux/compiler.h>
-
-#include <loongson.h>
-
-static inline void bonito_irq_enable(struct irq_data *d)
-{
-	LOONGSON_INTENSET = (1 << (d->irq - LOONGSON_IRQ_BASE));
-	mmiowb();
-}
-
-static inline void bonito_irq_disable(struct irq_data *d)
-{
-	LOONGSON_INTENCLR = (1 << (d->irq - LOONGSON_IRQ_BASE));
-	mmiowb();
-}
-
-static struct irq_chip bonito_irq_type = {
-	.name		= "bonito_irq",
-	.irq_mask	= bonito_irq_disable,
-	.irq_unmask	= bonito_irq_enable,
-};
-
-static struct irqaction __maybe_unused dma_timeout_irqaction = {
-	.handler	= no_action,
-	.name		= "dma_timeout",
-};
-
-void bonito_irq_init(void)
-{
-	u32 i;
-
-	for (i = LOONGSON_IRQ_BASE; i < LOONGSON_IRQ_BASE + 32; i++)
-		irq_set_chip_and_handler(i, &bonito_irq_type,
-					 handle_level_irq);
-
-#ifdef CONFIG_CPU_LOONGSON2E
-	setup_irq(LOONGSON_IRQ_BASE + 10, &dma_timeout_irqaction);
-#endif
-}
diff --git a/arch/mips/loongson64/common/cmdline.c b/arch/mips/loongson64/common/cmdline.c
index a735460682cf..fb1644b01471 100644
--- a/arch/mips/loongson64/common/cmdline.c
+++ b/arch/mips/loongson64/common/cmdline.c
@@ -39,6 +39,4 @@ void __init prom_init_cmdline(void)
 		strcat(arcs_cmdline, ((char *)l));
 		strcat(arcs_cmdline, " ");
 	}
-
-	prom_init_machtype();
 }
diff --git a/arch/mips/loongson64/common/early_printk.c b/arch/mips/loongson64/common/early_printk.c
deleted file mode 100644
index 5e2a151aa30c..000000000000
--- a/arch/mips/loongson64/common/early_printk.c
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*  early printk support
- *
- *  Copyright (c) 2009 Philippe Vachon <philippe@cowpig.ca>
- *  Copyright (c) 2009 Lemote Inc.
- *  Author: Wu Zhangjin, wuzhangjin@gmail.com
- */
-#include <linux/serial_reg.h>
-#include <asm/setup.h>
-
-#include <loongson.h>
-
-#define PORT(base, offset) (u8 *)(base + offset)
-
-static inline unsigned int serial_in(unsigned char *base, int offset)
-{
-	return readb(PORT(base, offset));
-}
-
-static inline void serial_out(unsigned char *base, int offset, int value)
-{
-	writeb(value, PORT(base, offset));
-}
-
-void prom_putchar(char c)
-{
-	int timeout;
-	unsigned char *uart_base;
-
-	uart_base = (unsigned char *)_loongson_uart_base[0];
-	timeout = 1024;
-
-	while (((serial_in(uart_base, UART_LSR) & UART_LSR_THRE) == 0) &&
-			(timeout-- > 0))
-		;
-
-	serial_out(uart_base, UART_TX, c);
-}
diff --git a/arch/mips/loongson64/common/env.c b/arch/mips/loongson64/common/env.c
index 09d5cf4676ca..0daeb7bcf023 100644
--- a/arch/mips/loongson64/common/env.c
+++ b/arch/mips/loongson64/common/env.c
@@ -30,41 +30,13 @@ u64 loongson_freqctrl[MAX_PACKAGES];
 
 unsigned long long smp_group[4];
 
-#define parse_even_earlier(res, option, p)				\
-do {									\
-	unsigned int tmp __maybe_unused;				\
-									\
-	if (strncmp(option, (char *)p, strlen(option)) == 0)		\
-		tmp = kstrtou32((char *)p + strlen(option"="), 10, &res); \
-} while (0)
+const char *get_system_type(void)
+{
+	return "Generic Loongson64 System";
+}
 
 void __init prom_init_env(void)
 {
-	/* pmon passes arguments in 32bit pointers */
-	unsigned int processor_id;
-
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
-	int *_prom_envp;
-	long l;
-
-	/* firmware arguments are initialized in head.S */
-	_prom_envp = (int *)fw_arg2;
-
-	l = (long)*_prom_envp;
-	while (l != 0) {
-		parse_even_earlier(cpu_clock_freq, "cpuclock", l);
-		parse_even_earlier(memsize, "memsize", l);
-		parse_even_earlier(highmemsize, "highmemsize", l);
-		_prom_envp++;
-		l = (long)*_prom_envp;
-	}
-	if (memsize == 0)
-		memsize = 256;
-
-	loongson_sysconf.nr_uarts = 1;
-
-	pr_info("memsize=%u, highmemsize=%u\n", memsize, highmemsize);
-#else
 	struct boot_params *boot_p;
 	struct loongson_params *loongson_p;
 	struct system_loongson *esys;
@@ -182,31 +154,5 @@ void __init prom_init_env(void)
 	if (loongson_sysconf.nr_sensors)
 		memcpy(loongson_sysconf.sensors, esys->sensors,
 			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
-#endif
-	if (cpu_clock_freq == 0) {
-		processor_id = (&current_cpu_data)->processor_id;
-		switch (processor_id & PRID_REV_MASK) {
-		case PRID_REV_LOONGSON2E:
-			cpu_clock_freq = 533080000;
-			break;
-		case PRID_REV_LOONGSON2F:
-			cpu_clock_freq = 797000000;
-			break;
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
-		default:
-			cpu_clock_freq = 100000000;
-			break;
-		}
-	}
 	pr_info("CpuClock = %u\n", cpu_clock_freq);
 }
diff --git a/arch/mips/loongson64/common/init.c b/arch/mips/loongson64/common/init.c
index 912fe61c4fc7..48b44f415059 100644
--- a/arch/mips/loongson64/common/init.c
+++ b/arch/mips/loongson64/common/init.c
@@ -12,9 +12,6 @@
 
 #include <loongson.h>
 
-/* Loongson CPU address windows config space base address */
-unsigned long __maybe_unused _loongson_addrwincfg_base;
-
 static void __init mips_nmi_setup(void)
 {
 	void *base;
@@ -27,11 +24,6 @@ static void __init mips_nmi_setup(void)
 
 void __init prom_init(void)
 {
-#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
-	_loongson_addrwincfg_base = (unsigned long)
-		ioremap(LOONGSON_ADDRWINCFG_BASE, LOONGSON_ADDRWINCFG_SIZE);
-#endif
-
 	prom_init_cmdline();
 	prom_init_env();
 
@@ -39,14 +31,11 @@ void __init prom_init(void)
 	set_io_port_base((unsigned long)
 		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
 
-#ifdef CONFIG_NUMA
 	prom_init_numa_memory();
-#else
-	prom_init_memory();
-#endif
 
-	/*init the uart base address */
-	prom_init_uart_base();
+	/* Hardcode to CPU UART 0 */
+	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
+
 	register_smp_ops(&loongson3_smp_ops);
 	board_nmi_handler_setup = mips_nmi_setup;
 }
diff --git a/arch/mips/loongson64/common/irq.c b/arch/mips/loongson64/common/irq.c
deleted file mode 100644
index 0ea93c1c0a97..000000000000
--- a/arch/mips/loongson64/common/irq.c
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
- * Author: Fuxin Zhang, zhangfx@lemote.com
- */
-#include <linux/delay.h>
-#include <linux/interrupt.h>
-
-#include <loongson.h>
-/*
- * the first level int-handler will jump here if it is a bonito irq
- */
-void bonito_irqdispatch(void)
-{
-	u32 int_status;
-	int i;
-
-	/* workaround the IO dma problem: let cpu looping to allow DMA finish */
-	int_status = LOONGSON_INTISR;
-	while (int_status & (1 << 10)) {
-		udelay(1);
-		int_status = LOONGSON_INTISR;
-	}
-
-	/* Get pending sources, masked by current enables */
-	int_status = LOONGSON_INTISR & LOONGSON_INTEN;
-
-	if (int_status) {
-		i = __ffs(int_status);
-		do_IRQ(LOONGSON_IRQ_BASE + i);
-	}
-}
-
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending;
-
-	pending = read_c0_cause() & read_c0_status() & ST0_IM;
-
-	/* machine-specific plat_irq_dispatch */
-	mach_irq_dispatch(pending);
-}
-
-void __init arch_init_irq(void)
-{
-	/*
-	 * Clear all of the interrupts while we change the able around a bit.
-	 * int-handler is not on bootstrap
-	 */
-	clear_c0_status(ST0_IM | ST0_BEV);
-
-	/* no steer */
-	LOONGSON_INTSTEER = 0;
-
-	/*
-	 * Mask out all interrupt by writing "1" to all bit position in
-	 * the interrupt reset reg.
-	 */
-	LOONGSON_INTENCLR = ~0;
-
-	/* machine specific irq init */
-	mach_init_irq();
-}
diff --git a/arch/mips/loongson64/common/machtype.c b/arch/mips/loongson64/common/machtype.c
deleted file mode 100644
index 4e42d929f1c7..000000000000
--- a/arch/mips/loongson64/common/machtype.c
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2009 Lemote Inc.
- * Author: Wu Zhangjin, wuzhangjin@gmail.com
- *
- * Copyright (c) 2009 Zhang Le <r0bertz@gentoo.org>
- */
-#include <linux/errno.h>
-#include <asm/bootinfo.h>
-
-#include <loongson.h>
-#include <machine.h>
-
-/* please ensure the length of the machtype string is less than 50 */
-#define MACHTYPE_LEN 50
-
-static const char *system_types[] = {
-	[MACH_LOONGSON_UNKNOWN]	= "unknown loongson machine",
-	[MACH_LEMOTE_FL2E]	= "lemote-fuloong-2e-box",
-	[MACH_LEMOTE_FL2F]	= "lemote-fuloong-2f-box",
-	[MACH_LEMOTE_ML2F7]	= "lemote-mengloong-2f-7inches",
-	[MACH_LEMOTE_YL2F89]	= "lemote-yeeloong-2f-8.9inches",
-	[MACH_DEXXON_GDIUM2F10]	= "dexxon-gdium-2f",
-	[MACH_LEMOTE_NAS]	= "lemote-nas-2f",
-	[MACH_LEMOTE_LL2F]	= "lemote-lynloong-2f",
-	[MACH_LOONGSON_GENERIC]	= "generic-loongson-machine",
-	[MACH_LOONGSON_END]	= NULL,
-};
-
-const char *get_system_type(void)
-{
-	return system_types[mips_machtype];
-}
-
-void __weak __init mach_prom_init_machtype(void)
-{
-}
-
-void __init prom_init_machtype(void)
-{
-	char *p, str[MACHTYPE_LEN + 1];
-	int machtype = MACH_LEMOTE_FL2E;
-
-	mips_machtype = LOONGSON_MACHTYPE;
-
-	p = strstr(arcs_cmdline, "machtype=");
-	if (!p) {
-		mach_prom_init_machtype();
-		return;
-	}
-	p += strlen("machtype=");
-	strncpy(str, p, MACHTYPE_LEN);
-	str[MACHTYPE_LEN] = '\0';
-	p = strstr(str, " ");
-	if (p)
-		*p = '\0';
-
-	for (; system_types[machtype]; machtype++)
-		if (strstr(system_types[machtype], str)) {
-			mips_machtype = machtype;
-			break;
-		}
-}
diff --git a/arch/mips/loongson64/common/mem.c b/arch/mips/loongson64/common/mem.c
deleted file mode 100644
index 4254ac4ec616..000000000000
--- a/arch/mips/loongson64/common/mem.c
+++ /dev/null
@@ -1,157 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-#include <linux/fs.h>
-#include <linux/fcntl.h>
-#include <linux/memblock.h>
-#include <linux/mm.h>
-
-#include <asm/bootinfo.h>
-
-#include <loongson.h>
-#include <boot_param.h>
-#include <mem.h>
-#include <pci.h>
-
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
-
-u32 memsize, highmemsize;
-
-void __init prom_init_memory(void)
-{
-	add_memory_region(0x0, (memsize << 20), BOOT_MEM_RAM);
-
-	add_memory_region(memsize << 20, LOONGSON_PCI_MEM_START - (memsize <<
-				20), BOOT_MEM_RESERVED);
-
-#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
-	{
-		int bit;
-
-		bit = fls(memsize + highmemsize);
-		if (bit != ffs(memsize + highmemsize))
-			bit += 20;
-		else
-			bit = bit + 20 - 1;
-
-		/* set cpu window3 to map CPU to DDR: 2G -> 2G */
-		LOONGSON_ADDRWIN_CPUTODDR(ADDRWIN_WIN3, 0x80000000ul,
-					  0x80000000ul, (1 << bit));
-		mmiowb();
-	}
-#endif /* !CONFIG_CPU_SUPPORTS_ADDRWINCFG */
-
-#ifdef CONFIG_64BIT
-	if (highmemsize > 0)
-		add_memory_region(LOONGSON_HIGHMEM_START,
-				  highmemsize << 20, BOOT_MEM_RAM);
-
-	add_memory_region(LOONGSON_PCI_MEM_END + 1, LOONGSON_HIGHMEM_START -
-			  LOONGSON_PCI_MEM_END - 1, BOOT_MEM_RESERVED);
-
-#endif /* !CONFIG_64BIT */
-}
-
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
-/* override of arch/mips/mm/cache.c: __uncached_access */
-int __uncached_access(struct file *file, unsigned long addr)
-{
-	if (file->f_flags & O_DSYNC)
-		return 1;
-
-	return addr >= __pa(high_memory) ||
-		((addr >= LOONGSON_MMIO_MEM_START) &&
-		 (addr < LOONGSON_MMIO_MEM_END));
-}
-
-#ifdef CONFIG_CPU_SUPPORTS_UNCACHED_ACCELERATED
-
-#include <linux/pci.h>
-#include <linux/sched.h>
-#include <asm/current.h>
-
-static unsigned long uca_start, uca_end;
-
-pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-			      unsigned long size, pgprot_t vma_prot)
-{
-	unsigned long offset = pfn << PAGE_SHIFT;
-	unsigned long end = offset + size;
-
-	if (__uncached_access(file, offset)) {
-		if (uca_start && (offset >= uca_start) &&
-		    (end <= uca_end))
-			return __pgprot((pgprot_val(vma_prot) &
-					 ~_CACHE_MASK) |
-					_CACHE_UNCACHED_ACCELERATED);
-		else
-			return pgprot_noncached(vma_prot);
-	}
-	return vma_prot;
-}
-
-static int __init find_vga_mem_init(void)
-{
-	struct pci_dev *dev = 0;
-	struct resource *r;
-	int idx;
-
-	if (uca_start)
-		return 0;
-
-	for_each_pci_dev(dev) {
-		if ((dev->class >> 16) == PCI_BASE_CLASS_DISPLAY) {
-			for (idx = 0; idx < PCI_NUM_RESOURCES; idx++) {
-				r = &dev->resource[idx];
-				if (!r->start && r->end)
-					continue;
-				if (r->flags & IORESOURCE_IO)
-					continue;
-				if (r->flags & IORESOURCE_MEM) {
-					uca_start = r->start;
-					uca_end = r->end;
-					return 0;
-				}
-			}
-		}
-	}
-
-	return 0;
-}
-
-late_initcall(find_vga_mem_init);
-#endif /* !CONFIG_CPU_SUPPORTS_UNCACHED_ACCELERATED */
diff --git a/arch/mips/loongson64/common/pci.c b/arch/mips/loongson64/common/pci.c
index 2d9755c49524..7bbe2388f38e 100644
--- a/arch/mips/loongson64/common/pci.c
+++ b/arch/mips/loongson64/common/pci.c
@@ -81,15 +81,12 @@ static int __init pcibios_init(void)
 	setup_pcimap();
 
 	loongson_pci_controller.io_map_base = mips_io_port_base;
-#ifdef CONFIG_LEFI_FIRMWARE_INTERFACE
 	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
 	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
-#endif
+
 	register_pci_controller(&loongson_pci_controller);
 
-#ifdef CONFIG_CPU_LOONGSON64
 	sbx00_acpi_init();
-#endif
 
 	return 0;
 }
diff --git a/arch/mips/loongson64/common/platform.c b/arch/mips/loongson64/common/platform.c
deleted file mode 100644
index 0084820cffaa..000000000000
--- a/arch/mips/loongson64/common/platform.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2009 Lemote Inc.
- * Author: Wu Zhangjin, wuzhangjin@gmail.com
- */
-
-#include <linux/err.h>
-#include <linux/smp.h>
-#include <linux/platform_device.h>
-
-static struct platform_device loongson2_cpufreq_device = {
-	.name = "loongson2_cpufreq",
-	.id = -1,
-};
-
-static int __init loongson2_cpufreq_init(void)
-{
-	struct cpuinfo_mips *c = &current_cpu_data;
-
-	/* Only 2F revision and it's successors support CPUFreq */
-	if ((c->processor_id & PRID_REV_MASK) >= PRID_REV_LOONGSON2F)
-		return platform_device_register(&loongson2_cpufreq_device);
-
-	return -ENODEV;
-}
-
-arch_initcall(loongson2_cpufreq_init);
diff --git a/arch/mips/loongson64/common/pm.c b/arch/mips/loongson64/common/pm.c
index b8aed878d912..7c8556f09781 100644
--- a/arch/mips/loongson64/common/pm.c
+++ b/arch/mips/loongson64/common/pm.c
@@ -60,56 +60,6 @@ void __weak setup_wakeup_events(void)
 {
 }
 
-/*
- * Check wakeup events
- */
-int __weak wakeup_loongson(void)
-{
-	return 1;
-}
-
-/*
- * If the events are really what we want to wakeup the CPU, wake it up
- * otherwise put the CPU asleep again.
- */
-static void wait_for_wakeup_events(void)
-{
-	while (!wakeup_loongson())
-		LOONGSON_CHIPCFG(0) &= ~0x7;
-}
-
-/*
- * Stop all perf counters
- *
- * $24 is the control register of Loongson perf counter
- */
-static inline void stop_perf_counters(void)
-{
-	__write_64bit_c0_register($24, 0, 0);
-}
-
-
-static void loongson_suspend_enter(void)
-{
-	static unsigned int cached_cpu_freq;
-
-	/* setup wakeup events via enabling the IRQs */
-	setup_wakeup_events();
-
-	stop_perf_counters();
-
-	cached_cpu_freq = LOONGSON_CHIPCFG(0);
-
-	/* Put CPU into wait mode */
-	LOONGSON_CHIPCFG(0) &= ~0x7;
-
-	/* wait for the given events to wakeup cpu from wait mode */
-	wait_for_wakeup_events();
-
-	LOONGSON_CHIPCFG(0) = cached_cpu_freq;
-	mmiowb();
-}
-
 void __weak mach_suspend(void)
 {
 }
@@ -122,9 +72,6 @@ static int loongson_pm_enter(suspend_state_t state)
 {
 	mach_suspend();
 
-	/* processor specific suspend */
-	loongson_suspend_enter();
-
 	mach_resume();
 
 	return 0;
diff --git a/arch/mips/loongson64/common/reset.c b/arch/mips/loongson64/common/reset.c
index ce39e918e4d5..88b3bd5fed25 100644
--- a/arch/mips/loongson64/common/reset.c
+++ b/arch/mips/loongson64/common/reset.c
@@ -17,31 +17,12 @@
 
 static inline void loongson_reboot(void)
 {
-#ifndef CONFIG_CPU_JUMP_WORKAROUNDS
 	((void (*)(void))ioremap_nocache(LOONGSON_BOOT_BASE, 4)) ();
-#else
-	void (*func)(void);
-
-	func = (void *)ioremap_nocache(LOONGSON_BOOT_BASE, 4);
-
-	__asm__ __volatile__(
-	"	.set	noat						\n"
-	"	jr	%[func]						\n"
-	"	.set	at						\n"
-	: /* No outputs */
-	: [func] "r" (func));
-#endif
 }
 
 static void loongson_restart(char *command)
 {
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
-	/* do preparation for reboot */
-	mach_prepare_reboot();
 
-	/* reboot via jumping to boot base address */
-	loongson_reboot();
-#else
 	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
 
 	fw_restart();
@@ -49,20 +30,10 @@ static void loongson_restart(char *command)
 		if (cpu_wait)
 			cpu_wait();
 	}
-#endif
 }
 
 static void loongson_poweroff(void)
 {
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
-	mach_prepare_shutdown();
-
-	/*
-	 * It needs a wait loop here, but mips/kernel/reset.c already calls
-	 * a generic delay loop, machine_hang(), so simply return.
-	 */
-	return;
-#else
 	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
 
 	fw_poweroff();
@@ -70,7 +41,6 @@ static void loongson_poweroff(void)
 		if (cpu_wait)
 			cpu_wait();
 	}
-#endif
 }
 
 static void loongson_halt(void)
diff --git a/arch/mips/loongson64/common/serial.c b/arch/mips/loongson64/common/serial.c
deleted file mode 100644
index 98c3a7feb10f..000000000000
--- a/arch/mips/loongson64/common/serial.c
+++ /dev/null
@@ -1,117 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2007 Ralf Baechle (ralf@linux-mips.org)
- *
- * Copyright (C) 2009 Lemote, Inc.
- * Author: Yan hua (yanhua@lemote.com)
- * Author: Wu Zhangjin (wuzhangjin@gmail.com)
- */
-
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/serial_8250.h>
-
-#include <asm/bootinfo.h>
-
-#include <loongson.h>
-#include <machine.h>
-
-#define PORT(int, clk)			\
-{								\
-	.irq		= int,					\
-	.uartclk	= clk,					\
-	.iotype		= UPIO_PORT,				\
-	.flags		= UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,	\
-	.regshift	= 0,					\
-}
-
-#define PORT_M(int, clk)				\
-{								\
-	.irq		= MIPS_CPU_IRQ_BASE + (int),		\
-	.uartclk	= clk,					\
-	.iotype		= UPIO_MEM,				\
-	.membase	= (void __iomem *)NULL,			\
-	.flags		= UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,	\
-	.regshift	= 0,					\
-}
-
-static struct plat_serial8250_port uart8250_data[][MAX_UARTS + 1] = {
-	[MACH_LOONGSON_UNKNOWN]	= {},
-	[MACH_LEMOTE_FL2E]	= {PORT(4, 1843200), {} },
-	[MACH_LEMOTE_FL2F]	= {PORT(3, 1843200), {} },
-	[MACH_LEMOTE_ML2F7]	= {PORT_M(3, 3686400), {} },
-	[MACH_LEMOTE_YL2F89]	= {PORT_M(3, 3686400), {} },
-	[MACH_DEXXON_GDIUM2F10]	= {PORT_M(3, 3686400), {} },
-	[MACH_LEMOTE_NAS]	= {PORT_M(3, 3686400), {} },
-	[MACH_LEMOTE_LL2F]	= {PORT(3, 1843200), {} },
-	[MACH_LOONGSON_GENERIC]	= {PORT_M(2, 25000000), {} },
-	[MACH_LOONGSON_END]	= {},
-};
-
-static struct platform_device uart8250_device = {
-	.name = "serial8250",
-	.id = PLAT8250_DEV_PLATFORM,
-};
-
-static int __init serial_init(void)
-{
-	int i;
-	unsigned char iotype;
-
-	iotype = uart8250_data[mips_machtype][0].iotype;
-
-	if (UPIO_MEM == iotype) {
-		uart8250_data[mips_machtype][0].mapbase =
-			loongson_uart_base[0];
-		uart8250_data[mips_machtype][0].membase =
-			(void __iomem *)_loongson_uart_base[0];
-	}
-	else if (UPIO_PORT == iotype)
-		uart8250_data[mips_machtype][0].iobase =
-			loongson_uart_base[0] - LOONGSON_PCIIO_BASE;
-
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
-
-	return platform_device_register(&uart8250_device);
-}
-module_init(serial_init);
-
-static void __exit serial_exit(void)
-{
-	platform_device_unregister(&uart8250_device);
-}
-module_exit(serial_exit);
diff --git a/arch/mips/loongson64/common/setup.c b/arch/mips/loongson64/common/setup.c
index bc2da4c140c4..4fd27f4f90ed 100644
--- a/arch/mips/loongson64/common/setup.c
+++ b/arch/mips/loongson64/common/setup.c
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
diff --git a/arch/mips/loongson64/common/time.c b/arch/mips/loongson64/common/time.c
index e78760ce475b..1245f22cec84 100644
--- a/arch/mips/loongson64/common/time.c
+++ b/arch/mips/loongson64/common/time.c
@@ -11,7 +11,6 @@
 #include <asm/hpet.h>
 
 #include <loongson.h>
-#include <cs5536/cs5536_mfgpt.h>
 
 void __init plat_time_init(void)
 {
@@ -20,8 +19,6 @@ void __init plat_time_init(void)
 
 #ifdef CONFIG_RS780_HPET
 	setup_hpet_timer();
-#else
-	setup_mfgpt0_timer();
 #endif
 }
 
diff --git a/arch/mips/loongson64/common/uart_base.c b/arch/mips/loongson64/common/uart_base.c
deleted file mode 100644
index e88d937f10fe..000000000000
--- a/arch/mips/loongson64/common/uart_base.c
+++ /dev/null
@@ -1,46 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2009 Lemote Inc.
- * Author: Wu Zhangjin, wuzhangjin@gmail.com
- */
-
-#include <linux/export.h>
-#include <asm/bootinfo.h>
-
-#include <loongson.h>
-
-/* raw */
-unsigned long loongson_uart_base[MAX_UARTS] = {};
-/* ioremapped */
-unsigned long _loongson_uart_base[MAX_UARTS] = {};
-
-EXPORT_SYMBOL(loongson_uart_base);
-EXPORT_SYMBOL(_loongson_uart_base);
-
-void prom_init_loongson_uart_base(void)
-{
-	switch (mips_machtype) {
-	case MACH_LOONGSON_GENERIC:
-		/* The CPU provided serial port (CPU) */
-		loongson_uart_base[0] = LOONGSON_REG_BASE + 0x1e0;
-		break;
-	case MACH_LEMOTE_FL2E:
-		loongson_uart_base[0] = LOONGSON_PCIIO_BASE + 0x3f8;
-		break;
-	case MACH_LEMOTE_FL2F:
-	case MACH_LEMOTE_LL2F:
-		loongson_uart_base[0] = LOONGSON_PCIIO_BASE + 0x2f8;
-		break;
-	case MACH_LEMOTE_ML2F7:
-	case MACH_LEMOTE_YL2F89:
-	case MACH_DEXXON_GDIUM2F10:
-	case MACH_LEMOTE_NAS:
-	default:
-		/* The CPU provided serial port (LPC) */
-		loongson_uart_base[0] = LOONGSON_LIO1_BASE + 0x3f8;
-		break;
-	}
-
-	_loongson_uart_base[0] =
-		(unsigned long)ioremap_nocache(loongson_uart_base[0], 8);
-}
diff --git a/arch/mips/loongson64/loongson-3/irq.c b/arch/mips/loongson64/loongson-3/irq.c
index 5605061f5f98..79ad797497e4 100644
--- a/arch/mips/loongson64/loongson-3/irq.c
+++ b/arch/mips/loongson64/loongson-3/irq.c
@@ -78,8 +78,12 @@ static void ht_irqdispatch(void)
 
 #define UNUSED_IPS (CAUSEF_IP5 | CAUSEF_IP4 | CAUSEF_IP1 | CAUSEF_IP0)
 
-void mach_irq_dispatch(unsigned int pending)
+asmlinkage void plat_irq_dispatch(void)
 {
+	unsigned int pending;
+
+	pending = read_c0_cause() & read_c0_status() & ST0_IM;
+
 	if (pending & CAUSEF_IP7)
 		do_IRQ(LOONGSON_TIMER_IRQ);
 #if defined(CONFIG_SMP)
@@ -127,7 +131,7 @@ void irq_router_init(void)
 		LOONGSON_INT_ROUTER_INTEN | (0xffff << 16) | 0x1 << 10;
 }
 
-void __init mach_init_irq(void)
+void __init arch_init_irq(void)
 {
 	struct irq_chip *chip;
 
diff --git a/arch/mips/loongson64/loongson-3/numa.c b/arch/mips/loongson64/loongson-3/numa.c
index 8f20d2cb3767..ef94a2278561 100644
--- a/arch/mips/loongson64/loongson-3/numa.c
+++ b/arch/mips/loongson64/loongson-3/numa.c
@@ -26,12 +26,15 @@
 #include <asm/wbflush.h>
 #include <boot_param.h>
 
-static struct node_data prealloc__node_data[MAX_NUMNODES];
+static struct pglist_data prealloc__node_data[MAX_NUMNODES];
 unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
 EXPORT_SYMBOL(__node_distances);
-struct node_data *__node_data[MAX_NUMNODES];
+struct pglist_data *__node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_data);
 
+cpumask_t __node_cpumask[MAX_NUMNODES];
+EXPORT_SYMBOL(__node_cpumask);
+
 static void enable_lpa(void)
 {
 	unsigned long value;
@@ -214,7 +217,7 @@ static __init void prom_meminit(void)
 		if (node_online(node)) {
 			szmem(node);
 			node_mem_init(node);
-			cpumask_clear(&__node_data[(node)]->cpumask);
+			cpumask_clear(&__node_cpumask[node]);
 		}
 	}
 	memblocks_present();
@@ -228,7 +231,7 @@ static __init void prom_meminit(void)
 		if (loongson_sysconf.reserved_cpus_mask & (1<<cpu))
 			continue;
 
-		cpumask_set_cpu(active_cpu, &__node_data[(node)]->cpumask);
+		cpumask_set_cpu(active_cpu, &__node_cpumask[node]);
 		pr_info("NUMA: set cpumask cpu %d on node %d\n", active_cpu, node);
 
 		active_cpu++;
-- 
2.23.0

