Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7EA206DB0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 09:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389841AbgFXHaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 03:30:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59678 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389610AbgFXH36 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 03:29:58 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_93mAPNezSRJAA--.399S12;
        Wed, 24 Jun 2020 15:29:48 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 10/14] irqchip/nvic: Fix potential resource leaks
Date:   Wed, 24 Jun 2020 15:29:38 +0800
Message-Id: <1592983782-8842-11-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592983782-8842-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_93mAPNezSRJAA--.399S12
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18Ww17Gr15tw13uFWruFg_yoW8GF1xpF
        WUW390vr4fG3Wxur95Cw4UZryakrW0krWxK3ySk3Z7Zrn5A3yDuF18AF10vr1FkFWxCa1I
        qF4kAFyrCF4UAa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
        0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUhmRUUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists potential resource leaks in the error path, fix them.

Fixes: 292ec080491d ("irqchip: Add support for ARMv7-M NVIC")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-nvic.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index f747e22..cd17f5d 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -94,7 +94,8 @@ static int __init nvic_of_init(struct device_node *node,
 
 	if (!nvic_irq_domain) {
 		pr_warn("Failed to allocate irq domain\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_iounmap;
 	}
 
 	ret = irq_alloc_domain_generic_chips(nvic_irq_domain, 32, 1,
@@ -102,8 +103,7 @@ static int __init nvic_of_init(struct device_node *node,
 					     clr, 0, IRQ_GC_INIT_MASK_CACHE);
 	if (ret) {
 		pr_warn("Failed to allocate irq chips\n");
-		irq_domain_remove(nvic_irq_domain);
-		return ret;
+		goto err_domain_remove;
 	}
 
 	for (i = 0; i < numbanks; ++i) {
@@ -129,5 +129,11 @@ static int __init nvic_of_init(struct device_node *node,
 		writel_relaxed(0, nvic_base + NVIC_IPR + i);
 
 	return 0;
+
+err_domain_remove:
+	irq_domain_remove(nvic_irq_domain);
+err_iounmap:
+	iounmap(nvic_base);
+	return ret;
 }
 IRQCHIP_DECLARE(armv7m_nvic, "arm,armv7m-nvic", nvic_of_init);
-- 
2.1.0

