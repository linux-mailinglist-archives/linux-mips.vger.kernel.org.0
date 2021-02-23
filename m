Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15ECB323049
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 19:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhBWSJb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 13:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233845AbhBWSJ2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 13:09:28 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D6FC061786;
        Tue, 23 Feb 2021 10:08:48 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o16so1377993wmh.0;
        Tue, 23 Feb 2021 10:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZanVZaonbiyqSCzrYYg25KQfqKlm1R1QwT23NUF4Rvs=;
        b=bzGkBIfEoiAjN9MdtrWIzm4kKjgZ3HdCTSoB7chVqoyoDRuVe6phOZzbuYBYKCZ0Ww
         lYKsoRhrupzKzNSpRoZocMMDlc4T7KXKWzHEoh4neQFkvhtqu7cHltHrLKYDJIZ1Rz2J
         KezDpMrZV7pAvvciah/YBxih08zt9gTXseoyM93cgLPF7w4Sr/oNyuSn1YmEIz1iUL6y
         AF28fcrPQiyRNqzEdsP1wYF9Gh2DjgDvP988IL+pwcsDJd85nD0bv8zI4Aeegh+ePu8I
         cOSZnbsgU0L4DQT7XMVJrtDn9Ek05vZ2fFFW1kVTtXkt32ZbXbVxysqNdUMapIB+/MdK
         jhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZanVZaonbiyqSCzrYYg25KQfqKlm1R1QwT23NUF4Rvs=;
        b=rS/dWbFR6FkhZwwAaN3p+2GtJO7HfaIet8FK8Cwagdk6mnRm9Chv5XSdRecJ4HwsXW
         DTiPaASkML4tx6sONQT95FhWW/M4EPqogWOOpn8B3jPvJiGeGNXzgl+fOv++kQxBYpIE
         KDnd7Ke3/Cy6jPN4AOMr9bQ5u2kn5D+n0bf/fvnPv2sBFilzTwtd4lnEIuBc3OcZcEt+
         1qXb7506GGoOFWsBVnLSaVtOFQZpyOHdavRUZXYG1zh4rawK9QAfbSqDXSYp1l18q6NM
         gP9QdqBpubqYr+eY//7tTNgJnqASGQauU/IXP4OF/rFt8fAEy4XsNLuTvynbbDD+GUys
         V9lQ==
X-Gm-Message-State: AOAM530Rm3h0pMqlrnENe+BYx1phDuVooyzQ/bUaD1wa6ySBe7dapB0K
        neHujPCX/4EdZcKs75E0Z/c=
X-Google-Smtp-Source: ABdhPJwlmqxGwSTjekomhIXRBqXI66zsnH5nH7/zNZbzxYPFnDRFKoOcuTOmpjLKfmqw4rQEGBIdPA==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr39933wmi.30.1614103725669;
        Tue, 23 Feb 2021 10:08:45 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id v18sm31101709wrf.75.2021.02.23.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:08:45 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: [PATCH 2/2] irqchip: add support for BCM6345 interrupt controller
Date:   Tue, 23 Feb 2021 19:08:40 +0100
Message-Id: <20210223180840.28771-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223180840.28771-1-noltari@gmail.com>
References: <20210223180840.28771-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This interrupt controller is present on bcm63xx SoCs in order to generate
interrupts based on GPIO status changes.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/irqchip/Kconfig           |   4 +
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-bcm6345-ext.c | 271 ++++++++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/irqchip/irq-bcm6345-ext.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e74fa206240a..eaa101939a34 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -113,6 +113,10 @@ config I8259
 	bool
 	select IRQ_DOMAIN
 
+config BCM6345_EXT_IRQ
+	bool "BCM6345 External IRQ Controller"
+	select IRQ_DOMAIN
+
 config BCM6345_L1_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index c59b95a0532c..3cba65bc0aa5 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_XTENSA_MX)			+= irq-xtensa-mx.o
 obj-$(CONFIG_XILINX_INTC)		+= irq-xilinx-intc.o
 obj-$(CONFIG_IRQ_CROSSBAR)		+= irq-crossbar.o
 obj-$(CONFIG_SOC_VF610)			+= irq-vf610-mscm-ir.o
+obj-$(CONFIG_BCM6345_EXT_IRQ)		+= irq-bcm6345-ext.o
 obj-$(CONFIG_BCM6345_L1_IRQ)		+= irq-bcm6345-l1.o
 obj-$(CONFIG_BCM7038_L1_IRQ)		+= irq-bcm7038-l1.o
 obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
diff --git a/drivers/irqchip/irq-bcm6345-ext.c b/drivers/irqchip/irq-bcm6345-ext.c
new file mode 100644
index 000000000000..5721ac8de295
--- /dev/null
+++ b/drivers/irqchip/irq-bcm6345-ext.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Broadcom BCM6345 style external interrupt controller driver
+ *
+ * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
+ * Copyright (C) 2014 Jonas Gorski <jonas.gorski@gmail.com>
+ */
+
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define MAX_IRQS		4
+
+#define EXTIRQ_CFG_SENSE	0
+#define EXTIRQ_CFG_STAT		1
+#define EXTIRQ_CFG_CLEAR	2
+#define EXTIRQ_CFG_MASK		3
+#define EXTIRQ_CFG_BOTHEDGE	4
+#define EXTIRQ_CFG_LEVELSENSE	5
+
+struct intc_data {
+	struct irq_chip chip;
+	struct irq_domain *domain;
+	raw_spinlock_t lock;
+
+	int parent_irq[MAX_IRQS];
+	void __iomem *reg;
+	int shift;
+	unsigned int toggle_clear_on_ack:1;
+};
+
+static void bcm6345_ext_intc_irq_handle(struct irq_desc *desc)
+{
+	struct intc_data *data = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int irq = irq_desc_get_irq(desc);
+	unsigned int idx;
+
+	chained_irq_enter(chip, desc);
+
+	for (idx = 0; idx < MAX_IRQS; idx++) {
+		if (data->parent_irq[idx] != irq)
+			continue;
+
+		generic_handle_irq(irq_find_mapping(data->domain, idx));
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void bcm6345_ext_intc_irq_ack(struct irq_data *data)
+{
+	struct intc_data *priv = data->domain->host_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	u32 reg;
+
+	raw_spin_lock(&priv->lock);
+	reg = __raw_readl(priv->reg);
+	__raw_writel(reg | (1 << (hwirq + EXTIRQ_CFG_CLEAR * priv->shift)),
+		     priv->reg);
+	if (priv->toggle_clear_on_ack)
+		__raw_writel(reg, priv->reg);
+	raw_spin_unlock(&priv->lock);
+}
+
+static void bcm6345_ext_intc_irq_mask(struct irq_data *data)
+{
+	struct intc_data *priv = data->domain->host_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	u32 reg;
+
+	raw_spin_lock(&priv->lock);
+	reg = __raw_readl(priv->reg);
+	reg &= ~(1 << (hwirq + EXTIRQ_CFG_MASK * priv->shift));
+	__raw_writel(reg, priv->reg);
+	raw_spin_unlock(&priv->lock);
+}
+
+static void bcm6345_ext_intc_irq_unmask(struct irq_data *data)
+{
+	struct intc_data *priv = data->domain->host_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	u32 reg;
+
+	raw_spin_lock(&priv->lock);
+	reg = __raw_readl(priv->reg);
+	reg |= 1 << (hwirq + EXTIRQ_CFG_MASK * priv->shift);
+	__raw_writel(reg, priv->reg);
+	raw_spin_unlock(&priv->lock);
+}
+
+static int bcm6345_ext_intc_set_type(struct irq_data *data,
+				     unsigned int flow_type)
+{
+	struct intc_data *priv = data->domain->host_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	bool levelsense = 0, sense = 0, bothedge = 0;
+	u32 reg;
+
+	flow_type &= IRQ_TYPE_SENSE_MASK;
+
+	if (flow_type == IRQ_TYPE_NONE)
+		flow_type = IRQ_TYPE_LEVEL_LOW;
+
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		bothedge = 1;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		sense = 1;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		levelsense = 1;
+		sense = 1;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		levelsense = 1;
+		break;
+
+	default:
+		pr_err("bogus flow type combination given!\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock(&priv->lock);
+	reg = __raw_readl(priv->reg);
+
+	if (levelsense)
+		reg |= 1 << (hwirq + EXTIRQ_CFG_LEVELSENSE * priv->shift);
+	else
+		reg &= ~(1 << (hwirq + EXTIRQ_CFG_LEVELSENSE * priv->shift));
+	if (sense)
+		reg |= 1 << (hwirq + EXTIRQ_CFG_SENSE * priv->shift);
+	else
+		reg &= ~(1 << (hwirq + EXTIRQ_CFG_SENSE * priv->shift));
+	if (bothedge)
+		reg |= 1 << (hwirq + EXTIRQ_CFG_BOTHEDGE * priv->shift);
+	else
+		reg &= ~(1 << (hwirq + EXTIRQ_CFG_BOTHEDGE * priv->shift));
+
+	__raw_writel(reg, priv->reg);
+	raw_spin_unlock(&priv->lock);
+
+	irqd_set_trigger_type(data, flow_type);
+	if (flow_type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+		irq_set_handler_locked(data, handle_level_irq);
+	else
+		irq_set_handler_locked(data, handle_edge_irq);
+
+	return 0;
+}
+
+static int bcm6345_ext_intc_map(struct irq_domain *d, unsigned int irq,
+				irq_hw_number_t hw)
+{
+	struct intc_data *priv = d->host_data;
+
+	irq_set_chip_and_handler(irq, &priv->chip, handle_level_irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops bcm6345_ext_domain_ops = {
+	.xlate = irq_domain_xlate_twocell,
+	.map = bcm6345_ext_intc_map,
+};
+
+static int __init bcm6345_ext_intc_init(struct device_node *node,
+					int num_irqs, int *irqs,
+					void __iomem *reg, int shift,
+					bool toggle_clear_on_ack)
+{
+	struct intc_data *data;
+	unsigned int i;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&data->lock);
+
+	for (i = 0; i < num_irqs; i++) {
+		data->parent_irq[i] = irqs[i];
+
+		irq_set_handler_data(irqs[i], data);
+		irq_set_chained_handler(irqs[i], bcm6345_ext_intc_irq_handle);
+	}
+
+	data->reg = reg;
+	data->shift = shift;
+	data->toggle_clear_on_ack = toggle_clear_on_ack;
+
+	data->chip.name = "bcm6345-ext-intc";
+	data->chip.irq_ack = bcm6345_ext_intc_irq_ack;
+	data->chip.irq_mask = bcm6345_ext_intc_irq_mask;
+	data->chip.irq_unmask = bcm6345_ext_intc_irq_unmask;
+	data->chip.irq_set_type = bcm6345_ext_intc_set_type;
+
+	data->domain = irq_domain_add_simple(node, num_irqs, 0,
+					     &bcm6345_ext_domain_ops, data);
+	if (!data->domain) {
+		kfree(data);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int __init bcm6345_ext_intc_of_init(struct device_node *node,
+					   struct device_node *parent)
+{
+	int num_irqs, ret = -EINVAL;
+	unsigned i;
+	void __iomem *base;
+	int irqs[MAX_IRQS] = { 0 };
+	u32 shift;
+	bool toggle_clear_on_ack = false;
+
+	num_irqs = of_irq_count(node);
+
+	if (!num_irqs || num_irqs > MAX_IRQS)
+		return -EINVAL;
+
+	if (of_property_read_u32(node, "brcm,field-width", &shift))
+		shift = 4;
+
+	/* On BCM6318 setting CLEAR seems to continuously mask interrupts */
+	if (of_device_is_compatible(node, "brcm,bcm6318-ext-intc"))
+		toggle_clear_on_ack = true;
+
+	for (i = 0; i < num_irqs; i++) {
+		irqs[i] = irq_of_parse_and_map(node, i);
+		if (!irqs[i])
+			return -ENOMEM;
+	}
+
+	base = of_iomap(node, 0);
+	if (!base)
+		return -ENXIO;
+
+	ret = bcm6345_ext_intc_init(node, num_irqs, irqs, base, shift,
+				    toggle_clear_on_ack);
+	if (!ret)
+		return 0;
+
+	iounmap(base);
+
+	for (i = 0; i < num_irqs; i++)
+		irq_dispose_mapping(irqs[i]);
+
+	return ret;
+}
+
+IRQCHIP_DECLARE(bcm6318_ext_intc, "brcm,bcm6318-ext-intc",
+		bcm6345_ext_intc_of_init);
+IRQCHIP_DECLARE(bcm6345_ext_intc, "brcm,bcm6345-ext-intc",
+		bcm6345_ext_intc_of_init);
-- 
2.20.1

