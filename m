Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B8E3E1597
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 15:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbhHENWj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 09:22:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhHENWj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 09:22:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2974E6113B;
        Thu,  5 Aug 2021 13:22:21 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Chen Zhu <zhuchen@loongson.cn>
Subject: [PATCH V2] irqchip/loongson-pch-pic: Improve edge triggered interrupt support
Date:   Thu,  5 Aug 2021 21:22:16 +0800
Message-Id: <20210805132216.3539007-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Edge-triggered mode and level-triggered mode need different handlers,
and edge-triggered mode need a specific ack operation. So improve it.

Fixes: ef8c01eb64ca6719da449dab0 ("irqchip: Add Loongson PCH PIC controller")
Signed-off-by: Chen Zhu <zhuchen@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Add a Fixes: tag.

 drivers/irqchip/irq-loongson-pch-pic.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index f790ca6d78aa..a4eb8a2181c7 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -92,18 +92,22 @@ static int pch_pic_set_type(struct irq_data *d, unsigned int type)
 	case IRQ_TYPE_EDGE_RISING:
 		pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
 		pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		pch_pic_bitset(priv, PCH_PIC_EDGE, d->hwirq);
 		pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 		pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
 		pch_pic_bitclr(priv, PCH_PIC_POL, d->hwirq);
+		irq_set_handler_locked(d, handle_level_irq);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		pch_pic_bitclr(priv, PCH_PIC_EDGE, d->hwirq);
 		pch_pic_bitset(priv, PCH_PIC_POL, d->hwirq);
+		irq_set_handler_locked(d, handle_level_irq);
 		break;
 	default:
 		ret = -EINVAL;
@@ -113,11 +117,24 @@ static int pch_pic_set_type(struct irq_data *d, unsigned int type)
 	return ret;
 }
 
+static void pch_pic_ack_irq(struct irq_data *d)
+{
+	unsigned int reg;
+	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
+
+	reg = readl(priv->base + PCH_PIC_EDGE + PIC_REG_IDX(d->hwirq) * 4);
+	if (reg & BIT(PIC_REG_BIT(d->hwirq))) {
+		writel(BIT(PIC_REG_BIT(d->hwirq)),
+			priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
+	}
+	irq_chip_ack_parent(d);
+}
+
 static struct irq_chip pch_pic_irq_chip = {
 	.name			= "PCH PIC",
 	.irq_mask		= pch_pic_mask_irq,
 	.irq_unmask		= pch_pic_unmask_irq,
-	.irq_ack		= irq_chip_ack_parent,
+	.irq_ack		= pch_pic_ack_irq,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_set_type		= pch_pic_set_type,
 };
-- 
2.27.0

