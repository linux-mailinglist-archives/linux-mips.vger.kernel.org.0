Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B881D4D54
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfJLFzF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:55:05 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25462 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfJLFzF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:55:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570859675; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=hmNfNGEQR9BcawK/l5DRP3HICkgwHFLvhxK604kBkKmsMtHIBaCQ1g0Y5c0OWo7umpAjce7VtC0HdUJItD5a069cVTKYBXzFNS2Ffp8WOYUFkKp+0TJPqWEYXxYD5lNKx84wGVCkKsVTohKkTNfzGOBHrWMd/VfdaXe+OEfSYZc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570859675; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=8uhG108fdMPXV9I7SkBsPI9BAWZdxA64FmFlrbnbwrw=; 
        b=mkkE6EbaDu6aouVelK3SaRfwNwqJC2v4TkBT7r0cYmeybKnRHsTVxJuVxB2KfEt0FvML/B0t52CfIWdXpCAmB0D4E0Jjh7vcuTCvWMzZQ2ERVNp1G2wNd3kLxq2f/7dgTkcNO4JzXZPGMnN8763P94URDbbGwGVsCzQYLsJnsmo=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=pUFN+uXWXaTODYGvRhiJrb2ScV6LqZtSznnJ4elPtZ0YgElFCCwVrLlGWJWtOy93K9NZ7ShJlRFG
    +ZFXvVcA7gxiyXDzziE6NIgt+fj8f7Aoqy1xEgOc1jiOt1V+QPVn  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570859675;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2729; bh=8uhG108fdMPXV9I7SkBsPI9BAWZdxA64FmFlrbnbwrw=;
        b=XLvw/zh/Z+q/S4LNe3rUxAV2vgAxJxog7k4ewFV5LFw9MP5ACZ1nfe95+AMZvfgs
        mYOxUGpKZJnga4tUCVV+0OZy6W9NnjPhvyjuUGNw4stT3vPhTUuLp3RsgrNumNe0vsn
        5O1yW9+F8iOYAlIrJlKlgN8AvkaW/vd0vi/l+hic=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570859675246769.4773337369243; Fri, 11 Oct 2019 22:54:35 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jason@lakedaemon.net,
        paul.burton@mips.com, allison@lohutok.net, syq@debian.org,
        rfontana@redhat.com, tglx@linutronix.de, paul@crapouillou.net,
        maz@kernel.org
Subject: [PATCH 1/5 v6] irqchip: ingenic: Drop redundant irq_suspend / irq_resume functions
Date:   Sat, 12 Oct 2019 13:53:46 +0800
Message-Id: <1570859630-50942-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570859630-50942-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1570859630-50942-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The same behaviour can be obtained by using the IRQCHIP_MASK_ON_SUSPEND
flag on the IRQ chip.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c   | 24 +-----------------------
 include/linux/irqchip/ingenic.h | 14 --------------
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 include/linux/irqchip/ingenic.h

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index f126255..06fa810 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -10,7 +10,6 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/ingenic.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/timex.h>
@@ -50,26 +49,6 @@ static irqreturn_t intc_cascade(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
-{
-	struct irq_chip_regs *regs = &gc->chip_types->regs;
-
-	writel(mask, gc->reg_base + regs->enable);
-	writel(~mask, gc->reg_base + regs->disable);
-}
-
-void ingenic_intc_irq_suspend(struct irq_data *data)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
-	intc_irq_set_mask(gc, gc->wake_active);
-}
-
-void ingenic_intc_irq_resume(struct irq_data *data)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
-	intc_irq_set_mask(gc, gc->mask_cache);
-}
-
 static struct irqaction intc_cascade_action = {
 	.handler = intc_cascade,
 	.name = "SoC intc cascade interrupt",
@@ -127,8 +106,7 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 		ct->chip.irq_mask = irq_gc_mask_disable_reg;
 		ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
 		ct->chip.irq_set_wake = irq_gc_set_wake;
-		ct->chip.irq_suspend = ingenic_intc_irq_suspend;
-		ct->chip.irq_resume = ingenic_intc_irq_resume;
+		ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
 		irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0,
 				       IRQ_NOPROBE | IRQ_LEVEL);
diff --git a/include/linux/irqchip/ingenic.h b/include/linux/irqchip/ingenic.h
deleted file mode 100644
index 1465588..00000000
--- a/include/linux/irqchip/ingenic.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- */
-
-#ifndef __LINUX_IRQCHIP_INGENIC_H__
-#define __LINUX_IRQCHIP_INGENIC_H__
-
-#include <linux/irq.h>
-
-extern void ingenic_intc_irq_suspend(struct irq_data *data);
-extern void ingenic_intc_irq_resume(struct irq_data *data);
-
-#endif
-- 
2.7.4


