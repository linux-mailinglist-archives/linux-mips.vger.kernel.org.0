Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1971BB6B6
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 08:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD1Gdn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 02:33:43 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:60582 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgD1Gdk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Apr 2020 02:33:40 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 51FB620CE2;
        Tue, 28 Apr 2020 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588055620; bh=lPC7IWuM+BGqp7NmvItdlak1lEGxcpeLXEliyaseLhg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p8HVUqdc4JhndV8J5n4jEPvfyK4+5/IcCwkHhMFv56ZudotRgoiMlwGRJYPwwoQ4l
         bNypg+e36v5U7QSpnn15MlQBBF86VPjCMQvNrlQFuePoPurW4hWwAUHHS6usQBb4Ed
         AWfC5/ngLMmNV0ZX5K48ZALtDPIZIIYiwVtW6S4bKwpCqYATyDFg5Xz3FUNa9Q+oa4
         Ef3Gdqtz0cgMYaOM0Qhzo6GXnqbTdAoVeS3/31GIB9KOQs5AME4qRqVvwtGTcyT+va
         h6znJIsIllw7EREMyo8FjdsFAOx+UDLElPtfblQvp8cd0ZYZcME7ALamn3YcGKT9La
         +3xtnJkfpv+1Q==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v2 3/6] irqchip: Add Loongson PCH PIC controller
Date:   Tue, 28 Apr 2020 14:32:42 +0800
Message-Id: <20200428063247.2223499-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appears on Loongson LS7A family of PCH to transform
interrupts from devices into HyperTransport vectorized interrrupts
and send them to procrssor's HT vector controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
	- Style clean-ups
	- Use IRQ_FASTEOI_HIERARCHY_HANDLERS
	- Move lock into bitclr & bitset
	- Make loongson,pic-base-vec as required property
---
 drivers/irqchip/Kconfig                |   9 +
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-loongson-pch-pic.c | 245 +++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-pch-pic.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index de4564e2ea88..5524a621638c 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -540,4 +540,13 @@ config LOONGSON_HTVEC
 	help
 	  Support for the Loongson3 HyperTransport Interrupt Vector Controller.
 
+config LOONGSON_PCH_PIC
+	bool "Loongson PCH PIC Controller"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	default MACH_LOONGSON64
+	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_FASTEOI_HIERARCHY_HANDLERS
+	help
+	  Support for the Loongson PCH PIC Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 74561879f5a7..acc72331cec8 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -108,3 +108,4 @@ obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
 obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
 obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
+obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
new file mode 100644
index 000000000000..9b4605873b2a
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson PCH PIC support
+ */
+
+#define pr_fmt(fmt) "pch-pic: " fmt
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+
+/* Registers */
+#define PCH_PIC_MASK		0x20
+#define PCH_PIC_HTMSI_EN	0x40
+#define PCH_PIC_EDGE		0x60
+#define PCH_PIC_CLR		0x80
+#define PCH_PIC_AUTO0		0xc0
+#define PCH_PIC_AUTO1		0xe0
+#define PCH_INT_ROUTE(irq)	(0x100 + irq)
+#define PCH_INT_HTVEC(irq)	(0x200 + irq)
+#define PCH_PIC_POL		0x3e0
+
+#define PIC_COUNT_PER_REG	32
+#define PIC_REG_COUNT		2
+#define PIC_COUNT		(PIC_COUNT_PER_REG * PIC_REG_COUNT)
+#define PIC_REG_IDX(irq_id)	((irq_id) / PIC_COUNT_PER_REG)
+#define PIC_REG_BIT(irq_id)	((irq_id) % PIC_COUNT_PER_REG)
+
+struct pch_pic {
+	void __iomem		*base;
+	struct irq_domain	*pic_domain;
+	u32			ht_vec_base;
+	raw_spinlock_t		pic_lock;
+};
+
+static void pch_pic_bitset(struct pch_pic *priv, int offset, int bit)
+{
+	void __iomem *addr = priv->base + offset + PIC_REG_IDX(bit) * 4;
+	unsigned long flags;
+	u32 reg;
+
+	raw_spin_lock_irqsave(&priv->pic_lock, flags);
+	reg = readl(addr);
+	reg |= BIT(PIC_REG_BIT(bit));
+	writel(reg, addr);
+	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
+}
+
+static void pch_pic_bitclr(struct pch_pic *priv, int offset, int bit)
+{
+	void __iomem *addr = priv->base + offset + PIC_REG_IDX(bit) * 4;
+	unsigned long flags;
+	u32 reg;
+
+	raw_spin_lock_irqsave(&priv->pic_lock, flags);
+	reg = readl(addr);
+	reg &= ~BIT(PIC_REG_BIT(bit));
+	writel(reg, addr);
+	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
+}
+
+static void pch_pic_eoi_irq(struct irq_data *d)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+	u32 idx = PIC_REG_IDX(d->hwirq);
+
+	writel(BIT(PIC_REG_BIT(d->hwirq)),
+			priv->base + PCH_PIC_CLR + idx * 4);
+}
+
+static void pch_pic_mask_irq(struct irq_data *d)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+
+	pch_pic_bitset(priv, PCH_PIC_MASK, d->hwirq);
+	irq_chip_mask_parent(d);
+}
+
+static void pch_pic_unmask_irq(struct irq_data *d)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+
+	pch_pic_bitclr(priv, PCH_PIC_MASK, d->hwirq);
+	irq_chip_unmask_parent(d);
+}
+
+static int pch_pic_set_type(struct irq_data *d, unsigned int type)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static struct irq_chip pch_pic_irq_chip = {
+	.name			= "PCH PIC",
+	.irq_mask		= pch_pic_mask_irq,
+	.irq_unmask		= pch_pic_unmask_irq,
+	.irq_ack		= irq_chip_ack_parent,
+	.irq_eoi		= pch_pic_eoi_irq,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_set_type		= pch_pic_set_type,
+};
+
+static int pch_pic_alloc(struct irq_domain *domain, unsigned int virq,
+			      unsigned int nr_irqs, void *arg)
+{
+	struct pch_pic *priv = domain->host_data;
+	struct irq_fwspec fwspec;
+	unsigned long hwirq;
+	unsigned int type;
+	int err;
+
+	irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+
+	fwspec.fwnode = domain->parent->fwnode;
+	fwspec.param_count = 1;
+	fwspec.param[0] = hwirq + priv->ht_vec_base;
+
+	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
+	if (err)
+		return err;
+
+	irq_domain_set_info(domain, virq, hwirq,
+			    &pch_pic_irq_chip, priv,
+			    handle_fasteoi_ack_irq, NULL, NULL);
+	irq_set_probe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops pch_pic_domain_ops = {
+	.translate	= irq_domain_translate_twocell,
+	.alloc		= pch_pic_alloc,
+	.free		= irq_domain_free_irqs_parent,
+};
+
+static void pch_pic_reset(struct pch_pic *priv)
+{
+	int i;
+
+	for (i = 0; i < PIC_COUNT; i++) {
+		/* Write vectore ID */
+		writeb(priv->ht_vec_base + i, priv->base + PCH_INT_HTVEC(i));
+		/* Hardcode route to HT0 Lo */
+		writeb(1, priv->base + PCH_INT_ROUTE(i));
+	}
+
+	for (i = 0; i < PIC_REG_COUNT; i++) {
+		/* Clear IRQ cause registers, mask all interrupts */
+		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_MASK + 4 * i);
+		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_CLR + 4 * i);
+		/* Clear auto bounce, we don't need that */
+		writel_relaxed(0, priv->base + PCH_PIC_AUTO0 + 4 * i);
+		writel_relaxed(0, priv->base + PCH_PIC_AUTO1 + 4 * i);
+		/* Enable HTMSI transformer */
+		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_HTMSI_EN + 4 * i);
+	}
+}
+
+static int pch_pic_of_init(struct device_node *node,
+				struct device_node *parent)
+{
+	struct pch_pic *priv;
+	struct irq_domain *parent_domain;
+	int err;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&priv->pic_lock);
+	priv->base = of_iomap(node, 0);
+	if (!priv->base) {
+		err = -ENOMEM;
+		goto free_priv;
+	}
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		pr_err("Failed to find the parent domain\n");
+		err = -ENXIO;
+		goto iounmap_base;
+	}
+
+	if (of_property_read_u32(node, "loongson,pic-base-vec",
+				&priv->ht_vec_base)) {
+		pr_err("Failed to determine pic-base-vec\n");
+		err = -EINVAL;
+		goto iounmap_base;
+	}
+
+	priv->pic_domain = irq_domain_create_hierarchy(parent_domain, 0,
+						     PIC_COUNT,
+						     of_node_to_fwnode(node),
+						     &pch_pic_domain_ops,
+						     priv);
+	if (!priv->pic_domain) {
+		pr_err("Failed to create IRQ domain\n");
+		err = -ENOMEM;
+		goto iounmap_base;
+	}
+
+	pch_pic_reset(priv);
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
+IRQCHIP_DECLARE(pch_pic, "loongson,pch-pic-1.0", pch_pic_of_init);
-- 
2.26.0.rc2

