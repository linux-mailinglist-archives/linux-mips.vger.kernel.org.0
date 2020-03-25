Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E71191FEF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 04:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgCYD7M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 23:59:12 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17855 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726842AbgCYD7L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 23:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585108681;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=BxeZmkRoV7gr9wkekUlbbNnnKV7kZj292gr4q3R68iQ=;
        b=DKhjZLMXe87hWOufkLy3xPWBpl+xKauL69tbragvVctDWayWqYCxRwZGjtUQkeFt
        ss06up9f64qndrdIgltx57JdFJ9UHc7gXBKRqYiB+4ug1KVFP1QHaImMwE3zcqZP/WG
        iCyCeZQskW/l2onC49vDQQoswF1kfm4nOq78nqc0=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 15851086790761004.6540884823719; Wed, 25 Mar 2020 11:57:59 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200325035537.156911-5-jiaxun.yang@flygoat.com>
Subject: [PATCH v8 04/11] irqchip: Add driver for Loongson-3 HyperTransport PIC controller
Date:   Wed, 25 Mar 2020 11:54:57 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appeared on Loongson-3 family of chips to receive
interrupts from PCH PIC.
It is a I8259 with optimized interrupt polling flow. We can poll
interrupt number from HT vector directly but still have to follow
standard I8259 routines to mask, unmask and EOI.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>

---
v4-v5:
=09Enhancements according to maz's suggestions:
=09=09- Add static for private struct
=09=09- Drop pointless rename
=09=09- Fix DT parse bug
=09=09- Clarifications in comments and commit message
v5-v6:
=09Check parent_irq =3D 0 case.
---
 arch/mips/include/asm/i8259.h        |   1 +
 drivers/irqchip/Kconfig              |  10 ++
 drivers/irqchip/Makefile             |   1 +
 drivers/irqchip/irq-loongson-htpic.c | 149 +++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-htpic.c

diff --git a/arch/mips/include/asm/i8259.h b/arch/mips/include/asm/i8259.h
index 97a5e41ed1ab..a54b9649de22 100644
--- a/arch/mips/include/asm/i8259.h
+++ b/arch/mips/include/asm/i8259.h
@@ -36,6 +36,7 @@ extern raw_spinlock_t i8259A_lock;
 extern void make_8259A_irq(unsigned int irq);
=20
 extern void init_i8259_irqs(void);
+extern struct irq_domain *__init_i8259_irqs(struct device_node *node);
=20
 /**
  * i8159_set_poll() - Override the i8259 polling function
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c609eaa319d2..cae6f480c987 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -522,4 +522,14 @@ config LOONGSON_LIOINTC
 =09help
 =09  Support for the Loongson Local I/O Interrupt Controller.
=20
+config LOONGSON_HTPIC
+=09bool "Loongson3 HyperTransport PIC Controller"
+=09depends on MACH_LOONGSON64
+=09default y
+=09select IRQ_DOMAIN
+=09select GENERIC_IRQ_CHIP
+=09select I8259
+=09help
+=09  Support for the Loongson-3 HyperTransport PIC Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 5e7678efdfe6..37bbe39bf909 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -106,3 +106,4 @@ obj-$(CONFIG_LS1X_IRQ)=09=09=09+=3D irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)=09+=3D irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)=09+=3D irq-ti-sci-inta.o
 obj-$(CONFIG_LOONGSON_LIOINTC)=09=09+=3D irq-loongson-liointc.o
+obj-$(CONFIG_LOONGSON_HTPIC)=09=09+=3D irq-loongson-htpic.o
diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loo=
ngson-htpic.c
new file mode 100644
index 000000000000..dd018c22ea83
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -0,0 +1,149 @@
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
+#define HTPIC_MAX_PARENT_IRQ=094
+#define HTINT_NUM_VECTORS=098
+#define HTINT_EN_OFF=09=090x20
+
+struct loongson_htpic {
+=09void __iomem *base;
+=09struct irq_domain *domain;
+};
+
+static struct loongson_htpic *htpic;
+
+static void htpic_irq_dispatch(struct irq_desc *desc)
+{
+=09struct loongson_htpic *priv =3D irq_desc_get_handler_data(desc);
+=09struct irq_chip *chip =3D irq_desc_get_chip(desc);
+=09uint32_t pending;
+
+=09chained_irq_enter(chip, desc);
+=09pending =3D readl(priv->base);
+=09/* Ack all IRQs at once, otherwise IRQ flood might happen */
+=09writel(pending, priv->base);
+
+=09if (!pending)
+=09=09spurious_interrupt();
+
+=09while (pending) {
+=09=09int bit =3D __ffs(pending);
+
+=09=09if (unlikely(bit > 15)) {
+=09=09=09spurious_interrupt();
+=09=09=09break;
+=09=09}
+
+=09=09generic_handle_irq(irq_linear_revmap(priv->domain, bit));
+=09=09pending &=3D ~BIT(bit);
+=09}
+=09chained_irq_exit(chip, desc);
+}
+
+static void htpic_reg_init(void)
+{
+=09int i;
+
+=09for (i =3D 0; i < HTINT_NUM_VECTORS; i++) {
+=09=09uint32_t val;
+
+=09=09/* Disable all HT Vectors */
+=09=09writel(0x0, htpic->base + HTINT_EN_OFF + i * 0x4);
+=09=09val =3D readl(htpic->base + i * 0x4);
+=09=09/* Ack all possible pending IRQs */
+=09=09writel(GENMASK(31, 0), htpic->base + i * 0x4);
+=09}
+
+=09/* Enable 16 vectors for PIC */
+=09writel(0xffff, htpic->base + HTINT_EN_OFF);
+}
+
+static void htpic_resume(void)
+{
+=09htpic_reg_init();
+}
+
+struct syscore_ops htpic_syscore_ops =3D {
+=09.resume=09=09=3D htpic_resume,
+};
+
+int __init htpic_of_init(struct device_node *node, struct device_node *par=
ent)
+{
+=09unsigned int parent_irq[4];
+=09int i, err;
+=09int num_parents =3D 0;
+
+=09if (htpic) {
+=09=09pr_err("loongson-htpic: Only one HTPIC is allowed in the system\n");
+=09=09return -ENODEV;
+=09}
+
+=09htpic =3D kzalloc(sizeof(*htpic), GFP_KERNEL);
+=09if (!htpic) {
+=09=09err =3D -ENOMEM;
+=09=09goto out_free;
+=09}
+
+=09htpic->base =3D of_iomap(node, 0);
+=09if (!htpic->base) {
+=09=09err =3D -ENODEV;
+=09=09goto out_free;
+=09}
+
+=09htpic->domain =3D __init_i8259_irqs(node);
+=09if (!htpic->domain) {
+=09=09pr_err("loongson-htpic: Failed to initialize i8259 IRQs\n");
+=09=09err =3D -ENOMEM;
+=09=09goto out_iounmap;
+=09}
+
+=09/* Interrupt may come from any of the 4 interrupt line */
+=09for (i =3D 0; i < HTPIC_MAX_PARENT_IRQ; i++) {
+=09=09parent_irq[i] =3D irq_of_parse_and_map(node, i);
+=09=09if (parent_irq[i] <=3D 0)
+=09=09=09break;
+
+=09=09num_parents++;
+=09}
+
+=09if (!num_parents) {
+=09=09pr_err("loongson-htpic: Failed to get parent irqs\n");
+=09=09err =3D -ENODEV;
+=09=09goto out_remove_domain;
+=09}
+
+=09htpic_reg_init();
+
+=09for (i =3D 0; i < num_parents; i++) {
+=09=09irq_set_chained_handler_and_data(parent_irq[i],
+=09=09=09=09=09=09htpic_irq_dispatch, htpic);
+=09}
+
+=09register_syscore_ops(&htpic_syscore_ops);
+
+=09return 0;
+
+out_remove_domain:
+=09irq_domain_remove(htpic->domain);
+out_iounmap:
+=09iounmap(htpic->base);
+out_free:
+=09kfree(htpic);
+=09return err;
+}
+
+IRQCHIP_DECLARE(loongson_htpic, "loongson,htpic-1.0", htpic_of_init);
--=20
2.26.0.rc2


