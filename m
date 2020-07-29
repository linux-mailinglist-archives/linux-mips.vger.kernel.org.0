Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A91231912
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgG2FWm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgG2FWl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:22:41 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DCFC061794
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:22:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i92so1035310pje.0
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vi7gMuiWnBMUuvMOxjT9185yHGQJrgjWLrG3SUOb0FM=;
        b=rjJLGETbIcGisb38BEKZhIzbr08BtcB6SojJYp95jXzk3PnjBNns4iqro5SSGGhOkc
         q8vs+dIbAJRwgfAPBF4htEevoZy6EzbvL1ViPXz/NsHQaK/nGE3tRrzo/ApV0ouKu6M9
         ZpQ7OERYTwHooNdvfT1rlyTBGWFjPZhwhBlqE2pRvjlUNks3Se8O5e0FCYRSocAZy/py
         pRrXJDTWYsdHrGg1RPjPW0aJQZjLyFvL4+6DJ0nDWhhhGKFWSvJX2q35OtPwYg5EQxRY
         ZIKDzsLwkbnP2/p7qqYSn5I2w8Zj3fDF9pQI5shfWzPANOtEDgpvBZoeYUc4PcxVy9ZB
         CYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=vi7gMuiWnBMUuvMOxjT9185yHGQJrgjWLrG3SUOb0FM=;
        b=gJfDC90xp/ebZNy1QQgJ3BpKzxwS6sRZCx/DNixzabHZBFYpymfwWkeM/Xsusp3N2e
         EEMOxQhgx+93kRorASLdn3+cdnUOfNygNgvKGchdKbESzYg4Ugxe6xyl++oxZ8kmfYam
         IObQPeOJGNBq7op6K/mbLidcxH9k3d8zBWI0CBi/I7gFiptiXeMRX9R9WXKk963rYkuA
         yOlRFIwGUCOj5jM3+RbKnX/BHhumxJPEp9jj5zLYeNMV5JaMw/7qCCsImxVTblY/uqj+
         JUnK/AR/43iUn1UqgpKEybzzOzaZn7hdzyhMonwufXJL4Xq0B/MxeBG5rIMCLNWUlN8a
         EqTw==
X-Gm-Message-State: AOAM531AdwkYCwzsRAcxgKruMZ3FacymtgbujZpzZOivSNUT5Ot8TMNN
        xAC+/1F+I270qDHKVJtWfY0=
X-Google-Smtp-Source: ABdhPJxfplVPtwA1ozoHkWKAU1NedGjSwKjFCygFM2CDjkHoSGYhuRAZ/7yE+ATJ2hyY/+RI+zMDdw==
X-Received: by 2002:a17:90b:353:: with SMTP id fh19mr7966357pjb.196.1596000161234;
        Tue, 28 Jul 2020 22:22:41 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id l4sm739539pjr.46.2020.07.28.22.22.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 22:22:40 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 5/5] irqchip: loongson-pch-pic: Fix the misused irq flow handler
Date:   Wed, 29 Jul 2020 13:22:10 +0800
Message-Id: <1596000130-8689-5-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson PCH PIC is a standard level triggered PIC, and it need to clear
interrupt during unmask.

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

