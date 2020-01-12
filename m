Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C08513856B
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbgALIUM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:20:12 -0500
Received: from forward100o.mail.yandex.net ([37.140.190.180]:60404 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732369AbgALIUM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:20:12 -0500
X-Greylist: delayed 332 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Jan 2020 03:20:07 EST
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id B438B4AC0146;
        Sun, 12 Jan 2020 11:14:49 +0300 (MSK)
Received: from mxback11q.mail.yandex.net (mxback11q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b4:0:640:1f0c:10f2])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id AEAFC61E0011;
        Sun, 12 Jan 2020 11:14:49 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback11q.mail.yandex.net (mxback/Yandex) with ESMTP id GPYyGPLaLe-EnouUtZJ;
        Sun, 12 Jan 2020 11:14:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816889;
        bh=0NuSIKtmETtBEl6vPK8FE06E3r9xPn7fhFLhkmzxzqg=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=eWxJSI36KkcBDIQVZ8lHVQVr+P+PSI93GbCsK665Vkg+VaWOYkoM0DNUQxImzI3cz
         XVOLnpNE0emR23KpUL2IleQS4p1tHLz3WDpahQBF3KGj49bD2kWTYZ3/Idh5fDMq9J
         RKsBktg3WsVPRPFLXwQStbRDIlvwB+ai8rlVjJAQ=
Authentication-Results: mxback11q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-EeV4Btrp;
        Sun, 12 Jan 2020 11:14:45 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 02/10] irqchip: Add driver for Loongson I/O interrupt controller
Date:   Sun, 12 Jan 2020 16:14:08 +0800
Message-Id: <20200112081416.722218-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appeared on Loongson family of chips as the primary
package interrupt source.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig               |   9 +
 drivers/irqchip/Makefile              |   1 +
 drivers/irqchip/irq-loongson-iointc.c | 338 ++++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-iointc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 697e6a8ccaae..3f220648151b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -499,4 +499,13 @@ config SIFIVE_PLIC
 
 	   If you don't know what to do here, say Y.
 
+config LOONGSON_IOINTC
+	bool "Loongson I/O Interrupt Controller"
+	depends on MACH_LOONGSON64
+	default y
+	select IRQ_DOMAIN
+	select GENERIC_IRQ_CHIP
+	help
+	  Support for the Loongson I/O Interrupt Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index e806dda690ea..3e98241401b3 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -104,3 +104,4 @@ obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
 obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
+obj-$(CONFIG_LOONGSON_IOINTC)		+= irq-loongson-iointc.o
diff --git a/drivers/irqchip/irq-loongson-iointc.c b/drivers/irqchip/irq-loongson-iointc.c
new file mode 100644
index 000000000000..b8deead97bc3
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-iointc.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson IOINTC IRQ support
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
+#include <boot_param.h>
+
+#define IOINTC_CHIP_IRQ	32
+#define IOINTC_NUM_PARENT 4
+
+#define IOINTC_REG_INTx_MAP(x)	(x * 0x1)
+#define IOINTC_INTC_CHIP_START	0x20
+
+#define IOINTC_REG_INTC_STATUS	(IOINTC_INTC_CHIP_START + 0x20)
+#define IOINTC_REG_INTC_EN_STATUS	(IOINTC_INTC_CHIP_START + 0x04)
+#define IOINTC_REG_INTC_ENABLE	(IOINTC_INTC_CHIP_START + 0x08)
+#define IOINTC_REG_INTC_DISABLE	(IOINTC_INTC_CHIP_START + 0x0c)
+#define IOINTC_REG_INTC_POL	(IOINTC_INTC_CHIP_START + 0x10)
+#define IOINTC_REG_INTC_EDGE	(IOINTC_INTC_CHIP_START + 0x14)
+
+#define BUGGY_LPC_IRQ	10
+
+#define IOINTC_SHIFT_INTx	4
+
+struct iointc_handler_data {
+	struct iointc_priv *priv;
+	u32 parent_int_map;
+};
+
+struct iointc_priv {
+	void __iomem *base;
+	struct irq_chip_generic *gc;
+	u8 map_cache[IOINTC_CHIP_IRQ];
+	struct iointc_handler_data handler[IOINTC_NUM_PARENT];
+	u8 possible_parent_mask;
+	bool have_lpc_irq_bug;
+};
+
+static void iointc_chained_handle_irq(struct irq_desc *desc)
+{
+	struct iointc_handler_data *handler = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_chip_generic *gc = handler->priv->gc;
+	u32 pending;
+
+	chained_irq_enter(chip, desc);
+
+	pending = readl(gc->reg_base + IOINTC_REG_INTC_STATUS);
+
+	if (!pending) {
+		/* Always blame LPC IRQ if we have that Bug and LPC interrupt enabled */
+		if (handler->priv->have_lpc_irq_bug &&
+			(handler->parent_int_map & ~gc->mask_cache & BIT(BUGGY_LPC_IRQ)))
+			generic_handle_irq(irq_find_mapping(gc->domain, BUGGY_LPC_IRQ));
+		else
+			spurious_interrupt();
+	}
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
+static void map_cache_set_core(struct iointc_priv *priv, int irq, int core)
+{
+	priv->map_cache[irq] &= ~GENMASK(3, 0);
+	priv->map_cache[irq] |= BIT(core);
+}
+
+static void write_map_cache(struct iointc_priv *priv, int irq)
+{
+	writeb(priv->map_cache[irq],
+		priv->base + IOINTC_REG_INTx_MAP(irq));
+}
+
+static void iointc_set_bit(struct irq_chip_generic *gc,
+				unsigned int offset,
+				u32 mask, bool set)
+{
+	if (set)
+		writel(readl(gc->reg_base + offset) | mask,
+				gc->reg_base + offset);
+	else
+		writel(readl(gc->reg_base + offset) & ~mask,
+				gc->reg_base + offset);
+}
+
+static int iointc_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
+	u32 mask = data->mask;
+	unsigned long flags;
+
+	irq_gc_lock_irqsave(gc, flags);
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		iointc_set_bit(gc, IOINTC_REG_INTC_EDGE, mask, false);
+		iointc_set_bit(gc, IOINTC_REG_INTC_POL, mask, true);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		iointc_set_bit(gc, IOINTC_REG_INTC_EDGE, mask, false);
+		iointc_set_bit(gc, IOINTC_REG_INTC_POL, mask, false);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		iointc_set_bit(gc, IOINTC_REG_INTC_EDGE, mask, true);
+		iointc_set_bit(gc, IOINTC_REG_INTC_POL, mask, true);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		iointc_set_bit(gc, IOINTC_REG_INTC_EDGE, mask, true);
+		iointc_set_bit(gc, IOINTC_REG_INTC_POL, mask, false);
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
+static int iointc_set_affinity(struct irq_data *idata,
+				const cpumask_t *cpu_mask, bool force)
+{
+	return -ENAVAIL;
+}
+
+static void iointc_resume(struct irq_chip_generic *gc)
+{
+	struct iointc_priv *priv = gc->private;
+	unsigned long flags;
+	int i;
+
+	irq_gc_lock_irqsave(gc, flags);
+	/* Revert map cache */
+	for (i = 0; i < IOINTC_CHIP_IRQ; i++)
+		write_map_cache(priv, i);
+
+	/* Revert mask cache again */
+	writel(gc->mask_cache, gc->reg_base + IOINTC_REG_INTC_DISABLE);
+	writel(~gc->mask_cache, gc->reg_base + IOINTC_REG_INTC_ENABLE);
+	irq_gc_unlock_irqrestore(gc, flags);
+}
+
+static void validate_parent_mask(struct iointc_priv *priv, u32 of_parent_int_map[])
+{
+	u32 proceed_mask = 0x0, duplicated_mask = 0x0;
+	int i;
+	int fallback_parent = __ffs(priv->possible_parent_mask);
+
+	for (i = 0; i < IOINTC_NUM_PARENT; i++) {
+		/* Try if the parent is avilable */
+		if (!(priv->possible_parent_mask & BIT(i)))
+			continue;
+
+		priv->handler[i].parent_int_map = of_parent_int_map[i];
+
+		/* Detect if the IRQ have previously proceed */
+		duplicated_mask |= (priv->handler[i].parent_int_map & proceed_mask);
+		proceed_mask |= priv->handler[i].parent_int_map;
+	}
+
+	/* Fallback IRQs with no map bit set */
+	while (~proceed_mask) {
+		int bit = __ffs(~proceed_mask);
+
+		pr_warn("loongson-iointc: Found homeless IRQ %d, map to INT%d\n",
+			bit, fallback_parent);
+		priv->handler[fallback_parent].parent_int_map |= BIT(bit);
+		proceed_mask |= BIT(bit);
+	}
+
+	/* Fallback IRQs with mutiple map bit set */
+	while (duplicated_mask) {
+		int bit = __ffs(duplicated_mask);
+
+		pr_warn("loongson-iointc: IRQ %d have mutiple parents, map to INT%d\n",
+			bit, fallback_parent);
+		/* Clear the bit in all parent bits */
+		for (i = 0; i < IOINTC_NUM_PARENT; i++)
+			priv->handler[i].parent_int_map &= ~BIT(bit);
+
+		priv->handler[fallback_parent].parent_int_map |= BIT(bit);
+		duplicated_mask &= ~BIT(bit);
+	}
+
+	/* Generate parent INT part of map Cache */
+	for (i = 0; i < IOINTC_NUM_PARENT; i++) {
+		u32 pending = priv->handler[i].parent_int_map;
+
+		while (pending) {
+			int bit = __ffs(pending);
+
+			priv->map_cache[bit] = BIT(i) << IOINTC_SHIFT_INTx;
+			pending &= ~BIT(bit);
+		}
+	}
+}
+
+static const char *parent_names[] = {"int0", "int1", "int2", "int3"};
+
+int __init iointc_of_init(struct device_node *node,
+				struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_domain *domain;
+	struct irq_chip_type *ct;
+	struct iointc_priv *priv;
+	u32 of_parent_int_map[IOINTC_NUM_PARENT];
+	int parent_irq[IOINTC_NUM_PARENT];
+	int core = loongson_sysconf.boot_cpu_id;
+	int i, err = 0;
+	int sz;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = of_iomap(node, 0);
+	if (!priv->base) {
+		err = -ENODEV;
+		goto out_free_priv;
+	}
+
+	if (of_device_is_compatible(node, "loongson,iointc-1.0"))
+		priv->have_lpc_irq_bug = true;
+
+	for (i = 0; i < IOINTC_NUM_PARENT; i++) {
+		parent_irq[i] = of_irq_get_byname(node, parent_names[i]);
+		if (parent_irq[i] >= 0)
+			priv->possible_parent_mask |= BIT(i);
+	}
+
+
+	if (!priv->possible_parent_mask) {
+		pr_err("loongson-iointc: No parent\n");
+		err = -ENOMEM;
+		goto out_iounmap;
+	}
+
+	sz = of_property_read_variable_u32_array(node, "loongson,parent_int_map",
+						&of_parent_int_map[0], IOINTC_NUM_PARENT,
+						IOINTC_NUM_PARENT);
+	if (sz < 4) {
+		pr_err("loongson-iointc: No parent_int_map\n");
+		err = -ENODEV;
+		goto out_iounmap;
+	}
+
+	/* Setup IRQ domain */
+	domain = irq_domain_add_linear(node, 32,
+					&irq_generic_chip_ops, priv);
+	if (!domain) {
+		pr_err("loongson-iointc: cannot add IRQ domain\n");
+		err = -ENOMEM;
+		goto out_iounmap;
+	}
+
+	err = irq_alloc_domain_generic_chips(domain, 32, 1,
+					node->full_name, handle_level_irq,
+					IRQ_NOPROBE, 0, 0);
+	if (err) {
+		pr_err("loongson-iointc: unable to register IRQ domain\n");
+		err = -ENOMEM;
+		goto out_free_domain;
+	}
+
+
+	/* Disable all IRQs */
+	writel(0xffffffff, priv->base + IOINTC_REG_INTC_DISABLE);
+	/* Set to level triggered */
+	writel(0x0, priv->base + IOINTC_REG_INTC_EDGE);
+
+	validate_parent_mask(priv, &of_parent_int_map[0]);
+
+	for (i = 0; i < IOINTC_CHIP_IRQ; i++) {
+		map_cache_set_core(priv, i, core);
+		write_map_cache(priv, i);
+	}
+
+	gc = irq_get_domain_generic_chip(domain, 0);
+	gc->private = priv;
+	gc->reg_base = priv->base;
+	gc->domain = domain;
+	gc->resume = iointc_resume;
+
+	ct = gc->chip_types;
+	ct->regs.enable = IOINTC_REG_INTC_ENABLE;
+	ct->regs.disable = IOINTC_REG_INTC_DISABLE;
+	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
+	ct->chip.irq_mask = irq_gc_mask_disable_reg;
+	ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
+	ct->chip.irq_set_type = iointc_set_type;
+	ct->chip.irq_set_affinity = iointc_set_affinity;
+
+	gc->mask_cache = 0xffffffff;
+	priv->gc = gc;
+
+	for (i = 0; i < IOINTC_NUM_PARENT; i++) {
+		if (parent_irq[i] < 0)
+			continue;
+
+		priv->handler[i].priv = priv;
+		irq_set_chained_handler_and_data(parent_irq[i],
+				iointc_chained_handle_irq, &priv->handler[i]);
+	}
+
+	return 0;
+
+out_free_domain:
+	irq_domain_remove(domain);
+out_iounmap:
+	iounmap(priv->base);
+out_free_priv:
+	kfree(priv);
+
+	return err;
+}
+
+IRQCHIP_DECLARE(loongson_iointc_1_0, "loongson,iointc-1.0", iointc_of_init);
+IRQCHIP_DECLARE(loongson_iointc_1_0a, "loongson,iointc-1.0a", iointc_of_init);
-- 
2.24.1

