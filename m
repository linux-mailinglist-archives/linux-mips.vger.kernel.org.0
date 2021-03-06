Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED7732F7D9
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 03:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCFChF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 21:37:05 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52742 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230007AbhCFCgs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 21:36:48 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH_Gx6kJgzxwVAA--.9772S7;
        Sat, 06 Mar 2021 10:36:41 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
Subject: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
Date:   Sat,  6 Mar 2021 10:36:31 +0800
Message-Id: <20210306023633.9579-6-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306023633.9579-1-zhangqing@loongson.cn>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH_Gx6kJgzxwVAA--.9772S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4kJr1fCFW5AF13XF13Arb_yoWruw47pa
        y8urZ8tFn8Ga47Wr4ftFWkZa4avr1SgrZrWa4fGFy7C3ZxA3s5Aa1ruF1UAr4Sk348GFWY
        vr4rKa4UGa15C3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
        6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
        IIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8Jw
        CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
        6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
        vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42
        IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOUDGDUUUU
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
---

v2-v3: No change

 drivers/irqchip/irq-loongson-liointc.c | 55 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 09b91b81851c..1c3c80f7f9f5 100644
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
 
 static int __init liointc_of_init(struct device_node *node,
 				  struct device_node *parent)
@@ -159,10 +171,28 @@ static int __init liointc_of_init(struct device_node *node,
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
@@ -172,7 +202,7 @@ static int __init liointc_of_init(struct device_node *node,
 	}
 	if (!have_parent) {
 		err = -ENODEV;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	sz = of_property_read_variable_u32_array(node,
@@ -183,7 +213,7 @@ static int __init liointc_of_init(struct device_node *node,
 	if (sz < 4) {
 		pr_err("loongson-liointc: No parent_int_map\n");
 		err = -ENODEV;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	for (i = 0; i < LIOINTC_NUM_PARENT; i++)
@@ -195,7 +225,7 @@ static int __init liointc_of_init(struct device_node *node,
 	if (!domain) {
 		pr_err("loongson-liointc: cannot add IRQ domain\n");
 		err = -EINVAL;
-		goto out_iounmap;
+		goto out_iounmap_isr;
 	}
 
 	err = irq_alloc_domain_generic_chips(domain, 32, 1,
@@ -260,7 +290,13 @@ static int __init liointc_of_init(struct device_node *node,
 
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
@@ -270,3 +306,4 @@ static int __init liointc_of_init(struct device_node *node,
 
 IRQCHIP_DECLARE(loongson_liointc_1_0, "loongson,liointc-1.0", liointc_of_init);
 IRQCHIP_DECLARE(loongson_liointc_1_0a, "loongson,liointc-1.0a", liointc_of_init);
+IRQCHIP_DECLARE(loongson_liointc_2_0, "loongson,liointc-2.0", liointc_of_init);
-- 
2.20.1

