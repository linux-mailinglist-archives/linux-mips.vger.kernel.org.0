Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F0E206E01
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390005AbgFXHpV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:45:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35812 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389954AbgFXHpV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:45:21 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2qIBPNevCZJAA--.660S3;
        Wed, 24 Jun 2020 15:45:13 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 01/14 RESEND] irqchip/ath79-misc: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:44:58 +0800
Message-Id: <1592984711-3130-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxD2qIBPNevCZJAA--.660S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw47trWfCFW5ZF4kXw17Awb_yoW8GF1DpF
        WUW39avrWfJr47XrsxCFWDXryavFyFkay293y3C3WxZrn8G3909F1rAa4jvF12krW3X3WU
        CF4fJa45uF4jkFUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUHlb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
        aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8w
        Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
        14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II
        8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4xMxAIw28IcxkI
        7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
        Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x0p
        E1xRrUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: 07ba4b061a79 ("irqchip/ath79-misc: Move the MISC driver from arch/mips/ath79/")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-ath79-misc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 3d641bb..53e0c50 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -133,7 +133,7 @@ static int __init ath79_misc_intc_of_init(
 {
 	struct irq_domain *domain;
 	void __iomem *base;
-	int irq;
+	int irq, ret;
 
 	irq = irq_of_parse_and_map(node, 0);
 	if (!irq) {
@@ -144,18 +144,26 @@ static int __init ath79_misc_intc_of_init(
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("Failed to get MISC IRQ registers\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_irq_dispose;
 	}
 
 	domain = irq_domain_add_linear(node, ATH79_MISC_IRQ_COUNT,
 				&misc_irq_domain_ops, base);
 	if (!domain) {
 		pr_err("Failed to add MISC irqdomain\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_iounmap;
 	}
 
 	ath79_misc_intc_domain_init(domain, irq);
 	return 0;
+
+err_iounmap:
+	iounmap(base);
+err_irq_dispose:
+	irq_dispose_mapping(irq);
+	return ret;
 }
 
 static int __init ar7100_misc_intc_of_init(
-- 
2.1.0

