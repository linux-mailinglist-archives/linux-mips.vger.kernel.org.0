Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48823206DD9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389715AbgFXHg1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:36:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33302 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389583AbgFXHg1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:36:27 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_93mAPNezSRJAA--.399S8;
        Wed, 24 Jun 2020 15:29:46 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 06/14] irqchip/digicolor: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:29:34 +0800
Message-Id: <1592983782-8842-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_93mAPNezSRJAA--.399S8
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy3Cr4fWF17Zw1kCFW8tFb_yoW8Cw4fpF
        WUWa9IgrWIvw4xWFn2kFyDZF98Kr4xKa9ru3yxC3Z2vrn5C34qka4UAF1j9FyrCrWxZa1j
        vFs7ta48C3WUKaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48J
        MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x02
        67AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUjNB_UUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: 8041dfbd31cf ("irqchip: Conexant CX92755 interrupts controller driver")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-digicolor.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-digicolor.c b/drivers/irqchip/irq-digicolor.c
index fc38d2d..18c6e77 100644
--- a/drivers/irqchip/irq-digicolor.c
+++ b/drivers/irqchip/irq-digicolor.c
@@ -89,7 +89,8 @@ static int __init digicolor_of_init(struct device_node *node,
 	ucregs = syscon_regmap_lookup_by_phandle(node, "syscon");
 	if (IS_ERR(ucregs)) {
 		pr_err("%pOF: unable to map UC registers\n", node);
-		return PTR_ERR(ucregs);
+		ret = PTR_ERR(ucregs);
+		goto err_iounmap;
 	}
 	/* channel 1, regular IRQs */
 	regmap_write(ucregs, UC_IRQ_CONTROL, 1);
@@ -98,7 +99,8 @@ static int __init digicolor_of_init(struct device_node *node,
 		irq_domain_add_linear(node, 64, &irq_generic_chip_ops, NULL);
 	if (!digicolor_irq_domain) {
 		pr_err("%pOF: unable to create IRQ domain\n", node);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_iounmap;
 	}
 
 	ret = irq_alloc_domain_generic_chips(digicolor_irq_domain, 32, 1,
@@ -106,7 +108,7 @@ static int __init digicolor_of_init(struct device_node *node,
 					     clr, 0, 0);
 	if (ret) {
 		pr_err("%pOF: unable to allocate IRQ gc\n", node);
-		return ret;
+		goto err_domain_remove;
 	}
 
 	digicolor_set_gc(reg_base, 0, IC_INT0ENABLE_LO, IC_FLAG_CLEAR_LO);
@@ -115,5 +117,11 @@ static int __init digicolor_of_init(struct device_node *node,
 	set_handle_irq(digicolor_handle_irq);
 
 	return 0;
+
+err_domain_remove:
+	irq_domain_remove(digicolor_irq_domain);
+err_iounmap:
+	iounmap(reg_base);
+	return ret;
 }
 IRQCHIP_DECLARE(conexant_digicolor_ic, "cnxt,cx92755-ic", digicolor_of_init);
-- 
2.1.0

