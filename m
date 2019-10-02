Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D759AC874B
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 13:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfJBL1C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 07:27:02 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25423 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727538AbfJBL1B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 07:27:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570015553; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=ZRH2LD3NKPXYJOHAfc+0hpiTR/BIapgirHyhUkaJ2oi2mX9TMEb0r463o5c1DdSE/xI7633E5HGqwqt5lcp+vWzZwGk3vTG1PhjnFBbSAurcIqQuIh0xiDpv6Eku3EmnvVMHS7pQukkuh+WB5R76tFoXvlfByJ+IegFpLrWsSiM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570015553; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=RD+GgwISDkeJ0+9zJglsbMp0cCqSbix3YRD8dlXbAd4=; 
        b=UdmMl+4cCIYn5Ef3KCrPGDLlx9e7Tnn5j31lAAmhOM2mdqV3siR+vG5yXi6Ly6CcckeXq/UI/M7CNxUAfA1AdxJVNo2aHuflr+4qq+FG6TbNRIXzDBFyKB3/xjdQDnj+fSeznzA1ln8KHAEv35qI11rt7nfNtI2Dh1xGcpOje0o=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=vLkjGjtGHs9whOE1YYrXTas5p2kpIk44yA0ibhSlq9NNlCocrwwaXyYrJZr+FbxkEFa0IhPQCba6
    0/kYk/s6YKii+q7CuElr/8pPBeHCZCZ1gZqs4aA4lKQGF0yxmyIg  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570015553;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1394; bh=RD+GgwISDkeJ0+9zJglsbMp0cCqSbix3YRD8dlXbAd4=;
        b=G/fOF/CeHi2AQShAHP4BpJFgIUtB3y3w4z3lo6tV1KkY71oBssVBSNgfL+whT00P
        Fp/VFISRYF0h7kemxzrtn2l3WDoiZz1TFYTzNvHY49xUxVggYRbSaALhZ8VztZ2K80p
        PLb+7Xn6296ylSI8eJUQa4PZhxgkswGSTX17dR44=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570015550669586.2947400949221; Wed, 2 Oct 2019 04:25:50 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        paul.burton@mips.com, gregkh@linuxfoundation.org,
        jason@lakedaemon.net, syq@debian.org, marc.zyngier@arm.com,
        rfontana@redhat.com, armijn@tjaldur.nl, allison@lohutok.net,
        paul@crapouillou.net
Subject: [PATCH 2/5 v5] irqchip: ingenic: Error out if IRQ domain creation failed
Date:   Wed,  2 Oct 2019 19:25:22 +0800
Message-Id: <1570015525-27018-3-git-send-email-zhouyanjie@zoho.com>
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

If we cannot create the IRQ domain, the driver should fail to probe
instead of succeeding with just a warning message.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/irqchip/irq-ingenic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 06fa810..d97a3a5 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -87,6 +87,14 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 		goto out_unmap_irq;
 	}
 
+	domain = irq_domain_add_legacy(node, num_chips * 32,
+				       JZ4740_IRQ_BASE, 0,
+				       &irq_domain_simple_ops, NULL);
+	if (!domain) {
+		err = -ENOMEM;
+		goto out_unmap_base;
+	}
+
 	for (i = 0; i < num_chips; i++) {
 		/* Mask all irqs */
 		writel(0xffffffff, intc->base + (i * CHIP_SIZE) +
@@ -112,14 +120,11 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 				       IRQ_NOPROBE | IRQ_LEVEL);
 	}
 
-	domain = irq_domain_add_legacy(node, num_chips * 32, JZ4740_IRQ_BASE, 0,
-				       &irq_domain_simple_ops, NULL);
-	if (!domain)
-		pr_warn("unable to register IRQ domain\n");
-
 	setup_irq(parent_irq, &intc_cascade_action);
 	return 0;
 
+out_unmap_base:
+	iounmap(intc->base);
 out_unmap_irq:
 	irq_dispose_mapping(parent_irq);
 out_free:
-- 
2.7.4


