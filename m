Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E0E232F00
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 10:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgG3IzY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 04:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3IzX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jul 2020 04:55:23 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F090C061794
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:55:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o1so13460609plk.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PNO6tB6QqOK5I3FA6H4q5A6OwPffOQuLiPQIW5uSnlI=;
        b=Iz7hlcKoCUjldNtJNBNvklz79t+up2KeipSOgnDMFqIxXhgrTPQsJPxqxVzkDAv1nv
         pJqygX/cS1VqBo1DAAYlzkOdth513xp1CSTj+Dxo8mXMw7O9XlsrjA+e7cu5ZgvxtGX/
         CLTfGI9vRUskANxS+Zo+PJtMlyfhX2oi6K7J+1uf7Y9xNl3Yh5CJFC6QFOk1SZs/8Swa
         xPjx3aHuqQ3AB2UHdvazlU0zbDh7EduDHgxHRprW7DhMasAIW+c+xYCRNuj2ivcsUKVS
         wPRzY8oFSE7Px3WF/BJsRBdESICvGgJEJcndW3aq0slZRi/hwEFGsUfIi5P0zgocVpNK
         CAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=PNO6tB6QqOK5I3FA6H4q5A6OwPffOQuLiPQIW5uSnlI=;
        b=aINt17w1R8sruMNlbGwe4MXmnAghsyl/rG0wvuKlSuIPYBKHhCvZbvAPcZZDlElB7P
         luYJvinSUQQkUUG/LGxtV6F85JsstIGu9jvMmXzdsnFAwv25h4HRCbU2hsF6JLSRKrAA
         TSm9lyN9VQkpx82SWpxzMZiTx3YYDXoXyRojFgmgo8/GvPRdfvRTQ9xU64Sl0QhznmKg
         Po+7J9syGlrmMbKsiN8GVNi32sud48p8N01sSHv91zDmxO6xiO5m1EdKhOkzjJXFU39Y
         qcVc1bYNgL8uXV0eGtO44AIQi27ueLt9E6EIkVXIBYoTnuJ5nnWsjwzb/ztXz3+L5dOV
         D92w==
X-Gm-Message-State: AOAM532moNbLn99lY/EebzZg7DRMQOsvKVd3J99RaiSnT2I0KPcElVSu
        /CBHPWqtkrC6bQinYFygHrI=
X-Google-Smtp-Source: ABdhPJyOxyd/rq8HWxjxz1RQEC17jRR1JWWaZWeCK718Q8cIG5YHlCVaSYHeFLp3Y1i5oIkQsqWXIw==
X-Received: by 2002:a62:3185:: with SMTP id x127mr2240038pfx.290.1596099323130;
        Thu, 30 Jul 2020 01:55:23 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m26sm5235345pff.84.2020.07.30.01.55.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 01:55:22 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 5/5] irqchip: loongson-pch-pic: Fix the misused irq flow handler
Date:   Thu, 30 Jul 2020 16:51:30 +0800
Message-Id: <1596099090-23516-6-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson PCH PIC is a standard level triggered PIC, and it need to clear
interrupt during unmask.

Fixes: ef8c01eb64ca6719da449dab0 ("irqchip: Add Loongson PCH PIC controller")
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/irqchip/irq-loongson-pch-pic.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 2a05b93..61d06df 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -64,15 +64,6 @@ static void pch_pic_bitclr(struct pch_pic *priv, int offset, int bit)
 	raw_spin_unlock(&priv->pic_lock);
 }
 
-static void pch_pic_eoi_irq(struct irq_data *d)
-{
-	u32 idx = PIC_REG_IDX(d->hwirq);
-	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
-
-	writel(BIT(PIC_REG_BIT(d->hwirq)),
-			priv->base + PCH_PIC_CLR + idx * 4);
-}
-
 static void pch_pic_mask_irq(struct irq_data *d)
 {
 	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
@@ -85,6 +76,9 @@ static void pch_pic_unmask_irq(struct irq_data *d)
 {
 	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
 
+	writel(BIT(PIC_REG_BIT(d->hwirq)),
+			priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
+
 	irq_chip_unmask_parent(d);
 	pch_pic_bitclr(priv, PCH_PIC_MASK, d->hwirq);
 }
@@ -124,7 +118,6 @@ static struct irq_chip pch_pic_irq_chip = {
 	.irq_mask		= pch_pic_mask_irq,
 	.irq_unmask		= pch_pic_unmask_irq,
 	.irq_ack		= irq_chip_ack_parent,
-	.irq_eoi		= pch_pic_eoi_irq,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_set_type		= pch_pic_set_type,
 };
@@ -150,7 +143,7 @@ static int pch_pic_alloc(struct irq_domain *domain, unsigned int virq,
 
 	irq_domain_set_info(domain, virq, hwirq,
 			    &pch_pic_irq_chip, priv,
-			    handle_fasteoi_ack_irq, NULL, NULL);
+			    handle_level_irq, NULL, NULL);
 	irq_set_probe(virq);
 
 	return 0;
-- 
2.7.0

