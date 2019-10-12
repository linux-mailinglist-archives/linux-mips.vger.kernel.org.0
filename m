Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A535D4D58
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfJLF4W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:56:22 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25481 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJLF4W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:56:22 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570859683; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=G159GhjAcvTDLbxqcQAg5y/5TEU1UXyaXtS02Sn7fT+3Jaj+RfPkpeKV5MnakG2xACQeUvFvt2wT7BvSX+SR4Ri+/fJhy22jGmQQQGsdpw2GmwvE3+AhfaUP6MT4F/jetegCU6/vPmwMkcz+J17v5YAY8uStX8+3Bn4p6zTs3NA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570859683; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=Keo7E/Vs4tWgtPPECLABpRTPgFOOvk6LlOQojTA9v6g=; 
        b=URSY2h87fc/Enlzan9IToVa54dbDzmZGhoi9JIG44EIkVuu/yCAmBsjepW6SXSOO0nUlEAFcTP/6mWgqjaNMxJm/mjcQbc4reefqeK7LWll0zoaYFnDrgWVuvrCyCV3qplXCx+3g3zDLgezRJNxljFsuzAdbGg7yi2lJ/72SCRY=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=WEJ/LvQUiP81Kz1GPLOPQebC84t4wBo13Ng5aeUi7U2HXaXyLU/4G4IK7AFTHgaQGbXRpPjEYXdi
    cQrBo4NcSUmzVPR+zTI3Ele3E0oQJBRcPq/4UF9c/XEY75DRLBgl  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570859683;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1459; bh=Keo7E/Vs4tWgtPPECLABpRTPgFOOvk6LlOQojTA9v6g=;
        b=s/7QvJrXgeOayNk1Esg5aqO1+rv2ZFuunWhrOwMOZAkIMAbH3YvcGHNdlhytNRBl
        nQtHDvBVMVdDsPWwIyLQPJy+m7eDLBZyiFufTASXAJlwFjPKT7srZhbKkL3lspp7crQ
        eqBTM0YUNP/GfkUhwQ8DiJ1IYJLwki7D0K0pPjyU=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570859681933627.8498366257614; Fri, 11 Oct 2019 22:54:41 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jason@lakedaemon.net,
        paul.burton@mips.com, allison@lohutok.net, syq@debian.org,
        rfontana@redhat.com, tglx@linutronix.de, paul@crapouillou.net,
        maz@kernel.org
Subject: [PATCH 3/5 v6] irqchip: ingenic: Get virq number from IRQ domain
Date:   Sat, 12 Oct 2019 13:53:48 +0800
Message-Id: <1570859630-50942-4-git-send-email-zhouyanjie@zoho.com>
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

Get the virq number from the IRQ domain instead of calculating it from
the hardcoded irq base.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
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


