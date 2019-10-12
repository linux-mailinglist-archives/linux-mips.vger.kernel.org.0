Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2154ED4D5A
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbfJLF4g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:56:36 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25490 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJLF4g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:56:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570859692; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=h+VAHyD6QA4mwOGvUmfoX9dSv6OJk1QHZIAzv5Kv9I/JmmoofwfNOSHQ90AGuqm7h9MufNLJJQhhZca6mh4fyIGaUf0AFSZHtY/zRZpdoz6fwUzrJW6fUl0vTaYRBPtjSrYXz7KJswDQQ62PGfvjdPyScrHT/zXguGQTJlXwRa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570859692; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=vqFzdmuAqd08mew6EEqLsjTHN1X+ipfTZxQgxn8mA9E=; 
        b=T0olOlVneplzc/1Rx1wIp28PjCeDu8Lcz0wDwAiozVhsLtWRqgd/MfeGnlfkXAPByKVwVI2SKq071jF5CSkKYNaSFrLn0/6ZKRBKP9hYFYJBoo83zy9i8gL4ZHUNz5j6H2GCsC64mc8um7Hfo2WUfTpTCegrybJ63BMPQ0tdvpU=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=Qms0e4aJcw2TsP9S7Fp3vrpEfeXU0KykgGyf8uNXCgYrQHnbW6O0hLwbCWwZ9GIsB3m5jzWk+W1L
    syA7P7iTGeRG8loNmnvKHVs9JYE8PQ/k599CE3np7Y701F3yjmiq  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570859692;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2699; bh=vqFzdmuAqd08mew6EEqLsjTHN1X+ipfTZxQgxn8mA9E=;
        b=QZ2hXF/7zCl70xXiKCrCzlCAu2N0mb3UWOZxakV0zMgpOR1lbyui6ql6EASXNtp/
        DUVebjT8jOvbZs0BBkTQaTYAx+RX9Dvq/RHfBgHYHgpqwDSTGJyTXE6drNYh9hhL+EM
        Cg+7wRSyDKGiDJSJMtTgt0kEESDZ1CgL6CpoKaKg=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570859690297939.5260946230621; Fri, 11 Oct 2019 22:54:50 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jason@lakedaemon.net,
        paul.burton@mips.com, allison@lohutok.net, syq@debian.org,
        rfontana@redhat.com, tglx@linutronix.de, paul@crapouillou.net,
        maz@kernel.org
Subject: [PATCH 4/5 v6] irqchip: ingenic: Alloc generic chips from IRQ domain
Date:   Sat, 12 Oct 2019 13:53:49 +0800
Message-Id: <1570859630-50942-5-git-send-email-zhouyanjie@zoho.com>
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

By creating the generic chips from the IRQ domain, we don't rely on the
JZ4740_IRQ_BASE macro. It also makes the code a bit cleaner.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
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


