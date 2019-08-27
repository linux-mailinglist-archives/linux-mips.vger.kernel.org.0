Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE639E34C
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfH0Iyd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:54:33 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:35425 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729895AbfH0Iyd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:54:33 -0400
Received: from mxback5j.mail.yandex.net (mxback5j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10e])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 35D7250E1B68;
        Tue, 27 Aug 2019 11:54:28 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback5j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id HykKnQ8voc-sRIOZ1Ch;
        Tue, 27 Aug 2019 11:54:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896068;
        bh=G0jHcPXM+OCk44Z0PCwjREln9mLdtxprn1r5zWOEs78=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=f342uDTtikFulBQKjxq016BGG0gvX9l22Frpnw2Ff3ZPoEbkBeLOCugfPOKsJRa9B
         imMZKyaZfGRNXnDAboV6RYWMF+gvr7yL8Ih4+5GYR8Q+izjfwag9g8HD4O5DzD4BxM
         cZhbXg9VyjD7BPj6rznXO6AhLnsyY09XHf5DnQlc=
Authentication-Results: mxback5j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-sLtCjfGP;
        Tue, 27 Aug 2019 11:54:26 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 06/13] irqchip: Add driver for Loongson-3 HyperTransport interrupt controller
Date:   Tue, 27 Aug 2019 16:52:55 +0800
Message-Id: <20190827085302.5197-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appeared on Loongson-3 family of chips to receive interrupts
from PCH chip.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig          |   8 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-ls3-htintc.c | 145 +++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/irqchip/irq-ls3-htintc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8d9eac5fd4a7..b3ce0f3e43ae 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -480,6 +480,14 @@ config LS3_IOINTC
 	help
 	  Support for the Loongson-3 I/O Interrupt Controller.
 
+config LS3_HTINTC
+	bool "Loongson3 HyperTransport Interrupt Controller"
+	depends on MACH_LOONGSON64
+	default y
+	select IRQ_DOMAIN
+	select GENERIC_IRQ_CHIP
+	help
+	  Support for the Loongson-3 HyperTransport Interrupt Controller.
 endmenu
 
 config SIFIVE_PLIC
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 49ecb8d38138..0fda94c319e9 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -103,3 +103,4 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_LS3_IOINTC)			+= irq-ls3-iointc.o
+obj-$(CONFIG_LS3_HTINTC)			+= irq-ls3-htintc.o
diff --git a/drivers/irqchip/irq-ls3-htintc.c b/drivers/irqchip/irq-ls3-htintc.c
new file mode 100644
index 000000000000..c53bbb0bd78c
--- /dev/null
+++ b/drivers/irqchip/irq-ls3-htintc.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2019, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson-3 HyperTransport IRQ support
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
+#include <linux/irqchip/chained_irq.h>
+
+#define HTINTC_NUM_GC  4
+#define HTINTC_GC_SIZE  0x4
+#define HTINTC_NUM_HANDLER  4
+#define HTINTC_HANDLER_SIZE  0x8
+#define HTINTC_HANDLER_IRQ  64
+
+#define HTINTC_VECTOR_OFFSET   0x0
+#define HTINTC_EN_OFFSET   0x20
+
+struct htintc_handler_priv {
+	struct irq_domain	*domain;
+	void __iomem		*handler_base;
+};
+
+static void htintc_chained_handle_irq(struct irq_desc *desc)
+{
+	struct htintc_handler_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	int i;
+	bool handled;
+
+	chained_irq_enter(chip, desc);
+
+	for (i = 0; i < HTINTC_NUM_GC; i++) {
+		uint32_t irqs = readl(priv->handler_base + HTINTC_GC_SIZE * i);
+
+		while (irqs) {
+			int bit = __ffs(irqs);
+
+			generic_handle_irq(irq_find_mapping(priv->domain, bit + 32 * i));
+			irqs &= ~BIT(bit);
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
+int __init ls3_htintc_of_init(struct device_node *node,
+					   struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_chip_type *ct;
+	struct htintc_handler_priv *priv;
+	struct irq_domain *domain;
+	void __iomem *base;
+	int parent_irq[HTINTC_NUM_HANDLER], err = 0;
+	int i;
+
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	base = of_iomap(node, 0);
+	if (!base) {
+		err = -ENODEV;
+		goto out_free_priv;
+	}
+
+	for (i = 0; i < HTINTC_NUM_HANDLER; i++) {
+		parent_irq[i] = irq_of_parse_and_map(node, i);
+		if (!parent_irq[i]) {
+			pr_err("ls3-htintc: unable to get parent irq %d\n", i);
+			err =  -ENODEV;
+			goto out_iounmap;
+		}
+	}
+	/* Set up an IRQ domain */
+	domain = irq_domain_add_linear(node, 32 * HTINTC_NUM_GC,
+		&irq_generic_chip_ops, NULL);
+	if (!domain) {
+		pr_err("ls3-htintc: cannot add IRQ domain\n");
+		err = -ENOMEM;
+		goto out_iounmap;
+	}
+
+	for (i = 0; i < HTINTC_NUM_HANDLER; i++) {
+		/* Mask all interrupts */
+		writeq(0x0, base + HTINTC_EN_OFFSET + HTINTC_HANDLER_SIZE * i);
+	}
+
+	err = irq_alloc_domain_generic_chips(domain, 32, 1,
+		node->full_name, handle_fasteoi_irq,
+		IRQ_NOPROBE, 0, IRQ_GC_INIT_MASK_CACHE);
+	if (err) {
+		pr_err("ls3-htintc: unable to register IRQ domain\n");
+		err = -ENOMEM;
+		goto out_free_domain;
+	}
+
+	for (i = 0; i < HTINTC_NUM_GC; i++) {
+		gc = irq_get_domain_generic_chip(domain, i * 32);
+		gc->reg_base = base + HTINTC_GC_SIZE * i;
+		gc->domain = domain;
+
+		ct = gc->chip_types;
+		ct->regs.mask = HTINTC_EN_OFFSET;
+		ct->regs.ack = HTINTC_VECTOR_OFFSET;
+		ct->chip.irq_unmask = irq_gc_mask_set_bit;
+		ct->chip.irq_mask = irq_gc_mask_clr_bit;
+		ct->chip.irq_ack = irq_gc_ack_set_bit;
+	}
+
+	priv->domain = domain;
+	priv->handler_base = base + HTINTC_VECTOR_OFFSET;
+
+	for (i = 0; i < HTINTC_NUM_HANDLER; i++) {
+		irq_set_chained_handler_and_data(parent_irq[i],
+			htintc_chained_handle_irq, priv);
+	}
+
+	return 0;
+
+out_free_domain:
+	irq_domain_remove(domain);
+out_iounmap:
+	iounmap(base);
+out_free_priv:
+	kfree(priv);
+
+	return err;
+}
+
+IRQCHIP_DECLARE(ls3_htintc, "loongson,ls3-htintc", ls3_htintc_of_init);
-- 
2.22.0

