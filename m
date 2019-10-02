Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B4DC8751
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 13:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfJBL16 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 07:27:58 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25448 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfJBL16 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 07:27:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570015561; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=K2dn0GWrxPKHo0hnxxHagYqHNulXSy8XtwqmuspkmoolVmo4dMXQnJhXfBvhN1o3CedvFY6uLkuQLgQmW0lOghWYk3GFsgar3WhhdWhoCtlUb6YgqqhmnnF5JVT/2Inyhv6cE0T1aiTvUsZ/ObS3cH7G7s3pHZITABtilGGc2Co=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570015561; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=CI4uRK7HCSNx6oDvbDAdR5UB/+8QBJQFbkkP6LQKjiU=; 
        b=HEhMqYRy/MDhWy4IP6jVjN2BtWbQUqoio2goF68SVbvFTLY690mW0PcT7f2NxQ517Klv58fZ6Nb5ckZoMAf20SaZiROj6nZ5EAvpM/iZPqn1WSO++WRsmlRt0EhICt72uCp+/bFKy153Iivd6+V7Bn7fFVtLUG9bzyEERnW6VU8=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=OadQJZbMoERVtdBiQycOwm7tqmpIrfruXwqVOFA9Hvqyl4xkspGnC4tBwTCTaSyIjdWBRea+2uE+
    nHbeoc0V6sA+1Hzwn/L1wQd+udEzq0om64phmjK81/lyOOnccCl0  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570015561;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2649; bh=CI4uRK7HCSNx6oDvbDAdR5UB/+8QBJQFbkkP6LQKjiU=;
        b=CnxptNsfcxxKhI78mckJ5Exu23du32Wk5jkUksHZTjGna/qGp7Jmb1UFCPmPmXCH
        fd4onI/VG+LFMDS3W/8xz9bozyJ2tz8G56XTSTwTGnsogOl0YzqWQj0/w/oblv61UCT
        HKwXpZXx4lRtuwTdBy/Kz0un1onzNjnbABKFXDd4=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570015560564920.0535606410725; Wed, 2 Oct 2019 04:26:00 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        paul.burton@mips.com, gregkh@linuxfoundation.org,
        jason@lakedaemon.net, syq@debian.org, marc.zyngier@arm.com,
        rfontana@redhat.com, armijn@tjaldur.nl, allison@lohutok.net,
        paul@crapouillou.net
Subject: [PATCH 4/5 v5] irqchip: ingenic: Alloc generic chips from IRQ domain
Date:   Wed,  2 Oct 2019 19:25:24 +0800
Message-Id: <1570015525-27018-5-git-send-email-zhouyanjie@zoho.com>
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

By creating the generic chips from the IRQ domain, we don't rely on the
JZ4740_IRQ_BASE macro. It also makes the code a bit cleaner.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/irqchip/irq-ingenic.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 82a079f..06ab3ad 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -36,12 +36,14 @@ static irqreturn_t intc_cascade(int irq, void *data)
 {
 	struct ingenic_intc_data *intc = irq_get_handler_data(irq);
 	struct irq_domain *domain = intc->domain;
+	struct irq_chip_generic *gc;
 	uint32_t irq_reg;
 	unsigned i;
 
 	for (i = 0; i < intc->num_chips; i++) {
-		irq_reg = readl(intc->base + (i * CHIP_SIZE) +
-				JZ_REG_INTC_PENDING);
+		gc = irq_get_domain_generic_chip(domain, i * 32);
+
+		irq_reg = irq_reg_readl(gc, JZ_REG_INTC_PENDING);
 		if (!irq_reg)
 			continue;
 
@@ -92,7 +94,7 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 
 	domain = irq_domain_add_legacy(node, num_chips * 32,
 				       JZ4740_IRQ_BASE, 0,
-				       &irq_domain_simple_ops, NULL);
+				       &irq_generic_chip_ops, NULL);
 	if (!domain) {
 		err = -ENOMEM;
 		goto out_unmap_base;
@@ -100,17 +102,17 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 
 	intc->domain = domain;
 
-	for (i = 0; i < num_chips; i++) {
-		/* Mask all irqs */
-		writel(0xffffffff, intc->base + (i * CHIP_SIZE) +
-		       JZ_REG_INTC_SET_MASK);
+	err = irq_alloc_domain_generic_chips(domain, 32, 1, "INTC",
+					     handle_level_irq, 0,
+					     IRQ_NOPROBE | IRQ_LEVEL, 0);
+	if (err)
+		goto out_domain_remove;
 
-		gc = irq_alloc_generic_chip("INTC", 1,
-					    JZ4740_IRQ_BASE + (i * 32),
-					    intc->base + (i * CHIP_SIZE),
-					    handle_level_irq);
+	for (i = 0; i < num_chips; i++) {
+		gc = irq_get_domain_generic_chip(domain, i * 32);
 
 		gc->wake_enabled = IRQ_MSK(32);
+		gc->reg_base = intc->base + (i * CHIP_SIZE);
 
 		ct = gc->chip_types;
 		ct->regs.enable = JZ_REG_INTC_CLEAR_MASK;
@@ -121,13 +123,15 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 		ct->chip.irq_set_wake = irq_gc_set_wake;
 		ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
-		irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0,
-				       IRQ_NOPROBE | IRQ_LEVEL);
+		/* Mask all irqs */
+		irq_reg_writel(gc, IRQ_MSK(32), JZ_REG_INTC_SET_MASK);
 	}
 
 	setup_irq(parent_irq, &intc_cascade_action);
 	return 0;
 
+out_domain_remove:
+	irq_domain_remove(domain);
 out_unmap_base:
 	iounmap(intc->base);
 out_unmap_irq:
-- 
2.7.4


