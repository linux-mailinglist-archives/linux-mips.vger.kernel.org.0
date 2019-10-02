Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA603C8758
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 13:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfJBL2T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 07:28:19 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25461 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfJBL2T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 07:28:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570015567; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=C0eQva+jMB+Nw5w9KYTzh4UdJLoPfzQKPfp/X06fitsXZ0y15IaTG88+uaiiT6/k/HI3YHkm81k5u1Rs3cF1NNWnJIZ6g+ooFp5hRuA+QEVCGf9CLlzVbmpho647BTc4k4tpeAMbjJ9i+nBGJv0QK73/dxDXDW85g88fsPrOC4U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570015567; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=eeeCKiM3IXSUywHWZMkuZdPCtxOgvU9X1AipnfM1nB0=; 
        b=dx3oAMXDQRP0SUbGfli5wBEGHJtqrgCjNfMJ3tYrYBWIBFGr91M1vftbZwyWowsIyXMv8LKmsLYgxaRDMThoH8p8pxk8Y5yzX9O5tL3TMmjSrdDbQ6X5yuYXHQj7HsqHVBOh6zlYwAbbyJ2jD3xsfS404CBn+Omlb+HrtK/pyrA=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=UdcQap6U/7QfvHXSuSsc7qvHYCVpJmC6JV2Y+brfxtCAYWP7AOBb1bXmlkbwgM622BU/vksASMWH
    6hwUkJLSqh/fGtduAVPglm79sorvs49Bzk+OBbHnYm+tnFFhWPN/  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570015567;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2275; bh=eeeCKiM3IXSUywHWZMkuZdPCtxOgvU9X1AipnfM1nB0=;
        b=MugC4L9HPgwp0qqRGcntvU0KrqTnc9oLHrWSO+bksJ96UxV2XgPwV9Ci1Q9RoxOV
        Nn+8r60xb8NtCvC/YajNaMB2q17IOkFtz1GkN65hlVzpz9Pv9fviEWooayK9Rt3C4jw
        BfCugmNEVS4uM2G2c/synkP2P2Sj9iauQQfLve8M=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 157001556560418.841606277967458; Wed, 2 Oct 2019 04:26:05 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        paul.burton@mips.com, gregkh@linuxfoundation.org,
        jason@lakedaemon.net, syq@debian.org, marc.zyngier@arm.com,
        rfontana@redhat.com, armijn@tjaldur.nl, allison@lohutok.net,
        paul@crapouillou.net
Subject: [PATCH 5/5 v5] irqchip: Ingenic: Add process for more than one irq at the same time.
Date:   Wed,  2 Oct 2019 19:25:25 +0800
Message-Id: <1570015525-27018-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1570015525-27018-1-git-send-email-zhouyanjie@zoho.com>
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
---
 drivers/irqchip/irq-ingenic.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 06ab3ad..c1be3d5 100644
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


