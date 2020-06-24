Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3875D206C75
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389128AbgFXGdS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:33:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45170 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388424AbgFXGdS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:33:18 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+j8_Je2R5JAA--.564S13;
        Wed, 24 Jun 2020 14:33:14 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 11/14] irqchip/omap-intc: Fix potential resource leak
Date:   Wed, 24 Jun 2020 14:32:44 +0800
Message-Id: <1592980367-1816-12-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592980367-1816-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj9+j8_Je2R5JAA--.564S13
X-Coremail-Antispam: 1UD129KBjvdXoW7GF4rtF1xAryrCFyfWw1xZrb_yoW3AFc_u3
        Wqgas3Wr4xAr4rGr1Igw13ZryYvrWkWFn7uF40q3ZxJ3y3Xw10yr42vrZ3JF10kFWUCr97
        Gr4UurWxAw1IyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbf8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAv
        wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
        AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUj_HUJUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leak in the error path, fix it.

Fixes: 8598066cddd1 ("arm: omap: irq: move irq.c to drivers/irqchip/")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-omap-intc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-omap-intc.c b/drivers/irqchip/irq-omap-intc.c
index d360a6e..e711530 100644
--- a/drivers/irqchip/irq-omap-intc.c
+++ b/drivers/irqchip/irq-omap-intc.c
@@ -254,8 +254,10 @@ static int __init omap_init_irq_of(struct device_node *node)
 	omap_irq_soft_reset();
 
 	ret = omap_alloc_gc_of(domain, omap_irq_base);
-	if (ret < 0)
+	if (ret < 0) {
 		irq_domain_remove(domain);
+		iounmap(omap_irq_base);
+	}
 
 	return ret;
 }
-- 
2.1.0

