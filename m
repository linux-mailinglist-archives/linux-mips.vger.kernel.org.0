Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22650A2E59
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfH3E1o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:27:44 -0400
Received: from forward102p.mail.yandex.net ([77.88.28.102]:52819 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbfH3E1o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:27:44 -0400
Received: from mxback13g.mail.yandex.net (mxback13g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:92])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 946DE1D41003;
        Fri, 30 Aug 2019 07:27:38 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback13g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id uS3J3pDn7T-Rb1q4og9;
        Fri, 30 Aug 2019 07:27:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139258;
        bh=Ulv/uD7qxr+1MoevGlR9WkmCPjhOjRT4WDO7fCVK1Z0=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=YavTsF0Fa7GujTM0Fs5VDAB3W5ZQK2PSjORjQkP973eBUTSn5w3S+ftUQZ0YhYMQH
         wXBaHW4d7Jk9xLODECZf3WKX+9sGkNqn4YjUQ3tKBO6fwIzKO57iNJfkeX7o6FtdsK
         SPIFITbtTXCnujeD7XtWeBHfPSPUGI4Z0/cApmJI=
Authentication-Results: mxback13g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 77UXTEcPDw-RST0EUPf;
        Fri, 30 Aug 2019 07:27:35 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 05/18] irqchip: Add driver for Loongson-3 I/O interrupt controller
Date:   Fri, 30 Aug 2019 12:25:55 +0800
Message-Id: <20190830042608.19569-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
References: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appeared on Loongson-3 family of chips as the primary
package interrupt source.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig          |   9 +
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-ls3-iointc.c | 275 +++++++++++++++++++++++++++++++
 3 files changed, 285 insertions(+)
 create mode 100644 drivers/irqchip/irq-ls3-iointc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 80e10f4e213a..8d9eac5fd4a7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -471,6 +471,15 @@ config TI_SCI_INTA_IRQCHIP
 	  If you wish to use interrupt aggregator irq resources managed by the
 	  TI System Controller, say Y here. Otherwise, say N.
 
+config LS3_IOINTC
+	bool "Loongson3 I/O Interrupt Controller"
+	depends on MACH_LOONGSON64
+	default y
+	select IRQ_DOMAIN
+	select GENERIC_IRQ_CHIP
+	help
+	  Support for the Loongson-3 I/O Interrupt Controller.
+
 endmenu
 
 config SIFIVE_PLIC
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 8d0fcec6ab23..49ecb8d38138 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -102,3 +102,4 @@ obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
 obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
+obj-$(CONFIG_LS3_IOINTC)			+= irq-ls3-iointc.o
diff --git a/drivers/irqchip/irq-ls3-iointc.c b/drivers/irqchip/irq-ls3-iointc.c
new file mode 100644
index 000000000000..0fbff7afa43c
--- /dev/null
+++ b/drivers/irqchip/irq-ls3-iointc.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2019, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson-3 IOINTC IRQ support
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/irqchip.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/io.h>
+#include <linux/smp.h>
+#include <linux/irqchip/chained_irq.h>
+
+
+#define LS3_CHIP_IRQ	32
+
+#define LS3_REG_INTx_MAP(x)	(x * 0x1)
+#define LS3_INTC_CHIP_START	0x20
+
+#define LS3_REG_INTC_STATUS	(LS3_INTC_CHIP_START + 0x00)
+#define LS3_REG_INTC_EN_STATUS	(LS3_INTC_CHIP_START + 0x04)
+#define LS3_REG_INTC_ENABLE	(LS3_INTC_CHIP_START + 0x08)
+#define LS3_REG_INTC_DISABLE	(LS3_INTC_CHIP_START + 0x0c)
+#define LS3_REG_INTC_POL	(LS3_INTC_CHIP_START + 0x10)
+#define LS3_REG_INTC_EDGE	(LS3_INTC_CHIP_START + 0x18)
+
+#define LS3_MAP_CORE_INT(x, y)	(u8)(BIT(x) | (BIT(y) << 4))
+
+struct ls3_iointc_priv {
+	u8 map_cache[LS3_CHIP_IRQ];
+};
+
+
+static void ls3_io_chained_handle_irq(struct irq_desc *desc)
+{
+	struct irq_chip_generic *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	u32 pending;
+
+	chained_irq_enter(chip, desc);
+
+	/* Check with mask_cache to prevent HW fake interrupt */
+	pending = ~gc->mask_cache &
+				readl(gc->reg_base + LS3_REG_INTC_STATUS);
+
+	if (!pending)
+		spurious_interrupt();
+
+	while (pending) {
+		int bit = __ffs(pending);
+
+		generic_handle_irq(irq_find_mapping(gc->domain, bit));
+		pending &= ~BIT(bit);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void ls_intc_set_bit(struct irq_chip_generic *gc,
+							unsigned int offset,
+							u32 mask, bool set)
+{
+	if (set)
+		writel(readl(gc->reg_base + offset) | mask,
+				gc->reg_base + offset);
+	else
+		writel(readl(gc->reg_base + offset) & ~mask,
+				gc->reg_base + offset);
+}
+
+static int ls_intc_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
+	u32 mask = data->mask;
+	unsigned long flags;
+
+	irq_gc_lock_irqsave(gc, flags);
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, false);
+		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, true);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, false);
+		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, false);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, true);
+		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, true);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ls_intc_set_bit(gc, LS3_REG_INTC_EDGE, mask, true);
+		ls_intc_set_bit(gc, LS3_REG_INTC_POL, mask, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+	irq_gc_unlock_irqrestore(gc, flags);
+
+	irqd_set_trigger_type(data, type);
+	return 0;
+}
+
+static int ls_intc_set_affinity(struct irq_data *idata,
+					 const cpumask_t *cpu_mask, bool force)
+{
+	return -ENAVAIL;
+}
+
+static int ls3_iointc_irq_domain_xlate(struct irq_domain *d,
+				struct device_node *ctrlr,
+				const u32 *intspec, unsigned int intsize,
+				unsigned long *out_hwirq,
+				unsigned int *out_type)
+{
+	struct ls3_iointc_priv *priv = d->host_data;
+	struct irq_chip_generic *gc;
+	int err;
+	unsigned long flags;
+
+	/* Call the generic xlate to process first two cells  */
+	err = irq_domain_xlate_onetwocell(d, ctrlr, intspec,
+									intsize, out_hwirq, out_type);
+	if (err)
+		return err;
+	/* If we only have two cells, don't process map information */
+	if (intsize <= 2)
+		return 0;
+	else if (intsize != 4)
+		return -EINVAL; /* Only 4 cells is acceptable */
+
+	/* Third cell is the parent interrupt line, fourth is the Core */
+	if (intspec[3] > 5 || intspec[4] > 3)
+		return -EINVAL; /* Check IP & Core  */
+
+	gc = irq_get_domain_generic_chip(d, *out_hwirq);
+	priv->map_cache[*out_hwirq] = LS3_MAP_CORE_INT(intspec[4], intspec[3]);
+
+	irq_gc_lock_irqsave(gc, flags);
+	writeb(priv->map_cache[*out_hwirq],
+			gc->reg_base + LS3_REG_INTx_MAP(*out_hwirq));
+	irq_gc_unlock_irqrestore(gc, flags);
+
+	return 0;
+}
+
+static const struct irq_domain_ops ls3_iointc_irq_domain_ops = {
+	.map	= irq_map_generic_chip,
+	.unmap  = irq_unmap_generic_chip,
+	.xlate	= ls3_iointc_irq_domain_xlate,
+};
+
+static void ls3_iointc_resume(struct irq_chip_generic *gc)
+{
+	struct ls3_iointc_priv *priv = gc->private;
+	unsigned long flags;
+	int i;
+
+	irq_gc_lock_irqsave(gc, flags);
+	/* Revert map cache */
+	for (i = 0; i < LS3_CHIP_IRQ; i++)
+		writeb(priv->map_cache[i],
+				gc->reg_base + LS3_REG_INTx_MAP(i));
+
+	/* Revert mask cache */
+	writel(gc->mask_cache, gc->reg_base + LS3_REG_INTC_DISABLE);
+	writel(~gc->mask_cache, gc->reg_base + LS3_REG_INTC_ENABLE);
+	irq_gc_unlock_irqrestore(gc, flags);
+}
+
+int __init ls3_iointc_of_init(struct device_node *node,
+					   struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_domain *domain;
+	struct irq_chip_type *ct;
+	struct ls3_iointc_priv *priv;
+	void __iomem *intc_base;
+	int parent_irq, err = 0;
+	int core = cpu_logical_map(smp_processor_id());
+	int i;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	intc_base = of_iomap(node, 0);
+	if (!intc_base) {
+		err = -ENODEV;
+		goto out_free_priv;
+	}
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq) {
+		pr_err("ls3-iointc: unable to get parent irq\n");
+		err =  -ENODEV;
+		goto out_iounmap;
+	}
+	/* Setup IRQ domain */
+	domain = irq_domain_add_linear(node, 32,
+										&ls3_iointc_irq_domain_ops,
+										priv);
+	if (!domain) {
+		pr_err("ls3-iointc: cannot add IRQ domain\n");
+		err = -ENOMEM;
+		goto out_iounmap;
+	}
+
+	err = irq_alloc_domain_generic_chips(domain, 32, 1,
+										node->full_name,
+										handle_level_irq,
+										IRQ_NOPROBE, 0, 0);
+	if (err) {
+		pr_err("ls3-iointc: unable to register IRQ domain\n");
+		err = -ENOMEM;
+		goto out_free_domain;
+	}
+
+	/*
+	 * Initialize the map_cache by routing all the interrupts
+	 * to interrupt line 0 of the bootcore
+	 */
+	pr_info("ls3-iointc: Mapping All ls3-iointc IRQ to core %d, IP 0\n",
+			core);
+	for (i = 0; i < LS3_CHIP_IRQ; i++) {
+		priv->map_cache[i] = LS3_MAP_CORE_INT(core, 0);
+		writeb(priv->map_cache[i],
+				intc_base + LS3_REG_INTx_MAP(i));
+	}
+
+	/* Disable all IRQs */
+	writel(0xffffffff, intc_base + LS3_REG_INTC_DISABLE);
+	/* Set to level triggered */
+	writel(0x0, intc_base + LS3_REG_INTC_EDGE);
+
+	gc = irq_get_domain_generic_chip(domain, 0);
+	gc->private = priv;
+	gc->reg_base = intc_base;
+	gc->domain = domain;
+	gc->resume = ls3_iointc_resume;
+
+	ct = gc->chip_types;
+	ct->regs.enable = LS3_REG_INTC_ENABLE;
+	ct->regs.disable = LS3_REG_INTC_DISABLE;
+	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
+	ct->chip.irq_mask = irq_gc_mask_disable_reg;
+	ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
+	ct->chip.irq_set_type = ls_intc_set_type;
+	ct->chip.irq_set_affinity = ls_intc_set_affinity;
+
+	/* Initialize mask_cache by read EN_STATUS register */
+	gc->mask_cache = ~readl(intc_base + LS3_REG_INTC_EN_STATUS);
+
+	irq_set_chained_handler_and_data(parent_irq,
+									ls3_io_chained_handle_irq,
+									gc);
+
+	return 0;
+
+out_free_domain:
+	irq_domain_remove(domain);
+out_iounmap:
+	iounmap(intc_base);
+out_free_priv:
+	kfree(priv);
+
+	return err;
+}
+
+IRQCHIP_DECLARE(ls3_iointc, "loongson,ls3-iointc", ls3_iointc_of_init);
-- 
2.22.0

