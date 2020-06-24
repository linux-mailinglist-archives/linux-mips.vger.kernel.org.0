Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BA8206CB0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389139AbgFXGjQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:39:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46456 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388476AbgFXGjQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:39:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+j8_Je2R5JAA--.564S5;
        Wed, 24 Jun 2020 14:33:10 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 03/14] irqchip/csky-mpintc: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 14:32:36 +0800
Message-Id: <1592980367-1816-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj9+j8_Je2R5JAA--.564S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KF47urWrWr1UAF1rKF15Arb_yoW8Aw1DpF
        48u3ySgrZ7Gr1UWr1fC3W8XryrG3yftay8K34Skas3JrnxWr98CFW8AF1Duw1fJa1rGayf
        Zrs7t3y5C3WDAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26F
        4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUb1vaUUUUU
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

