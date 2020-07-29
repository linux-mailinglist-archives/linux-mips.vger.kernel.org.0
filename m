Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606CA231911
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgG2FWC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgG2FWB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:22:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A44C061794
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:22:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d4so13647082pgk.4
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kw4YlohL0M2SfPo2yS24Fc01FPImFy877KGaEp7/Zrs=;
        b=Hx7BMafEz9pY82Mq9xffnhXYeIgqq5RwJI7C23Zm32DdF0drkDXqwYwGKKXOHDhvqn
         5POER9Gn1AxxbigYucKWQxTxjjoHC7jkOKLmSx3xTsTqZz0g12VwfqSb+mGswVPNWmH2
         LwUJfcpz/Z7/vPs8Axoct7igsmSdgvhia0L2R42Hd/VnIAhwkTC1h3sH71fojskDp5Om
         CiESwvQS9X/iP0RFSZxdliTnL+KkfRrUb2OOGP7dJ9IC8Pzr3cpufI5anU822DbJsvH7
         TiRQw9mmxDw4mbkvHMs8Oy2OwyJAlvfijKwKfKpOtnK8aUZitrGn9lTbbTL3WGN6Jgf5
         ZnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=kw4YlohL0M2SfPo2yS24Fc01FPImFy877KGaEp7/Zrs=;
        b=QZ2D3MAvvWLGag8QoQ8FrVZZJxl4NzVbSQM6Dn9xLJRrUD1m2qAsCJD1UUBfgiLqFe
         lgVU3hH7+WpRThmeT7t7PrFJVD5dYwGFdh265FZZXLDjj2NoAZzXtF3+UAgqRfJDcX++
         bbAtEwbeScRE08tnMO4iOIoqjidl5KrtsudjtjjKPQ8oQro9D3hmo6tFp+cVxfB3TodH
         h5HpKdzf/O284w8m8khxmKjRRs6hZcR607ZLOutrlSGn2m2ajinhuLCG90eNULn5X8F/
         kaEngc+sDZbaisevMBPJdnyGj5uo8er8B5yQ36PGRQ63VfqMLrzFp4+/e1c19gVp2OmQ
         rfoA==
X-Gm-Message-State: AOAM530wDrdLA4qNW+niljsOCkwCKQh2RWsnz8jaxOH2P79fnvsvdx5A
        9A99U1A1vIiYPUErq7ic72w=
X-Google-Smtp-Source: ABdhPJyTGQk9B96Nert4sfaJPfbF3+ZFCxu84YbxpO3V2AMO7yTCO/o0GN1ofBwNnh5Iw+ViMxWcxQ==
X-Received: by 2002:a65:5c08:: with SMTP id u8mr28678333pgr.184.1596000121225;
        Tue, 28 Jul 2020 22:22:01 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id l4sm739539pjr.46.2020.07.28.22.21.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 22:22:00 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 4/5] irqchip: loongson-htvec: Support 8 groups of HT vectors
Date:   Wed, 29 Jul 2020 13:22:09 +0800
Message-Id: <1596000130-8689-4-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The original version can only used by old Loongson-3 which only use 4
groups of HT vectors. Now Loongson-3A R4 can use 8 groups, so improve
the driver to support all 8 groups.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/irqchip/irq-loongson-htvec.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 1ece933..e7722fa 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -19,15 +19,14 @@
 
 /* Registers */
 #define HTVEC_EN_OFF		0x20
-#define HTVEC_MAX_PARENT_IRQ	4
+#define HTVEC_MAX_PARENT_IRQ	8
 
 #define VEC_COUNT_PER_REG	32
-#define VEC_REG_COUNT		4
-#define VEC_COUNT		(VEC_COUNT_PER_REG * VEC_REG_COUNT)
 #define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
 #define VEC_REG_BIT(irq_id)	((irq_id) % VEC_COUNT_PER_REG)
 
 struct htvec {
+	int			num_parents;
 	void __iomem		*base;
 	struct irq_domain	*htvec_domain;
 	raw_spinlock_t		htvec_lock;
@@ -43,7 +42,7 @@ static void htvec_irq_dispatch(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < VEC_REG_COUNT; i++) {
+	for (i = 0; i < priv->num_parents; i++) {
 		pending = readl(priv->base + 4 * i);
 		while (pending) {
 			int bit = __ffs(pending);
@@ -147,7 +146,7 @@ static void htvec_reset(struct htvec *priv)
 	u32 idx;
 
 	/* Clear IRQ cause registers, mask all interrupts */
-	for (idx = 0; idx < VEC_REG_COUNT; idx++) {
+	for (idx = 0; idx < priv->num_parents; idx++) {
 		writel_relaxed(0x0, priv->base + HTVEC_EN_OFF + 4 * idx);
 		writel_relaxed(0xFFFFFFFF, priv->base);
 	}
@@ -157,7 +156,7 @@ static int htvec_of_init(struct device_node *node,
 				struct device_node *parent)
 {
 	struct htvec *priv;
-	int err, parent_irq[4], num_parents = 0, i;
+	int err, parent_irq[8], i;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -176,19 +175,18 @@ static int htvec_of_init(struct device_node *node,
 		if (parent_irq[i] <= 0)
 			break;
 
-		num_parents++;
+		priv->num_parents++;
 	}
 
-	if (!num_parents) {
+	if (!priv->num_parents) {
 		pr_err("Failed to get parent irqs\n");
 		err = -ENODEV;
 		goto iounmap_base;
 	}
 
 	priv->htvec_domain = irq_domain_create_linear(of_node_to_fwnode(node),
-						      VEC_COUNT,
-						      &htvec_domain_ops,
-						      priv);
+					(VEC_COUNT_PER_REG * priv->num_parents),
+					&htvec_domain_ops, priv);
 	if (!priv->htvec_domain) {
 		pr_err("Failed to create IRQ domain\n");
 		err = -ENOMEM;
@@ -197,7 +195,7 @@ static int htvec_of_init(struct device_node *node,
 
 	htvec_reset(priv);
 
-	for (i = 0; i < num_parents; i++)
+	for (i = 0; i < priv->num_parents; i++)
 		irq_set_chained_handler_and_data(parent_irq[i],
 						 htvec_irq_dispatch, priv);
 
-- 
2.7.0

