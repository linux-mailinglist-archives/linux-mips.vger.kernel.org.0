Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F722CFAC4
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 10:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbgLEJGn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 04:06:43 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39812 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbgLEJFN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 04:05:13 -0500
Received: by mail-pj1-f67.google.com with SMTP id hk16so4576929pjb.4
        for <linux-mips@vger.kernel.org>; Sat, 05 Dec 2020 01:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k1t43WsOCeWkGioi+225McenqDyts5xeyGG10W67SwI=;
        b=FpxcQkMW1okZJLX5lhalqkDFCi8ak4Luz716GlCMIJGKxKNd6jqMyRBpyuDeRAOGFq
         9GkoWjEghOZr57dp87E8+9tCx+x3xxSNj15Q5WbXWTXlEGp5CqMjiqp/kXpk6fHSfOvz
         fh0Iq/DadmjbNPnS/eapNPh4Ba0OBNT1zpmoUPT9RaPtrObLiNtB48Ntrl5pmYQ6Uc80
         uwfdAMw2hbdD79jHpieaQ6c2/i+oPBw1Zj4Zs/H7SogH8Yxyyxgsu7+h0MZ4y+r9XIet
         /7BnF2XJCw4C8RpZtstyLYIyxwH0O2OOG/9z93H8mgL/cfwJUeYdG8KOLdDWx73fb8N1
         UyOg==
X-Gm-Message-State: AOAM531nxEQ9dvc7TJ5OiV/gqTAdwjRKoeQjxCOJ/7VPMKMdJKIdiVcW
        tAowQ9AuiE9GXV8LD3Xf6zA=
X-Google-Smtp-Source: ABdhPJyTDmiKEg0fPHJkTA5P33iLM36BoHrHnGeUAkakTuYZB4awIBAfXNEzzNjyGqUcd0eJMMhrjw==
X-Received: by 2002:a17:902:aa84:b029:da:1c29:b965 with SMTP id d4-20020a170902aa84b02900da1c29b965mr7613427plr.36.1607159032876;
        Sat, 05 Dec 2020 01:03:52 -0800 (PST)
Received: from software.domain.org ([132.145.85.142])
        by smtp.gmail.com with ESMTPSA id g34sm6212620pgb.33.2020.12.05.01.03.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Dec 2020 01:03:52 -0800 (PST)
From:   Huacai Chen <chenhuacai@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH] irqchip/loongson-htpic: Fix build warnings
Date:   Sat,  5 Dec 2020 17:05:52 +0800
Message-Id: <1607159152-15958-1-git-send-email-chenhuacai@kernel.org>
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

