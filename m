Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D01D2DB46A
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 20:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731857AbgLOTWS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 14:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732024AbgLOTWI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Dec 2020 14:22:08 -0500
X-Greylist: delayed 2696 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Dec 2020 11:21:27 PST
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA30C06179C
        for <linux-mips@vger.kernel.org>; Tue, 15 Dec 2020 11:21:27 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kpFBU-00866O-LO
        for linux-mips@vger.kernel.org; Tue, 15 Dec 2020 19:36:29 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kpFB6-00866A-NE; Tue, 15 Dec 2020 19:36:04 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kpFB6-002i4f-9d; Tue, 15 Dec 2020 19:36:04 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH] Add support for Realtek RTL838x/RTL839x switch SoCs
Date:   Tue, 15 Dec 2020 19:35:57 +0100
Message-Id: <20201215183557.646034-1-bert@biot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  20 +++
 arch/mips/include/asm/mach-realtek/ioremap.h  |  29 ++++
 arch/mips/include/asm/mach-realtek/irq.h      |  69 ++++++++
 .../include/asm/mach-realtek/mach-realtek.h   |  69 ++++++++
 arch/mips/realtek/Makefile                    |   1 +
 arch/mips/realtek/Platform                    |   6 +
 arch/mips/realtek/irq.c                       | 157 ++++++++++++++++++
 arch/mips/realtek/prom.c                      | 126 ++++++++++++++
 arch/mips/realtek/setup.c                     |  58 +++++++
 10 files changed, 536 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-realtek/ioremap.h
 create mode 100644 arch/mips/include/asm/mach-realtek/irq.h
 create mode 100644 arch/mips/include/asm/mach-realtek/mach-realtek.h
 create mode 100644 arch/mips/realtek/Makefile
 create mode 100644 arch/mips/realtek/Platform
 create mode 100644 arch/mips/realtek/irq.c
 create mode 100644 arch/mips/realtek/prom.c
 create mode 100644 arch/mips/realtek/setup.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 5483e38b5dc7..e9adc6e7d1d3 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -22,6 +22,7 @@ platform-$(CONFIG_NLM_COMMON)		+= netlogic/
 platform-$(CONFIG_PIC32MZDA)		+= pic32/
 platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
 platform-$(CONFIG_RALINK)		+= ralink/
+platform-$(CONFIG_MACH_REALTEK)		+= realtek/
 platform-$(CONFIG_MIKROTIK_RB532)	+= rb532/
 platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
 platform-$(CONFIG_SGI_IP27)		+= sgi-ip27/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6b762bebff33..58966ebaed5b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -624,6 +624,26 @@ config RALINK
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
+config MACH_REALTEK
+	bool "Realtek RTL8380 based machines"
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select CSRC_R4K
+	select CEVT_R4K
+	select SYS_HAS_CPU_MIPS32_R1
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MULTITHREADING
+	select SYS_SUPPORTS_VPE_LOADER
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_EARLY_PRINTK_8250
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select BOOT_RAW
+	select PINCTRL
+	select USE_OF
+
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
 	select ARC_MEMORY
diff --git a/arch/mips/include/asm/mach-realtek/ioremap.h b/arch/mips/include/asm/mach-realtek/ioremap.h
new file mode 100644
index 000000000000..8847d0b99dad
--- /dev/null
+++ b/arch/mips/include/asm/mach-realtek/ioremap.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _RTL8380_IOREMAP_H_
+#define _RTL8380_IOREMAP_H_
+
+static inline int is_rtl8380_internal_registers(phys_addr_t offset)
+{
+	/* IO-Block */
+	if (offset >= 0xb8000000 && offset < 0xb9000000)
+		return 1;
+	/* Switch block */
+	if (offset >= 0xbb000000 && offset < 0xbc000000)
+		return 1;
+	return 0;
+}
+
+static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
+					 unsigned long flags)
+{
+	if (is_rtl8380_internal_registers(offset))
+		return (void __iomem *)offset;
+	return NULL;
+}
+
+static inline int plat_iounmap(const volatile void __iomem *addr)
+{
+	return is_rtl8380_internal_registers((unsigned long)addr);
+}
+
+#endif /* _RTL8380_IOREMAP_H_ */
diff --git a/arch/mips/include/asm/mach-realtek/irq.h b/arch/mips/include/asm/mach-realtek/irq.h
new file mode 100644
index 000000000000..e2e2cd6dd27a
--- /dev/null
+++ b/arch/mips/include/asm/mach-realtek/irq.h
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
+ * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
+ * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
+ * Copyright (C) 2020 John Crispin <john@phrozen.org>
+ */
+
+#ifndef _RTL8380_IRQ_H_
+#define _RTL8380_IRQ_H_
+
+#define NR_IRQS 32
+#include_next <irq.h>
+
+/* Global Interrupt Mask Register */
+#define RTL8380_ICTL_GIMR	0x00
+/* Global Interrupt Status Register */
+#define RTL8380_ICTL_GISR	0x04
+
+/* Cascaded interrupts */
+#define RTL8380_CPU_IRQ_SHARED0		(MIPS_CPU_IRQ_BASE + 2)
+#define RTL8380_CPU_IRQ_UART		(MIPS_CPU_IRQ_BASE + 3)
+#define RTL8380_CPU_IRQ_SWITCH		(MIPS_CPU_IRQ_BASE + 4)
+#define RTL8380_CPU_IRQ_SHARED1		(MIPS_CPU_IRQ_BASE + 5)
+#define RTL8380_CPU_IRQ_EXTERNAL	(MIPS_CPU_IRQ_BASE + 6)
+#define RTL8380_CPU_IRQ_COUNTER		(MIPS_CPU_IRQ_BASE + 7)
+
+
+/* Interrupt routing register */
+#define RTL8380_IRR0		0x08
+#define RTL8380_IRR1		0x0c
+#define RTL8380_IRR2		0x10
+#define RTL8380_IRR3		0x14
+
+/* Cascade map */
+#define RTL8380_IRQ_CASCADE_UART0	2
+#define RTL8380_IRQ_CASCADE_UART1	1
+#define RTL8380_IRQ_CASCADE_TC0		5
+#define RTL8380_IRQ_CASCADE_TC1		1
+#define RTL8380_IRQ_CASCADE_OCPTO	1
+#define RTL8380_IRQ_CASCADE_HLXTO	1
+#define RTL8380_IRQ_CASCADE_SLXTO	1
+#define RTL8380_IRQ_CASCADE_NIC		4
+#define RTL8380_IRQ_CASCADE_GPIO_ABCD	4
+#define RTL8380_IRQ_CASCADE_GPIO_EFGH	4
+#define RTL8380_IRQ_CASCADE_RTC		4
+#define RTL8380_IRQ_CASCADE_SWCORE	3
+#define RTL8380_IRQ_CASCADE_WDT_IP1	4
+#define RTL8380_IRQ_CASCADE_WDT_IP2	5
+
+/* Pack cascade map into interrupt routing registers */
+#define RTL8380_IRR0_SETTING (\
+	(RTL8380_IRQ_CASCADE_UART0	<< 28) | \
+	(RTL8380_IRQ_CASCADE_UART1	<< 24) | \
+	(RTL8380_IRQ_CASCADE_TC0	<< 20) | \
+	(RTL8380_IRQ_CASCADE_TC1	<< 16) | \
+	(RTL8380_IRQ_CASCADE_OCPTO	<< 12) | \
+	(RTL8380_IRQ_CASCADE_HLXTO	<< 8)  | \
+	(RTL8380_IRQ_CASCADE_SLXTO	<< 4)  | \
+	(RTL8380_IRQ_CASCADE_NIC	<< 0))
+#define RTL8380_IRR1_SETTING (\
+	(RTL8380_IRQ_CASCADE_GPIO_ABCD	<< 28) | \
+	(RTL8380_IRQ_CASCADE_GPIO_EFGH	<< 24) | \
+	(RTL8380_IRQ_CASCADE_RTC	<< 20) | \
+	(RTL8380_IRQ_CASCADE_SWCORE	<< 16))
+#define RTL8380_IRR2_SETTING	0
+#define RTL8380_IRR3_SETTING	0
+
+#endif /* _RTL8380_IRQ_H_ */
diff --git a/arch/mips/include/asm/mach-realtek/mach-realtek.h b/arch/mips/include/asm/mach-realtek/mach-realtek.h
new file mode 100644
index 000000000000..bc6b1e57c00a
--- /dev/null
+++ b/arch/mips/include/asm/mach-realtek/mach-realtek.h
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
+ * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
+ * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
+ * Copyright (C) 2020 John Crispin <john@phrozen.org>
+ */
+
+#ifndef _MACH_REALTEK_H_
+#define _MACH_REALTEK_H_
+
+struct realtek_soc_info {
+	unsigned char *name;
+	unsigned int id;
+	unsigned int family;
+};
+
+/* High 16 bits of MODEL_NAME_INFO register */
+#define RTL8389_FAMILY_ID		0x8389
+#define RTL8328_FAMILY_ID		0x8328
+#define RTL8390_FAMILY_ID		0x8390
+#define RTL8350_FAMILY_ID		0x8350
+#define RTL8380_FAMILY_ID		0x8380
+#define RTL8330_FAMILY_ID		0x8330
+
+/* Interrupt numbers/bits */
+#define RTL8380_IRQ_UART0		31
+#define RTL8380_IRQ_UART1		30
+#define RTL8380_IRQ_TC0			29
+#define RTL8380_IRQ_TC1			28
+#define RTL8380_IRQ_OCPTO		27
+#define RTL8380_IRQ_HLXTO		26
+#define RTL8380_IRQ_SLXTO		25
+#define RTL8380_IRQ_NIC			24
+#define RTL8380_IRQ_GPIO_ABCD		23
+#define RTL8380_IRQ_GPIO_EFGH		22
+#define RTL8380_IRQ_RTC			21
+#define RTL8380_IRQ_SWCORE		20
+#define RTL8380_IRQ_WDT_IP1		19
+#define RTL8380_IRQ_WDT_IP2		18
+
+
+// TODO: move to DT
+#define RTL8380_SWITCH_BASE		((volatile void *) 0xBB000000)
+#define RTL8380_MODEL_NAME_INFO		(RTL8380_SWITCH_BASE + 0x00D4)
+#define RTL8390_MODEL_NAME_INFO		(RTL8380_SWITCH_BASE + 0x0FF0)
+
+/* GMII pinmux on RTL838x */
+#define RTL8380_GMII_INTF_SEL		(RTL8380_SWITCH_BASE + 0x1000)
+#define RTL8380_GMII_INTF_SEL_UART1	BIT(4)
+#define RTL8380_GMII_INTF_SEL_JTAG	(BIT(2) | BIT(3))
+#define RTL8380_GMII_INTF_SEL_GMII	(BIT(0) | BIT(1))
+
+/* GMII pinmux on RTL839x */
+#define RTL8390_MAC_IF_CTRL		(RTL8380_SWITCH_BASE + 0x04)
+#define RTL8390_MAC_IF_CTRL_JTAG	BIT(1)
+#define RTL8390_MAC_IF_CTRL_UART	BIT(0)
+
+/* Used to detect address length pin strapping on RTL833x/RTL838x */
+#define RTL8380_INT_RW_CTRL		(RTL8380_SWITCH_BASE + 0x58)
+#define RTL8380_EXT_VERSION		(RTL8380_SWITCH_BASE + 0xD0)
+#define RTL8380_PLL_CML_CTRL		(RTL8380_SWITCH_BASE + 0xFF8)
+#define RTL8380_STRAP_DBG		(RTL8380_SWITCH_BASE + 0x100C)
+
+/* Reset */
+#define RTL8380_RST_GLB_CTRL_1		(RTL8380_SWITCH_BASE + 0x40)
+#define RTL8390_RST_GLB_CTRL		(RTL8380_SWITCH_BASE + 0x14)
+
+#endif /* _MACH_RTL8380_H_ */
diff --git a/arch/mips/realtek/Makefile b/arch/mips/realtek/Makefile
new file mode 100644
index 000000000000..4616928e9883
--- /dev/null
+++ b/arch/mips/realtek/Makefile
@@ -0,0 +1 @@
+obj-y := setup.o prom.o irq.o
diff --git a/arch/mips/realtek/Platform b/arch/mips/realtek/Platform
new file mode 100644
index 000000000000..6e6b29b82b81
--- /dev/null
+++ b/arch/mips/realtek/Platform
@@ -0,0 +1,6 @@
+#
+# Realtek RTL8380 SoCs
+#
+platform-$(CONFIG_MACH_REALTEK) += realtek/
+cflags-$(CONFIG_MACH_REALTEK)   += -I$(srctree)/arch/mips/include/asm/mach-realtek/
+load-$(CONFIG_MACH_REALTEK)     += 0xffffffff80000000
diff --git a/arch/mips/realtek/irq.c b/arch/mips/realtek/irq.c
new file mode 100644
index 000000000000..99c0adb56de3
--- /dev/null
+++ b/arch/mips/realtek/irq.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
+ * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
+ * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
+ * Copyright (C) 2020 John Crispin <john@phrozen.org>
+ */
+
+#include <linux/irqchip.h>
+#include <linux/spinlock.h>
+#include <linux/of_address.h>
+#include <asm/irq_cpu.h>
+#include <linux/of_irq.h>
+#include <asm/cevt-r4k.h>
+
+#include <mach-realtek.h>
+#include "irq.h"
+
+#define REG(x)		(realtek_ictl_base + x)
+
+extern struct realtek_soc_info soc_info;
+
+static DEFINE_RAW_SPINLOCK(irq_lock);
+static void __iomem *realtek_ictl_base;
+
+static void realtek_ictl_enable_irq(struct irq_data *i)
+{
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&irq_lock, flags);
+
+	value = readl(REG(RTL8380_ICTL_GIMR));
+	value |= BIT(i->hwirq);
+	writel(value, REG(RTL8380_ICTL_GIMR));
+
+	raw_spin_unlock_irqrestore(&irq_lock, flags);
+}
+
+static void realtek_ictl_disable_irq(struct irq_data *i)
+{
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&irq_lock, flags);
+
+	value = readl(REG(RTL8380_ICTL_GIMR));
+	value &= ~BIT(i->hwirq);
+	writel(value, REG(RTL8380_ICTL_GIMR));
+
+	raw_spin_unlock_irqrestore(&irq_lock, flags);
+}
+
+static struct irq_chip realtek_ictl_irq = {
+	.name = "rtl8380",
+	.irq_enable = realtek_ictl_enable_irq,
+	.irq_disable = realtek_ictl_disable_irq,
+	.irq_ack = realtek_ictl_disable_irq,
+	.irq_mask = realtek_ictl_disable_irq,
+	.irq_unmask = realtek_ictl_enable_irq,
+	.irq_eoi = realtek_ictl_enable_irq,
+};
+
+static int intc_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(hw, &realtek_ictl_irq, handle_level_irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops irq_domain_ops = {
+	.map = intc_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static void realtek_irq_dispatch(struct irq_desc *desc)
+{
+	unsigned int pending = readl(REG(RTL8380_ICTL_GIMR)) & readl(REG(RTL8380_ICTL_GISR));
+
+	if (pending) {
+		struct irq_domain *domain = irq_desc_get_handler_data(desc);
+		generic_handle_irq(irq_find_mapping(domain, __ffs(pending)));
+	} else {
+		spurious_interrupt();
+	}
+}
+
+asmlinkage void plat_irq_dispatch(void)
+{
+	unsigned int pending;
+
+	pending =  read_c0_cause() & read_c0_status() & ST0_IM;
+
+	if (pending & CAUSEF_IP7)
+		do_IRQ(RTL8380_CPU_IRQ_COUNTER);
+
+	else if (pending & CAUSEF_IP6)
+		do_IRQ(RTL8380_CPU_IRQ_EXTERNAL);
+
+	else if (pending & CAUSEF_IP5)
+		do_IRQ(RTL8380_CPU_IRQ_SHARED1);
+
+	else if (pending & CAUSEF_IP4)
+		do_IRQ(RTL8380_CPU_IRQ_SWITCH);
+
+	else if (pending & CAUSEF_IP3)
+		do_IRQ(RTL8380_CPU_IRQ_UART);
+
+	else if (pending & CAUSEF_IP2)
+		do_IRQ(RTL8380_CPU_IRQ_SHARED0);
+
+	else
+		spurious_interrupt();
+}
+
+static void __init icu_of_init(struct device_node *node, struct device_node *parent)
+{
+	struct irq_domain *domain;
+
+	domain = irq_domain_add_simple(node, 32, 0,
+				       &irq_domain_ops, NULL);
+        irq_set_chained_handler_and_data(2, realtek_irq_dispatch, domain);
+        irq_set_chained_handler_and_data(5, realtek_irq_dispatch, domain);
+
+	realtek_ictl_base = of_iomap(node, 0);
+	if (!realtek_ictl_base)
+		return;
+
+	/* Disable all cascaded interrupts */
+	writel(0, REG(RTL8380_ICTL_GIMR));
+
+	/* Set up interrupt routing */
+	writel(RTL8380_IRR0_SETTING, REG(RTL8380_IRR0));
+	writel(RTL8380_IRR1_SETTING, REG(RTL8380_IRR1));
+	writel(RTL8380_IRR2_SETTING, REG(RTL8380_IRR2));
+	writel(RTL8380_IRR3_SETTING, REG(RTL8380_IRR3));
+
+	/* Clear timer interrupt */
+	write_c0_compare(0);
+
+	/* Enable all CPU interrupts */
+	write_c0_status(read_c0_status() | ST0_IM);
+
+	/* Enable timer0 and uart0 interrupts */
+	writel(BIT(RTL8380_IRQ_TC0) | BIT(RTL8380_IRQ_UART0), REG(RTL8380_ICTL_GIMR));
+}
+
+static struct of_device_id __initdata of_irq_ids[] = {
+	{ .compatible = "mti,cpu-interrupt-controller", .data = mips_cpu_irq_of_init },
+	{ .compatible = "realtek,rtl8380-intc", .data = icu_of_init },
+	{},
+};
+
+void __init arch_init_irq(void)
+{
+	of_irq_init(of_irq_ids);
+}
diff --git a/arch/mips/realtek/prom.c b/arch/mips/realtek/prom.c
new file mode 100644
index 000000000000..be9d34282969
--- /dev/null
+++ b/arch/mips/realtek/prom.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
+ * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
+ * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
+ * Copyright (C) 2020 John Crispin <john@phrozen.org>
+ */
+
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+#include <asm/prom.h>
+
+#include <mach-realtek.h>
+
+extern char arcs_cmdline[];
+extern const char __appended_dtb;
+
+struct realtek_soc_info soc_info;
+const void *fdt;
+
+
+const char *get_system_type(void)
+{
+	return soc_info.name;
+}
+
+void __init prom_free_prom_memory(void)
+{
+	return;
+}
+
+void __init device_tree_init(void)
+{
+	if (!fdt_check_header(&__appended_dtb)) {
+		fdt = &__appended_dtb;
+		pr_info("Using appended Device Tree.\n");
+	}
+	initial_boot_params = (void *)fdt;
+	unflatten_and_copy_device_tree();
+}
+
+static void __init prom_init_cmdline(void)
+{
+	int argc = fw_arg0;
+	char **argv = (char **) KSEG1ADDR(fw_arg1);
+	int i;
+
+	arcs_cmdline[0] = '\0';
+
+	for (i = 0; i < argc; i++) {
+		char *p = (char *) KSEG1ADDR(argv[i]);
+
+		if (CPHYSADDR(p) && *p) {
+			strlcat(arcs_cmdline, p, sizeof(arcs_cmdline));
+			strlcat(arcs_cmdline, " ", sizeof(arcs_cmdline));
+		}
+	}
+	pr_info("Kernel command line: %s\n", arcs_cmdline);
+}
+
+void __init prom_init(void)
+{
+	void *dtb;
+	uint32_t model;
+
+	/* uart0 */
+	setup_8250_early_printk_port(0xb8002000, 2, 0);
+
+	model = readl(RTL8380_MODEL_NAME_INFO) >> 16;
+	if (model != 0x8330 && model != 0x8332 &&
+	    model != 0x8380 && model != 0x8382 )
+		model = readl(RTL8390_MODEL_NAME_INFO) >> 16;
+
+	soc_info.id = model;
+
+	switch (model) {
+		case 0x8328:
+			soc_info.name="RTL8328";
+			soc_info.family = RTL8328_FAMILY_ID;
+			break;
+		case 0x8332:
+			soc_info.name="RTL8332";
+			soc_info.family = RTL8380_FAMILY_ID;
+			break;
+		case 0x8380:
+			soc_info.name="RTL8380";
+			soc_info.family = RTL8380_FAMILY_ID;
+			break;
+		case 0x8382:
+			soc_info.name="RTL8382";
+			soc_info.family = RTL8380_FAMILY_ID;
+			break;
+		case 0x8390:
+			soc_info.name="RTL8390";
+			soc_info.family = RTL8390_FAMILY_ID;
+			break;
+		case 0x8391:
+			soc_info.name="RTL8391";
+			soc_info.family = RTL8390_FAMILY_ID;
+			break;
+		case 0x8392:
+			soc_info.name="RTL8392";
+			soc_info.family = RTL8390_FAMILY_ID;
+			break;
+		case 0x8393:
+			soc_info.name="RTL8393";
+			soc_info.family = RTL8390_FAMILY_ID;
+			break;
+		default:
+			soc_info.name="DEFAULT";
+			soc_info.family = 0;
+	}
+	pr_info("SoC Type: %s\n", soc_info.name);
+	prom_init_cmdline();
+
+	if (fw_passed_dtb)
+		dtb = (void *)fw_passed_dtb;
+	else if (__dtb_start != __dtb_end)
+		dtb = (void *)__dtb_start;
+	else
+		panic("no dtb found");
+
+	__dt_setup_arch(dtb);
+}
+
diff --git a/arch/mips/realtek/setup.c b/arch/mips/realtek/setup.c
new file mode 100644
index 000000000000..00b6af2fd541
--- /dev/null
+++ b/arch/mips/realtek/setup.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
+ * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
+ * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
+ * Copyright (C) 2020 John Crispin <john@phrozen.org>
+ */
+
+#include <linux/of_fdt.h>
+#include <asm/reboot.h>
+#include <asm/time.h>
+#include <mach-realtek.h>
+
+extern struct realtek_soc_info soc_info;
+
+static void realtek_restart(char *command)
+{
+	if (soc_info.family == RTL8380_FAMILY_ID) {
+		/* Reset Global Control1 Register */
+		writel(1, RTL8380_RST_GLB_CTRL_1);
+	} else if (soc_info.family == RTL8390_FAMILY_ID) {
+		/* If calling reset vector fails, reset entire chip */
+		writel(0xFFFFFFFF, RTL8390_RST_GLB_CTRL);
+	}
+}
+
+static void realtek_halt(void)
+{
+	printk("System halted.\n");
+	while(1);
+}
+
+void __init plat_mem_setup(void)
+{
+	set_io_port_base(KSEG1);
+
+	_machine_restart = realtek_restart;
+	_machine_halt = realtek_halt;
+}
+
+void __init plat_time_init(void)
+{
+	struct device_node *np;
+	u32 freq = 500000000;
+
+	np = of_find_node_by_name(NULL, "cpus");
+	if (!np) {
+		pr_err("Missing 'cpus' DT node, using default frequency.");
+	} else {
+		if (of_property_read_u32(np, "frequency", &freq) < 0)
+			pr_err("No 'frequency' property in DT, using default.");
+		else
+			pr_info("CPU frequency from device tree: %d", freq);
+		of_node_put(np);
+	}
+
+	mips_hpt_frequency = freq / 2;
+}
-- 
2.25.1

