Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66835206E1C
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387849AbgFXHqH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:46:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35806 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389948AbgFXHpT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:45:19 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2qIBPNevCZJAA--.660S7;
        Wed, 24 Jun 2020 15:45:14 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 05/14 RESEND] irqchip/davinci-cp-intc: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:45:02 +0800
Message-Id: <1592984711-3130-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxD2qIBPNevCZJAA--.660S7
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWDJr4xWw43Zr18WF13CFg_yoW8KFyrpr
        4fJ3y3Gr48Jr1rXrs3AFyrWFnxKw1DCrW2krW7Cas7CrsYvryqyr15KF1DZFyUua1UZr1j
        yan3G3W09Fy5Zw7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
        kF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnUUI43ZEXa7VUjvD73UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: 0fc3d74cf946 ("irqchip: davinci-cp-intc: move the driver to drivers/irqchip")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-davinci-cp-intc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-davinci-cp-intc.c b/drivers/irqchip/irq-davinci-cp-intc.c
index 276da277..2c2e115 100644
--- a/drivers/irqchip/irq-davinci-cp-intc.c
+++ b/drivers/irqchip/irq-davinci-cp-intc.c
@@ -162,6 +162,7 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	unsigned int num_regs = BITS_TO_LONGS(config->num_irqs);
 	int offset, irq_base;
 	void __iomem *req;
+	int ret;
 
 	req = request_mem_region(config->reg.start,
 				 resource_size(&config->reg),
@@ -175,7 +176,8 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 				       resource_size(&config->reg));
 	if (!davinci_cp_intc_base) {
 		pr_err("%s: unable to ioremap register range\n", __func__);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release;
 	}
 
 	davinci_cp_intc_write(0, DAVINCI_CP_INTC_GLOBAL_ENABLE);
@@ -210,7 +212,8 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	if (irq_base < 0) {
 		pr_err("%s: unable to allocate interrupt descriptors: %d\n",
 		       __func__, irq_base);
-		return irq_base;
+		ret = irq_base;
+		goto err_iounmap;
 	}
 
 	davinci_cp_intc_irq_domain = irq_domain_add_legacy(
@@ -219,7 +222,8 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 
 	if (!davinci_cp_intc_irq_domain) {
 		pr_err("%s: unable to create an interrupt domain\n", __func__);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_descs;
 	}
 
 	set_handle_irq(davinci_cp_intc_handle_irq);
@@ -228,6 +232,14 @@ davinci_cp_intc_do_init(const struct davinci_cp_intc_config *config,
 	davinci_cp_intc_write(1, DAVINCI_CP_INTC_GLOBAL_ENABLE);
 
 	return 0;
+
+err_free_descs:
+	irq_free_descs(irq_base, config->num_irqs);
+err_iounmap:
+	iounmap(davinci_cp_intc_base);
+err_release:
+	release_mem_region(config->reg.start, resource_size(&config->reg));
+	return ret;
 }
 
 int __init davinci_cp_intc_init(const struct davinci_cp_intc_config *config)
-- 
2.1.0

