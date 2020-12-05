Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A012CFACB
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 10:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgLEJWH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 04:22:07 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:32778 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgLEJVy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 04:21:54 -0500
Received: by mail-io1-f67.google.com with SMTP id o8so8368628ioh.0
        for <linux-mips@vger.kernel.org>; Sat, 05 Dec 2020 01:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k1t43WsOCeWkGioi+225McenqDyts5xeyGG10W67SwI=;
        b=mPhzn+XML/rXfepEr0dPPqEdVsCUEaFbgYFW120Sd0qo/ktEWxMhfxn4KmQrSX5KYA
         Mu29o8JVwM2dldTF2h/fZVLfIp2c6ECfeIOKIPGE/W2oEzPhMntDD2EZl4Kuad0Q1e3h
         +21elSV+21j0Xbg/R1q2f9NUpMNIVG83raj+DbWu3WwB8x8QQoYGI8LKieQau6rRImml
         MmZ0/sBovb/BviQELcDqw2Gfa1Orto0mjfSC8bJ5uYDj34wYHbmYUe8wmQ7doS+e0Hef
         15IdnKVIrelzN0mYhdBpUcNJA034zzn7Il0+s3cZBYxsST2VilgxWLbfuc3Z+Ycn079s
         KoSQ==
X-Gm-Message-State: AOAM530fbMCJgAs3S/gIPNyJ3rQp1sGnmqV0scfDRJhjI12qkL8e2Fdx
        fgBy4XmBycLR3Nh17H2emc3AD6t0F+HgXVz7
X-Google-Smtp-Source: ABdhPJy9Xc7j9uimHyVk9eLzq56IaZCP9n/LUoPdqIO0kxMQdODAKJ2jeH4CABqcrthcBFKaVsFDNA==
X-Received: by 2002:a63:161a:: with SMTP id w26mr10887428pgl.17.1607159634170;
        Sat, 05 Dec 2020 01:13:54 -0800 (PST)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id q12sm7730836pfc.84.2020.12.05.01.13.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Dec 2020 01:13:53 -0800 (PST)
From:   Huacai Chen <chenhuacai@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH] irqchip/loongson-htpic: Fix build warnings
Date:   Sat,  5 Dec 2020 17:15:44 +0800
Message-Id: <1607159744-995-1-git-send-email-chenhuacai@kernel.org>
X-Mailer: git-send-email 2.7.0
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix build warnings as below:

   drivers/irqchip/irq-loongson-htpic.c: In function 'htpic_reg_init':
>> drivers/irqchip/irq-loongson-htpic.c:62:12: warning: variable 'val' set but not used [-Wunused-but-set-variable]
      62 |   uint32_t val;
         |            ^~~
   drivers/irqchip/irq-loongson-htpic.c: At top level:
>> drivers/irqchip/irq-loongson-htpic.c:84:12: warning: no previous prototype for 'htpic_of_init' [-Wmissing-prototypes]
      84 | int __init htpic_of_init(struct device_node *node, struct device_node *parent)
         |            ^~~~~~~~~~~~~

Fixes: a93f1d903fa34fc2c5d9fa450bd ("irqchip: Add driver for Loongson-3 HyperTransport PIC controller")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
---
 drivers/irqchip/irq-loongson-htpic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
index 63f7280..1b801c4 100644
--- a/drivers/irqchip/irq-loongson-htpic.c
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -59,11 +59,10 @@ static void htpic_reg_init(void)
 	int i;
 
 	for (i = 0; i < HTINT_NUM_VECTORS; i++) {
-		uint32_t val;
-
 		/* Disable all HT Vectors */
 		writel(0x0, htpic->base + HTINT_EN_OFF + i * 0x4);
-		val = readl(htpic->base + i * 0x4);
+		/* Read back to force write */
+		(void) readl(htpic->base + i * 0x4);
 		/* Ack all possible pending IRQs */
 		writel(GENMASK(31, 0), htpic->base + i * 0x4);
 	}
@@ -81,7 +80,7 @@ struct syscore_ops htpic_syscore_ops = {
 	.resume		= htpic_resume,
 };
 
-int __init htpic_of_init(struct device_node *node, struct device_node *parent)
+static int __init htpic_of_init(struct device_node *node, struct device_node *parent)
 {
 	unsigned int parent_irq[4];
 	int i, err;
-- 
2.7.0

