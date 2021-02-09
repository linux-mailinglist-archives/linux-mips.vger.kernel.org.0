Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C07314BC6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 10:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhBIJfz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 04:35:55 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34844 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230261AbhBIJdb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 04:33:31 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSdSoViJgw40IAA--.11028S7;
        Tue, 09 Feb 2021 17:32:35 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: [PATCH 5/6] irqchip/loongson-liointc: irqchip add 2.0 version.
Date:   Tue,  9 Feb 2021 17:32:23 +0800
Message-Id: <20210209093224.7085-6-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209093224.7085-1-zhangqing@loongson.cn>
References: <20210209093224.7085-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSdSoViJgw40IAA--.11028S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4kJr17tr1DKFW7Gr1xZrb_yoWruw13pa
        y8C395KFn8GFy7ur4ftFW8Za4avr1S9rsrWa4fCF17CFnxA3s5Aa1rCF1UAr4fC348JFWY
        yrWrKa4UGF45C3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUT5l8UUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add IO interrupt controller support for Loongson 2k1000, different
from the 3a series is that 2K1000 has 64 interrupt sources, 0-31
correspond to the device tree liointc0 device node, and the other
correspond to liointc1 node.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
---
 drivers/irqchip/irq-loongson-liointc.c | 55 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 9ed1bc473663..496e73bde597 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -20,6 +20,7 @@
 
 #define LIOINTC_CHIP_IRQ	32
 #define LIOINTC_NUM_PARENT 4
+#define LIOINTC_NUM_CORES	4
 
 #define LIOINTC_INTC_CHIP_START	0x20
 
@@ -42,6 +43,7 @@ struct liointc_handler_data {
 struct liointc_priv {
 	struct irq_chip_generic		*gc;
 	struct liointc_handler_data	handler[LIOINTC_NUM_PARENT];
+	void __iomem			*core_isr[LIOINTC_NUM_CORES];
 	u8				map_cache[LIOINTC_CHIP_IRQ];
 	bool				has_lpc_irq_errata;
 };
@@ -51,11 +53,12 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
 	struct liointc_handler_data *handler = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_chip_generic *gc = handler->priv->gc;
+	int core = get_ebase_cpunum() % LIOINTC_NUM_CORES;
 	u32 pending;
 
 	chained_irq_enter(chip, desc);
 
-	pending = readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
+	pending = readl(handler->priv->core_isr[core]);
 
 	if (!pending) {
 		/* Always blame LPC IRQ if we have that bug */
@@ -141,6 +144,15 @@ static void liointc_resume(struct irq_chip_generic *gc)
 }
 
 static const char * const parent_names[] = {"int0", "int1", "int2", "int3"};
+static const char * const core_reg_names[] = {"isr0", "isr1", "isr2", "isr3"};
+
+static void __iomem *liointc_get_reg_byname(struct device_node *node,
+						const char *name)
+{
+	int index = of_property_match_string(node, "reg-names", name);
+
+	return of_iomap(node, index);
+}
 
 int __init liointc_of_init(struct device_node *node,
 				struct device_node *parent)
@@ -159,10 +171,28 @@ int __init liointc_of_init(struct device_node *node,
 	if (!priv)
 		return -ENOMEM;
 
-	base = of_iomap(node, 0);
-	if (!base) {
-		err = -ENODEV;
-		goto out_free_priv;
+	if (of_device_is_compatible(node, "loongson,liointc-2.0")) {
+		base = liointc_get_reg_byname(node, "main");
+		if (!base) {
+			err = -ENODEV;
+			goto out_free_priv;
+		}
+		for (i = 0; i < LIOINTC_NUM_CORES; i++) {
+			priv->core_isr[i] =
+				liointc_get_reg_byname(node, core_reg_names[i]);
+		}
+		if (!priv->core_isr[0]) {
+			err = -ENODEV;
+			goto out_iounmap_base;
+		}
+	} else {
+		base = of_iomap(node, 0);
+		if (!base) {
+			err = -ENODEV;
+			goto out_free_priv;
+		}
+		for (i = 0; i < LIOINTC_NUM_CORES; i++)
+			priv->core_isr[i] = base + LIOINTC_REG_INTC_STATUS;
 	}
 
 	for (i = 0; i < LIOINTC_NUM_PARENT; i++) {
@@ -172,7 +202,7 @@ int __init liointc_of_init(struct device_node *node,
 	}
 	if (!have_parent) {
 		err = -ENODEV;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	sz = of_property_read_variable_u32_array(node,
@@ -183,7 +213,7 @@ int __init liointc_of_init(struct device_node *node,
 	if (sz < 4) {
 		pr_err("loongson-liointc: No parent_int_map\n");
 		err = -ENODEV;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	for (i = 0; i < LIOINTC_NUM_PARENT; i++)
@@ -195,7 +225,7 @@ int __init liointc_of_init(struct device_node *node,
 	if (!domain) {
 		pr_err("loongson-liointc: cannot add IRQ domain\n");
 		err = -EINVAL;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	err = irq_alloc_domain_generic_chips(domain, 32, 1,
@@ -260,7 +290,13 @@ int __init liointc_of_init(struct device_node *node,
 
 out_free_domain:
 	irq_domain_remove(domain);
-out_iounmap:
+out_iounmap_isr:
+	for (i = 0; i < LIOINTC_NUM_CORES; i++) {
+		if (!priv->core_isr[i])
+			continue;
+		iounmap(priv->core_isr[i]);
+	}
+out_iounmap_base:
 	iounmap(base);
 out_free_priv:
 	kfree(priv);
@@ -270,3 +306,4 @@ int __init liointc_of_init(struct device_node *node,
 
 IRQCHIP_DECLARE(loongson_liointc_1_0, "loongson,liointc-1.0", liointc_of_init);
 IRQCHIP_DECLARE(loongson_liointc_1_0a, "loongson,liointc-1.0a", liointc_of_init);
+IRQCHIP_DECLARE(loongson_liointc_2_0, "loongson,liointc-2.0", liointc_of_init);
-- 
2.20.1

