Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D1B73541
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 19:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbfGXRRS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 13:17:18 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49472 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbfGXRRR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Jul 2019 13:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563988630; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ILp1SaZijfp42WzbgD4jMiCq15AQEEzGtNHNYECP5Jw=;
        b=npRaiHxUx/FFaOh+Vedtf/J4SHoXNAphls6dmr1qOC7mrI/pCUCG0LOjxTQNB/YvJFr5XE
        igmFz5mvD2SAOM1CbtYQbZ0vpoisoCnqoO5GVoY2WEYdg0PMzboe6dofkhIjER4s5Tnxwj
        W0Wli9W2tOZWIMvhRlHMclnKTJaUx3k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v15 06/13] irqchip: Add irq-ingenic-tcu driver
Date:   Wed, 24 Jul 2019 13:16:08 -0400
Message-Id: <20190724171615.20774-7-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver handles the interrupt controller built in the Timer/Counter
Unit (TCU) of the JZ47xx SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---

Notes:
    v12: New patch
    
    v13: No change
    
    v14: Remove empty lines in structure definitions
    
    v15: Use device_node_to_regmap()

 drivers/irqchip/Kconfig           |  11 ++
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-ingenic-tcu.c | 182 ++++++++++++++++++++++++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 drivers/irqchip/irq-ingenic-tcu.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 80e10f4e213a..3c8308e6b3a7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -315,6 +315,17 @@ config INGENIC_IRQ
 	depends on MACH_INGENIC
 	default y
 
+config INGENIC_TCU_IRQ
+	bool "Ingenic JZ47xx TCU interrupt controller"
+	default MACH_INGENIC
+	depends on MIPS || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Support for interrupts in the Timer/Counter Unit (TCU) of the Ingenic
+	  JZ47xx SoCs.
+
+	  If unsure, say N.
+
 config RENESAS_H8300H_INTC
         bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 8d0fcec6ab23..cc7c43932f16 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_RENESAS_H8300H_INTC)	+= irq-renesas-h8300h.o
 obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
+obj-$(CONFIG_INGENIC_TCU_IRQ)		+= irq-ingenic-tcu.o
 obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
 obj-$(CONFIG_PIC32_EVIC)		+= irq-pic32-evic.o
 obj-$(CONFIG_MSCC_OCELOT_IRQ)		+= irq-mscc-ocelot.o
diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
new file mode 100644
index 000000000000..6d05cefe9d79
--- /dev/null
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ47xx SoCs TCU IRQ driver
+ * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/mfd/ingenic-tcu.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+
+struct ingenic_tcu {
+	struct regmap *map;
+	struct clk *clk;
+	struct irq_domain *domain;
+	unsigned int nb_parent_irqs;
+	u32 parent_irqs[3];
+};
+
+static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
+{
+	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
+	struct regmap *map = gc->private;
+	uint32_t irq_reg, irq_mask;
+	unsigned int i;
+
+	regmap_read(map, TCU_REG_TFR, &irq_reg);
+	regmap_read(map, TCU_REG_TMR, &irq_mask);
+
+	chained_irq_enter(irq_chip, desc);
+
+	irq_reg &= ~irq_mask;
+
+	for_each_set_bit(i, (unsigned long *)&irq_reg, 32)
+		generic_handle_irq(irq_linear_revmap(domain, i));
+
+	chained_irq_exit(irq_chip, desc);
+}
+
+static void ingenic_tcu_gc_unmask_enable_reg(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
+	struct regmap *map = gc->private;
+	u32 mask = d->mask;
+
+	irq_gc_lock(gc);
+	regmap_write(map, ct->regs.ack, mask);
+	regmap_write(map, ct->regs.enable, mask);
+	*ct->mask_cache |= mask;
+	irq_gc_unlock(gc);
+}
+
+static void ingenic_tcu_gc_mask_disable_reg(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
+	struct regmap *map = gc->private;
+	u32 mask = d->mask;
+
+	irq_gc_lock(gc);
+	regmap_write(map, ct->regs.disable, mask);
+	*ct->mask_cache &= ~mask;
+	irq_gc_unlock(gc);
+}
+
+static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
+	struct regmap *map = gc->private;
+	u32 mask = d->mask;
+
+	irq_gc_lock(gc);
+	regmap_write(map, ct->regs.ack, mask);
+	regmap_write(map, ct->regs.disable, mask);
+	irq_gc_unlock(gc);
+}
+
+static int __init ingenic_tcu_irq_init(struct device_node *np,
+				       struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_chip_type *ct;
+	struct ingenic_tcu *tcu;
+	struct regmap *map;
+	unsigned int i;
+	int ret, irqs;
+
+	map = device_node_to_regmap(np);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
+	if (!tcu)
+		return -ENOMEM;
+
+	tcu->map = map;
+
+	irqs = of_property_count_elems_of_size(np, "interrupts", sizeof(u32));
+	if (irqs < 0 || irqs > ARRAY_SIZE(tcu->parent_irqs)) {
+		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
+		ret = -EINVAL;
+		goto err_free_tcu;
+	}
+
+	tcu->nb_parent_irqs = irqs;
+
+	tcu->domain = irq_domain_add_linear(np, 32, &irq_generic_chip_ops,
+					    NULL);
+	if (!tcu->domain) {
+		ret = -ENOMEM;
+		goto err_free_tcu;
+	}
+
+	ret = irq_alloc_domain_generic_chips(tcu->domain, 32, 1, "TCU",
+					     handle_level_irq, 0,
+					     IRQ_NOPROBE | IRQ_LEVEL, 0);
+	if (ret) {
+		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
+		goto out_domain_remove;
+	}
+
+	gc = irq_get_domain_generic_chip(tcu->domain, 0);
+	ct = gc->chip_types;
+
+	gc->wake_enabled = IRQ_MSK(32);
+	gc->private = tcu->map;
+
+	ct->regs.disable = TCU_REG_TMSR;
+	ct->regs.enable = TCU_REG_TMCR;
+	ct->regs.ack = TCU_REG_TFCR;
+	ct->chip.irq_unmask = ingenic_tcu_gc_unmask_enable_reg;
+	ct->chip.irq_mask = ingenic_tcu_gc_mask_disable_reg;
+	ct->chip.irq_mask_ack = ingenic_tcu_gc_mask_disable_reg_and_ack;
+	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
+
+	/* Mask all IRQs by default */
+	regmap_write(tcu->map, TCU_REG_TMSR, IRQ_MSK(32));
+
+	/*
+	 * On JZ4740, timer 0 and timer 1 have their own interrupt line;
+	 * timers 2-7 share one interrupt.
+	 * On SoCs >= JZ4770, timer 5 has its own interrupt line;
+	 * timers 0-4 and 6-7 share one single interrupt.
+	 *
+	 * To keep things simple, we just register the same handler to
+	 * all parent interrupts. The handler will properly detect which
+	 * channel fired the interrupt.
+	 */
+	for (i = 0; i < irqs; i++) {
+		tcu->parent_irqs[i] = irq_of_parse_and_map(np, i);
+		if (!tcu->parent_irqs[i]) {
+			ret = -EINVAL;
+			goto out_unmap_irqs;
+		}
+
+		irq_set_chained_handler_and_data(tcu->parent_irqs[i],
+						 ingenic_tcu_intc_cascade,
+						 tcu->domain);
+	}
+
+	return 0;
+
+out_unmap_irqs:
+	for (; i > 0; i--)
+		irq_dispose_mapping(tcu->parent_irqs[i - 1]);
+out_domain_remove:
+	irq_domain_remove(tcu->domain);
+err_free_tcu:
+	kfree(tcu);
+	return ret;
+}
+IRQCHIP_DECLARE(jz4740_tcu_irq, "ingenic,jz4740-tcu", ingenic_tcu_irq_init);
+IRQCHIP_DECLARE(jz4725b_tcu_irq, "ingenic,jz4725b-tcu", ingenic_tcu_irq_init);
+IRQCHIP_DECLARE(jz4770_tcu_irq, "ingenic,jz4770-tcu", ingenic_tcu_irq_init);
-- 
2.21.0.593.g511ec345e18

