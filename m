Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 936B49E345
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbfH0IyT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:54:19 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:50463 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729493AbfH0IyS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:54:18 -0400
Received: from mxback4o.mail.yandex.net (mxback4o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1e])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 5E7274200EE3;
        Tue, 27 Aug 2019 11:54:14 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback4o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id UMT5yPq767-sEVuVvkC;
        Tue, 27 Aug 2019 11:54:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896054;
        bh=ry65v6/TCRoZrNVykYmi6U0q0PkAZQvhlV9P2rFjxqk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=QCk1lKO6tpPDXu0FYi0iroiZsKI2cSvmd27cjtxSx0qyFpH7igwvqqlN+76dQQioS
         UINbaslhSCm8ywi9ucAzBXHEd9OD8uRJFY2pHhAf3eCOV3m4ExufOjbTFvUzZ4u3W5
         edco12MZ1VJYOyRhzPTsC/lk8gUOzsQ5KrKMz018=
Authentication-Results: mxback4o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-s7tCT8dN;
        Tue, 27 Aug 2019 11:54:12 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 04/13] irqchip: Add driver for Loongson-3 I/O interrupt controller
Date:   Tue, 27 Aug 2019 16:52:53 +0800
Message-Id: <20190827085302.5197-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
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
 drivers/irqchip/Kconfig          |   9 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-ls3-iointc.c | 216 +++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
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
index 000000000000..1fc3c41c57d9
--- /dev/null
+++ b/drivers/irqchip/irq-ls3-iointc.c
@@ -0,0 +1,216 @@
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
+#define LS3_INTC_CHIP_START	0x20
+
+#define LS3_REG_INTC_STATUS	0x00
+#define LS3_REG_INTC_EN_STATUS	0x04
+#define LS3_REG_INTC_ENABLE	0x08
+#define LS3_REG_INTC_DISABLE	0x0c
+#define LS3_REG_INTC_POL	0x10
+#define LS3_REG_INTC_EDGE	0x18
+
+#define LS3_MAP_CORE_INT(x, y)	(u8)(BIT(x) | (BIT(y) << 4))
+
+
+struct ls3_iointc_priv {
+	struct irq_domain	*domain;
+	void __iomem		*intc_base;
+};
+
+
+static void ls3_io_chained_handle_irq(struct irq_desc *desc)
+{
+	struct ls3_iointc_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	u32 pending;
+
+	chained_irq_enter(chip, desc);
+
+	pending = readl(priv->intc_base + LS3_REG_INTC_EN_STATUS) &
+		readl(priv->intc_base + LS3_REG_INTC_STATUS);
+
+	if (!pending)
+		spurious_interrupt();
+
+	while (pending) {
+		int bit = __ffs(pending);
+
+		generic_handle_irq(irq_find_mapping(priv->domain, bit));
+		pending &= ~BIT(bit);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+
+static void ls_intc_set_bit(struct irq_chip_generic *gc,
+							unsigned int offset,
+							u32 mask, bool set)
+{
+	if (set)
+		writel(readl(gc->reg_base + offset) | mask,
+		gc->reg_base + offset);
+	else
+		writel(readl(gc->reg_base + offset) & ~mask,
+		gc->reg_base + offset);
+}
+
+static int ls_intc_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
+	u32 mask = data->mask;
+
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
+
+	irqd_set_trigger_type(data, type);
+	return 0;
+}
+
+int __init ls3_iointc_of_init(struct device_node *node,
+				       struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_chip_type *ct;
+	struct ls3_iointc_priv *priv;
+	int parent_irq, err = 0;
+	int core = cpu_logical_map(smp_processor_id());
+	int ip = 0;
+	int i;
+	const u32 *map_ip, *map_core;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->intc_base = of_iomap(node, 0);
+	if (!priv->intc_base) {
+		err = -ENODEV;
+		goto out_free_priv;
+	}
+
+	map_ip = of_get_property(node, "loongson,map-ip", NULL);
+	if (!map_ip)
+		goto no_ip;
+	else if ((*map_ip) > 5)
+		pr_err("* %pOF loongson,map-ip is invalid\n", node);
+	else
+		ip = (*map_ip);
+no_ip:
+
+	/* If this property does not exist or invalid,
+	 * we map all IRQs to bootcore.
+	 */
+	map_core = of_get_property(node, "loongson,map-core", NULL);
+	if (!map_core)
+		goto no_core;
+	else if ((*map_core) > 3)
+		pr_err("* %pOF loongson,map-core is invalid\n", node);
+	else
+		core = (*map_core);
+no_core:
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq) {
+		pr_err("ls3-iointc: unable to get parent irq\n");
+		err =  -ENODEV;
+		goto out_iounmap;
+	}
+	/* Set up an IRQ domain */
+	priv->domain = irq_domain_add_linear(node, 32, &irq_generic_chip_ops,
+					     NULL);
+	if (!priv->domain) {
+		pr_err("ls3-iointc: cannot add IRQ domain\n");
+		err = -ENOMEM;
+		goto out_iounmap;
+	}
+
+	err = irq_alloc_domain_generic_chips(priv->domain, 32, 1,
+		node->full_name, handle_level_irq,
+		IRQ_NOPROBE, 0, 0);
+	if (err) {
+		pr_err("ls3-iointc: unable to register IRQ domain\n");
+		err = -ENOMEM;
+		goto out_free_domain;
+	}
+
+	/*
+	 * Q: Why don't we set IRQ affinity by these registers?
+	 * A: Hardware IRQ delivery is seriously broken,
+	 *    so we map all IRQs to a fixed core.
+	 */
+	pr_info("ls3-iointc: Mapping All ls3-iointc IRQ to core %d, IP %d\n", core, ip);
+	for (i = 0; i < LS3_CHIP_IRQ; i++)
+		writeb(LS3_MAP_CORE_INT(core, ip), priv->intc_base + 0x1 * i);
+	priv->intc_base += LS3_INTC_CHIP_START;
+
+	/* Disable all IRQs */
+	writel(0xffffffff, priv->intc_base + LS3_REG_INTC_DISABLE);
+	/* Set to level triggered */
+	writel(0x0, priv->intc_base + LS3_REG_INTC_EDGE);
+
+	gc = irq_get_domain_generic_chip(priv->domain, 0);
+	gc->reg_base = priv->intc_base;
+	gc->domain = priv->domain;
+
+	ct = gc->chip_types;
+	ct->regs.enable = LS3_REG_INTC_ENABLE;
+	ct->regs.disable = LS3_REG_INTC_DISABLE;
+	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
+	ct->chip.irq_mask = irq_gc_mask_disable_reg;
+	ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
+	ct->chip.irq_set_type = ls_intc_set_type;
+
+	irq_set_chained_handler_and_data(parent_irq,
+		ls3_io_chained_handle_irq, priv);
+
+	return 0;
+
+out_free_domain:
+	irq_domain_remove(priv->domain);
+out_iounmap:
+	iounmap(priv->intc_base);
+out_free_priv:
+	kfree(priv);
+
+	return err;
+}
+
+IRQCHIP_DECLARE(ls3_iointc, "loongson,ls3-iointc", ls3_iointc_of_init);
-- 
2.22.0

