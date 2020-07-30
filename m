Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A417232EEF
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 10:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgG3IvI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 04:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgG3IvH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jul 2020 04:51:07 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7838C061794
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:51:07 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w19so453565plq.3
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nFYsTz6y1J4vj1txVH73J5x90lBx5nGFNHkkFDnIZCQ=;
        b=He3Y9o7N2sWC8TuXf1CKqJ4EN8TJCPZRsHAF3U8jEjK4gVJ99Ar04LOEaoequNTVhK
         Z2c2z57zg0VrZsW1dgELo7C65SQa0W4oWJakHnGQTdVKzAhPrKZ3AmtEVROuM/qc/NRB
         sIUpSZUBO6WLzPglUTTCGMSRl4CjnVjGgmFobt+UW8NsVGMY6aivD2z5cnq8vVe1qywj
         6JciWM3g8TDCfch5EeBCXrZGjpWj931HoVcICsjtGxkUDrjc62jurxOI0BfyLtcQkB/i
         jUYvmWddqtYosAIOErCZUuvshg6jZpmMVhwCDJBii4cZ3AeeLuvSc4yg9Gpexw8iACPc
         qGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nFYsTz6y1J4vj1txVH73J5x90lBx5nGFNHkkFDnIZCQ=;
        b=IvX5zTbPkgx7HrxNWx+1Ho0V6sKst9xDoU4KbpbpjfwBsyHdpt3+Cqpm/6xPAhP4Pb
         7zptF4gdhTsNBf32bQOXjMOz/bvXqEec6ESkR16wPR6bafg5AFV7wbQKJLRxb9z7pnzG
         vegIxY1mvHnrXn3LyeyKK//xMR1FrLZ4w+0WwRwp0h6z5b8N/BRViNl0N+kpP7+o+FXo
         1mTOiKxCbv4cPQm1gOcUdioPo7jpLeESy4Vz3q0rAx4IwVFznGg1rIW5CNr2XSa83NS8
         TRwL1B3OqZLtmC/iQWnNE0yO26Ti+JaT7R1ervZHpnn35IjTO4KIfsTQbzifKivkVHmU
         4+Uw==
X-Gm-Message-State: AOAM531ydsiD9gYP5tDGZ7iO1z9cshrQraUhOPQ5KI2IBySdKnhnu2wz
        Z1DqLMaY3AeH33kyjE6cPdc=
X-Google-Smtp-Source: ABdhPJzIiC6TqShhnQo6DP3ffhLadehqq0q2OzKwSIAzrxmXBK8+ktHI+QgZvFnGB3ZXm5Kl3qNQNw==
X-Received: by 2002:a63:8ec7:: with SMTP id k190mr32561780pge.261.1596099067382;
        Thu, 30 Jul 2020 01:51:07 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m26sm5235345pff.84.2020.07.30.01.51.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 01:51:06 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 4/5] irqchip: loongson-htvec: Support 8 groups of HT vectors
Date:   Thu, 30 Jul 2020 16:51:29 +0800
Message-Id: <1596099090-23516-5-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The original version can only used by old Loongson-3 which only use 4
groups of HT vectors. Now Loongson-3A R4 can use 8 groups, so improve
the driver to support all 8 groups.

Fixes: 818e915fbac518e8c78e1877a ("irqchip: Add Loongson HyperTransport Vector support")
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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

