Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0571E6608
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 17:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404402AbgE1P2v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 11:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404080AbgE1P2t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 11:28:49 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6815FC08C5C6;
        Thu, 28 May 2020 08:28:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 2E04C20F0F;
        Thu, 28 May 2020 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590679727; bh=PiyFQ3vJlUAXzvU65mikDKpCq3aJ3Pe1IC/GIuhFf0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qctDfiL5HeSTnpJkrIzyjaKAw3t9ZYd8LqqMdWt4L2McR6V/EEbslax8Pjzq8UVHd
         L1dANecu44GypcJ82UjL09AIU6l/ap8MIyL8dLVBQtbjE9kC36eToxFFD+JKGWA4zp
         HrY0w36ffwdK70meDWZzpKAiIpTgrhKjWVJRrqOG0aIhrKjvpXqJkSBi5/Q/HxWoBc
         aysP13JbDTYp6dq5IlqMmQE7l3QvQtb4++KFNLMBPL38o+sJbpTNrjps+u8VDhDUQ8
         m/FGJb0RwxvGOIfJYlrMm+s3UOGAXdezOc6GZW3Ixfxe85LfoY1LrXDdoOTUYgjJkJ
         swW2U7yOvYfrQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v5 1/6] irqchip: Add Loongson HyperTransport Vector support
Date:   Thu, 28 May 2020 23:27:49 +0800
Message-Id: <20200528152757.1028711-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200528152757.1028711-1-jiaxun.yang@flygoat.com>
References: <20200528152757.1028711-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appears on Loongson-3 chips for receiving interrupt
vectors from PCH's PIC and PCH's PCIe MSI interrupts.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
	- Style cleanup
	- Set ack callback and set correct edge_irq handler

v3:
	- Correct bitops in ACK callback
v4:
	- Drop irqsave for spinlocks
	- Fix brace align and ordering issue thanks to tglx
---
 drivers/irqchip/Kconfig              |   8 +
 drivers/irqchip/Makefile             |   1 +
 drivers/irqchip/irq-loongson-htvec.c | 214 +++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-htvec.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a85aada04a64..de4564e2ea88 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -532,4 +532,12 @@ config LOONGSON_HTPIC
 	help
 	  Support for the Loongson-3 HyperTransport PIC Controller.
 
+config LOONGSON_HTVEC
+	bool "Loongson3 HyperTransport Interrupt Vector Controller"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	default MACH_LOONGSON64
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Support for the Loongson3 HyperTransport Interrupt Vector Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 37bbe39bf909..74561879f5a7 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -107,3 +107,4 @@ obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
 obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
+obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
new file mode 100644
index 000000000000..1ece9337c78d
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson HyperTransport Interrupt Vector support
+ */
+
+#define pr_fmt(fmt) "htvec: " fmt
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+
+/* Registers */
+#define HTVEC_EN_OFF		0x20
+#define HTVEC_MAX_PARENT_IRQ	4
+
+#define VEC_COUNT_PER_REG	32
+#define VEC_REG_COUNT		4
+#define VEC_COUNT		(VEC_COUNT_PER_REG * VEC_REG_COUNT)
+#define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
+#define VEC_REG_BIT(irq_id)	((irq_id) % VEC_COUNT_PER_REG)
+
+struct htvec {
+	void __iomem		*base;
+	struct irq_domain	*htvec_domain;
+	raw_spinlock_t		htvec_lock;
+};
+
+static void htvec_irq_dispatch(struct irq_desc *desc)
+{
+	int i;
+	u32 pending;
+	bool handled = false;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct htvec *priv = irq_desc_get_handler_data(desc);
+
+	chained_irq_enter(chip, desc);
+
+	for (i = 0; i < VEC_REG_COUNT; i++) {
+		pending = readl(priv->base + 4 * i);
+		while (pending) {
+			int bit = __ffs(pending);
+
+			generic_handle_irq(irq_linear_revmap(priv->htvec_domain, bit +
+							     VEC_COUNT_PER_REG * i));
+			pending &= ~BIT(bit);
+			handled = true;
+		}
+	}
+
+	if (!handled)
+		spurious_interrupt();
+
+	chained_irq_exit(chip, desc);
+}
+
+static void htvec_ack_irq(struct irq_data *d)
+{
+	struct htvec *priv = irq_data_get_irq_chip_data(d);
+
+	writel(BIT(VEC_REG_BIT(d->hwirq)),
+	       priv->base + VEC_REG_IDX(d->hwirq) * 4);
+}
+
+static void htvec_mask_irq(struct irq_data *d)
+{
+	u32 reg;
+	void __iomem *addr;
+	struct htvec *priv = irq_data_get_irq_chip_data(d);
+
+	raw_spin_lock(&priv->htvec_lock);
+	addr = priv->base + HTVEC_EN_OFF;
+	addr += VEC_REG_IDX(d->hwirq) * 4;
+	reg = readl(addr);
+	reg &= ~BIT(VEC_REG_BIT(d->hwirq));
+	writel(reg, addr);
+	raw_spin_unlock(&priv->htvec_lock);
+}
+
+static void htvec_unmask_irq(struct irq_data *d)
+{
+	u32 reg;
+	void __iomem *addr;
+	struct htvec *priv = irq_data_get_irq_chip_data(d);
+
+	raw_spin_lock(&priv->htvec_lock);
+	addr = priv->base + HTVEC_EN_OFF;
+	addr += VEC_REG_IDX(d->hwirq) * 4;
+	reg = readl(addr);
+	reg |= BIT(VEC_REG_BIT(d->hwirq));
+	writel(reg, addr);
+	raw_spin_unlock(&priv->htvec_lock);
+}
+
+static struct irq_chip htvec_irq_chip = {
+	.name			= "LOONGSON_HTVEC",
+	.irq_mask		= htvec_mask_irq,
+	.irq_unmask		= htvec_unmask_irq,
+	.irq_ack		= htvec_ack_irq,
+};
+
+static int htvec_domain_alloc(struct irq_domain *domain, unsigned int virq,
+			      unsigned int nr_irqs, void *arg)
+{
+	unsigned long hwirq;
+	unsigned int type, i;
+	struct htvec *priv = domain->host_data;
+
+	irq_domain_translate_onecell(domain, arg, &hwirq, &type);
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, hwirq + i, &htvec_irq_chip,
+				    priv, handle_edge_irq, NULL, NULL);
+	}
+
+	return 0;
+}
+
+static void htvec_domain_free(struct irq_domain *domain, unsigned int virq,
+				  unsigned int nr_irqs)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_data *d = irq_domain_get_irq_data(domain, virq + i);
+
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+	}
+}
+
+static const struct irq_domain_ops htvec_domain_ops = {
+	.translate	= irq_domain_translate_onecell,
+	.alloc		= htvec_domain_alloc,
+	.free		= htvec_domain_free,
+};
+
+static void htvec_reset(struct htvec *priv)
+{
+	u32 idx;
+
+	/* Clear IRQ cause registers, mask all interrupts */
+	for (idx = 0; idx < VEC_REG_COUNT; idx++) {
+		writel_relaxed(0x0, priv->base + HTVEC_EN_OFF + 4 * idx);
+		writel_relaxed(0xFFFFFFFF, priv->base);
+	}
+}
+
+static int htvec_of_init(struct device_node *node,
+				struct device_node *parent)
+{
+	struct htvec *priv;
+	int err, parent_irq[4], num_parents = 0, i;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&priv->htvec_lock);
+	priv->base = of_iomap(node, 0);
+	if (!priv->base) {
+		err = -ENOMEM;
+		goto free_priv;
+	}
+
+	/* Interrupt may come from any of the 4 interrupt line */
+	for (i = 0; i < HTVEC_MAX_PARENT_IRQ; i++) {
+		parent_irq[i] = irq_of_parse_and_map(node, i);
+		if (parent_irq[i] <= 0)
+			break;
+
+		num_parents++;
+	}
+
+	if (!num_parents) {
+		pr_err("Failed to get parent irqs\n");
+		err = -ENODEV;
+		goto iounmap_base;
+	}
+
+	priv->htvec_domain = irq_domain_create_linear(of_node_to_fwnode(node),
+						      VEC_COUNT,
+						      &htvec_domain_ops,
+						      priv);
+	if (!priv->htvec_domain) {
+		pr_err("Failed to create IRQ domain\n");
+		err = -ENOMEM;
+		goto iounmap_base;
+	}
+
+	htvec_reset(priv);
+
+	for (i = 0; i < num_parents; i++)
+		irq_set_chained_handler_and_data(parent_irq[i],
+						 htvec_irq_dispatch, priv);
+
+	return 0;
+
+iounmap_base:
+	iounmap(priv->base);
+free_priv:
+	kfree(priv);
+
+	return err;
+}
+
+IRQCHIP_DECLARE(htvec, "loongson,htvec-1.0", htvec_of_init);
-- 
2.27.0.rc0

