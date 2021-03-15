Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD21F33ACA9
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 08:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhCOHuo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 03:50:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41284 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230284AbhCOHuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 03:50:20 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxydSsEU9gcqMZAA--.1167S7;
        Mon, 15 Mar 2021 15:50:13 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Subject: [PATCH v5 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
Date:   Mon, 15 Mar 2021 15:50:02 +0800
Message-Id: <20210315075004.15465-6-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315075004.15465-1-zhangqing@loongson.cn>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxydSsEU9gcqMZAA--.1167S7
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3JF1DtF18JrW3Jr18Xwb_yoWrtFWkpa
        y8CrZ8KFn8Ga47ur4ftFWkZa4avr1SgrZruayfGFy7CFnxA3s5AF4ruF1UAr4Sk3y8GFWY
        vF4rKa4UGF45CwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjPEf3UUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add IO interrupt controller support for Loongson-2K1000, different
from the Loongson-3A series is that Loongson-2K1000 has 64 interrupt
sources, 0-31 correspond to the device tree liointc0 device node, and
the other correspond to liointc1 node.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Tested-by: Ming Wang <wangming01@loongson.cn>
---

v4-v5:
- No change

 drivers/irqchip/irq-loongson-liointc.c | 58 ++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 249566a23cc4..8ccb30421806 100644
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
@@ -141,6 +144,18 @@ static void liointc_resume(struct irq_chip_generic *gc)
 }
 
 static const char * const parent_names[] = {"int0", "int1", "int2", "int3"};
+static const char * const core_reg_names[] = {"isr0", "isr1", "isr2", "isr3"};
+
+static void __iomem *liointc_get_reg_byname(struct device_node *node,
+						const char *name)
+{
+	int index = of_property_match_string(node, "reg-names", name);
+
+	if (index < 0)
+		return NULL;
+
+	return of_iomap(node, index);
+}
 
 static int __init liointc_of_init(struct device_node *node,
 				  struct device_node *parent)
@@ -159,10 +174,28 @@ static int __init liointc_of_init(struct device_node *node,
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
+
+		for (i = 0; i < LIOINTC_NUM_CORES; i++)
+			priv->core_isr[i] = liointc_get_reg_byname(node, core_reg_names[i]);
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
+
+		for (i = 0; i < LIOINTC_NUM_CORES; i++)
+			priv->core_isr[i] = base + LIOINTC_REG_INTC_STATUS;
 	}
 
 	for (i = 0; i < LIOINTC_NUM_PARENT; i++) {
@@ -172,7 +205,7 @@ static int __init liointc_of_init(struct device_node *node,
 	}
 	if (!have_parent) {
 		err = -ENODEV;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	sz = of_property_read_variable_u32_array(node,
@@ -183,7 +216,7 @@ static int __init liointc_of_init(struct device_node *node,
 	if (sz < 4) {
 		pr_err("loongson-liointc: No parent_int_map\n");
 		err = -ENODEV;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	for (i = 0; i < LIOINTC_NUM_PARENT; i++)
@@ -195,7 +228,7 @@ static int __init liointc_of_init(struct device_node *node,
 	if (!domain) {
 		pr_err("loongson-liointc: cannot add IRQ domain\n");
 		err = -EINVAL;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	err = irq_alloc_domain_generic_chips(domain, 32, 1,
@@ -260,7 +293,13 @@ static int __init liointc_of_init(struct device_node *node,
 
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
@@ -270,3 +309,4 @@ static int __init liointc_of_init(struct device_node *node,
 
 IRQCHIP_DECLARE(loongson_liointc_1_0, "loongson,liointc-1.0", liointc_of_init);
 IRQCHIP_DECLARE(loongson_liointc_1_0a, "loongson,liointc-1.0a", liointc_of_init);
+IRQCHIP_DECLARE(loongson_liointc_2_0, "loongson,liointc-2.0", liointc_of_init);
-- 
2.20.1

