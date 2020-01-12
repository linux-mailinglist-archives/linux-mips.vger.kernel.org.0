Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C237913857C
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732385AbgALIVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:21:16 -0500
Received: from forward101j.mail.yandex.net ([5.45.198.241]:46935 "EHLO
        forward101j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732369AbgALIVP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:21:15 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward101j.mail.yandex.net (Yandex) with ESMTP id CC09F1BE0FD6;
        Sun, 12 Jan 2020 11:15:12 +0300 (MSK)
Received: from mxback5q.mail.yandex.net (mxback5q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:b716:ad89])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id C4DD661E0004;
        Sun, 12 Jan 2020 11:15:12 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback5q.mail.yandex.net (mxback/Yandex) with ESMTP id RzsfWlDwcB-FCcCWsp6;
        Sun, 12 Jan 2020 11:15:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816912;
        bh=cQb47U+3vGM7o7PpBCUiXtwksEyD9C8rtuU6Jf0f18c=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ih7aFdi3uOQVS/LHF5ZEDVK0GFR25LKrxqK4zPsaVM3Okh9AbNRuMLs63YqOuNSWa
         MzsMEI8fW3rzhb6ZviZ6vSOhajYyYurUcd2uj4EDPWvXsxyldrZqGT79fo3U9QFBpe
         CFZpUpIu506WIb8n7YJs4aP8W/hRnjdYjPqBKtyc=
Authentication-Results: mxback5q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-F1V4Kccv;
        Sun, 12 Jan 2020 11:15:07 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 04/10] irqchip: Add driver for Loongson-3 HyperTransport PIC controller
Date:   Sun, 12 Jan 2020 16:14:10 +0800
Message-Id: <20200112081416.722218-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appeared on Loongson-3 family of chips to receive interrupts
from PCH PIC.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/i8259.h        |   1 +
 drivers/irqchip/Kconfig              |   9 ++
 drivers/irqchip/Makefile             |   1 +
 drivers/irqchip/irq-i8259.c          |   6 +-
 drivers/irqchip/irq-loongson-htpic.c | 147 +++++++++++++++++++++++++++
 5 files changed, 161 insertions(+), 3 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongson-htpic.c

diff --git a/arch/mips/include/asm/i8259.h b/arch/mips/include/asm/i8259.h
index 97a5e41ed1ab..1ec3dbb1588f 100644
--- a/arch/mips/include/asm/i8259.h
+++ b/arch/mips/include/asm/i8259.h
@@ -36,6 +36,7 @@ extern raw_spinlock_t i8259A_lock;
 extern void make_8259A_irq(unsigned int irq);
 
 extern void init_i8259_irqs(void);
+extern struct irq_domain *of_init_i8259_irqs(struct device_node *node);
 
 /**
  * i8159_set_poll() - Override the i8259 polling function
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3f220648151b..2d9fadb1b5d5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -508,4 +508,13 @@ config LOONGSON_IOINTC
 	help
 	  Support for the Loongson I/O Interrupt Controller.
 
+config LOONGSON_HTPIC
+	bool "Loongson3 HyperTransport PIC Controller"
+	depends on MACH_LOONGSON64
+	default y
+	select IRQ_DOMAIN
+	select GENERIC_IRQ_CHIP
+	select I8259
+	help
+	  Support for the Loongson-3 HyperTransport PIC Controller.
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 3e98241401b3..96ed00da097d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -105,3 +105,4 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
 obj-$(CONFIG_LOONGSON_IOINTC)		+= irq-loongson-iointc.o
+obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index d000870d9b6b..9d79acce6c0c 100644
--- a/drivers/irqchip/irq-i8259.c
+++ b/drivers/irqchip/irq-i8259.c
@@ -309,7 +309,7 @@ static const struct irq_domain_ops i8259A_ops = {
  * driver compatibility reasons interrupts 0 - 15 to be the i8259
  * interrupts even if the hardware uses a different interrupt numbering.
  */
-struct irq_domain * __init __init_i8259_irqs(struct device_node *node)
+struct irq_domain * __init of_init_i8259_irqs(struct device_node *node)
 {
 	struct irq_domain *domain;
 
@@ -330,7 +330,7 @@ struct irq_domain * __init __init_i8259_irqs(struct device_node *node)
 
 void __init init_i8259_irqs(void)
 {
-	__init_i8259_irqs(NULL);
+	of_init_i8259_irqs(NULL);
 }
 
 static void i8259_irq_dispatch(struct irq_desc *desc)
@@ -351,7 +351,7 @@ int __init i8259_of_init(struct device_node *node, struct device_node *parent)
 	struct irq_domain *domain;
 	unsigned int parent_irq;
 
-	domain = __init_i8259_irqs(node);
+	domain = of_init_i8259_irqs(node);
 
 	parent_irq = irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
new file mode 100644
index 000000000000..fa33176157d6
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson HTPIC IRQ support
+ */
+
+#include <linux/init.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irq.h>
+#include <linux/io.h>
+#include <linux/syscore_ops.h>
+
+#include <asm/i8259.h>
+
+#define HTPIC_MAX_PARENT_IRQ	4
+#define HTINT_NUM_VECTORS	8
+#define HTINT_EN_OFF		0x20
+
+struct loongson_htpic {
+	void __iomem *base;
+	struct irq_domain *domain;
+};
+
+struct loongson_htpic *htpic;
+
+static void htpic_irq_dispatch(struct irq_desc *desc)
+{
+	struct loongson_htpic *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	uint32_t pending;
+
+	chained_irq_enter(chip, desc);
+	pending = readl(priv->base);
+	/* Ack all irqs */
+	writel(pending, priv->base);
+
+	if (!pending)
+		spurious_interrupt();
+
+	while (pending) {
+		int bit = __ffs(pending);
+
+		if (unlikely(bit > 15))
+			spurious_interrupt();
+
+		generic_handle_irq(irq_linear_revmap(priv->domain, bit));
+		pending &= ~BIT(bit);
+	}
+	chained_irq_exit(chip, desc);
+}
+
+static void htpic_reg_init(void)
+{
+	int i;
+
+	for (i = 0; i < HTINT_NUM_VECTORS; i++) {
+		uint32_t val;
+
+		/* Disable all HT Vectors */
+		writel(0x0, htpic->base + HTINT_EN_OFF + i * 0x4);
+		val = readl(htpic->base + i * 0x4);
+		/* Ack all possible pending IRQs */
+		writel(GENMASK(31, 0), htpic->base + i * 0x4);
+	}
+
+	/* Enable 16 vectors for PIC */
+	writel(0xffff, htpic->base + HTINT_EN_OFF);
+}
+
+static void htpic_resume(void)
+{
+	htpic_reg_init();
+}
+
+struct syscore_ops htpic_syscore_ops = {
+	.resume		= htpic_resume,
+};
+
+int __init htpic_of_init(struct device_node *node, struct device_node *parent)
+{
+	unsigned int parent_irq[4];
+	int i, err;
+	int num_parents = 0;
+
+	if (htpic) {
+		pr_err("loongson-htpic: Only one htpic is allowed in the system\n");
+		return -ENODEV;
+	}
+
+	htpic = kzalloc(sizeof(*htpic), GFP_KERNEL);
+	if (!htpic) {
+		err = -ENOMEM;
+		goto out_free;
+	}
+
+	htpic->base = of_iomap(node, 0);
+	if (!htpic->base) {
+		pr_err("loongson-htpic: Failed to map io\n");
+		err = -ENODEV;
+		goto out_free;
+	}
+
+	htpic->domain = of_init_i8259_irqs(node);
+	if (!htpic->domain) {
+		pr_err("loongson-htpic: Failed to initialize i8259 irqs\n");
+		err = -ENOMEM;
+		goto out_iounmap;
+	}
+
+	for (i = 0; i < HTPIC_MAX_PARENT_IRQ; i++) {
+		parent_irq[i] = irq_of_parse_and_map(node, 0);
+		if (parent_irq[i] < 0)
+			break;
+
+		num_parents++;
+	}
+
+	if (!num_parents) {
+		pr_err("loongson-htpic: Failed to get parent irqs\n");
+		err = -ENODEV;
+		goto out_remove_domain;
+	}
+
+	htpic_reg_init();
+
+	for (i = 0; i < num_parents; i++) {
+		irq_set_chained_handler_and_data(parent_irq[i],
+						htpic_irq_dispatch, htpic);
+	}
+
+	register_syscore_ops(&htpic_syscore_ops);
+
+	return 0;
+
+out_remove_domain:
+	irq_domain_remove(htpic->domain);
+out_iounmap:
+	iounmap(htpic->base);
+out_free:
+	kfree(htpic);
+	return err;
+}
+
+IRQCHIP_DECLARE(loongson_htpic, "loongson,htpic-1.0", htpic_of_init);
-- 
2.24.1

