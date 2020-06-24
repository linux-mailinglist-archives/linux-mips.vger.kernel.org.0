Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64A0206CE4
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 08:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389383AbgFXGqI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 02:46:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48434 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389372AbgFXGpt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 02:45:49 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxXeuQ9vJebSBJAA--.397S7;
        Wed, 24 Jun 2020 14:45:39 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 5/7 RESEND] irqchip/loongson-pch-pic: Check return value of irq_domain_translate_twocell()
Date:   Wed, 24 Jun 2020 14:45:34 +0800
Message-Id: <1592981136-3572-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592981136-3572-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592981136-3572-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxXeuQ9vJebSBJAA--.397S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17JrW8tw15tw4UZry7Jrb_yoW8WF1xpF
        4UAwnrXr4DJFyUZw1xCws5X343Jw1ftFW7KayfKas3WrZ5J34qkF1UCFn5ur4rZF43JFyU
        Zrs8KFWUuF13AFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUQa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48J
        MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUwmRUUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Check the return value of irq_domain_translate_twocell() due to
it may returns -EINVAL if failed and use variable fwspec for it,
and then use a new variable parent_fwspec which is proper for
irq_domain_alloc_irqs_parent().

Fixes: ef8c01eb64ca ("irqchip: Add Loongson PCH PIC controller")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-pic.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 2a05b93..016f32c 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -135,16 +135,19 @@ static int pch_pic_alloc(struct irq_domain *domain, unsigned int virq,
 	int err;
 	unsigned int type;
 	unsigned long hwirq;
-	struct irq_fwspec fwspec;
+	struct irq_fwspec *fwspec = arg;
+	struct irq_fwspec parent_fwspec;
 	struct pch_pic *priv = domain->host_data;
 
-	irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+	err = irq_domain_translate_twocell(domain, fwspec, &hwirq, &type);
+	if (err)
+		return err;
 
-	fwspec.fwnode = domain->parent->fwnode;
-	fwspec.param_count = 1;
-	fwspec.param[0] = hwirq + priv->ht_vec_base;
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param_count = 1;
+	parent_fwspec.param[0] = hwirq + priv->ht_vec_base;
 
-	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
+	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
 	if (err)
 		return err;
 
-- 
2.1.0

