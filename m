Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 038253A20A
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfFHUsy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42387 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUsy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so5395464wrl.9
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDkhvgtD/o0cYL0eRaqTRxOMPTqLlZ8l9oete6cnkdg=;
        b=b2sWoyvyFLmxT+oY88f/Ny6QzzIZROW+5Dum6y6X09IhNYT1UCGdaeKVWbXOP3Ictk
         GTdSNc0olhc/TPrc70GdlcH2HBJXi/TW3kNfHU4JpHBpX8qliroBFb3Hl+Cj+5B+trH7
         pXeQ5PxfozheKWnYSa5jWVgDaaMmmXk3qSEfdCNE8USw1BtFoGHSCEfAnF4Tlwei7AzO
         u5hH5GzHSJIpJGexKvTMWkivrhuZF2l6df0N+NvnTA24O/I2f/T8kijcnMvkHPf0Xlw9
         IafA6VDydYvrBYBx7SOf5Xf93IhPctIrl7SEH121rs7Cb3dSGmvBcX6ZbrR6TXLXgvsi
         H7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDkhvgtD/o0cYL0eRaqTRxOMPTqLlZ8l9oete6cnkdg=;
        b=pfCk2JvZ5yHbl7dHcLMnO16w43BNnY/3Z04qL69Vn+M6aq9vxCV1o2CW15r4DRNJE/
         Zno44bewb84fzZXzqyMlOErRqH7KST8jCCyefkRxwAE8Fh8lZInf7JshdMlr9/H6qtOo
         CPbLZHqP12m58IugVbhYcw6m3Ves8r9lgLh3lcLTSOLuI6GqtigzguFJvxpzEdVyBA+2
         YFl5W1atpoTncCzV2ojEYSxB+u+47f6G+aECQ351N/paGqAQ5g/TEJCPnBx5Q5D2b/GJ
         g1JtS3Y0UnYMLHU46ZiHnZu08dILWD+njtTSTr9I23/7bbYzn005Uw6T3mS0bDmI5WiS
         KY/w==
X-Gm-Message-State: APjAAAWFs/6mZAy7jSNV+vXqllj3g71PSAEN3sCFXjdexuqm81196WZS
        ysBYvnXE/uOC9frr1oY2Nnk=
X-Google-Smtp-Source: APXvYqxrllq2YXhlFbcTSCsE5eJWOW2xflbeXjr/f27HPYjPDsi8g6gG0ubMjJ9KX8tqQneExDtxOA==
X-Received: by 2002:adf:ef09:: with SMTP id e9mr24636275wro.79.1560026932396;
        Sat, 08 Jun 2019 13:48:52 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:52 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 6/7] MIPS: lantiq: Shorten register names, remove unused macros
Date:   Sat,  8 Jun 2019 22:48:09 +0200
Message-Id: <430d6780b19250426ad4aa32f8382d62fe7e7dd0.1560024463.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560024463.git.petrcvekcz@gmail.com>
References: <cover.1560024463.git.petrcvekcz@gmail.com>
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

