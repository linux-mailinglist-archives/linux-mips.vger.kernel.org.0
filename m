Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB81D204D0A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 10:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731860AbgFWIwW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 04:52:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41228 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731691AbgFWIwV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 04:52:21 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv2uFwvFecLBIAA--.12S6;
        Tue, 23 Jun 2020 16:51:26 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Guo Ren <guoren@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 4/7] irqchip/loongson-pch-pic: Check return value of irq_domain_translate_twocell()
Date:   Tue, 23 Jun 2020 16:51:13 +0800
Message-Id: <1592902276-3969-5-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxv2uFwvFecLBIAA--.12S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17JrW8tFWkAr1fXrW5Jrb_yoW8Xw1DpF
        4UAwnFqr4DJFyUZw1xCws5Xry3Jw1ftFW7tayfKas3WrZ5J34qkF1UuFn5ur1rAF45JFy7
        Zrs8KFWUuF13AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
        4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU
        eXd1UUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Check the return value of irq_domain_translate_twocell() due to
it may returns -EINVAL if failed and use variable fwspec for it,
and then use a new variable parent_fwspec which is proper for
irq_domain_alloc_irqs_parent().

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

