Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F541B473E
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgDVO03 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgDVO02 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:26:28 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F808C03C1AA;
        Wed, 22 Apr 2020 07:26:17 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 2BE7620CDE;
        Wed, 22 Apr 2020 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587565576; bh=ArmavWdp/jI3lQ22byDO2pGHSLNDArUodMOyXZqJ+j4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ByPT7Hrdcn+q4551ksK7GExHY8EJ5LNkRDt0xrPyOQBtRfTzXDTk+4l1RTPVR0M3u
         Gj8T4JZJO8s6cx7Oco3jyW8gTffzKQ6OZUuSAFKAVSIAei4VI8vrU85rwUE2LtANdR
         YQdvKx3w96/HyE15LKpurQZkD2+6IumFt13ikjsrYYJaeeVCDdonCGt6Bexj/hf8Bn
         kKoK3A/Xm0SkrRRReoVAewJVeNZJHVvjrB5A6aC8hgryzbBUEY8kvO6DAlT/gELb7d
         XkWAyI5Y7V0RirzE7JzkErBh/dkgn9WKA/uwMsFB7n8WyuhL7HW48EJqdPcdRiTfnr
         LaMvx25ocT/pA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/6] irqchip: Add Loongson PCH PIC controller
Date:   Wed, 22 Apr 2020 22:24:23 +0800
Message-Id: <20200422142428.1249684-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appears on Loongson-7A family of PCH to transform
interrupts from devices into HyperTransport vectorized interrrupts
and send them to procrssor's HT vector controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig                |   8 +
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-loongson-pch-pic.c | 256 +++++++++++++++++++++++++
 3 files changed, 265 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-pch-pic.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index de4564e2ea88..4ab7a9b1a5c2 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -540,4 +540,12 @@ config LOONGSON_HTVEC
 	help
 	  Support for the Loongson3 HyperTransport Interrupt Vector Controller.
 
+config LOONGSON_PCH_PIC
+	bool "Loongson PCH PIC Controller"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	default MACH_LOONGSON64
+	select IRQ_DOMAIN_HIERARCHY
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
index 000000000000..717ab8335074
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -0,0 +1,256 @@
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
+#define PCH_PIC_CLR			0x80
+#define PCH_PIC_AUTO0		0xc0
+#define PCH_PIC_AUTO1		0xe0
+#define PCH_INT_ROUTE(irq)	(0x100 + irq)
+#define PCH_INT_HTVEC(irq)	(0x200 + irq)
+#define PCH_PIC_POL			0x3e0
+
+#define PIC_COUNT_PER_REG	32
+#define PIC_REG_COUNT		2
+#define PIC_COUNT			(PIC_COUNT_PER_REG * PIC_REG_COUNT)
+#define PIC_REG_IDX(irq_id)	((irq_id) / PIC_COUNT_PER_REG)
+#define PIC_REG_BIT(irq_id)	((irq_id) % PIC_COUNT_PER_REG)
+
+struct pch_pic {
+	void __iomem *base;
+	struct irq_domain *pic_domain;
+	int	ht_vec_base;
+	raw_spinlock_t pic_lock;
+};
+
+static void pch_pic_bitset(void __iomem *addr, int bit)
+{
+	u32 reg;
+
+	addr += PIC_REG_IDX(bit) * 4;
+	reg = readl(addr);
+	reg |= BIT(PIC_REG_BIT(bit));
+	writel(reg, addr);
+}
+
+static void pch_pic_bitclr(void __iomem *addr, int bit)
+{
+	u32 reg;
+
+	addr += PIC_REG_IDX(bit) * 4;
+	reg = readl(addr);
+	reg &= ~BIT(PIC_REG_BIT(bit));
+	writel(reg, addr);
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
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->pic_lock, flags);
+	pch_pic_bitset(priv->base + PCH_PIC_MASK, d->hwirq);
+	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
+	irq_chip_mask_parent(d);
+}
+
+static void pch_pic_unmask_irq(struct irq_data *d)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->pic_lock, flags);
+	pch_pic_bitclr(priv->base + PCH_PIC_MASK, d->hwirq);
+	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
+	irq_chip_unmask_parent(d);
+}
+
+static int pch_pic_set_type(struct irq_data *d, unsigned int type)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+	int ret = 0;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->pic_lock, flags);
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		pch_pic_bitset(priv->base + PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitclr(priv->base + PCH_PIC_POL, d->hwirq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		pch_pic_bitset(priv->base + PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitset(priv->base + PCH_PIC_POL, d->hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		pch_pic_bitclr(priv->base + PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitclr(priv->base + PCH_PIC_POL, d->hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		pch_pic_bitclr(priv->base + PCH_PIC_EDGE, d->hwirq);
+		pch_pic_bitset(priv->base + PCH_PIC_POL, d->hwirq);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
+
+	return ret;
+}
+
+static void pch_pic_enable_irq(struct irq_data *d)
+{
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+	u8 htvec = d->hwirq + priv->ht_vec_base;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->pic_lock, flags);
+	writeb(htvec, priv->base + PCH_INT_HTVEC(d->hwirq));
+	/* Hardcode to HT0 Lo */
+	writeb(1, priv->base + PCH_INT_ROUTE(d->hwirq));
+	/* Clear auto bounce, we don't need that */
+	pch_pic_bitclr(priv->base + PCH_PIC_AUTO0, d->hwirq);
+	pch_pic_bitclr(priv->base + PCH_PIC_AUTO1, d->hwirq);
+	/* Enable HTMSI transformer */
+	pch_pic_bitset(priv->base + PCH_PIC_HTMSI_EN, d->hwirq);
+	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
+	pch_pic_unmask_irq(d);
+}
+
+static struct irq_chip pch_pic_irq_chip = {
+	.name			= "PCH PIC",
+	.irq_eoi		= pch_pic_eoi_irq,
+	.irq_mask		= pch_pic_mask_irq,
+	.irq_unmask		= pch_pic_unmask_irq,
+	.irq_enable		= pch_pic_enable_irq,
+	.irq_disable	= pch_pic_mask_irq,
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
+			    handle_fasteoi_irq, NULL, NULL);
+	irq_set_probe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops pch_pic_domain_ops = {
+	.translate = irq_domain_translate_twocell,
+	.alloc	= pch_pic_alloc,
+	.free	= irq_domain_free_irqs_parent,
+};
+
+static void pch_pic_reset(struct pch_pic *priv)
+{
+	u32 idx;
+
+	/* Clear IRQ cause registers, mask all interrupts */
+	for (idx = 0; idx < PIC_REG_COUNT; idx++) {
+		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_MASK + 4 * idx);
+		writel_relaxed(0xFFFFFFFF, priv->base + PCH_PIC_CLR + 4 * idx);
+	}
+}
+
+static int pch_pic_of_init(struct device_node *node,
+				struct device_node *parent)
+{
+	struct pch_pic *priv;
+	struct irq_domain *parent_domain;
+	int err;
+	u32 ht_vec_base;
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
+				&ht_vec_base))
+		priv->ht_vec_base = 64;
+	else
+		priv->ht_vec_base = ht_vec_base;
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

