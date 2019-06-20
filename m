Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF014DCD0
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfFTVj0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40779 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfFTVj0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:26 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so4539170wmj.5
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UtD9LqGAYakgNOjMfkfswsTmJIWlE3YoJFMFCxDn+fg=;
        b=SfpmR39vtZGZxS6dTuarEBSd9HKz0/5fgUtH3pk6UbVhjKEpID/hEymGZj+k9C6rvS
         hvzk19T289V0K+7LTh31LI7Jh/KD7Hm5Zi4HciWIhu/cPgreTQd+5+1VWwyeI05ax2ji
         ty6ZOKz340jeiMpGarwF8hn7GSVL9h3lLmLFA/g/E97uyA3aj4moyLu/E9rY5R25zHeg
         l6ZCThX1kIn3E7N93O4H8VJQCHUr3XNLoQOKPYOGXOQVdZ12u9d/kUkiPbzydd/VgAWl
         MTZh13I1tpqGmmiIf0h1IWSVY7xTcr2aIMOfit+amRUKLC10c1YZbfYiK+fyvD9e3DvO
         B7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UtD9LqGAYakgNOjMfkfswsTmJIWlE3YoJFMFCxDn+fg=;
        b=bb5/U9TePIY0tLLIMXTh2UpfV77GvB2y/qu+ac7x4KCGCAAZQ0iX587AE61e1nW4EQ
         ZVysDxx4s/cKAyF+ERat/hr1z5G7c+PwXMV/w6iWCtsQxla2Nmr0ytQ6Tm6hiOhuC+XG
         IUIymrlwT/oihjFUuDEiyk1V21YOewOAYVldHna8RbBF2W42duSSLiUfcLHFMRGHls7s
         1EQ0ygSvKBSOWLes2Fn1unWJASGEQG4FuYwv5tV6fQQKH94TwdbKL1d383+aaUB30QhN
         PL7vqc4L07LXO+b4sVaQOAVX6qasbkmTnQj1jOWSdguL1Iq3auQVVfT3pqZCSJz93Nco
         zP0w==
X-Gm-Message-State: APjAAAUGstLZirbs88pJHeHNQpRQ7argn/xED9a8UMwTTvQ7w4orYbZA
        AdQdv0VPANegUk+/m9w3dWVfb23z
X-Google-Smtp-Source: APXvYqxAd6Z1+l/sGHqX3fn8NMyCLFvKK8eQVWWo/PMLag6OkyJxJ9QvZXTrHxxfbTArMQNl2oCrow==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr959956wmb.39.1561066764731;
        Thu, 20 Jun 2019 14:39:24 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:24 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 1/7] MIPS: lantiq: Move macro directly to iomem function
Date:   Thu, 20 Jun 2019 23:39:33 +0200
Message-Id: <ab12b57b489226e6075a9224ca76a8bc48eb7c69.1561065843.git.petrcvekcz@gmail.com>
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

Using the variable as a temporary holder for the macro of the register
offset value is not necessary. Move it directly to the IOMEM read/write
call.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 6549499eb202..fb3e1cc2cf6b 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -77,44 +77,42 @@ int ltq_eiu_get_irq(int exin)
 
 void ltq_disable_irq(struct irq_data *d)
 {
-	u32 ier = LTQ_ICU_IM0_IER;
 	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	int im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, ier) & ~BIT(offset), ier);
+	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) & ~BIT(offset),
+		    LTQ_ICU_IM0_IER);
 }
 
 void ltq_mask_and_ack_irq(struct irq_data *d)
 {
-	u32 ier = LTQ_ICU_IM0_IER;
-	u32 isr = LTQ_ICU_IM0_ISR;
 	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	int im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, ier) & ~BIT(offset), ier);
-	ltq_icu_w32(im, BIT(offset), isr);
+	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) & ~BIT(offset),
+		    LTQ_ICU_IM0_IER);
+	ltq_icu_w32(im, BIT(offset), LTQ_ICU_IM0_ISR);
 }
 
 static void ltq_ack_irq(struct irq_data *d)
 {
-	u32 isr = LTQ_ICU_IM0_ISR;
 	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	int im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, BIT(offset), isr);
+	ltq_icu_w32(im, BIT(offset), LTQ_ICU_IM0_ISR);
 }
 
 void ltq_enable_irq(struct irq_data *d)
 {
-	u32 ier = LTQ_ICU_IM0_IER;
 	int offset = d->hwirq - MIPS_CPU_IRQ_CASCADE;
 	int im = offset / INT_NUM_IM_OFFSET;
 
 	offset %= INT_NUM_IM_OFFSET;
-	ltq_icu_w32(im, ltq_icu_r32(im, ier) | BIT(offset), ier);
+	ltq_icu_w32(im, ltq_icu_r32(im, LTQ_ICU_IM0_IER) | BIT(offset),
+		    LTQ_ICU_IM0_IER);
 }
 
 static int ltq_eiu_settype(struct irq_data *d, unsigned int type)
-- 
2.21.0

