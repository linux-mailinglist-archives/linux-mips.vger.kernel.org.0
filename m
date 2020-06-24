Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9495C206E0D
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390002AbgFXHpV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:45:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35790 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389928AbgFXHpU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:45:20 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2qIBPNevCZJAA--.660S11;
        Wed, 24 Jun 2020 15:45:16 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 09/14 RESEND] irqchip/mscc-ocelot: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:45:06 +0800
Message-Id: <1592984711-3130-10-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxD2qIBPNevCZJAA--.660S11
X-Coremail-Antispam: 1UD129KBjvdXoWrKw13uF47Ary7tFW8CrW7Jwb_yoWkXFb_Cr
        s0g3s3GrWUKr4fJanrtwnxZ34kWr4v9F1vgrZ7t3Zxt34xK3s7Zr4avrsxAr48uFZ0krnr
        Ga1j9r4xAw1xujkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbB8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7
        CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCa
        FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26F1j
        6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW0oVCq
        3bIYCTnIWIevJa73UjIFyTuYvjTRX2-nDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: 19d99164480a ("irqchip: Add a driver for the Microsemi Ocelot controller")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-mscc-ocelot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-ocelot.c
index 88143c0..e676ae2 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -73,7 +73,8 @@ static int __init ocelot_irq_init(struct device_node *node,
 				       &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		pr_err("%pOFn: unable to add irq domain\n", node);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_irq_dispose;
 	}
 
 	ret = irq_alloc_domain_generic_chips(domain, OCELOT_NR_IRQ, 1,
@@ -109,9 +110,10 @@ static int __init ocelot_irq_init(struct device_node *node,
 
 err_gc_free:
 	irq_free_generic_chip(gc);
-
 err_domain_remove:
 	irq_domain_remove(domain);
+err_irq_dispose:
+	irq_dispose_mapping(parent_irq);
 
 	return ret;
 }
-- 
2.1.0

