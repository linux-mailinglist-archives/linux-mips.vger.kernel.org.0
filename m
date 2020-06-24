Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37B3206C76
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389163AbgFXGdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:33:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45210 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389063AbgFXGdU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:33:20 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+j8_Je2R5JAA--.564S15;
        Wed, 24 Jun 2020 14:33:15 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 13/14] irqchip/s3c24xx: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 14:32:46 +0800
Message-Id: <1592980367-1816-14-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj9+j8_Je2R5JAA--.564S15
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1rKFyrKF1xXFW5Kr13XFb_yoW8WrWrpF
        WkW390gr48Gay7Wr4fKr4DZFW3Ca48KrWUK3sakasFvFnxWrWktFy8ZFyjvryrC3yfGFyr
        tF43Aa1jkF1jk3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20E
        Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JU6OJrUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: f0774d41da0e ("irqchip: s3c24xx: add devicetree support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-s3c24xx.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index d2031fe..ef5d645 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -1239,7 +1239,8 @@ static int __init s3c_init_intc_of(struct device_node *np,
 						     &s3c24xx_irq_ops_of, NULL);
 	if (!domain) {
 		pr_err("irq: could not create irq-domain\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_iounmap;
 	}
 
 	for (i = 0; i < num_ctrl; i++) {
@@ -1248,15 +1249,17 @@ static int __init s3c_init_intc_of(struct device_node *np,
 		pr_debug("irq: found controller %s\n", ctrl->name);
 
 		intc = kzalloc(sizeof(struct s3c_irq_intc), GFP_KERNEL);
-		if (!intc)
-			return -ENOMEM;
+		if (!intc) {
+			ret = -ENOMEM;
+			goto out_domain_remove;
+		}
 
 		intc->domain = domain;
 		intc->irqs = kcalloc(32, sizeof(struct s3c_irq_data),
 				     GFP_KERNEL);
 		if (!intc->irqs) {
-			kfree(intc);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto out_free;
 		}
 
 		if (ctrl->parent) {
@@ -1285,6 +1288,13 @@ static int __init s3c_init_intc_of(struct device_node *np,
 	set_handle_irq(s3c24xx_handle_irq);
 
 	return 0;
+
+out_free:
+	kfree(intc);
+out_domain_remove:
+	irq_domain_remove(domain);
+out_iounmap:
+	iounmap(reg_base);
 }
 
 static struct s3c24xx_irq_of_ctrl s3c2410_ctrl[] = {
-- 
2.1.0

