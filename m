Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0CC1A68D9
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731095AbgDMP3A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:29:00 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41152 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731088AbgDMP26 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791641; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WZZizUVOqe1NbzDkxeL35YfZK5dr09Eks3StwUGOkiI=;
        b=mNg5msB8AL/ZBjimlwBGXsn2gwBjxg4OehPUmwuxi5Tvy476M/t3/Uiq+zhibEyGfBUML2
        ydSXejl5i42yf0kZbJMTtg+Il1Z83nkRP8nR7rE1LKBGp9a1aoERUbMKYQU0oN3RZLqQVk
        j1qdzpZSF/Q2Q+TqaeDH4Fvr0UbDrgQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 13/13] MIPS: ingenic: Drop obsolete code, merge the rest in setup.c
Date:   Mon, 13 Apr 2020 17:26:33 +0200
Message-Id: <20200413152633.198301-13-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop a bootload of 10-years-old dirty code, that is not used anymore, as
it has been replaced with clean code over the ages.

Merge the very few bits left inside setup.c, so that everything is clean
and tidy now.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/mach-jz4740/base.h  |  27 -----
 arch/mips/include/asm/mach-jz4740/dma.h   |  23 ----
 arch/mips/include/asm/mach-jz4740/irq.h   |  45 +-------
 arch/mips/include/asm/mach-jz4740/timer.h | 126 ----------------------
 arch/mips/jz4740/Makefile                 |   7 +-
 arch/mips/jz4740/pm.c                     |  34 ------
 arch/mips/jz4740/prom.c                   |  19 ----
 arch/mips/jz4740/reset.c                  |  24 -----
 arch/mips/jz4740/reset.h                  |   7 --
 arch/mips/jz4740/setup.c                  |  63 ++++++++++-
 arch/mips/jz4740/time.c                   |  17 ---
 arch/mips/jz4740/timer.c                  |  42 --------
 12 files changed, 61 insertions(+), 373 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-jz4740/base.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/dma.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/timer.h
 delete mode 100644 arch/mips/jz4740/pm.c
 delete mode 100644 arch/mips/jz4740/prom.c
 delete mode 100644 arch/mips/jz4740/reset.c
 delete mode 100644 arch/mips/jz4740/reset.h
 delete mode 100644 arch/mips/jz4740/time.c
 delete mode 100644 arch/mips/jz4740/timer.c

diff --git a/arch/mips/include/asm/mach-jz4740/base.h b/arch/mips/include/asm/mach-jz4740/base.h
deleted file mode 100644
index 96b2d6674cdb..000000000000
--- a/arch/mips/include/asm/mach-jz4740/base.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MACH_JZ4740_BASE_H__
-#define __ASM_MACH_JZ4740_BASE_H__
-
-#define JZ4740_CPM_BASE_ADDR	0x10000000
-#define JZ4740_INTC_BASE_ADDR	0x10001000
-#define JZ4740_WDT_BASE_ADDR	0x10002000
-#define JZ4740_TCU_BASE_ADDR	0x10002010
-#define JZ4740_RTC_BASE_ADDR	0x10003000
-#define JZ4740_GPIO_BASE_ADDR	0x10010000
-#define JZ4740_AIC_BASE_ADDR	0x10020000
-#define JZ4740_MSC_BASE_ADDR	0x10021000
-#define JZ4740_UART0_BASE_ADDR	0x10030000
-#define JZ4740_UART1_BASE_ADDR	0x10031000
-#define JZ4740_I2C_BASE_ADDR	0x10042000
-#define JZ4740_SSI_BASE_ADDR	0x10043000
-#define JZ4740_SADC_BASE_ADDR	0x10070000
-#define JZ4740_EMC_BASE_ADDR	0x13010000
-#define JZ4740_DMAC_BASE_ADDR	0x13020000
-#define JZ4740_UHC_BASE_ADDR	0x13030000
-#define JZ4740_UDC_BASE_ADDR	0x13040000
-#define JZ4740_LCD_BASE_ADDR	0x13050000
-#define JZ4740_SLCD_BASE_ADDR	0x13050000
-#define JZ4740_CIM_BASE_ADDR	0x13060000
-#define JZ4740_IPU_BASE_ADDR	0x13080000
-
-#endif
diff --git a/arch/mips/include/asm/mach-jz4740/dma.h b/arch/mips/include/asm/mach-jz4740/dma.h
deleted file mode 100644
index e5d2a5311a3a..000000000000
--- a/arch/mips/include/asm/mach-jz4740/dma.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ7420/JZ4740 DMA definitions
- */
-
-#ifndef __ASM_MACH_JZ4740_DMA_H__
-#define __ASM_MACH_JZ4740_DMA_H__
-
-enum jz4740_dma_request_type {
-	JZ4740_DMA_TYPE_AUTO_REQUEST	= 8,
-	JZ4740_DMA_TYPE_UART_TRANSMIT	= 20,
-	JZ4740_DMA_TYPE_UART_RECEIVE	= 21,
-	JZ4740_DMA_TYPE_SPI_TRANSMIT	= 22,
-	JZ4740_DMA_TYPE_SPI_RECEIVE	= 23,
-	JZ4740_DMA_TYPE_MMC_TRANSMIT	= 26,
-	JZ4740_DMA_TYPE_MMC_RECEIVE	= 27,
-	JZ4740_DMA_TYPE_TCU		= 28,
-	JZ4740_DMA_TYPE_SADC		= 29,
-	JZ4740_DMA_TYPE_SLCD		= 30,
-};
-
-#endif	/* __ASM_JZ4740_DMA_H__ */
diff --git a/arch/mips/include/asm/mach-jz4740/irq.h b/arch/mips/include/asm/mach-jz4740/irq.h
index 09c38eac671a..27c543bd340f 100644
--- a/arch/mips/include/asm/mach-jz4740/irq.h
+++ b/arch/mips/include/asm/mach-jz4740/irq.h
@@ -8,49 +8,6 @@
 #define __ASM_MACH_JZ4740_IRQ_H__
 
 #define MIPS_CPU_IRQ_BASE 0
-#define JZ4740_IRQ_BASE 8
-
-#ifdef CONFIG_MACH_JZ4740
-# define NR_INTC_IRQS	32
-#else
-# define NR_INTC_IRQS	64
-#endif
-
-/* 1st-level interrupts */
-#define JZ4740_IRQ(x)		(JZ4740_IRQ_BASE + (x))
-#define JZ4740_IRQ_I2C		JZ4740_IRQ(1)
-#define JZ4740_IRQ_UHC		JZ4740_IRQ(3)
-#define JZ4740_IRQ_UART1	JZ4740_IRQ(8)
-#define JZ4740_IRQ_UART0	JZ4740_IRQ(9)
-#define JZ4740_IRQ_SADC		JZ4740_IRQ(12)
-#define JZ4740_IRQ_MSC		JZ4740_IRQ(14)
-#define JZ4740_IRQ_RTC		JZ4740_IRQ(15)
-#define JZ4740_IRQ_SSI		JZ4740_IRQ(16)
-#define JZ4740_IRQ_CIM		JZ4740_IRQ(17)
-#define JZ4740_IRQ_AIC		JZ4740_IRQ(18)
-#define JZ4740_IRQ_ETH		JZ4740_IRQ(19)
-#define JZ4740_IRQ_DMAC		JZ4740_IRQ(20)
-#define JZ4740_IRQ_TCU2		JZ4740_IRQ(21)
-#define JZ4740_IRQ_TCU1		JZ4740_IRQ(22)
-#define JZ4740_IRQ_TCU0		JZ4740_IRQ(23)
-#define JZ4740_IRQ_UDC		JZ4740_IRQ(24)
-#define JZ4740_IRQ_GPIO3	JZ4740_IRQ(25)
-#define JZ4740_IRQ_GPIO2	JZ4740_IRQ(26)
-#define JZ4740_IRQ_GPIO1	JZ4740_IRQ(27)
-#define JZ4740_IRQ_GPIO0	JZ4740_IRQ(28)
-#define JZ4740_IRQ_IPU		JZ4740_IRQ(29)
-#define JZ4740_IRQ_LCD		JZ4740_IRQ(30)
-
-#define JZ4780_IRQ_TCU2		JZ4740_IRQ(25)
-
-/* 2nd-level interrupts */
-#define JZ4740_IRQ_DMA(x)	(JZ4740_IRQ(NR_INTC_IRQS) + (x))
-
-#define JZ4740_IRQ_INTC_GPIO(x) (JZ4740_IRQ_GPIO0 - (x))
-#define JZ4740_IRQ_GPIO(x)	(JZ4740_IRQ(NR_INTC_IRQS + 16) + (x))
-
-#define JZ4740_IRQ_ADC_BASE	JZ4740_IRQ(NR_INTC_IRQS + 144)
-
-#define NR_IRQS (JZ4740_IRQ_ADC_BASE + 6)
+#define NR_IRQS 256
 
 #endif
diff --git a/arch/mips/include/asm/mach-jz4740/timer.h b/arch/mips/include/asm/mach-jz4740/timer.h
deleted file mode 100644
index 8a19cfe5bed7..000000000000
--- a/arch/mips/include/asm/mach-jz4740/timer.h
+++ /dev/null
@@ -1,126 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 platform timer support
- */
-
-#ifndef __ASM_MACH_JZ4740_TIMER
-#define __ASM_MACH_JZ4740_TIMER
-
-#define JZ_REG_TIMER_STOP		0x0C
-#define JZ_REG_TIMER_STOP_SET		0x1C
-#define JZ_REG_TIMER_STOP_CLEAR		0x2C
-#define JZ_REG_TIMER_ENABLE		0x00
-#define JZ_REG_TIMER_ENABLE_SET		0x04
-#define JZ_REG_TIMER_ENABLE_CLEAR	0x08
-#define JZ_REG_TIMER_FLAG		0x10
-#define JZ_REG_TIMER_FLAG_SET		0x14
-#define JZ_REG_TIMER_FLAG_CLEAR		0x18
-#define JZ_REG_TIMER_MASK		0x20
-#define JZ_REG_TIMER_MASK_SET		0x24
-#define JZ_REG_TIMER_MASK_CLEAR		0x28
-
-#define JZ_REG_TIMER_DFR(x) (((x) * 0x10) + 0x30)
-#define JZ_REG_TIMER_DHR(x) (((x) * 0x10) + 0x34)
-#define JZ_REG_TIMER_CNT(x) (((x) * 0x10) + 0x38)
-#define JZ_REG_TIMER_CTRL(x) (((x) * 0x10) + 0x3C)
-
-#define JZ_TIMER_IRQ_HALF(x) BIT((x) + 0x10)
-#define JZ_TIMER_IRQ_FULL(x) BIT(x)
-
-#define JZ_TIMER_CTRL_PWM_ABBRUPT_SHUTDOWN	BIT(9)
-#define JZ_TIMER_CTRL_PWM_ACTIVE_LOW		BIT(8)
-#define JZ_TIMER_CTRL_PWM_ENABLE		BIT(7)
-#define JZ_TIMER_CTRL_PRESCALE_MASK		0x1c
-#define JZ_TIMER_CTRL_PRESCALE_OFFSET		0x3
-#define JZ_TIMER_CTRL_PRESCALE_1		(0 << 3)
-#define JZ_TIMER_CTRL_PRESCALE_4		(1 << 3)
-#define JZ_TIMER_CTRL_PRESCALE_16		(2 << 3)
-#define JZ_TIMER_CTRL_PRESCALE_64		(3 << 3)
-#define JZ_TIMER_CTRL_PRESCALE_256		(4 << 3)
-#define JZ_TIMER_CTRL_PRESCALE_1024		(5 << 3)
-
-#define JZ_TIMER_CTRL_PRESCALER(x) ((x) << JZ_TIMER_CTRL_PRESCALE_OFFSET)
-
-#define JZ_TIMER_CTRL_SRC_EXT		BIT(2)
-#define JZ_TIMER_CTRL_SRC_RTC		BIT(1)
-#define JZ_TIMER_CTRL_SRC_PCLK		BIT(0)
-
-extern void __iomem *jz4740_timer_base;
-void __init jz4740_timer_init(void);
-
-void jz4740_timer_enable_watchdog(void);
-void jz4740_timer_disable_watchdog(void);
-
-static inline void jz4740_timer_stop(unsigned int timer)
-{
-	writel(BIT(timer), jz4740_timer_base + JZ_REG_TIMER_STOP_SET);
-}
-
-static inline void jz4740_timer_start(unsigned int timer)
-{
-	writel(BIT(timer), jz4740_timer_base + JZ_REG_TIMER_STOP_CLEAR);
-}
-
-static inline bool jz4740_timer_is_enabled(unsigned int timer)
-{
-	return readb(jz4740_timer_base + JZ_REG_TIMER_ENABLE) & BIT(timer);
-}
-
-static inline void jz4740_timer_enable(unsigned int timer)
-{
-	writeb(BIT(timer), jz4740_timer_base + JZ_REG_TIMER_ENABLE_SET);
-}
-
-static inline void jz4740_timer_disable(unsigned int timer)
-{
-	writeb(BIT(timer), jz4740_timer_base + JZ_REG_TIMER_ENABLE_CLEAR);
-}
-
-static inline void jz4740_timer_set_period(unsigned int timer, uint16_t period)
-{
-	writew(period, jz4740_timer_base + JZ_REG_TIMER_DFR(timer));
-}
-
-static inline void jz4740_timer_set_duty(unsigned int timer, uint16_t duty)
-{
-	writew(duty, jz4740_timer_base + JZ_REG_TIMER_DHR(timer));
-}
-
-static inline void jz4740_timer_set_count(unsigned int timer, uint16_t count)
-{
-	writew(count, jz4740_timer_base + JZ_REG_TIMER_CNT(timer));
-}
-
-static inline uint16_t jz4740_timer_get_count(unsigned int timer)
-{
-	return readw(jz4740_timer_base + JZ_REG_TIMER_CNT(timer));
-}
-
-static inline void jz4740_timer_ack_full(unsigned int timer)
-{
-	writel(JZ_TIMER_IRQ_FULL(timer), jz4740_timer_base + JZ_REG_TIMER_FLAG_CLEAR);
-}
-
-static inline void jz4740_timer_irq_full_enable(unsigned int timer)
-{
-	writel(JZ_TIMER_IRQ_FULL(timer), jz4740_timer_base + JZ_REG_TIMER_FLAG_CLEAR);
-	writel(JZ_TIMER_IRQ_FULL(timer), jz4740_timer_base + JZ_REG_TIMER_MASK_CLEAR);
-}
-
-static inline void jz4740_timer_irq_full_disable(unsigned int timer)
-{
-	writel(JZ_TIMER_IRQ_FULL(timer), jz4740_timer_base + JZ_REG_TIMER_MASK_SET);
-}
-
-static inline void jz4740_timer_set_ctrl(unsigned int timer, uint16_t ctrl)
-{
-	writew(ctrl, jz4740_timer_base + JZ_REG_TIMER_CTRL(timer));
-}
-
-static inline uint16_t jz4740_timer_get_ctrl(unsigned int timer)
-{
-	return readw(jz4740_timer_base + JZ_REG_TIMER_CTRL(timer));
-}
-
-#endif
diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
index 6de14c0deb4e..f96c0f5eca44 100644
--- a/arch/mips/jz4740/Makefile
+++ b/arch/mips/jz4740/Makefile
@@ -4,11 +4,6 @@
 #
 
 # Object file lists.
-
-obj-y += prom.o time.o reset.o setup.o timer.o
+obj-y += setup.o
 
 CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
-
-# PM support
-
-obj-$(CONFIG_PM) += pm.o
diff --git a/arch/mips/jz4740/pm.c b/arch/mips/jz4740/pm.c
deleted file mode 100644
index f9b551f01f42..000000000000
--- a/arch/mips/jz4740/pm.c
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *	JZ4740 SoC power management support
- */
-
-#include <linux/init.h>
-#include <linux/pm.h>
-#include <linux/delay.h>
-#include <linux/suspend.h>
-
-static int jz4740_pm_enter(suspend_state_t state)
-{
-	__asm__(".set\tmips3\n\t"
-		"wait\n\t"
-		".set\tmips0");
-
-
-
-	return 0;
-}
-
-static const struct platform_suspend_ops jz4740_pm_ops = {
-	.valid		= suspend_valid_only_mem,
-	.enter		= jz4740_pm_enter,
-};
-
-static int __init jz4740_pm_init(void)
-{
-	suspend_set_ops(&jz4740_pm_ops);
-	return 0;
-
-}
-late_initcall(jz4740_pm_init);
diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
deleted file mode 100644
index ff4555c3fb15..000000000000
--- a/arch/mips/jz4740/prom.c
+++ /dev/null
@@ -1,19 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 SoC prom code
- */
-
-#include <linux/init.h>
-
-#include <asm/bootinfo.h>
-#include <asm/fw/fw.h>
-
-void __init prom_init(void)
-{
-	fw_init_cmdline();
-}
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/jz4740/reset.c b/arch/mips/jz4740/reset.c
deleted file mode 100644
index 1f9f02e54085..000000000000
--- a/arch/mips/jz4740/reset.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- */
-
-#include <asm/reboot.h>
-
-#include "reset.h"
-
-static void jz4740_halt(void)
-{
-	while (1) {
-		__asm__(".set push;\n"
-			".set mips3;\n"
-			"wait;\n"
-			".set pop;\n"
-		);
-	}
-}
-
-void jz4740_reset_init(void)
-{
-	_machine_halt = jz4740_halt;
-}
diff --git a/arch/mips/jz4740/reset.h b/arch/mips/jz4740/reset.h
deleted file mode 100644
index 4e8746ee9b61..000000000000
--- a/arch/mips/jz4740/reset.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __MIPS_JZ4740_RESET_H__
-#define __MIPS_JZ4740_RESET_H__
-
-extern void jz4740_reset_init(void);
-
-#endif
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index 880c26857aff..81428ddcaa97 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -5,17 +5,21 @@
  *  JZ4740 setup code
  */
 
+#include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>
+#include <linux/pm.h>
+#include <linux/suspend.h>
 
 #include <asm/bootinfo.h>
+#include <asm/fw/fw.h>
 #include <asm/prom.h>
-
-#include "reset.h"
+#include <asm/reboot.h>
 
 #define JZ4740_EMC_BASE_ADDR 0x13010000
 
@@ -61,8 +65,6 @@ void __init plat_mem_setup(void)
 	int offset;
 	void *dtb;
 
-	jz4740_reset_init();
-
 	if (__dtb_start != __dtb_end)
 		dtb = __dtb_start;
 	else
@@ -105,3 +107,56 @@ void __init arch_init_irq(void)
 {
 	irqchip_init();
 }
+
+void __init plat_time_init(void)
+{
+	of_clk_init(NULL);
+	timer_probe();
+}
+
+void __init prom_init(void)
+{
+	fw_init_cmdline();
+}
+
+void __init prom_free_prom_memory(void)
+{
+}
+
+static void jz4740_wait_instr(void)
+{
+	__asm__(".set push;\n"
+		".set mips3;\n"
+		"wait;\n"
+		".set pop;\n"
+	);
+}
+
+static void jz4740_halt(void)
+{
+	for (;;)
+		jz4740_wait_instr();
+}
+
+static int __maybe_unused jz4740_pm_enter(suspend_state_t state)
+{
+	jz4740_wait_instr();
+
+	return 0;
+}
+
+static const struct platform_suspend_ops jz4740_pm_ops __maybe_unused = {
+	.valid = suspend_valid_only_mem,
+	.enter = jz4740_pm_enter,
+};
+
+static int __init jz4740_pm_init(void)
+{
+	if (IS_ENABLED(CONFIG_PM_SLEEP))
+		suspend_set_ops(&jz4740_pm_ops);
+	_machine_halt = jz4740_halt;
+
+	return 0;
+
+}
+late_initcall(jz4740_pm_init);
diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
deleted file mode 100644
index 605a84a250bf..000000000000
--- a/arch/mips/jz4740/time.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 platform time support
- */
-
-#include <linux/clocksource.h>
-#include <linux/of_clk.h>
-
-#include <asm/mach-jz4740/timer.h>
-
-void __init plat_time_init(void)
-{
-	of_clk_init(NULL);
-	jz4740_timer_init();
-	timer_probe();
-}
diff --git a/arch/mips/jz4740/timer.c b/arch/mips/jz4740/timer.c
deleted file mode 100644
index 5c9f82de6a82..000000000000
--- a/arch/mips/jz4740/timer.c
+++ /dev/null
@@ -1,42 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 platform timer support
- */
-
-#include <linux/export.h>
-#include <linux/io.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-
-#include <asm/mach-jz4740/base.h>
-#include <asm/mach-jz4740/timer.h>
-
-void __iomem *jz4740_timer_base;
-EXPORT_SYMBOL_GPL(jz4740_timer_base);
-
-void jz4740_timer_enable_watchdog(void)
-{
-	writel(BIT(16), jz4740_timer_base + JZ_REG_TIMER_STOP_CLEAR);
-}
-EXPORT_SYMBOL_GPL(jz4740_timer_enable_watchdog);
-
-void jz4740_timer_disable_watchdog(void)
-{
-	writel(BIT(16), jz4740_timer_base + JZ_REG_TIMER_STOP_SET);
-}
-EXPORT_SYMBOL_GPL(jz4740_timer_disable_watchdog);
-
-void __init jz4740_timer_init(void)
-{
-	jz4740_timer_base = ioremap(JZ4740_TCU_BASE_ADDR, 0x100);
-
-	if (!jz4740_timer_base)
-		panic("Failed to ioremap timer registers");
-
-	/* Disable all timer clocks except for those used as system timers */
-	writel(0x000100fc, jz4740_timer_base + JZ_REG_TIMER_STOP_SET);
-
-	/* Timer irqs are unmasked by default, mask them */
-	writel(0x00ff00ff, jz4740_timer_base + JZ_REG_TIMER_MASK_SET);
-}
-- 
2.25.1

