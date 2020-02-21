Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924A9166EC0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 06:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgBUFMx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 00:12:53 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17826 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgBUFMx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 00:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582261895;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=HICXcoLAntejme88fw+g+f7cdOyeLuzwcz8Pyf3Sw38=;
        b=byvXi1+upj8cKespzms3+Pkw+1ay322f4dABemHp9uSzxSwrPPxYxGMtjlEUopK7
        UUHx1tjMym6/bTzc+h4IGTCs2iWnC68iNr8CE8NSXOX3A8rBGwhiza8SVXgLZDd0CRj
        SXUpBcp/PVfpOeGJAygdz3fNBvYK1UR2GqYvHviQ=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1582261894263984.0477111080212; Fri, 21 Feb 2020 13:11:34 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200221050942.507775-2-jiaxun.yang@flygoat.com>
Subject: [PATCH v4 01/10] irqchip: Add driver for Loongson I/O Local Interrupt Controller
Date:   Fri, 21 Feb 2020 13:09:16 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This controller appeared on Loongson family of chips as the primary
package interrupt source.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig                |   9 +
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-loongson-liointc.c | 338 +++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 drivers/irqchip/irq-loongson-liointc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 6d397732138d..c609eaa319d2 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -513,4 +513,13 @@ config EXYNOS_IRQ_COMBINER
 =09  Say yes here to add support for the IRQ combiner devices embedded
 =09  in Samsung Exynos chips.
=20
+config LOONGSON_LIOINTC
+=09bool "Loongson Local I/O Interrupt Controller"
+=09depends on MACH_LOONGSON64
+=09default y
+=09select IRQ_DOMAIN
+=09select GENERIC_IRQ_CHIP
+=09help
+=09  Support for the Loongson Local I/O Interrupt Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eae0d78cbf22..5e7678efdfe6 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -105,3 +105,4 @@ obj-$(CONFIG_MADERA_IRQ)=09=09+=3D irq-madera.o
 obj-$(CONFIG_LS1X_IRQ)=09=09=09+=3D irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)=09+=3D irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)=09+=3D irq-ti-sci-inta.o
+obj-$(CONFIG_LOONGSON_LIOINTC)=09=09+=3D irq-loongson-liointc.o
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-l=
oongson-liointc.c
new file mode 100644
index 000000000000..d7efab9f4ee7
--- /dev/null
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson Local IO Interrupt Controller support
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
+#include <linux/smp.h>
+#include <linux/irqchip/chained_irq.h>
+
+#include <boot_param.h>
+
+#define LIOINTC_CHIP_IRQ=0932
+#define LIOINTC_NUM_PARENT 4
+
+#define LIOINTC_REG_INTx_MAP(x)=09(x * 0x1)
+#define LIOINTC_INTC_CHIP_START=090x20
+
+#define LIOINTC_REG_INTC_STATUS=09(LIOINTC_INTC_CHIP_START + 0x20)
+#define LIOINTC_REG_INTC_EN_STATUS=09(LIOINTC_INTC_CHIP_START + 0x04)
+#define LIOINTC_REG_INTC_ENABLE=09(LIOINTC_INTC_CHIP_START + 0x08)
+#define LIOINTC_REG_INTC_DISABLE=09(LIOINTC_INTC_CHIP_START + 0x0c)
+#define LIOINTC_REG_INTC_POL=09(LIOINTC_INTC_CHIP_START + 0x10)
+#define LIOINTC_REG_INTC_EDGE=09(LIOINTC_INTC_CHIP_START + 0x14)
+
+#define BUGGY_LPC_IRQ=0910
+
+#define LIOINTC_SHIFT_INTx=094
+
+struct liointc_handler_data {
+=09struct liointc_priv *priv;
+=09u32 parent_int_map;
+};
+
+struct liointc_priv {
+=09void __iomem *base;
+=09struct irq_chip_generic *gc;
+=09u8 map_cache[LIOINTC_CHIP_IRQ];
+=09struct liointc_handler_data handler[LIOINTC_NUM_PARENT];
+=09u8 possible_parent_mask;
+=09bool have_lpc_irq_bug;
+};
+
+static void liointc_chained_handle_irq(struct irq_desc *desc)
+{
+=09struct liointc_handler_data *handler =3D irq_desc_get_handler_data(desc=
);
+=09struct irq_chip *chip =3D irq_desc_get_chip(desc);
+=09struct irq_chip_generic *gc =3D handler->priv->gc;
+=09u32 pending;
+
+=09chained_irq_enter(chip, desc);
+
+=09pending =3D readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
+
+=09if (!pending) {
+=09=09/* Always blame LPC IRQ if we have that Bug with LPC interrupt enabl=
ed */
+=09=09if (handler->priv->have_lpc_irq_bug &&
+=09=09=09(handler->parent_int_map & ~gc->mask_cache & BIT(BUGGY_LPC_IRQ)))
+=09=09=09generic_handle_irq(irq_find_mapping(gc->domain, BUGGY_LPC_IRQ));
+=09=09else
+=09=09=09spurious_interrupt();
+=09}
+
+=09while (pending) {
+=09=09int bit =3D __ffs(pending);
+
+=09=09generic_handle_irq(irq_find_mapping(gc->domain, bit));
+=09=09pending &=3D ~BIT(bit);
+=09}
+
+=09chained_irq_exit(chip, desc);
+}
+
+static void map_cache_set_core(struct liointc_priv *priv, int irq, int cor=
e)
+{
+=09priv->map_cache[irq] &=3D ~GENMASK(3, 0);
+=09priv->map_cache[irq] |=3D BIT(core);
+}
+
+static void write_map_cache(struct liointc_priv *priv, int irq)
+{
+=09writeb(priv->map_cache[irq],
+=09=09priv->base + LIOINTC_REG_INTx_MAP(irq));
+}
+
+static void liointc_set_bit(struct irq_chip_generic *gc,
+=09=09=09=09unsigned int offset,
+=09=09=09=09u32 mask, bool set)
+{
+=09if (set)
+=09=09writel(readl(gc->reg_base + offset) | mask,
+=09=09=09=09gc->reg_base + offset);
+=09else
+=09=09writel(readl(gc->reg_base + offset) & ~mask,
+=09=09=09=09gc->reg_base + offset);
+}
+
+static int liointc_set_type(struct irq_data *data, unsigned int type)
+{
+=09struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
+=09u32 mask =3D data->mask;
+=09unsigned long flags;
+
+=09irq_gc_lock_irqsave(gc, flags);
+=09switch (type) {
+=09case IRQ_TYPE_LEVEL_HIGH:
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, false);
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
+=09=09break;
+=09case IRQ_TYPE_LEVEL_LOW:
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, false);
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, false);
+=09=09break;
+=09case IRQ_TYPE_EDGE_RISING:
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, true);
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
+=09=09break;
+=09case IRQ_TYPE_EDGE_FALLING:
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, true);
+=09=09liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, false);
+=09=09break;
+=09default:
+=09=09return -EINVAL;
+=09}
+=09irq_gc_unlock_irqrestore(gc, flags);
+
+=09irqd_set_trigger_type(data, type);
+=09return 0;
+}
+
+static int liointc_set_affinity(struct irq_data *idata,
+=09=09=09=09const cpumask_t *cpu_mask, bool force)
+{
+=09return -ENAVAIL;
+}
+
+static void liointc_resume(struct irq_chip_generic *gc)
+{
+=09struct liointc_priv *priv =3D gc->private;
+=09unsigned long flags;
+=09int i;
+
+=09irq_gc_lock_irqsave(gc, flags);
+=09/* Revert map cache */
+=09for (i =3D 0; i < LIOINTC_CHIP_IRQ; i++)
+=09=09write_map_cache(priv, i);
+
+=09/* Revert mask cache again */
+=09writel(gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_DISABLE);
+=09writel(~gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
+=09irq_gc_unlock_irqrestore(gc, flags);
+}
+
+static void validate_parent_mask(struct liointc_priv *priv, u32 of_parent_=
int_map[])
+{
+=09u32 proceed_mask =3D 0x0, duplicated_mask =3D 0x0;
+=09int i;
+=09int fallback_parent =3D __ffs(priv->possible_parent_mask);
+
+=09for (i =3D 0; i < LIOINTC_NUM_PARENT; i++) {
+=09=09/* Try if the parent is avilable */
+=09=09if (!(priv->possible_parent_mask & BIT(i)))
+=09=09=09continue;
+
+=09=09priv->handler[i].parent_int_map =3D of_parent_int_map[i];
+
+=09=09/* Detect if the IRQ have previously proceed */
+=09=09duplicated_mask |=3D (priv->handler[i].parent_int_map & proceed_mask=
);
+=09=09proceed_mask |=3D priv->handler[i].parent_int_map;
+=09}
+
+=09/* Fallback IRQs with no map bit set */
+=09while (~proceed_mask) {
+=09=09int bit =3D __ffs(~proceed_mask);
+
+=09=09pr_warn("loongson-liointc: Found homeless IRQ %d, map to INT%d\n",
+=09=09=09bit, fallback_parent);
+=09=09priv->handler[fallback_parent].parent_int_map |=3D BIT(bit);
+=09=09proceed_mask |=3D BIT(bit);
+=09}
+
+=09/* Fallback IRQs with multiple map bit set */
+=09while (duplicated_mask) {
+=09=09int bit =3D __ffs(duplicated_mask);
+
+=09=09pr_warn("loongson-liointc: IRQ %d have multiple parents, map to INT%=
d\n",
+=09=09=09bit, fallback_parent);
+=09=09/* Clear the bit in all parent bits */
+=09=09for (i =3D 0; i < LIOINTC_NUM_PARENT; i++)
+=09=09=09priv->handler[i].parent_int_map &=3D ~BIT(bit);
+
+=09=09priv->handler[fallback_parent].parent_int_map |=3D BIT(bit);
+=09=09duplicated_mask &=3D ~BIT(bit);
+=09}
+
+=09/* Generate parent INT part of map Cache */
+=09for (i =3D 0; i < LIOINTC_NUM_PARENT; i++) {
+=09=09u32 pending =3D priv->handler[i].parent_int_map;
+
+=09=09while (pending) {
+=09=09=09int bit =3D __ffs(pending);
+
+=09=09=09priv->map_cache[bit] =3D BIT(i) << LIOINTC_SHIFT_INTx;
+=09=09=09pending &=3D ~BIT(bit);
+=09=09}
+=09}
+}
+
+static const char *parent_names[] =3D {"int0", "int1", "int2", "int3"};
+
+int __init liointc_of_init(struct device_node *node,
+=09=09=09=09struct device_node *parent)
+{
+=09struct irq_chip_generic *gc;
+=09struct irq_domain *domain;
+=09struct irq_chip_type *ct;
+=09struct liointc_priv *priv;
+=09u32 of_parent_int_map[LIOINTC_NUM_PARENT];
+=09int parent_irq[LIOINTC_NUM_PARENT];
+=09int core =3D loongson_sysconf.boot_cpu_id;
+=09int i, err =3D 0;
+=09int sz;
+
+=09priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
+=09if (!priv)
+=09=09return -ENOMEM;
+
+=09priv->base =3D of_iomap(node, 0);
+=09if (!priv->base) {
+=09=09err =3D -ENODEV;
+=09=09goto out_free_priv;
+=09}
+
+=09if (of_device_is_compatible(node, "loongson,liointc-1.0"))
+=09=09priv->have_lpc_irq_bug =3D true;
+
+=09for (i =3D 0; i < LIOINTC_NUM_PARENT; i++) {
+=09=09parent_irq[i] =3D of_irq_get_byname(node, parent_names[i]);
+=09=09if (parent_irq[i] >=3D 0)
+=09=09=09priv->possible_parent_mask |=3D BIT(i);
+=09}
+
+
+=09if (!priv->possible_parent_mask) {
+=09=09pr_err("loongson-liointc: No parent\n");
+=09=09err =3D -ENOMEM;
+=09=09goto out_iounmap;
+=09}
+
+=09sz =3D of_property_read_variable_u32_array(node, "loongson,parent_int_m=
ap",
+=09=09=09=09=09=09&of_parent_int_map[0], LIOINTC_NUM_PARENT,
+=09=09=09=09=09=09LIOINTC_NUM_PARENT);
+=09if (sz < 4) {
+=09=09pr_err("loongson-liointc: No parent_int_map\n");
+=09=09err =3D -ENODEV;
+=09=09goto out_iounmap;
+=09}
+
+=09/* Setup IRQ domain */
+=09domain =3D irq_domain_add_linear(node, 32,
+=09=09=09=09=09&irq_generic_chip_ops, priv);
+=09if (!domain) {
+=09=09pr_err("loongson-liointc: cannot add IRQ domain\n");
+=09=09err =3D -ENOMEM;
+=09=09goto out_iounmap;
+=09}
+
+=09err =3D irq_alloc_domain_generic_chips(domain, 32, 1,
+=09=09=09=09=09node->full_name, handle_level_irq,
+=09=09=09=09=09IRQ_NOPROBE, 0, 0);
+=09if (err) {
+=09=09pr_err("loongson-liointc: unable to register IRQ domain\n");
+=09=09err =3D -ENOMEM;
+=09=09goto out_free_domain;
+=09}
+
+
+=09/* Disable all IRQs */
+=09writel(0xffffffff, priv->base + LIOINTC_REG_INTC_DISABLE);
+=09/* Set to level triggered */
+=09writel(0x0, priv->base + LIOINTC_REG_INTC_EDGE);
+
+=09validate_parent_mask(priv, &of_parent_int_map[0]);
+
+=09for (i =3D 0; i < LIOINTC_CHIP_IRQ; i++) {
+=09=09map_cache_set_core(priv, i, core);
+=09=09write_map_cache(priv, i);
+=09}
+
+=09gc =3D irq_get_domain_generic_chip(domain, 0);
+=09gc->private =3D priv;
+=09gc->reg_base =3D priv->base;
+=09gc->domain =3D domain;
+=09gc->resume =3D liointc_resume;
+
+=09ct =3D gc->chip_types;
+=09ct->regs.enable =3D LIOINTC_REG_INTC_ENABLE;
+=09ct->regs.disable =3D LIOINTC_REG_INTC_DISABLE;
+=09ct->chip.irq_unmask =3D irq_gc_unmask_enable_reg;
+=09ct->chip.irq_mask =3D irq_gc_mask_disable_reg;
+=09ct->chip.irq_mask_ack =3D irq_gc_mask_disable_reg;
+=09ct->chip.irq_set_type =3D liointc_set_type;
+=09ct->chip.irq_set_affinity =3D liointc_set_affinity;
+
+=09gc->mask_cache =3D 0xffffffff;
+=09priv->gc =3D gc;
+
+=09for (i =3D 0; i < LIOINTC_NUM_PARENT; i++) {
+=09=09if (parent_irq[i] < 0)
+=09=09=09continue;
+
+=09=09priv->handler[i].priv =3D priv;
+=09=09irq_set_chained_handler_and_data(parent_irq[i],
+=09=09=09=09liointc_chained_handle_irq, &priv->handler[i]);
+=09}
+
+=09return 0;
+
+out_free_domain:
+=09irq_domain_remove(domain);
+out_iounmap:
+=09iounmap(priv->base);
+out_free_priv:
+=09kfree(priv);
+
+=09return err;
+}
+
+IRQCHIP_DECLARE(loongson_liointc_1_0, "loongson,liointc-1.0", liointc_of_i=
nit);
+IRQCHIP_DECLARE(loongson_liointc_1_0a, "loongson,liointc-1.0a", liointc_of=
_init);
--=20
2.25.0


