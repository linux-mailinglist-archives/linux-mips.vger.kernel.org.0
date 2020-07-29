Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A10231910
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgG2FVC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgG2FVB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:21:01 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74FAC061794
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:21:01 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k27so13655565pgm.2
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Yn6T+ydwl7t04EuWlZ6rQm0TIidTqiY2rykbdkGbhsw=;
        b=lMM9W7v4OPQqECfr4szNZkA19dmNn4QoKb3XijzZ6c/WMXBWUwlwcCKAKrE/TkgIM2
         DUV4yn5Hw3cH+7Ud0nJ6M3Q+LiWQdHjRSj5FBMwNAMHmFB36vJwCY3ipSdVgZkWz7rUz
         G5e31fCIRqK354Zh243bHz8o7AWCYqum9goUqvit5MtPM2z6IybOQnYq/JCYIkxEhpOU
         zbqqjcaeguesXStzA1DPUhnlbRFUyU4PzUs5CvE/JpNmUcyMQbfyLsipEhykYnP6C3Nh
         uXbnYXFHLij7OpOegs96xWt5v8YPf1IJCGla6345CoJFI3Y3dobebcA4ZnqlIauPmj4E
         4jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Yn6T+ydwl7t04EuWlZ6rQm0TIidTqiY2rykbdkGbhsw=;
        b=nZttsCD4Grd3BxL9RrK9Us2vp2h6YHH+zmWvzhIfL6WKmIkygK+QiH6ZSZnzHT5hYd
         O0m1Sau293mQ6j90hSNZ0YO6eP02Di/BKSI2QE2l/JnKcVvIfXFQvZ5fjTCYyp6OeSkM
         ErKt4sMhrMAXwydycNxkF29W8aMgCvPeAAZee7hxApnf/jyLsDWtM9gZ7gXFgu7HnqV+
         hYSbi/5J8LmULCaz6cwmemkED7iaECeHJdf+95qbejeO0MCvZk0Yv/XPKfsWehb7egGZ
         +CK4mvaKdqv2YBJztkZCSK7y0Zh0c0PyZ5w52FEpWOthsacVGpj1uW905M+SV06MWWGP
         uGSw==
X-Gm-Message-State: AOAM5314F8Dwwi8+ovNM1x4zdHCM+iQ0gKl85Mk98N9mFZN7wLCj4gbJ
        7TQlRrkylAw68dfVz/pU2E0=
X-Google-Smtp-Source: ABdhPJyKH53i5bE9xWCkQuCIiwtHb4EZ+nOi/TXEAVtULa6mqR5NsZI2+GR2jKF8ciwhqsub31ClYw==
X-Received: by 2002:aa7:988e:: with SMTP id r14mr28454110pfl.35.1596000061354;
        Tue, 28 Jul 2020 22:21:01 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id l4sm739539pjr.46.2020.07.28.22.20.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 22:21:00 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 3/5] irqchip: loongson-liointc: Fix misuse of gc->mask_cache
Date:   Wed, 29 Jul 2020 13:22:08 +0800
Message-Id: <1596000130-8689-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In gc->mask_cache bits, 1 means enabled and 0 means disabled, but in the
loongson-liointc driver mask_cache is misused by reverting its meaning.
This patch fix the bug and update the comments as well.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/irqchip/irq-loongson-liointc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 63b6147..08165c5 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -60,7 +60,7 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
 	if (!pending) {
 		/* Always blame LPC IRQ if we have that bug */
 		if (handler->priv->has_lpc_irq_errata &&
-			(handler->parent_int_map & ~gc->mask_cache &
+			(handler->parent_int_map & gc->mask_cache &
 			BIT(LIOINTC_ERRATA_IRQ)))
 			pending = BIT(LIOINTC_ERRATA_IRQ);
 		else
@@ -131,11 +131,11 @@ static void liointc_resume(struct irq_chip_generic *gc)
 	irq_gc_lock_irqsave(gc, flags);
 	/* Disable all at first */
 	writel(0xffffffff, gc->reg_base + LIOINTC_REG_INTC_DISABLE);
-	/* Revert map cache */
+	/* Restore map cache */
 	for (i = 0; i < LIOINTC_CHIP_IRQ; i++)
 		writeb(priv->map_cache[i], gc->reg_base + i);
-	/* Revert mask cache */
-	writel(~gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
+	/* Restore mask cache */
+	writel(gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
 	irq_gc_unlock_irqrestore(gc, flags);
 }
 
@@ -243,7 +243,7 @@ int __init liointc_of_init(struct device_node *node,
 	ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
 	ct->chip.irq_set_type = liointc_set_type;
 
-	gc->mask_cache = 0xffffffff;
+	gc->mask_cache = 0;
 	priv->gc = gc;
 
 	for (i = 0; i < LIOINTC_NUM_PARENT; i++) {
-- 
2.7.0

