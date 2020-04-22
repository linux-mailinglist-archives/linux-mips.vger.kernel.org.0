Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BCF1B4745
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgDVO0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgDVO0d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:26:33 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A589C03C1A9;
        Wed, 22 Apr 2020 07:26:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id BED8420CD8;
        Wed, 22 Apr 2020 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587565585; bh=ExmLEV3nA2A18Fk+xJg1E3zvt8dK5C5B2ff5kfz3i1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HUZd+dNiUObX6g6/2GsABQMNq32OZ3cHuUjAtLeRT5Vr3kp9ztZ5Ry3dCOExAKhQO
         dQIv3Q7u5zNJYGgLc55j0xlxNdK/pKniVSCD/J6zAFj/JTeE+nbYJ4bUQ+EjibJa+2
         dFBQt4xTIyAMRBOIL15rhdbNSNoDN01QuBoy9iU8qD0aQhj+q4+KiYJrVnNhzujpP9
         pfQi4QtmQUXtQN7uC0hwMz2VEoovJWcM/qfOvhv7ntP7sVm7o6pO0x5BWJhqg+Jrr0
         4i6VyduIQ0Y0vOsO5hsWabMbOeJACNy7n/z3/4VEG2tMOYhpOe38UGrCAmfyAk0jRz
         GGkKZzNpSxd8Q==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/6] irqchip: Add Loongson PCH MSI controller
Date:   Wed, 22 Apr 2020 22:24:25 +0800
Message-Id: <20200422142428.1249684-6-jiaxun.yang@flygoat.com>
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
interrupts from PCI MSI into HyperTransport vectorized interrrupts
and send them to procrssor's HT vector controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig                |  10 +
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-loongson-pch-msi.c | 265 +++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-pch-msi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4ab7a9b1a5c2..9f2935418f33 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -548,4 +548,14 @@ config LOONGSON_PCH_PIC
 	help
 	  Support for the Loongson PCH PIC Controller.
 
+config LOONGSON_PCH_MSI
+	bool "Loongson PCH PIC Controller"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	depends on PCI
+	default MACH_LOONGSON64
+	select IRQ_DOMAIN_HIERARCHY
+	select PCI_MSI
+	help
+	  Support for the Loongson PCH MSI Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index acc72331cec8..3a4ce283189a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -109,3 +109,4 @@ obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
 obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
 obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
 obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
+obj-$(CONFIG_LOONGSON_PCH_MSI)		+= irq-loongson-pch-msi.o
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
new file mode 100644
index 000000000000..4bb00f2ce86a
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson PCH MSI support
+ */
+
+#define pr_fmt(fmt) "pch-msi: " fmt
+
+#include <linux/irqchip.h>
+#include <linux/msi.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_pci.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+
+struct pch_msi_data {
+	spinlock_t msi_map_lock;
+	phys_addr_t addr;
+	u32 irq_first;		/* The vectoe number that MSIs start */
+	u32 num_irqs;		/* The number of vector for MSIs */
+	unsigned long *msi_map;
+};
+
+static void pch_msi_mask_msi_irq(struct irq_data *d)
+{
+	pci_msi_mask_irq(d);
+	irq_chip_mask_parent(d);
+}
+
+static void pch_msi_unmask_msi_irq(struct irq_data *d)
+{
+	pci_msi_unmask_irq(d);
+	irq_chip_unmask_parent(d);
+}
+
+static struct irq_chip pch_msi_irq_chip = {
+	.name			= "PCH MSI",
+	.irq_mask		= pch_msi_mask_msi_irq,
+	.irq_unmask		= pch_msi_unmask_msi_irq,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
+static int pch_msi_allocate_hwirq(struct pch_msi_data *priv, int num_req)
+{
+	int first;
+
+	spin_lock(&priv->msi_map_lock);
+
+	first = bitmap_find_next_zero_area(priv->msi_map, priv->num_irqs, 0,
+					   num_req, 0);
+	if (first >= priv->num_irqs) {
+		spin_unlock(&priv->msi_map_lock);
+		return -ENOSPC;
+	}
+
+	bitmap_set(priv->msi_map, first, num_req);
+
+	spin_unlock(&priv->msi_map_lock);
+
+	return priv->irq_first + first;
+}
+
+static void pch_msi_free_hwirq(struct pch_msi_data *priv,
+				int hwirq, int num_req)
+{
+	int first = hwirq - priv->irq_first;
+
+	spin_lock(&priv->msi_map_lock);
+
+	bitmap_clear(priv->msi_map, first, num_req);
+
+	spin_unlock(&priv->msi_map_lock);
+}
+
+static void pch_msi_compose_msi_msg(struct irq_data *data,
+					struct msi_msg *msg)
+{
+	struct pch_msi_data *priv = irq_data_get_irq_chip_data(data);
+	phys_addr_t msg_addr = priv->addr;
+
+	msg->address_hi = upper_32_bits(msg_addr);
+	msg->address_lo = lower_32_bits(msg_addr);
+	msg->data = data->hwirq;
+}
+
+static struct msi_domain_info pch_msi_domain_info = {
+	.flags		= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+			  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
+	.chip	= &pch_msi_irq_chip,
+};
+
+static struct irq_chip middle_irq_chip = {
+	.name			= "PCH MSI Middle",
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_compose_msi_msg	= pch_msi_compose_msi_msg,
+};
+
+static int pch_msi_parent_domain_alloc(struct irq_domain *domain,
+					unsigned int virq, int hwirq)
+{
+	struct irq_fwspec fwspec;
+	int ret;
+
+	if (!is_of_node(domain->parent->fwnode))
+		return -EINVAL;
+
+	fwspec.fwnode = domain->parent->fwnode;
+	fwspec.param_count = 1;
+	fwspec.param[0] = hwirq;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
+	if (ret)
+		return ret;
+
+	irq_domain_set_info(domain, virq, hwirq,
+			    &middle_irq_chip, NULL,
+			    handle_simple_irq, NULL, NULL);
+	irq_set_probe(virq);
+
+	return 0;
+}
+
+static int pch_msi_middle_domain_alloc(struct irq_domain *domain,
+					   unsigned int virq,
+					   unsigned int nr_irqs, void *args)
+{
+	struct pch_msi_data *priv = domain->host_data;
+	int hwirq, err, i;
+
+	hwirq = pch_msi_allocate_hwirq(priv, nr_irqs);
+	if (hwirq < 0)
+		return hwirq;
+
+	for (i = 0; i < nr_irqs; i++) {
+		err = pch_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+		if (err)
+			goto err_hwirq;
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &middle_irq_chip, priv);
+	}
+
+	return 0;
+err_hwirq:
+	while (--i >= 0)
+		irq_domain_free_irqs_parent(domain, virq, i);
+
+	pch_msi_free_hwirq(priv, hwirq, nr_irqs);
+	return err;
+}
+
+static void pch_msi_middle_domain_free(struct irq_domain *domain,
+					   unsigned int virq,
+					   unsigned int nr_irqs)
+{
+	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+	struct pch_msi_data *priv = irq_data_get_irq_chip_data(d);
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+	pch_msi_free_hwirq(priv, d->hwirq, nr_irqs);
+}
+
+static const struct irq_domain_ops pch_msi_middle_domain_ops = {
+	.alloc	= pch_msi_middle_domain_alloc,
+	.free	= pch_msi_middle_domain_free,
+};
+
+static int pch_msi_init_domains(struct pch_msi_data *priv,
+				struct device_node *node,
+				struct device_node *parent)
+{
+	struct irq_domain *middle_domain, *msi_domain, *parent_domain;
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		pr_err("Failed to find the parent domain\n");
+		return -ENXIO;
+	}
+
+	middle_domain = irq_domain_add_tree(NULL,
+					    &pch_msi_middle_domain_ops,
+					    priv);
+	if (!middle_domain) {
+		pr_err("Failed to create the MSI middle domain\n");
+		return -ENOMEM;
+	}
+
+	middle_domain->parent = parent_domain;
+
+	msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(node),
+					       &pch_msi_domain_info,
+					       middle_domain);
+	if (!msi_domain) {
+		pr_err("Failed to create MSI domain\n");
+		irq_domain_remove(middle_domain);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int pch_msi_init(struct device_node *node,
+			    struct device_node *parent)
+{
+	struct pch_msi_data *priv;
+	struct resource res;
+	int ret;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->msi_map_lock);
+
+	ret = of_address_to_resource(node, 0, &res);
+	if (ret) {
+		pr_err("Failed to allocate resource\n");
+		goto err_priv;
+	}
+
+	priv->addr = res.start;
+
+	if (of_property_read_u32(node, "loongson,msi-base-vec",
+				&priv->irq_first)) {
+		pr_err("Unable to parse MSI vec base\n");
+		ret = -EINVAL;
+		goto err_priv;
+	}
+
+	if (of_property_read_u32(node, "loongson,msi-num-vecs",
+				&priv->num_irqs)) {
+		pr_err("Unable to parse MSI vec number\n");
+		ret = -EINVAL;
+		goto err_priv;
+	}
+
+	priv->msi_map = kcalloc(BITS_TO_LONGS(priv->num_irqs),
+				sizeof(*priv->msi_map),
+				GFP_KERNEL);
+	if (!priv->msi_map) {
+		ret = -ENOMEM;
+		goto err_priv;
+	}
+
+	pr_debug("Registering %d MSIs, starting at %d\n",
+		 priv->num_irqs, priv->irq_first);
+
+	ret = pch_msi_init_domains(priv, node, parent);
+	if (ret)
+		goto err_map;
+
+	return 0;
+
+err_map:
+	kfree(priv->msi_map);
+err_priv:
+	kfree(priv);
+	return ret;
+}
+
+IRQCHIP_DECLARE(pch_msi, "loongson,pch-msi-1.0", pch_msi_init);
-- 
2.26.0.rc2

