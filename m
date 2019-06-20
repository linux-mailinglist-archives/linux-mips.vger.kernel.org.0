Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A344DCD5
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfFTVjb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:31 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34725 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfFTVja (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id k11so4530176wrl.1
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDkhvgtD/o0cYL0eRaqTRxOMPTqLlZ8l9oete6cnkdg=;
        b=u1703qGeun92yqCuRMsSPPlt6SCwhBVim6l5cOnkSnKiZ1Zp6CuIdJ3uRwz02SBBuk
         +H1SpftyQWtwAZKuIllhnh659xM0DKoApf6HapLa8/ZCL5xepIGTRttf+sFFfJGHq6wC
         QHORcz+tH6Z9MHqIOhKJYc1G0GaiutU2I+/xxw9skE2KeCALOA8p7VEj2MxxVZqYyZRs
         EuxQiD5OaGT/4znPOyPjT9gYCMo9ubggXlffn1huBrG636k8Odef+R2HQ/gsvB25kdtL
         bKCF83TZ6IULoWgOjhVJUJZd2cdsfXDIRpADHZXfijxAKU+L824fL0jH0RBvzgHXS6ED
         TP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDkhvgtD/o0cYL0eRaqTRxOMPTqLlZ8l9oete6cnkdg=;
        b=MvjE/PP/FnrMZ4+aZa2m9eKVW9pxodsBsgmFKsQA9HpQOawN9R1JrdOv4+hEaXXG24
         246vkqfkHiYIleCPqm2u2B9qOzn2/twoHBp19VA+qZsM7C4sbnUA0L6YbBsv3zMdoWs1
         7IzTCiQ4X3A0CqX20Cg0gCmr+MWUPLU0MIYIaxi4GsX/SfKVyjMGXztBf31/WR05pGTK
         l9pH4B3XzGP7YMC4PeZZlYdorssRLK/Zb6+ILHKKzXVGjTtYy9nIuFFNjdmkreGW8brH
         4TumpVP/V0NWd7wXAMx8VkHfUQCh0qahZJ2jlBN1GLYdoJI8hB/UsVSxPEuvw20KWLAB
         1Ycg==
X-Gm-Message-State: APjAAAXwqeBedHBklPSOJOjUCP3M+PKCusILY67oKhO7qNMcBRCGZZH+
        wbmIZUSQ64s0Ca+KXBd13PE=
X-Google-Smtp-Source: APXvYqyZ0GhHA1sqVl08N5c2krQx9+bCPv2EEY5VHEaTc6DXvLMMIuA4h3mv2AN9tb5dFbDfB2MC/w==
X-Received: by 2002:adf:efcb:: with SMTP id i11mr44748749wrp.188.1561066768785;
        Thu, 20 Jun 2019 14:39:28 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:28 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 6/7] MIPS: lantiq: Shorten register names, remove unused macros
Date:   Thu, 20 Jun 2019 23:39:38 +0200
Message-Id: <7dd5524c05dc31610d550eb83a401728c64d9105.1561065843.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561065843.git.petrcvekcz@gmail.com>
References: <cover.1561065843.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

The macros LTQ_ICU_IM1_ISR and LTQ_ICU_OFFSET seems to be unused, remove
them. Allong with that, remove _IM0 substring from the macro names. The
IM (interrupt module) is already defined in IOMEM access and IM0 would be
misleading.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 35d7c5f6d159..b9ca20ff07d5 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -22,13 +22,11 @@
 #include <irq.h>
 
 /* register definitions - internal irqs */
-#define LTQ_ICU_IM0_ISR		0x0000
-#define LTQ_ICU_IM0_IER		0x0008
-#define LTQ_ICU_IM0_IOSR	0x0010
-#define LTQ_ICU_IM0_IRSR	0x0018
-#define LTQ_ICU_IM0_IMR		0x0020
-#define LTQ_ICU_IM1_ISR		0x0028
-#define LTQ_ICU_OFFSET		(LTQ_ICU_IM1_ISR - LTQ_ICU_IM0_ISR)
+#define LTQ_ICU_ISR		0x0000
+#define LTQ_ICU_IER		0x0008
+#define LTQ_ICU_IOSR		0x0010
+#define LTQ_ICU_IRSR		0x0018
+#define LTQ_ICU_IMR		0x0020
 
 /* register definitions - external irqs */
 #define LTQ_EIU_EXIN_C		0x0000
@@ -77,8 +75,8 @@ void ltq_disable_irq(struct irq_data *d)
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) & ~BIT(offset),
-		    LTQ_ICU_IM0_IER);
+	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
+		    LTQ_ICU_IER);
 }
 
 void ltq_mask_and_ack_irq(struct irq_data *d)
@@ -87,9 +85,9 @@ void ltq_mask_and_ack_irq(struct irq_data *d)
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) & ~BIT(offset),
-		    LTQ_ICU_IM0_IER);
-	ltq_icu_w32(im, BIT(offset), LTQ_ICU_IM0_ISR);
+	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) & ~BIT(offset),
+		    LTQ_ICU_IER);
+	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
 }
 
 static void ltq_ack_irq(struct irq_data *d)
@@ -98,7 +96,7 @@ static void ltq_ack_irq(struct irq_data *d)
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, BIT(offset), LTQ_ICU_IM0_ISR);
+	ltq_icu_w32(im, BIT(offset), LTQ_ICU_ISR);
 }
 
 void ltq_enable_irq(struct irq_data *d)
@@ -107,8 +105,8 @@ void ltq_enable_irq(struct irq_data *d)
 	unsigned long im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) | BIT(offset),
-		    LTQ_ICU_IM0_IER);
+	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IER) | BIT(offset),
+		    LTQ_ICU_IER);
 }
 
 static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
@@ -225,7 +223,7 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 	u32 irq;
 	irq_hw_number_t hwirq;
 
-	irq = ltq_icu_r32(module, LTQ_ICU_IM0_IOSR);
+	irq = ltq_icu_r32(module, LTQ_ICU_IOSR);
 	if (irq == 0)
 		return;
 
@@ -288,9 +286,9 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 	/* turn off all irqs by default */
 	for (i = 0; i < MAX_IM; i++) {
 		/* make sure all irqs are turned off by default */
-		ltq_icu_w32(i, 0, LTQ_ICU_IM0_IER);
+		ltq_icu_w32(i, 0, LTQ_ICU_IER);
 		/* clear all possibly pending interrupts */
-		ltq_icu_w32(i, ~0, LTQ_ICU_IM0_ISR);
+		ltq_icu_w32(i, ~0, LTQ_ICU_ISR);
 	}
 
 	mips_cpu_irq_init();
-- 
2.21.0

