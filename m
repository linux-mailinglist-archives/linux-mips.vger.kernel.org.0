Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD47D4D56
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfJLF4H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:56:07 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25471 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJLF4H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:56:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570859679; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=MUJihpGopBf1M3h2L8QLEDTiRqDcqFZmviCgeAwkfCI5ieP32AP7u72JG5MBIoigfC5yZqUQLcw87FUOrlAsBEzEFTgHSWHTH30VN90Ef5NueHBcp1EmhNOvBnwoyILt/8v17zlDjSo7yQ51YAgiNqmXK0rYUna3YU+lUUFrSrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570859679; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=8Q1QWDHPH4FrpfqMll+CRi4+P395ePJNtqPkkMOo1qY=; 
        b=ZT7cGCNC/0kqWvLLyZkUEHXgh8KdmpqYYWkaTg2Mx9E4GQ9RUTV46b8nEvIBgzr8vv1O1o5jjC6cw9AIjX72R7KEyI8wAf1ZpPWG8KX86bwwXDGteRhHnfqc7CYoPo5uGBLSdAZ3KzU/4OrpZX2FpTxrietSYdKXBwfxDMxNMCc=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=BCj4gvZ9YL4inNkS9uke39eKBXeDLvq6ORVxS7dwb371/+e6OI55+Gd6XQICXvxotwhkcwxRVEex
    VWveCm7f8VcVSNnZbm0sL7hxE7AZ3S5ODb+ph4/oYjgN1eYEJdTc  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570859679;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1444; bh=8Q1QWDHPH4FrpfqMll+CRi4+P395ePJNtqPkkMOo1qY=;
        b=flJo++4HdkOsp+Bbufh2eIbDR1E9dkeLs8Y/Kn+pQutNEUYZzwHV/Au8TJNSCiRQ
        3DPZRE3FrwjLF3+D9eT1R87ekee2kiSRmvMl9aQHd1lE+pjzFhdwPqkK4mbEr99SMdT
        1eyQbPNkNrZBKbonz7ylO1sS6Fgsf6MOQ5W4eEMs=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570859678068815.4253499907817; Fri, 11 Oct 2019 22:54:38 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jason@lakedaemon.net,
        paul.burton@mips.com, allison@lohutok.net, syq@debian.org,
        rfontana@redhat.com, tglx@linutronix.de, paul@crapouillou.net,
        maz@kernel.org
Subject: [PATCH 2/5 v6] irqchip: ingenic: Error out if IRQ domain creation failed
Date:   Sat, 12 Oct 2019 13:53:47 +0800
Message-Id: <1570859630-50942-3-git-send-email-zhouyanjie@zoho.com>
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

If we cannot create the IRQ domain, the driver should fail to probe
instead of succeeding with just a warning message.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
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


