Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 730E0C874F
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 13:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfJBL1Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 07:27:25 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25435 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727538AbfJBL1Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 07:27:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570015557; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=CJMxdoixGk2BPmuK+/owkNhdyGHehsHJXcg2de6MvNHiXAkM1oxG8wzJLQYRzL+MF19/0y/JWqYZUl37D+5rOPu+Bw51LmyMQlHGOp/Oj7+M3IJsQpa2+ryIBc2GcOIt2ojiKh4gNebMW2QzG0MdYX3pvsFhIKFQtaLIxL19yhY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570015557; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=3meDoWWBVuJInFW9uh+2hvam4yAKHNM65vA+K8EDZus=; 
        b=PTZ4qCjxDRPpw7IlRlMDU0UG7wY5V6vN98V79OiyprqTAd7vBXFrxwSnf4qxr6nwrvHV1pS30ZNuKZG7r3gSl5uqAl7eI5lQv+LNRdbJBPF55PgBgMioIrNtXCdd/AhaJJzb/0je9fsDeyJLOTYGkWaueKssHjPfgPys0JSZ2EM=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=ZU0CxYEwFQXRzCu0bxOQsIF8sC6xKptS2pJmVkktHc0cW3upto8IwikvrVSLBgi1IoZd3Z5EEvVf
    xpZkHSZw/AVCDlgtIupgataHa7nhMPwG7uLgeALvVyXxd/tc+ajI  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570015557;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1409; bh=3meDoWWBVuJInFW9uh+2hvam4yAKHNM65vA+K8EDZus=;
        b=qnXBzJnJSzKsSUm6fK+YfkWwP8enLgX/Fu6PAjjem0TiVjBPpy2u7KGRDHDnkIZf
        ovWia6tIBt6prv1grVBiLTPJ16/300ZuHtisPTDC/LITbq2vNf6DMpv1bG0BpGueU8D
        lLtaU3cmrbea5qqseynYsAdq3MF5wELKW6b7hqiQ=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570015555747460.1002529000531; Wed, 2 Oct 2019 04:25:55 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        paul.burton@mips.com, gregkh@linuxfoundation.org,
        jason@lakedaemon.net, syq@debian.org, marc.zyngier@arm.com,
        rfontana@redhat.com, armijn@tjaldur.nl, allison@lohutok.net,
        paul@crapouillou.net
Subject: [PATCH 3/5 v5] irqchip: ingenic: Get virq number from IRQ domain
Date:   Wed,  2 Oct 2019 19:25:23 +0800
Message-Id: <1570015525-27018-4-git-send-email-zhouyanjie@zoho.com>
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

Get the virq number from the IRQ domain instead of calculating it from
the hardcoded irq base.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/irqchip/irq-ingenic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index d97a3a5..82a079f 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -21,6 +21,7 @@
 
 struct ingenic_intc_data {
 	void __iomem *base;
+	struct irq_domain *domain;
 	unsigned num_chips;
 };
 
@@ -34,6 +35,7 @@ struct ingenic_intc_data {
 static irqreturn_t intc_cascade(int irq, void *data)
 {
 	struct ingenic_intc_data *intc = irq_get_handler_data(irq);
+	struct irq_domain *domain = intc->domain;
 	uint32_t irq_reg;
 	unsigned i;
 
@@ -43,7 +45,8 @@ static irqreturn_t intc_cascade(int irq, void *data)
 		if (!irq_reg)
 			continue;
 
-		generic_handle_irq(__fls(irq_reg) + (i * 32) + JZ4740_IRQ_BASE);
+		irq = irq_find_mapping(domain, __fls(irq_reg) + (i * 32));
+		generic_handle_irq(irq);
 	}
 
 	return IRQ_HANDLED;
@@ -95,6 +98,8 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 		goto out_unmap_base;
 	}
 
+	intc->domain = domain;
+
 	for (i = 0; i < num_chips; i++) {
 		/* Mask all irqs */
 		writel(0xffffffff, intc->base + (i * CHIP_SIZE) +
-- 
2.7.4


