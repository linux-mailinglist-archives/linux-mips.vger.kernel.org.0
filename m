Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83936206DB5
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389760AbgFXHaR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:30:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59670 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388628AbgFXH34 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:29:56 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_93mAPNezSRJAA--.399S5;
        Wed, 24 Jun 2020 15:29:44 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 03/14] irqchip/csky-mpintc: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:29:31 +0800
Message-Id: <1592983782-8842-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_93mAPNezSRJAA--.399S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KF47urWrWr1UAF1rKF15Arb_yoW8Aw1DpF
        48u3ySgrZ7Gr1UWr1fC3W8XryrG3yftay8K34Skas3JrnxWr98CFW8AF1Duw1fJa1rGayf
        Zrs7t3y5C3WDAFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC2
        0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
        0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
        14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
        IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AK
        xVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUbjjg3UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: d8a5f5f79122 ("irqchip: add C-SKY SMP interrupt controller")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-csky-mpintc.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-mpintc.c
index a1534ed..c195e24 100644
--- a/drivers/irqchip/irq-csky-mpintc.c
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -247,8 +247,10 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 	if (INTCG_base == NULL) {
 		INTCG_base = ioremap(mfcr("cr<31, 14>"),
 				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
-		if (INTCG_base == NULL)
-			return -EIO;
+		if (INTCG_base == NULL) {
+			ret = -EIO;
+			goto err_free;
+		}
 
 		INTCL_base = INTCG_base + INTCG_SIZE;
 
@@ -257,8 +259,10 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 
 	root_domain = irq_domain_add_linear(node, nr_irq, &csky_irqdomain_ops,
 					    NULL);
-	if (!root_domain)
-		return -ENXIO;
+	if (!root_domain) {
+		ret = -ENXIO;
+		goto err_iounmap;
+	}
 
 	/* for every cpu */
 	for_each_present_cpu(cpu) {
@@ -270,12 +274,22 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
 
 #ifdef CONFIG_SMP
 	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ);
-	if (!ipi_irq)
-		return -EIO;
+	if (!ipi_irq) {
+		ret = -EIO;
+		goto err_domain_remove;
+	}
 
 	set_send_ipi(&csky_mpintc_send_ipi, ipi_irq);
 #endif
 
 	return 0;
+
+err_domain_remove:
+	irq_domain_remove(root_domain);
+err_iounmap:
+	iounmap(INTCG_base);
+err_free:
+	kfree(__trigger);
+	return ret;
 }
 IRQCHIP_DECLARE(csky_mpintc, "csky,mpintc", csky_mpintc_init);
-- 
2.1.0

