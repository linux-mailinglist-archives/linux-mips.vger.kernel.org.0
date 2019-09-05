Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E39AA63C
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389424AbfIEOpf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:45:35 -0400
Received: from forward104j.mail.yandex.net ([5.45.198.247]:44701 "EHLO
        forward104j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728918AbfIEOpf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:45:35 -0400
Received: from mxback17g.mail.yandex.net (mxback17g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:317])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id 557E74A0BBF;
        Thu,  5 Sep 2019 17:45:31 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback17g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id WqJFxGHLTd-jUbS45mD;
        Thu, 05 Sep 2019 17:45:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694731;
        bh=uP9MG8+u654pkqp4xv19vVnOWS2h9LOWNLXKJjr0L14=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=R+t/Wd5Uz8mgeznMO2RmW8oyNeN8TzcRTLhIJPVt9yaZp/POpXCvC4i88JtS3a6QB
         bohUF4TOVmmPDUPzdlUEdwwkpBakWxqbtWcBrjBYqksTZd9z/YKWEJGrPFaUuHLe3d
         Z78Tq4feuBX3rT37mCZeHujAXz4K3ZuDLJB5TSPM=
Authentication-Results: mxback17g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-jFxW3uja;
        Thu, 05 Sep 2019 17:45:26 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 07/19] irqchip: Add driver for Loongson-3 HyperTransport interrupt controller
Date:   Thu,  5 Sep 2019 22:43:04 +0800
Message-Id: <20190905144316.12527-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
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
 drivers/irqchip/irq-ls3-htintc.c | 147 +++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/irqchip/irq-ls3-htintc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4acf38a20a2c..d415fb13f3d5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -492,6 +492,14 @@ config LS3_IOINTC
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
index 18ba8f203afd..ab03ad7d421c 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -104,3 +104,4 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_LS3_IOINTC)			+= irq-ls3-iointc.o
+obj-$(CONFIG_LS3_HTINTC)			+= irq-ls3-htintc.o
diff --git a/drivers/irqchip/irq-ls3-htintc.c b/drivers/irqchip/irq-ls3-htintc.c
new file mode 100644
index 000000000000..d5013606faa8
--- /dev/null
+++ b/drivers/irqchip/irq-ls3-htintc.c
@@ -0,0 +1,147 @@
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
+	bool handled = false;
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
+								&irq_generic_chip_ops, NULL);
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
+										node->full_name,
+										handle_edge_irq,
+										IRQ_NOPROBE, 0,
+										IRQ_GC_INIT_MASK_CACHE);
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
+										htintc_chained_handle_irq,
+										priv);
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

