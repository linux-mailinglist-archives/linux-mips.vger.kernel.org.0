Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB98D4D5C
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfJLF4t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:56:49 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25499 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfJLF4s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:56:48 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570859698; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=fbrsZxm+7TKVtfBaI9CgHN2IBxrQUnWVjVt1g208sqHAQL2H8pESojcxSzJTs9AGL9n4cNYZ/UguOymBnEoWnSymKk38/tEh94q6jtCt+v+qPGuThT+IjV73jyvmkLA0yHCh/C4hLPifLizIA2S0c+v8Q5pkANWx72dCd1q5Mu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570859698; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=9AsoSpojO4C74zbA2M3vz9rPBC36KFYTB+2fQ9Vp4gI=; 
        b=RCCLWEjvhiN06MZySYEkaXh3Ytov+nuI07mag5pBuWn5L9qPkre0VOLclXinMggGOkpO02uwZxI1+HCrsq1gNLnWV5Wx254qtJJD1YqF47tzBjfZefy/EWwFY0hSr8sL//EFE4pjOb6TEF1n0GIbwpRg0KF4yksyOCNlMWBjZ9k=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=mNl1coxyT/xrBFcEUlhANEY+31SZf5sG9wBRrdRm1JFVU4i/+SFhuXS65DKOkNokmR6b6nKn/haQ
    3+OnysTj0tldCIkEgdXdkx5MFYqmSod0c3tdKrx0Y4h9th3AnH1I  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570859698;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2326; bh=9AsoSpojO4C74zbA2M3vz9rPBC36KFYTB+2fQ9Vp4gI=;
        b=f2/7j/pnXvy/3Ewx3yOsWePr6AFOZYJ5jo45oCm/jLU7s5Xy0TlH8NHuCGGJo7MD
        d14zx0DgPbG+rHpbJvZ11PwUPBVjUPipnQ5FEp9c0UKqFftsD/JE9XMzMf3B5ucV+MS
        I1fRPcc5blwWscfRVfl2EkZ5lCWzmOizODyni25c=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570859696276279.0728945796534; Fri, 11 Oct 2019 22:54:56 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jason@lakedaemon.net,
        paul.burton@mips.com, allison@lohutok.net, syq@debian.org,
        rfontana@redhat.com, tglx@linutronix.de, paul@crapouillou.net,
        maz@kernel.org
Subject: [PATCH 5/5 v6] irqchip: Ingenic: Add process for more than one irq at the same time.
Date:   Sat, 12 Oct 2019 13:53:50 +0800
Message-Id: <1570859630-50942-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570859630-50942-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1570859630-50942-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add process for the situation that more than one irq is coming to
a single chip at the same time. The original code will only respond
to the lowest setted bit in JZ_REG_INTC_PENDING, and then exit the
interrupt dispatch function. After exiting the interrupt dispatch
function, since the second interrupt has not yet responded, the
interrupt dispatch function is again entered to process the second
interrupt. This creates additional unnecessary overhead, and the
more interrupts that occur at the same time, the more overhead is
added. The improved method in this patch is to check whether there
are still unresponsive interrupts after processing the lowest
setted bit interrupt. If there are any, the processing will be
processed according to the bit in JZ_REG_INTC_PENDING, and the
interrupt dispatch function will be exited until all processing
is completed.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/irqchip/irq-ingenic.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 06ab3ad..01d18b3 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 platform IRQ support
+ *  Ingenic XBurst platform IRQ support
  */
 
 #include <linux/errno.h>
@@ -37,18 +37,23 @@ static irqreturn_t intc_cascade(int irq, void *data)
 	struct ingenic_intc_data *intc = irq_get_handler_data(irq);
 	struct irq_domain *domain = intc->domain;
 	struct irq_chip_generic *gc;
-	uint32_t irq_reg;
+	uint32_t pending;
 	unsigned i;
 
 	for (i = 0; i < intc->num_chips; i++) {
 		gc = irq_get_domain_generic_chip(domain, i * 32);
 
-		irq_reg = irq_reg_readl(gc, JZ_REG_INTC_PENDING);
-		if (!irq_reg)
+		pending = irq_reg_readl(gc, JZ_REG_INTC_PENDING);
+		if (!pending)
 			continue;
 
-		irq = irq_find_mapping(domain, __fls(irq_reg) + (i * 32));
-		generic_handle_irq(irq);
+		while (pending) {
+			int bit = __fls(pending);
+
+			irq = irq_find_mapping(domain, bit + (i * 32));
+			generic_handle_irq(irq);
+			pending &= ~BIT(bit);
+		}
 	}
 
 	return IRQ_HANDLED;
-- 
2.7.4


