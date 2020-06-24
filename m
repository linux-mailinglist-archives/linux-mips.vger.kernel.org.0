Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75942206CB1
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389162AbgFXGjR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:39:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46444 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388582AbgFXGjQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:39:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+j8_Je2R5JAA--.564S8;
        Wed, 24 Jun 2020 14:33:12 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 06/14] irqchip/digicolor: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 14:32:39 +0800
Message-Id: <1592980367-1816-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj9+j8_Je2R5JAA--.564S8
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy3Cr4fWF17Zw1kCFW8tFb_yoW8Cw4fpF
        WUWa9IgrWIvw4xWFn2kFyDZF98Kr4xKa9ru3yxC3Z2vrn5C34qka4UAF1j9FyrCrWxZa1j
        vFs7ta48C3WUKaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
        AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUj_HUJUUUUU==
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

