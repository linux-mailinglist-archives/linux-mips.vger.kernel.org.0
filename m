Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46C1C8742
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 13:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfJBL0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 07:26:36 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25404 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbfJBL0g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 07:26:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570015546; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=S+Diuivf9rBULn+rSoS7mERM4LMaiizJjZz4mrCMSESe6Zcw4qpUyhWIfm2eUKmeh2s+8jJ7LNo8roGUwKhJRJ/Q9GNA31En6GsO3ntUL/0IR13hST0vfNWHPhSA09ZtUoiShopwGTcqbyyeXPzYxg7xpw2BED+LVI7Vmo4PfDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570015546; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=0cOK+cCuE1Fm3ThR/+IxH46twN3ONpZGwZBDUH3l7AU=; 
        b=O9WwAiGi5zY/yn6vaFx01n6Ty3bLJBUcuofY53Vb7ajLyvDa67jYWTTgYV6TtdcGHyLoJ2iLZhMxW1R7slws8YfnEyA5RldtgWMzv86/GtW9vTorNm7GzQKrIFlgw54314D5UM8R+FZ3gP+oqLCJr3PYL59mcvV5McFs/54T3e4=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=neZnW3dofdATJogiikKQhWOECZC2bwnmjJOdX7Vemsv7xOzi1Zkf2DD67veTsd7Vbq8M2CNnm4eL
    epMg/8G0r3fAu2pFljEvbnq10C2+mMgsC1cUOnFVQQLhqVDTAkIH  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570015546;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2678; bh=0cOK+cCuE1Fm3ThR/+IxH46twN3ONpZGwZBDUH3l7AU=;
        b=DsHgUQ3fq/Deg+zaEyD5fzc95KDi21lAzR87TXoaFrHSA6mZTCsOGbsg0gINUdAv
        gXzFia1xOa2wmlqSRMdE5HVfkuEhYygrDUn95bEaNtDFIxuhjnq3Pp/23623HdngLx3
        7JeZ7tgFY+6kaCSwafSMQuJi6fzWkOCcTnV0bt9E=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570015546320105.9573534034023; Wed, 2 Oct 2019 04:25:46 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        paul.burton@mips.com, gregkh@linuxfoundation.org,
        jason@lakedaemon.net, syq@debian.org, marc.zyngier@arm.com,
        rfontana@redhat.com, armijn@tjaldur.nl, allison@lohutok.net,
        paul@crapouillou.net
Subject: [PATCH 1/5 v5] irqchip: ingenic: Drop redundant irq_suspend / irq_resume functions
Date:   Wed,  2 Oct 2019 19:25:21 +0800
Message-Id: <1570015525-27018-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The same behaviour can be obtained by using the IRQCHIP_MASK_ON_SUSPEND
flag on the IRQ chip.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
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
index 1465588..0000000
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


